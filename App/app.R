library(shiny)
library(shinydashboard)
library(tidyverse)
library(rstatix)
library(plotly)
library(readxl)
library(shinythemes)
library(DT)

ui <- dashboardPage(
  skin = "black",
  dashboardHeader(title = "Análise Estatística Genérica"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Carregar Dados", tabName = "load_data", icon = icon("upload")),
      menuItem("Pivotar Tabela", tabName = "pivot_table", icon = icon("table")),
      menuItem("Análise", tabName = "analysis", icon = icon("bar-chart-o"))
    )
  ),
  dashboardBody(
    tags$head(tags$style(HTML('
                                /* body */
                                .content-wrapper, .right-side {
                                background-color: #f2f2f2;
                                }
                                '))),
    tabItems(
      tabItem(tabName = "load_data",
              fluidRow(
                box(
                  title = "Carregar Arquivo",
                  fileInput("file1", "Selecione o arquivo (CSV ou Excel)",
                            accept = c(".csv", ".xlsx")
                  ),
                  width = 12
                )
              )
      ),
      tabItem(tabName = "pivot_table",
              fluidRow(
                box(
                  title = "Configurações para Pivotar",
                  checkboxGroupInput("cols_to_not_pivot", "Colunas para não pivotar:",
                                     choices = NULL
                  ),
                  actionButton("run_pivot", "Pivotar Tabela"),
                  width = 12
                ),
                box(
                  title = "Tabela Original",
                  DTOutput("original_table"),
                  width = 6
                ),
                box(
                  title = "Tabela Pivotada",
                  DTOutput("pivoted_table"),
                  width = 6
                )
              )
      ),
      tabItem(tabName = "analysis",
              fluidRow(
                box(
                  title = "Configurações de Análise",
                  selectInput("y_var", "Variável Y (Numérica)", choices = NULL),
                  selectInput("x_var", "Variável X (Fatorial)", choices = NULL),
                  selectInput("group_var", "Variável de Grupo (opcional)", choices = NULL),
                  selectInput("test_type", "Teste Estatístico",
                              choices = c("ANOVA", "Kruskal-Wallis", "t-test", "Wilcoxon")),
                  selectInput("plot_type", "Tipo de Gráfico",
                              choices = c("boxplot", "scatter", "histogram")),
                  actionButton("run_analysis", "Executar Análise"),
                  width = 4
                ),
                box(
                  title = "Resultados da Análise",
                  plotlyOutput("plot_output"),
                  DTOutput("table_output"),
                  width = 8
                )
              )
      )
    )
  )
)

server <- function(input, output) {
  
  # Reactive para dados carregados
  data <- reactive({
    req(input$file1)
    ext <- tools::file_ext(input$file1$name)
    if (ext == "csv") {
      read.csv(input$file1$datapath)
    } else if (ext == "xlsx") {
      read_excel(input$file1$datapath)
    } else {
      return(NULL)  # Retorna NULL para formatos não suportados
    }
  })
  
  # Reactive para dados pivotados
  pivot_data <- reactiveVal(NULL)
  
  # Atualizar escolhas de colunas para não pivotar
  observe({
    req(data())
    cols <- names(data())
    updateCheckboxGroupInput(inputId = "cols_to_not_pivot", choices = cols)
  })
  
  # Renderizar tabela original
  output$original_table <- renderDT({
    req(data())
    datatable(data())
  })
  
  # Pivotar a tabela
  observeEvent(input$run_pivot, {
    req(data())
    cols_to_not_pivot <- input$cols_to_not_pivot
    df <- data()
    
    if (!is.null(cols_to_not_pivot) && all(cols_to_not_pivot %in% names(df))){
      df_pivot <- df %>%
        pivot_longer(cols = -c(cols_to_not_pivot),
                     values_to = "value",
                     names_to = "group") %>% 
        separate(group, into = c("group", "id"), "\\...")
      # separa o grupo e id se tiver
      if(any(grepl("\\.\\.\\.", names(df_pivot)))){
        df_pivot <- df_pivot %>%
          separate(group, into = c("group", "id"), "\\...")
      }
      
      # Converter 'value' para numérico e 'group' para fator
      df_pivot$value <- as.numeric(df_pivot$value)
      df_pivot$group <- as.factor(df_pivot$group)
      
      if("id" %in% names(df_pivot)){
        df_pivot$id <- as.factor(df_pivot$id)
      }
      
      showNotification("Tabela foi pivotada.", type = "message")
      pivot_data(df_pivot)
    } else if (is.null(cols_to_not_pivot)){
      showNotification("Tabela não foi pivotada: nenhuma coluna para não pivotar foi selecionada.", type = "message")
    }
    else{
      showNotification("Tabela não foi pivotada: nenhuma das colunas selecionadas para não pivotar foram encontradas.", type = "warning")
    }
  })
  
  # Renderizar tabela pivotada
  output$pivoted_table <- renderDT({
    req(pivot_data())
    datatable(pivot_data())
  })
  
  # Atualizar escolhas de variáveis quando os dados são carregados ou pivotados
  observe({
    
    df <- if (!is.null(pivot_data())) {
      pivot_data()
    } else {
      data()
    }
    
    req(df)
    cols <- names(df)
    updateSelectInput(inputId = "y_var", choices = cols)
    updateSelectInput(inputId = "x_var", choices = cols)
    updateSelectInput(inputId = "group_var", choices = c(NULL, cols))
    
  })
  
  
  # Executar análise e gerar gráficos
  observeEvent(input$run_analysis, {
    req(input$y_var, input$x_var, input$test_type, input$plot_type)
    
    y_var <- input$y_var
    x_var <- input$x_var
    group_var <- input$group_var
    test_type <- input$test_type
    plot_type <- input$plot_type
    
    # Usar dados pivotados se disponíveis, senão usar dados originais
    df <- if (!is.null(pivot_data())) {
      pivot_data()
    } else {
      data()
    }
    req(df)
    
    # Verificar se as variáveis selecionadas são válidas
    if (!all(c(y_var, x_var) %in% names(df))) {
      showNotification("As variáveis selecionadas não estão presentes nos dados.", type = "error")
      return()
    }
    if (!is.null(group_var) && !(group_var %in% names(df))){
      showNotification("A variável de grupo selecionada não está presente nos dados.", type = "error")
      return()
    }
    
    # Converter variáveis para os tipos apropriados
    df[[y_var]] <- as.numeric(df[[y_var]])
    
    
    # Verificar se as variáveis selecionadas são válidas
    if (!all(c(y_var, x_var) %in% names(df))) {
      showNotification("As variáveis selecionadas não estão presentes nos dados.", type = "error")
      return()
    }
    
    # Análise Estatística
    stat_results <- tryCatch({
      formula <- if (!is.null(group_var)) {
        as.formula(paste(y_var, "~", x_var, "*", group_var))
      } else {
        as.formula(paste(y_var, "~", x_var))
      }
      if (test_type == "ANOVA") {
        df %>%
          anova_test(formula)
      } else if (test_type == "Kruskal-Wallis") {
        df %>%
          kruskal_test(formula)
      } else if(test_type == "t-test"){
        if (!is.null(group_var)){
          showNotification("t-test não aceita variável de grupo. Executando sem variável de grupo.", type = "warning")
          df %>%
            t_test(as.formula(paste(y_var, "~", x_var)))
        } else {
          df %>%
            t_test(formula)
        }
      } else if(test_type == "Wilcoxon"){
        if (!is.null(group_var)){
          showNotification("Wilcoxon não aceita variável de grupo. Executando sem variável de grupo.", type = "warning")
          df %>%
            wilcox_test(as.formula(paste(y_var, "~", x_var)))
        } else {
          df %>%
            wilcox_test(formula)
        }
      }
      
    }, error = function(e) {
      showNotification(paste("Erro ao executar teste:", e$message), type = "error")
      return(NULL)
    })
    
    # Renderizar tabela
    output$table_output <- renderDT({
      req(stat_results)
      datatable(stat_results)
    })
    
    # Gerar gráfico
    plot_output <- tryCatch({
      if(plot_type == "boxplot"){
        p <- ggplot(df, aes_string(x = x_var, y = y_var, fill = x_var)) +
          geom_boxplot() +
          theme_minimal()
        if(!is.null(group_var)) {
          p <- p + facet_wrap(paste("~",group_var), scales = "free_x")
          
        }
        ggplotly(p)
      } else if(plot_type == "scatter"){
        p <- ggplot(df, aes_string(x = x_var, y = y_var, color = x_var)) +
          geom_point() +
          theme_minimal()
        if(!is.null(group_var)){
          p <- p + facet_wrap(paste("~", group_var), scales = "free_x")
        }
        ggplotly(p)
      } else if (plot_type == "histogram"){
        p <- ggplot(df, aes_string(x = y_var, fill = x_var)) +
          geom_histogram() +
          theme_minimal()
        if (!is.null(group_var)){
          p <- p + facet_wrap(paste("~",group_var), scales = "free_x")
        }
        ggplotly(p)
      }
    }, error = function(e) {
      showNotification(paste("Erro ao gerar gráfico:", e$message), type = "error")
      return(NULL)
    })
    
    output$plot_output <- renderPlotly({
      plot_output
    })
  })
  
}

shinyApp(ui, server)