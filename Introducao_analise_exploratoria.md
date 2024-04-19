---
title: "Curso"
output: 
  html_document: 
    toc_depth: 22
    df_print: default
    keep_md: true
    number_sections: true
date: "2024-04-19"
---

OBS: Para apresentar de tabelas e imagens fora do Markdown, vá para o Tools \> Global options \> R Markdown and unselect “Show output inline for all R Markdown documents”

# 1. Biblioteca e pacotes



# 2. Operações básicas


```r
#Operações básicas -----

#Variáveis numéricas
x = 5
x
```

```
## [1] 5
```

```r
y = 7
y
```

```
## [1] 7
```

```r
z = y + x
z
```

```
## [1] 12
```

```r
multi = x * y
multi
```

```
## [1] 35
```


```r
# Variáveis textuais (characters, string)
a = "Olá"
a
```

```
## [1] "Olá"
```

```r
b = "Tudo bem?"
b
```

```
## [1] "Tudo bem?"
```


```r
# Variáveis Lógicas
t = TRUE
t
```

```
## [1] TRUE
```

```r
f = FALSE
f
```

```
## [1] FALSE
```


```r
# Comparações lógicas (booleanas)
a == b #Diferente
```

```
## [1] FALSE
```

```r
x < y # Menor
```

```
## [1] TRUE
```

```r
x > y # Maior
```

```
## [1] FALSE
```

```r
x <= 5 # menor ou igual
```

```
## [1] TRUE
```

```r
t == f #Igual
```

```
## [1] FALSE
```

```r
t != f #Diferente
```

```
## [1] TRUE
```

Se criarmos outras variáveis com nomes diferentes, mas com os mesmos valores, elas ainda continuarão dando o mesmo resultado


```r
# Se criarmos outras variáveis com nomes diferentes, mas com os mesmos valores, elas ainda continuarão dando o mesmo resultado
tt = TRUE
ff = FALSE
aa = "Olá"

t == tt #Igual
```

```
## [1] TRUE
```

```r
f == ff #Igual
```

```
## [1] TRUE
```

```r
aa == a #Igual
```

```
## [1] TRUE
```

## Vetores

Os vetores são uma **sequência unidimensional** que podem ser números, strings, valores lógicos, entre outros. Podemos criar vetores com a função c(), de "concatenar".


```r
# Vetores
i = c(7, 5, 9, 10) #Numérico
i
```

```
## [1]  7  5  9 10
```

```r
j = c("Olá", "Caneta", "Qualificacao") #String
j
```

```
## [1] "Olá"          "Caneta"       "Qualificacao"
```

```r
h = c(7, "olá", 78) #String
h
```

```
## [1] "7"   "olá" "78"
```

```r
# O que esta função faz? Use o "?" antes da função e rode.
?c()
```

```
## starting httpd help server ... done
```

## Dataframes e tibbles

Dataframes e tibbles são tabelas comuns e consistem de linhas e colunas de diferentes classes, como números, caracteres e fatores.

As **tibbles são diferentes dos dataframes** somente em sua apresentação no console e facilitam muito o trabalho com tabelas grandes e largas.

Além disso, a criação do dataframe e da tibble são diferentes visualmente. Veja como a tibble é mais semelhante à forma que imputamos dados no excel.

Para criar um dataframe, usamos a função **data.frame().**


```r
#Dataframes e tibbles -----

#Dataframe
data = data.frame(
  nome = c("Gabriela", "Júlia", "Beatriz", "Luiza"),
  altura = c(1.59, 1.60, 1.65, 1.73),
  idade = c(30, 25, 31, 32)
)
```

E para criar uma tibble, usamos a função **tribble().**


```r
#Tibble
tibble = tribble(
  ~nome, ~altura, ~idade,
  "Gabriela", 1.59,   30,
  "Júlia",   1.60,   25,
  "Beatriz",    1.65,  31,
  "Luiza",  1.73,   32 
  )
```

**É possível transformar quase todo objeto em uma tabela.**

Por exemplo, se pegarmos os vetores criados anteriormente e usarmos a função **as.data.frame(),** será criada uma coluna com o nome do vetor, seguida por linhas contendo os elementos do vetor.


```r
# Vetores em dataframe
as.data.frame(i) #dataframe com coluna numérica
```

```
##    i
## 1  7
## 2  5
## 3  9
## 4 10
```

```r
as.data.frame(j) #dataframe com coluna textual
```

```
##              j
## 1          Olá
## 2       Caneta
## 3 Qualificacao
```

```r
as.data.frame(h) #dataframe com coluna textual, mesmo com valores numéricos
```

```
##     h
## 1   7
## 2 olá
## 3  78
```

**Há diferentes formas de se visualizar uma tabela.**

A diferença de cada objeto está na visualização no console e no documento. **Teste estas linhas de código no documento e no console.**


```r
#Visualizando o dataframe -----
# Com print()
print(data) #No documento ou console
```

```
##       nome altura idade
## 1 Gabriela   1.59    30
## 2    Júlia   1.60    25
## 3  Beatriz   1.65    31
## 4    Luiza   1.73    32
```

```r
print(tibble)
```

```
## # A tibble: 4 × 3
##   nome     altura idade
##   <chr>     <dbl> <dbl>
## 1 Gabriela   1.59    30
## 2 Júlia      1.6     25
## 3 Beatriz    1.65    31
## 4 Luiza      1.73    32
```

```r
# Com nome do objeto
data
```

```
##       nome altura idade
## 1 Gabriela   1.59    30
## 2    Júlia   1.60    25
## 3  Beatriz   1.65    31
## 4    Luiza   1.73    32
```

```r
tibble 
```

```
## # A tibble: 4 × 3
##   nome     altura idade
##   <chr>     <dbl> <dbl>
## 1 Gabriela   1.59    30
## 2 Júlia      1.6     25
## 3 Beatriz    1.65    31
## 4 Luiza      1.73    32
```

```r
# Com glimpse(). #Descrição mais completa da tabela
glimpse(data) 
```

```
## Rows: 4
## Columns: 3
## $ nome   <chr> "Gabriela", "Júlia", "Beatriz", "Luiza"
## $ altura <dbl> 1.59, 1.60, 1.65, 1.73
## $ idade  <dbl> 30, 25, 31, 32
```

```r
glimpse(tibble)
```

```
## Rows: 4
## Columns: 3
## $ nome   <chr> "Gabriela", "Júlia", "Beatriz", "Luiza"
## $ altura <dbl> 1.59, 1.60, 1.65, 1.73
## $ idade  <dbl> 30, 25, 31, 32
```

```r
# Com view(). A tabela completa com mais funcionalidades (filtragem manual, pesquisa e ordenamento) abrirá em uma nova janela
view(data) 
view(tibble)

# Selecionando o nome do objeto e segurando Ctrl + Click.
data
```

```
##       nome altura idade
## 1 Gabriela   1.59    30
## 2    Júlia   1.60    25
## 3  Beatriz   1.65    31
## 4    Luiza   1.73    32
```

```r
tibble 
```

```
## # A tibble: 4 × 3
##   nome     altura idade
##   <chr>     <dbl> <dbl>
## 1 Gabriela   1.59    30
## 2 Júlia      1.6     25
## 3 Beatriz    1.65    31
## 4 Luiza      1.73    32
```

## Estatísticas gerais da tabela

O R possui uma função muito prática de análise estatística descritiva, a **summary()**.

No entanto, existem outros pacotes que realizam essas análises e até geram relatórios em HTML.

Um deles é o skimr, cuja função **skim()** gera três outputs, um semelhante ao summary, e outras duas tabelas com a quantidade de valores não disponíveis (NA), estatísticas descritivas, e um histograma.


```r
# Estatísticas gerais 
summary(tibble)
```

```
##      nome               altura          idade      
##  Length:4           Min.   :1.590   Min.   :25.00  
##  Class :character   1st Qu.:1.597   1st Qu.:28.75  
##  Mode  :character   Median :1.625   Median :30.50  
##                     Mean   :1.643   Mean   :29.50  
##                     3rd Qu.:1.670   3rd Qu.:31.25  
##                     Max.   :1.730   Max.   :32.00
```

```r
summary(data)
```

```
##      nome               altura          idade      
##  Length:4           Min.   :1.590   Min.   :25.00  
##  Class :character   1st Qu.:1.597   1st Qu.:28.75  
##  Mode  :character   Median :1.625   Median :30.50  
##                     Mean   :1.643   Mean   :29.50  
##                     3rd Qu.:1.670   3rd Qu.:31.25  
##                     Max.   :1.730   Max.   :32.00
```

```r
# Usando skim
skim(tibble)
```


Table: Data summary

|                         |       |
|:------------------------|:------|
|Name                     |tibble |
|Number of rows           |4      |
|Number of columns        |3      |
|_______________________  |       |
|Column type frequency:   |       |
|character                |1      |
|numeric                  |2      |
|________________________ |       |
|Group variables          |None   |


**Variable type: character**

|skim_variable | n_missing| complete_rate| min| max| empty| n_unique| whitespace|
|:-------------|---------:|-------------:|---:|---:|-----:|--------:|----------:|
|nome          |         0|             1|   5|   8|     0|        4|          0|


**Variable type: numeric**

|skim_variable | n_missing| complete_rate|  mean|   sd|    p0|   p25|   p50|   p75|  p100|hist  |
|:-------------|---------:|-------------:|-----:|----:|-----:|-----:|-----:|-----:|-----:|:-----|
|altura        |         0|             1|  1.64| 0.06|  1.59|  1.60|  1.62|  1.67|  1.73|▇▁▃▁▃ |
|idade         |         0|             1| 29.50| 3.11| 25.00| 28.75| 30.50| 31.25| 32.00|▃▁▁▃▇ |

```r
skim(data)
```


Table: Data summary

|                         |     |
|:------------------------|:----|
|Name                     |data |
|Number of rows           |4    |
|Number of columns        |3    |
|_______________________  |     |
|Column type frequency:   |     |
|character                |1    |
|numeric                  |2    |
|________________________ |     |
|Group variables          |None |


**Variable type: character**

|skim_variable | n_missing| complete_rate| min| max| empty| n_unique| whitespace|
|:-------------|---------:|-------------:|---:|---:|-----:|--------:|----------:|
|nome          |         0|             1|   5|   8|     0|        4|          0|


**Variable type: numeric**

|skim_variable | n_missing| complete_rate|  mean|   sd|    p0|   p25|   p50|   p75|  p100|hist  |
|:-------------|---------:|-------------:|-----:|----:|-----:|-----:|-----:|-----:|-----:|:-----|
|altura        |         0|             1|  1.64| 0.06|  1.59|  1.60|  1.62|  1.67|  1.73|▇▁▃▁▃ |
|idade         |         0|             1| 29.50| 3.11| 25.00| 28.75| 30.50| 31.25| 32.00|▃▁▁▃▇ |

## Pivotando tabelas: Long e Wide

As tabelas tidy possuem dois formatos, um largo (wide) e outro longo (long). Converter uma em outra é conhecido como **pivotagem**, e conhecer essas funções é importantíssimo para obter, manipular e explorar dados.

Para pivotar, utilizamos **pivot_longer() e pivot_wider()**. A pivotagem deve ser pensada com base na relação entre variáveis e seus valores.

Por exemplo, se tivermos uma tabela larga com 10 colunas com anos (de 1990 a 2000), podemos reduzi-las em uma só coluna chamada "anos", que facilitará a manipulação de dados. Isso alongará a tabela.

Mas, se quisermos deixá-la mais fácil de ser interpretada por humanos, podemos pivotá-la em uma tabela larga.


```r
# Trabalhando com dataframes -----
#Transformando outros formatos em dataframe

# Long table
data_long = pivot_longer(data, #Tabela 
             cols = c(altura, idade), #Colunas para alongar 
             values_to = "valor", # Estocar valores em uma nova coluna
             names_to = "variavel" # Estocar variáveis em uma nova coluna
             ) 
data_long
```

```
## # A tibble: 8 × 3
##   nome     variavel valor
##   <chr>    <chr>    <dbl>
## 1 Gabriela altura    1.59
## 2 Gabriela idade    30   
## 3 Júlia    altura    1.6 
## 4 Júlia    idade    25   
## 5 Beatriz  altura    1.65
## 6 Beatriz  idade    31   
## 7 Luiza    altura    1.73
## 8 Luiza    idade    32
```


```r
# Wide table
data_wide = pivot_wider(data_long, #Tabela
            names_from = variavel, #Dividir níveis de uma coluna em novas colunas
            values_from = valor)   #Estocar valores relacionados à coluna nome e novas variáveis) 
```

## Matrizes

As matrizes são estruturas tabelares cujos valores são **somente numéricos**. Para isso, é necessário converter a coluna de "nomes" (strings) em nomes de linhas (rownames) usando o column_to_rownames(), e então converter a tabela em matriz, com o as.matrix().

A diferença aqui é a apresentação da tabela. Enquanto dataframes e tibbles são facilmente lidas, as matrizes são mais complicadas nesse sentido.

**Caso você queira manipular a matriz com as funções do tidyverse**, é recomendável reconvertê-la em dataframe/tibble, manipular os dados, e depois converter novamente para matriz.

É importante saber manipular matrizes para computar análises estatísticas, como o Principal Components Analysis, por exemplo.


```r
#Matriz
matrix = as.matrix(data) #Transformar tabela em matriz
matrix #Os valores numéricos são strings
```

```
##      nome       altura idade
## [1,] "Gabriela" "1.59" "30" 
## [2,] "Júlia"    "1.60" "25" 
## [3,] "Beatriz"  "1.65" "31" 
## [4,] "Luiza"    "1.73" "32"
```

```r
data_matrix = column_to_rownames(data, "nome") #Converte coluna em rownames
matrix = as.matrix(data_matrix)
matrix #Agora, os valores são numéricos
```

```
##          altura idade
## Gabriela   1.59    30
## Júlia      1.60    25
## Beatriz    1.65    31
## Luiza      1.73    32
```

```r
# Reconverter para dataframe
matrix_dr = as.data.frame(matrix)

matrix_dr # Coluna "nome" continua como rownames e dificulta a manipulação.
```

```
##          altura idade
## Gabriela   1.59    30
## Júlia      1.60    25
## Beatriz    1.65    31
## Luiza      1.73    32
```

```r
matrix_dr = rownames_to_column(matrix_dr, "nome") #Converter rownames em nova coluna
matrix_dr
```

```
##       nome altura idade
## 1 Gabriela   1.59    30
## 2    Júlia   1.60    25
## 3  Beatriz   1.65    31
## 4    Luiza   1.73    32
```

## Listas

Listas são estruturas que podem conter um conjunto de elementos de diferentes classes, como **vetores, outras listas, dataframes, e matrizes**.

Elas são interessantes para **organizar os objetos necessários para uma análise**, e são muito comuns em análises de RNAseq, por exemplo.


```r
#Criando a lista
lista = list(a, b, f, h, j, multi, t, data, matrix, tibble)

#View(lista) #Visualizando a lista

#Acessando objetos diferentes da lista
lista[[1]] #Primeiro objeto
```

```
## [1] "Olá"
```

```r
lista[[8]] #Oitavo objeto
```

```
##       nome altura idade
## 1 Gabriela   1.59    30
## 2    Júlia   1.60    25
## 3  Beatriz   1.65    31
## 4    Luiza   1.73    32
```

```r
#Isolando o objeto
df_list = lista[[8]]
df_list
```

```
##       nome altura idade
## 1 Gabriela   1.59    30
## 2    Júlia   1.60    25
## 3  Beatriz   1.65    31
## 4    Luiza   1.73    32
```

## Manipulação de tabelas com o R base

O R possui funções e formas nativas de acessar e manipular tabelas. Essas operações, como as descritas abaixo, não são mais a melhor forma de trabalhar, pois são pouco intuitivas. Mas, **é importante conhecê-las**, pois, são utilizadas em alguns casos.


```r
# Acessando colunas do data frame
data$nome
```

```
## [1] "Gabriela" "Júlia"    "Beatriz"  "Luiza"
```

```r
data$idade
```

```
## [1] 30 25 31 32
```

```r
# Criando nova variável para não sobrescrever a tabela original para os próximos exemplos
data_2 = data

# Adicionando uma nova coluna ao data frame
data_2$peso = c(70, 
                65, 
                80, 
                20)
data_2
```

```
##       nome altura idade peso
## 1 Gabriela   1.59    30   70
## 2    Júlia   1.60    25   65
## 3  Beatriz   1.65    31   80
## 4    Luiza   1.73    32   20
```

```r
# Removendo uma coluna do data frame
data_2 = data_2[ , -4]

# Filtrando linhas do data frame. df[linha, coluna]
data_jovens = data_2[data_2$idade < 30, ]
data_jovens
```

```
##    nome altura idade
## 2 Júlia    1.6    25
```

```r
# Ordenando o data frame por uma coluna
data_ordenados <- data_2[order(data_2$idade), ]
data_ordenados
```

```
##       nome altura idade
## 2    Júlia   1.60    25
## 1 Gabriela   1.59    30
## 3  Beatriz   1.65    31
## 4    Luiza   1.73    32
```

# 3. Tidyverse

O tidyverse é um **metapacote**, um pacote com diversos pacotes dentro, que facilita muito o trabalho no R. As funções conversam entre si, são padronizadas e, mais importante, são muito **intuitivas**.

## Adicionando linhas e colunas

Para adicionar uma linha com valores, usamos o add_row(), e para adicionar uma coluna, o add_column. Bem intuitivo, né?

Para não alterarmos as tabelas originais, criamos uma nova variável chamada data_2 e tibble_2.


```r
#Adicionar linha
data_2 = add_row(data, 
               nome = "Rafaela", 
               idade = 50,
               altura = 1.85)

tibble_2 = add_row(tibble, 
                   nome = "Rafaela", 
                   idade = 50,
                   altura = 1.85)

data_2
```

```
##       nome altura idade
## 1 Gabriela   1.59    30
## 2    Júlia   1.60    25
## 3  Beatriz   1.65    31
## 4    Luiza   1.73    32
## 5  Rafaela   1.85    50
```

```r
tibble_2
```

```
## # A tibble: 5 × 3
##   nome     altura idade
##   <chr>     <dbl> <dbl>
## 1 Gabriela   1.59    30
## 2 Júlia      1.6     25
## 3 Beatriz    1.65    31
## 4 Luiza      1.73    32
## 5 Rafaela    1.85    50
```


```r
#Adicionar coluna
data_2 = add_column(data_2,
                    peso = c(50,
                             80,
                             40,
                             100,
                             70))

tibble_2 = add_column(tibble_2,
                      peso = c(50,
                               80,
                               40,
                               100,
                               70))

data_2
```

```
##       nome altura idade peso
## 1 Gabriela   1.59    30   50
## 2    Júlia   1.60    25   80
## 3  Beatriz   1.65    31   40
## 4    Luiza   1.73    32  100
## 5  Rafaela   1.85    50   70
```

```r
tibble_2
```

```
## # A tibble: 5 × 4
##   nome     altura idade  peso
##   <chr>     <dbl> <dbl> <dbl>
## 1 Gabriela   1.59    30    50
## 2 Júlia      1.6     25    80
## 3 Beatriz    1.65    31    40
## 4 Luiza      1.73    32   100
## 5 Rafaela    1.85    50    70
```

## filter(): Filtrando linhas e usando o pipe

Sempre que estivermos manipulando linhas, utilizamos o **verbo "filtrar"**. No tidyverse, mais especificamente no pacote dplyr, usamos a função filter() e estabelecemos argumentos lógicos para a filtragem.


```r
# Filtrando linhas ----
idade = filter(data, idade >= 30)
idade_nome = filter(idade, nome == "Júlia")
```

Mas, e se eu quiser filtrar usando mais operações?

Temos duas formas de fazer isso.

A primeira é usando "OU" e %in% c().


```r
# Filtrando mais de um valor usando | (OU) e "%in% c()"
data %>%                   #Tenho este objeto
  filter(nome == "Júlia" | # E então vou filtrar indivíduos que tenham o nome "Júlia" OU 
           nome == "Gabriela") #"Gabriela"
```

```
##       nome altura idade
## 1 Gabriela   1.59    30
## 2    Júlia   1.60    25
```

```r
data %>%  
  filter(nome %in% c(     # Filtrando os valores "Júlia" OU "Gabriela" dentro (%in%) da coluna "nome" 
    "Júlia", 
    "Gabriela")) 
```

```
##       nome altura idade
## 1 Gabriela   1.59    30
## 2    Júlia   1.60    25
```

E a segunda é usando o **pipe (%\>%),** que permite "costurar" operações e resultados. Dessa forma, não precisamos criar uma variável/objeto sempre que uma função for aplicada. Usaremos muito o pipe nos próximos códigos.

Abaixo, pegamos uma tabela, filtramos por idade e, então, filtramos somente linhas que não contêm um valor.


```r
# Usando o pipe "%>%" (lê-se "e então")
data %>%                   # Tenho este objeto 
  filter(idade >= 30) %>%  # E então vou filtrar os indivíduos com menos de 30 anos
  filter(nome != "Júlia")   # E então vou filtrar os indivíduos que não incluam a "Júlia"
```

```
##       nome altura idade
## 1 Gabriela   1.59    30
## 2  Beatriz   1.65    31
## 3    Luiza   1.73    32
```

## select(): Selecionando colunas

Da mesma forma que trabalhamos com linhas usando filter(), ao trabalhar com colunas, usamos o select().

A função select é muito versátil, e **além de selecionar colunas** que você quer trabalhar, podemos **reordená-las e renomeá-las**.

Mas, cuidado, pois ao renomeá-las, se esquecermos do "**everything()**", ficamos somente com a coluna renomeada.

Por isso, temos a função **rename()**, que evita que isso aconteça.


```r
# Selecionando colunas ----
# Selecionar colunas específicas
data_2 %>%
  select(nome, altura) 
```

```
##       nome altura
## 1 Gabriela   1.59
## 2    Júlia   1.60
## 3  Beatriz   1.65
## 4    Luiza   1.73
## 5  Rafaela   1.85
```

```r
# Selecionar da coluna nome (1) à coluna peso (3)
data_2 %>% 
  select(nome:peso) 
```

```
##       nome altura idade peso
## 1 Gabriela   1.59    30   50
## 2    Júlia   1.60    25   80
## 3  Beatriz   1.65    31   40
## 4    Luiza   1.73    32  100
## 5  Rafaela   1.85    50   70
```

```r
#Retirando coluna
data_2 %>% 
  select(-idade) 
```

```
##       nome altura peso
## 1 Gabriela   1.59   50
## 2    Júlia   1.60   80
## 3  Beatriz   1.65   40
## 4    Luiza   1.73  100
## 5  Rafaela   1.85   70
```

```r
data_2 %>%   
  select(!idade)
```

```
##       nome altura peso
## 1 Gabriela   1.59   50
## 2    Júlia   1.60   80
## 3  Beatriz   1.65   40
## 4    Luiza   1.73  100
## 5  Rafaela   1.85   70
```

```r
#Reordenando coluna
data_2 %>%   
  select(idade, everything())
```

```
##   idade     nome altura peso
## 1    30 Gabriela   1.59   50
## 2    25    Júlia   1.60   80
## 3    31  Beatriz   1.65   40
## 4    32    Luiza   1.73  100
## 5    50  Rafaela   1.85   70
```

```r
#Renomeando coluna
data_2 %>%   
  select(age = idade, everything())
```

```
##   age     nome altura peso
## 1  30 Gabriela   1.59   50
## 2  25    Júlia   1.60   80
## 3  31  Beatriz   1.65   40
## 4  32    Luiza   1.73  100
## 5  50  Rafaela   1.85   70
```

```r
#Renomeando coluna com rename
data_2 %>%   
  rename(age = idade) #Retirando coluna
```

```
##       nome altura age peso
## 1 Gabriela   1.59  30   50
## 2    Júlia   1.60  25   80
## 3  Beatriz   1.65  31   40
## 4    Luiza   1.73  32  100
## 5  Rafaela   1.85  50   70
```

## mutate(): Criando e realizando operações com novas variáveis

A função mutate() permite criar ou modificar **colunas** e imputar valores usando funções que se aplicarão a todas as linhas daquela coluna.


```r
# Criando novas variáveis
data_2 = data_2 %>%
  mutate(imc = peso / (altura^2)) #Para cada linha da tabela, pegaremos o valor do peso e dividiremos pela altura ao quadrado.

data_2 %>% 
  mutate(sexo = "feminino") #Como todas as linhas contêm nomes femininos, criaremos a coluna sexo com o valor "feminino"
```

```
##       nome altura idade peso      imc     sexo
## 1 Gabriela   1.59    30   50 19.77770 feminino
## 2    Júlia   1.60    25   80 31.25000 feminino
## 3  Beatriz   1.65    31   40 14.69238 feminino
## 4    Luiza   1.73    32  100 33.41241 feminino
## 5  Rafaela   1.85    50   70 20.45289 feminino
```

## summarize(): resumindo estatísticas

A função summarize (ou summarise) aplica a mesma lógica, mas a tabela gerada é muito menor, e se aplica à variável de interesse na tabela. Por exemplo, se quisermos obter a média (mean()), e a soma (sum()) das linhas de uma coluna, a summarize é capaz de fazer isso.


```r
# Resumindo dados
data_2 %>% 
  summarize(Media_idade = mean(idade))
```

```
##   Media_idade
## 1        33.6
```

```r
data_2 %>% 
  summarize(Soma_idade = sum(idade))
```

```
##   Soma_idade
## 1        168
```

## arrange(): Ordenando dados


```r
# Ordenando dados de forma crescente
data_2 %>% 
  arrange(idade)
```

```
##       nome altura idade peso      imc
## 1    Júlia   1.60    25   80 31.25000
## 2 Gabriela   1.59    30   50 19.77770
## 3  Beatriz   1.65    31   40 14.69238
## 4    Luiza   1.73    32  100 33.41241
## 5  Rafaela   1.85    50   70 20.45289
```

```r
# Ordenando de forma decrescente
#Método 1
data_2 %>% 
  arrange(desc(idade))
```

```
##       nome altura idade peso      imc
## 1  Rafaela   1.85    50   70 20.45289
## 2    Luiza   1.73    32  100 33.41241
## 3  Beatriz   1.65    31   40 14.69238
## 4 Gabriela   1.59    30   50 19.77770
## 5    Júlia   1.60    25   80 31.25000
```

```r
#Método 2
data_2 %>% 
  arrange(-idade)
```

```
##       nome altura idade peso      imc
## 1  Rafaela   1.85    50   70 20.45289
## 2    Luiza   1.73    32  100 33.41241
## 3  Beatriz   1.65    31   40 14.69238
## 4 Gabriela   1.59    30   50 19.77770
## 5    Júlia   1.60    25   80 31.25000
```

## Usando o pipe para fazer múltiplas operações de uma vez

Usando o pipe, podemos escrever e ler códigos em uma sequência lógica fácil.

Por exemplo, abaixo:

*pegamos a tabela **data_2**, **ordenamos** a altura na ordem crescente,*

***filtramos** somente as pessoas com idade acima de 30 e peso acima de 50 e **retiramos** os nomes.*

*Depois, **arredondamos** os valores do IMC para uma casa decimal (usando round()) e **criamos uma nova variável** chamada peso versus idade.*

*Por fim, **resumimos** os dados usando a média do peso e a média do imc.*


```r
# Múltiplas operações em uma caixa
data_2 %>% 
  arrange(altura) %>% 
  filter(idade >= 30,
         peso >= 50) %>% 
  select(-nome) %>% 
  mutate(imc = round(imc, 1),
         peso_x_idade = peso * idade) %>%
  summarise(mean_peso = mean(peso) %>% round(1),
            mean_imc = mean(imc) %>% round(1))
```

```
##   mean_peso mean_imc
## 1      73.3     24.6
```

# 4. Trabalhando com dados reais

## Importando e padronizando tabela


```r
#Pelo readr
cobertura_vacinal_unicef <- read_csv("cobertura_vacinal_unicef.csv") 
```

```
## Rows: 103066 Columns: 6
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr (4): country, unicef_region, iso3, vaccine
## dbl (2): year, cov
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```r
#Manual: File > Import Dataset > From text (readr)
cobertura_vacinal_unicef
```

```
## # A tibble: 103,066 × 6
##    country      year   cov unicef_region iso3  vaccine
##    <chr>       <dbl> <dbl> <chr>         <chr> <chr>  
##  1 Afghanistan  2022    88 ROSA          AFG   BCG    
##  2 Afghanistan  2021    84 ROSA          AFG   BCG    
##  3 Afghanistan  2020    87 ROSA          AFG   BCG    
##  4 Afghanistan  2019    86 ROSA          AFG   BCG    
##  5 Afghanistan  2018    89 ROSA          AFG   BCG    
##  6 Afghanistan  2017    84 ROSA          AFG   BCG    
##  7 Afghanistan  2016    78 ROSA          AFG   BCG    
##  8 Afghanistan  2015    76 ROSA          AFG   BCG    
##  9 Afghanistan  2014    74 ROSA          AFG   BCG    
## 10 Afghanistan  2013    72 ROSA          AFG   BCG    
## # ℹ 103,056 more rows
```

```r
data_long = cobertura_vacinal_unicef 
```

## Explorando dados

### Visualizando tabelas


```r
# Explorando dados -----

# Tabela completa
view(data_long) 

# Descrição geral
glimpse(data_long)
```

```
## Rows: 103,066
## Columns: 6
## $ country       <chr> "Afghanistan", "Afghanistan", "Afghanistan", "Afghanista…
## $ year          <dbl> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014, 20…
## $ cov           <dbl> 88, 84, 87, 86, 89, 84, 78, 76, 74, 72, 78, 71, 68, 64, …
## $ unicef_region <chr> "ROSA", "ROSA", "ROSA", "ROSA", "ROSA", "ROSA", "ROSA", …
## $ iso3          <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", …
## $ vaccine       <chr> "BCG", "BCG", "BCG", "BCG", "BCG", "BCG", "BCG", "BCG", …
```

```r
# Primeiras 10 linhas
head(data_long, 10)
```

```
## # A tibble: 10 × 6
##    country      year   cov unicef_region iso3  vaccine
##    <chr>       <dbl> <dbl> <chr>         <chr> <chr>  
##  1 Afghanistan  2022    88 ROSA          AFG   BCG    
##  2 Afghanistan  2021    84 ROSA          AFG   BCG    
##  3 Afghanistan  2020    87 ROSA          AFG   BCG    
##  4 Afghanistan  2019    86 ROSA          AFG   BCG    
##  5 Afghanistan  2018    89 ROSA          AFG   BCG    
##  6 Afghanistan  2017    84 ROSA          AFG   BCG    
##  7 Afghanistan  2016    78 ROSA          AFG   BCG    
##  8 Afghanistan  2015    76 ROSA          AFG   BCG    
##  9 Afghanistan  2014    74 ROSA          AFG   BCG    
## 10 Afghanistan  2013    72 ROSA          AFG   BCG
```

```r
# Últimas 10 linhas
tail(data_long, 10)
```

```
## # A tibble: 10 × 6
##    country  year   cov unicef_region iso3  vaccine
##    <chr>   <dbl> <dbl> <chr>         <chr> <chr>  
##  1 WCAR     2022    28 WCAR          <NA>  HEPBB  
##  2 WCAR     2022    69 WCAR          <NA>  HIB3   
##  3 WCAR     2022    70 WCAR          <NA>  IPV1   
##  4 WCAR     2022    64 WCAR          <NA>  MCV1   
##  5 WCAR     2022    32 WCAR          <NA>  MCV2   
##  6 WCAR     2022    64 WCAR          <NA>  PCV3   
##  7 WCAR     2022    68 WCAR          <NA>  POL3   
##  8 WCAR     2022    20 WCAR          <NA>  RCV1   
##  9 WCAR     2022    44 WCAR          <NA>  ROTAC  
## 10 WCAR     2022    62 WCAR          <NA>  YFV
```

```r
#Summary statistics
summary(data_long)
```

```
##    country               year           cov        unicef_region     
##  Length:103066      Min.   :1980   Min.   : 0.00   Length:103066     
##  Class :character   1st Qu.:1990   1st Qu.:75.00   Class :character  
##  Mode  :character   Median :2001   Median :90.00   Mode  :character  
##                     Mean   :2001   Mean   :81.46                     
##                     3rd Qu.:2012   3rd Qu.:97.00                     
##                     Max.   :2022   Max.   :99.00                     
##                                    NA's   :39349                     
##      iso3             vaccine         
##  Length:103066      Length:103066     
##  Class :character   Class :character  
##  Mode  :character   Mode  :character  
##                                       
##                                       
##                                       
## 
```


```r
#Níveis de colunas
unique(data_long$unicef_region)
```

```
## [1] "ROSA"          "ECAR"          "MENA"          "ESAR"         
## [5] "LACR"          "Non-programme" "WCAR"          "EAPR"         
## [9] "Global"
```

```r
unique(data_long$country)
```

```
##   [1] "Afghanistan"                          
##   [2] "Albania"                              
##   [3] "Algeria"                              
##   [4] "Angola"                               
##   [5] "Argentina"                            
##   [6] "Armenia"                              
##   [7] "Austria"                              
##   [8] "Azerbaijan"                           
##   [9] "Bangladesh"                           
##  [10] "Belarus"                              
##  [11] "Belize"                               
##  [12] "Benin"                                
##  [13] "Bhutan"                               
##  [14] "Bolivia (Plurinational State of)"     
##  [15] "Bosnia and Herzegovina"               
##  [16] "Botswana"                             
##  [17] "Brazil"                               
##  [18] "Brunei Darussalam"                    
##  [19] "Bulgaria"                             
##  [20] "Burkina Faso"                         
##  [21] "Burundi"                              
##  [22] "Cabo Verde"                           
##  [23] "Cambodia"                             
##  [24] "Cameroon"                             
##  [25] "Central African Republic"             
##  [26] "Chad"                                 
##  [27] "Chile"                                
##  [28] "China"                                
##  [29] "Colombia"                             
##  [30] "Comoros"                              
##  [31] "Congo"                                
##  [32] "Cook Islands"                         
##  [33] "Costa Rica"                           
##  [34] "Cote d'Ivoire"                        
##  [35] "Croatia"                              
##  [36] "Cuba"                                 
##  [37] "Czechia"                              
##  [38] "Democratic People's Republic of Korea"
##  [39] "Democratic Republic of the Congo"     
##  [40] "Djibouti"                             
##  [41] "Dominica"                             
##  [42] "Dominican Republic"                   
##  [43] "Ecuador"                              
##  [44] "Egypt"                                
##  [45] "El Salvador"                          
##  [46] "Equatorial Guinea"                    
##  [47] "Eritrea"                              
##  [48] "Estonia"                              
##  [49] "Eswatini"                             
##  [50] "Ethiopia"                             
##  [51] "Fiji"                                 
##  [52] "Finland"                              
##  [53] "France"                               
##  [54] "Gabon"                                
##  [55] "Gambia"                               
##  [56] "Georgia"                              
##  [57] "Ghana"                                
##  [58] "Greece"                               
##  [59] "Guatemala"                            
##  [60] "Guinea"                               
##  [61] "Guinea-Bissau"                        
##  [62] "Guyana"                               
##  [63] "Haiti"                                
##  [64] "Honduras"                             
##  [65] "Hungary"                              
##  [66] "India"                                
##  [67] "Indonesia"                            
##  [68] "Iran (Islamic Republic of)"           
##  [69] "Iraq"                                 
##  [70] "Ireland"                              
##  [71] "Israel"                               
##  [72] "Jamaica"                              
##  [73] "Japan"                                
##  [74] "Jordan"                               
##  [75] "Kazakhstan"                           
##  [76] "Kenya"                                
##  [77] "Kiribati"                             
##  [78] "Kuwait"                               
##  [79] "Kyrgyzstan"                           
##  [80] "Lao People's Democratic Republic"     
##  [81] "Latvia"                               
##  [82] "Lesotho"                              
##  [83] "Liberia"                              
##  [84] "Libya"                                
##  [85] "Lithuania"                            
##  [86] "Madagascar"                           
##  [87] "Malawi"                               
##  [88] "Malaysia"                             
##  [89] "Maldives"                             
##  [90] "Mali"                                 
##  [91] "Malta"                                
##  [92] "Marshall Islands"                     
##  [93] "Mauritania"                           
##  [94] "Mauritius"                            
##  [95] "Mexico"                               
##  [96] "Micronesia (Federated States of)"     
##  [97] "Monaco"                               
##  [98] "Mongolia"                             
##  [99] "Montenegro"                           
## [100] "Morocco"                              
## [101] "Mozambique"                           
## [102] "Myanmar"                              
## [103] "Namibia"                              
## [104] "Nauru"                                
## [105] "Nepal"                                
## [106] "Nicaragua"                            
## [107] "Niger"                                
## [108] "Nigeria"                              
## [109] "Niue"                                 
## [110] "North Macedonia"                      
## [111] "Oman"                                 
## [112] "Pakistan"                             
## [113] "Panama"                               
## [114] "Papua New Guinea"                     
## [115] "Paraguay"                             
## [116] "Peru"                                 
## [117] "Philippines"                          
## [118] "Poland"                               
## [119] "Portugal"                             
## [120] "Qatar"                                
## [121] "Republic of Korea"                    
## [122] "Republic of Moldova"                  
## [123] "Romania"                              
## [124] "Russian Federation"                   
## [125] "Rwanda"                               
## [126] "Saint Kitts and Nevis"                
## [127] "Saint Lucia"                          
## [128] "Saint Vincent and the Grenadines"     
## [129] "Samoa"                                
## [130] "Sao Tome and Principe"                
## [131] "Saudi Arabia"                         
## [132] "Senegal"                              
## [133] "Serbia"                               
## [134] "Seychelles"                           
## [135] "Sierra Leone"                         
## [136] "Singapore"                            
## [137] "Slovakia"                             
## [138] "Slovenia"                             
## [139] "Solomon Islands"                      
## [140] "Somalia"                              
## [141] "South Africa"                         
## [142] "South Sudan"                          
## [143] "Sri Lanka"                            
## [144] "State of Palestine"                   
## [145] "Sudan"                                
## [146] "Sweden"                               
## [147] "Syrian Arab Republic"                 
## [148] "Tajikistan"                           
## [149] "Thailand"                             
## [150] "Timor-Leste"                          
## [151] "Togo"                                 
## [152] "Tonga"                                
## [153] "Tunisia"                              
## [154] "Turkiye"                              
## [155] "Turkmenistan"                         
## [156] "Tuvalu"                               
## [157] "Uganda"                               
## [158] "Ukraine"                              
## [159] "United Arab Emirates"                 
## [160] "United Republic of Tanzania"          
## [161] "Uruguay"                              
## [162] "Uzbekistan"                           
## [163] "Vanuatu"                              
## [164] "Venezuela (Bolivarian Republic of)"   
## [165] "Viet Nam"                             
## [166] "Yemen"                                
## [167] "Zambia"                               
## [168] "Zimbabwe"                             
## [169] "Andorra"                              
## [170] "Antigua and Barbuda"                  
## [171] "Australia"                            
## [172] "Bahamas"                              
## [173] "Bahrain"                              
## [174] "Barbados"                             
## [175] "Belgium"                              
## [176] "Canada"                               
## [177] "Cyprus"                               
## [178] "Denmark"                              
## [179] "Germany"                              
## [180] "Grenada"                              
## [181] "Iceland"                              
## [182] "Italy"                                
## [183] "Lebanon"                              
## [184] "Luxembourg"                           
## [185] "Netherlands (Kingdom of the)"         
## [186] "New Zealand"                          
## [187] "Norway"                               
## [188] "Palau"                                
## [189] "San Marino"                           
## [190] "Spain"                                
## [191] "Suriname"                             
## [192] "Switzerland"                          
## [193] "Trinidad and Tobago"                  
## [194] "United Kingdom"                       
## [195] "United States"                        
## [196] "Global"                               
## [197] "EAPR"                                 
## [198] "ECAR"                                 
## [199] "ESAR"                                 
## [200] "LACR"                                 
## [201] "MENA"                                 
## [202] "Non-programme"                        
## [203] "ROSA"                                 
## [204] "WCAR"
```

```r
unique(data_long$vaccine)
```

```
##  [1] "BCG"   "DTP1"  "DTP3"  "HEPB3" "HEPBB" "HIB3"  "IPV1"  "MCV1"  "MCV2" 
## [10] "PCV3"  "POL3"  "RCV1"  "ROTAC" "YFV"
```

```r
#Contar linhas por coluna
data_long %>% count(country) 
```

```
## # A tibble: 204 × 2
##    country                 n
##    <chr>               <int>
##  1 Afghanistan           516
##  2 Albania               559
##  3 Algeria               516
##  4 Andorra               473
##  5 Angola                559
##  6 Antigua and Barbuda   430
##  7 Argentina             602
##  8 Armenia               559
##  9 Australia             473
## 10 Austria               473
## # ℹ 194 more rows
```

```r
data_long %>% count(vaccine) 
```

```
## # A tibble: 14 × 2
##    vaccine     n
##    <chr>   <int>
##  1 BCG      7611
##  2 DTP1     8772
##  3 DTP3     8772
##  4 HEPB3    8555
##  5 HEPBB    4808
##  6 HIB3     8639
##  7 IPV1     8457
##  8 MCV1     8772
##  9 MCV2     8248
## 10 PCV3     6800
## 11 POL3     8772
## 12 RCV1     7869
## 13 ROTAC    5270
## 14 YFV      1721
```

```r
data_long %>% count(unicef_region) 
```

```
## # A tibble: 9 × 2
##   unicef_region     n
##   <chr>         <int>
## 1 EAPR          15551
## 2 ECAR          11337
## 3 ESAR          12008
## 4 Global          441
## 5 LACR          17727
## 6 MENA          10761
## 7 Non-programme 17916
## 8 ROSA           4371
## 9 WCAR          12954
```

```r
#Tabela de frequências
table(data_long$country)
```

```
## 
##                           Afghanistan                               Albania 
##                                   516                                   559 
##                               Algeria                               Andorra 
##                                   516                                   473 
##                                Angola                   Antigua and Barbuda 
##                                   559                                   430 
##                             Argentina                               Armenia 
##                                   602                                   559 
##                             Australia                               Austria 
##                                   473                                   473 
##                            Azerbaijan                               Bahamas 
##                                   516                                   473 
##                               Bahrain                            Bangladesh 
##                                   516                                   473 
##                              Barbados                               Belarus 
##                                   430                                   473 
##                               Belgium                                Belize 
##                                   473                                   473 
##                                 Benin                                Bhutan 
##                                   559                                   516 
##      Bolivia (Plurinational State of)                Bosnia and Herzegovina 
##                                   559                                   430 
##                              Botswana                                Brazil 
##                                   559                                   602 
##                     Brunei Darussalam                              Bulgaria 
##                                   473                                   559 
##                          Burkina Faso                               Burundi 
##                                   602                                   516 
##                            Cabo Verde                              Cambodia 
##                                   473                                   516 
##                              Cameroon                                Canada 
##                                   559                                   473 
##              Central African Republic                                  Chad 
##                                   430                                   430 
##                                 Chile                                 China 
##                                   516                                   430 
##                              Colombia                               Comoros 
##                                   602                                   430 
##                                 Congo                          Cook Islands 
##                                   559                                   473 
##                            Costa Rica                         Cote d'Ivoire 
##                                   559                                   602 
##                               Croatia                                  Cuba 
##                                   516                                   473 
##                                Cyprus                               Czechia 
##                                   430                                   430 
## Democratic People's Republic of Korea      Democratic Republic of the Congo 
##                                   430                                   473 
##                               Denmark                              Djibouti 
##                                   387                                   516 
##                              Dominica                    Dominican Republic 
##                                   473                                   559 
##                                  EAPR                                  ECAR 
##                                   415                                   415 
##                               Ecuador                                 Egypt 
##                                   602                                   473 
##                           El Salvador                     Equatorial Guinea 
##                                   559                                   430 
##                               Eritrea                                  ESAR 
##                                   516                                   441 
##                               Estonia                              Eswatini 
##                                   473                                   516 
##                              Ethiopia                                  Fiji 
##                                   473                                   559 
##                               Finland                                France 
##                                   473                                   473 
##                                 Gabon                                Gambia 
##                                   387                                   602 
##                               Georgia                               Germany 
##                                   559                                   473 
##                                 Ghana                                Global 
##                                   559                                   441 
##                                Greece                               Grenada 
##                                   516                                   430 
##                             Guatemala                                Guinea 
##                                   559                                   430 
##                         Guinea-Bissau                                Guyana 
##                                   516                                   602 
##                                 Haiti                              Honduras 
##                                   516                                   559 
##                               Hungary                               Iceland 
##                                   430                                   387 
##                                 India                             Indonesia 
##                                   559                                   516 
##            Iran (Islamic Republic of)                                  Iraq 
##                                   473                                   559 
##                               Ireland                                Israel 
##                                   473                                   559 
##                                 Italy                               Jamaica 
##                                   473                                   430 
##                                 Japan                                Jordan 
##                                   516                                   473 
##                            Kazakhstan                                 Kenya 
##                                   516                                   559 
##                              Kiribati                                Kuwait 
##                                   559                                   559 
##                            Kyrgyzstan                                  LACR 
##                                   559                                   441 
##      Lao People's Democratic Republic                                Latvia 
##                                   516                                   559 
##                               Lebanon                               Lesotho 
##                                   473                                   516 
##                               Liberia                                 Libya 
##                                   516                                   516 
##                             Lithuania                            Luxembourg 
##                                   559                                   473 
##                            Madagascar                                Malawi 
##                                   473                                   516 
##                              Malaysia                              Maldives 
##                                   516                                   473 
##                                  Mali                                 Malta 
##                                   516                                   473 
##                      Marshall Islands                            Mauritania 
##                                   559                                   473 
##                             Mauritius                                  MENA 
##                                   516                                   441 
##                                Mexico      Micronesia (Federated States of) 
##                                   559                                   559 
##                                Monaco                              Mongolia 
##                                   430                                   516 
##                            Montenegro                               Morocco 
##                                   430                                   559 
##                            Mozambique                               Myanmar 
##                                   516                                   559 
##                               Namibia                                 Nauru 
##                                   559                                   559 
##                                 Nepal          Netherlands (Kingdom of the) 
##                                   516                                   430 
##                           New Zealand                             Nicaragua 
##                                   473                                   516 
##                                 Niger                               Nigeria 
##                                   516                                   559 
##                                  Niue                         Non-programme 
##                                   559                                   415 
##                       North Macedonia                                Norway 
##                                   559                                   473 
##                                  Oman                              Pakistan 
##                                   516                                   473 
##                                 Palau                                Panama 
##                                   516                                   602 
##                      Papua New Guinea                              Paraguay 
##                                   516                                   559 
##                                  Peru                           Philippines 
##                                   602                                   559 
##                                Poland                              Portugal 
##                                   516                                   516 
##                                 Qatar                     Republic of Korea 
##                                   559                                   516 
##                   Republic of Moldova                               Romania 
##                                   559                                   516 
##                                  ROSA                    Russian Federation 
##                                   415                                   473 
##                                Rwanda                 Saint Kitts and Nevis 
##                                   516                                   473 
##                           Saint Lucia      Saint Vincent and the Grenadines 
##                                   473                                   473 
##                                 Samoa                            San Marino 
##                                   559                                   430 
##                 Sao Tome and Principe                          Saudi Arabia 
##                                   602                                   559 
##                               Senegal                                Serbia 
##                                   602                                   516 
##                            Seychelles                          Sierra Leone 
##                                   516                                   559 
##                             Singapore                              Slovakia 
##                                   516                                   473 
##                              Slovenia                       Solomon Islands 
##                                   473                                   559 
##                               Somalia                          South Africa 
##                                   387                                   473 
##                           South Sudan                                 Spain 
##                                   344                                   430 
##                             Sri Lanka                    State of Palestine 
##                                   430                                   559 
##                                 Sudan                              Suriname 
##                                   473                                   473 
##                                Sweden                           Switzerland 
##                                   516                                   430 
##                  Syrian Arab Republic                            Tajikistan 
##                                   430                                   516 
##                              Thailand                           Timor-Leste 
##                                   516                                   516 
##                                  Togo                                 Tonga 
##                                   559                                   516 
##                   Trinidad and Tobago                               Tunisia 
##                                   473                                   516 
##                               Turkiye                          Turkmenistan 
##                                   516                                   559 
##                                Tuvalu                                Uganda 
##                                   559                                   559 
##                               Ukraine                  United Arab Emirates 
##                                   473                                   559 
##                        United Kingdom           United Republic of Tanzania 
##                                   473                                   516 
##                         United States                               Uruguay 
##                                   516                                   473 
##                            Uzbekistan                               Vanuatu 
##                                   559                                   516 
##    Venezuela (Bolivarian Republic of)                              Viet Nam 
##                                   602                                   473 
##                                  WCAR                                 Yemen 
##                                   441                                   516 
##                                Zambia                              Zimbabwe 
##                                   516                                   516
```

```r
tabyl(data_long, country)
```

```
##                                country   n     percent
##                            Afghanistan 516 0.005006501
##                                Albania 559 0.005423709
##                                Algeria 516 0.005006501
##                                Andorra 473 0.004589292
##                                 Angola 559 0.005423709
##                    Antigua and Barbuda 430 0.004172084
##                              Argentina 602 0.005840917
##                                Armenia 559 0.005423709
##                              Australia 473 0.004589292
##                                Austria 473 0.004589292
##                             Azerbaijan 516 0.005006501
##                                Bahamas 473 0.004589292
##                                Bahrain 516 0.005006501
##                             Bangladesh 473 0.004589292
##                               Barbados 430 0.004172084
##                                Belarus 473 0.004589292
##                                Belgium 473 0.004589292
##                                 Belize 473 0.004589292
##                                  Benin 559 0.005423709
##                                 Bhutan 516 0.005006501
##       Bolivia (Plurinational State of) 559 0.005423709
##                 Bosnia and Herzegovina 430 0.004172084
##                               Botswana 559 0.005423709
##                                 Brazil 602 0.005840917
##                      Brunei Darussalam 473 0.004589292
##                               Bulgaria 559 0.005423709
##                           Burkina Faso 602 0.005840917
##                                Burundi 516 0.005006501
##                             Cabo Verde 473 0.004589292
##                               Cambodia 516 0.005006501
##                               Cameroon 559 0.005423709
##                                 Canada 473 0.004589292
##               Central African Republic 430 0.004172084
##                                   Chad 430 0.004172084
##                                  Chile 516 0.005006501
##                                  China 430 0.004172084
##                               Colombia 602 0.005840917
##                                Comoros 430 0.004172084
##                                  Congo 559 0.005423709
##                           Cook Islands 473 0.004589292
##                             Costa Rica 559 0.005423709
##                          Cote d'Ivoire 602 0.005840917
##                                Croatia 516 0.005006501
##                                   Cuba 473 0.004589292
##                                 Cyprus 430 0.004172084
##                                Czechia 430 0.004172084
##  Democratic People's Republic of Korea 430 0.004172084
##       Democratic Republic of the Congo 473 0.004589292
##                                Denmark 387 0.003754876
##                               Djibouti 516 0.005006501
##                               Dominica 473 0.004589292
##                     Dominican Republic 559 0.005423709
##                                   EAPR 415 0.004026546
##                                   ECAR 415 0.004026546
##                                   ESAR 441 0.004278812
##                                Ecuador 602 0.005840917
##                                  Egypt 473 0.004589292
##                            El Salvador 559 0.005423709
##                      Equatorial Guinea 430 0.004172084
##                                Eritrea 516 0.005006501
##                                Estonia 473 0.004589292
##                               Eswatini 516 0.005006501
##                               Ethiopia 473 0.004589292
##                                   Fiji 559 0.005423709
##                                Finland 473 0.004589292
##                                 France 473 0.004589292
##                                  Gabon 387 0.003754876
##                                 Gambia 602 0.005840917
##                                Georgia 559 0.005423709
##                                Germany 473 0.004589292
##                                  Ghana 559 0.005423709
##                                 Global 441 0.004278812
##                                 Greece 516 0.005006501
##                                Grenada 430 0.004172084
##                              Guatemala 559 0.005423709
##                                 Guinea 430 0.004172084
##                          Guinea-Bissau 516 0.005006501
##                                 Guyana 602 0.005840917
##                                  Haiti 516 0.005006501
##                               Honduras 559 0.005423709
##                                Hungary 430 0.004172084
##                                Iceland 387 0.003754876
##                                  India 559 0.005423709
##                              Indonesia 516 0.005006501
##             Iran (Islamic Republic of) 473 0.004589292
##                                   Iraq 559 0.005423709
##                                Ireland 473 0.004589292
##                                 Israel 559 0.005423709
##                                  Italy 473 0.004589292
##                                Jamaica 430 0.004172084
##                                  Japan 516 0.005006501
##                                 Jordan 473 0.004589292
##                             Kazakhstan 516 0.005006501
##                                  Kenya 559 0.005423709
##                               Kiribati 559 0.005423709
##                                 Kuwait 559 0.005423709
##                             Kyrgyzstan 559 0.005423709
##                                   LACR 441 0.004278812
##       Lao People's Democratic Republic 516 0.005006501
##                                 Latvia 559 0.005423709
##                                Lebanon 473 0.004589292
##                                Lesotho 516 0.005006501
##                                Liberia 516 0.005006501
##                                  Libya 516 0.005006501
##                              Lithuania 559 0.005423709
##                             Luxembourg 473 0.004589292
##                                   MENA 441 0.004278812
##                             Madagascar 473 0.004589292
##                                 Malawi 516 0.005006501
##                               Malaysia 516 0.005006501
##                               Maldives 473 0.004589292
##                                   Mali 516 0.005006501
##                                  Malta 473 0.004589292
##                       Marshall Islands 559 0.005423709
##                             Mauritania 473 0.004589292
##                              Mauritius 516 0.005006501
##                                 Mexico 559 0.005423709
##       Micronesia (Federated States of) 559 0.005423709
##                                 Monaco 430 0.004172084
##                               Mongolia 516 0.005006501
##                             Montenegro 430 0.004172084
##                                Morocco 559 0.005423709
##                             Mozambique 516 0.005006501
##                                Myanmar 559 0.005423709
##                                Namibia 559 0.005423709
##                                  Nauru 559 0.005423709
##                                  Nepal 516 0.005006501
##           Netherlands (Kingdom of the) 430 0.004172084
##                            New Zealand 473 0.004589292
##                              Nicaragua 516 0.005006501
##                                  Niger 516 0.005006501
##                                Nigeria 559 0.005423709
##                                   Niue 559 0.005423709
##                          Non-programme 415 0.004026546
##                        North Macedonia 559 0.005423709
##                                 Norway 473 0.004589292
##                                   Oman 516 0.005006501
##                               Pakistan 473 0.004589292
##                                  Palau 516 0.005006501
##                                 Panama 602 0.005840917
##                       Papua New Guinea 516 0.005006501
##                               Paraguay 559 0.005423709
##                                   Peru 602 0.005840917
##                            Philippines 559 0.005423709
##                                 Poland 516 0.005006501
##                               Portugal 516 0.005006501
##                                  Qatar 559 0.005423709
##                                   ROSA 415 0.004026546
##                      Republic of Korea 516 0.005006501
##                    Republic of Moldova 559 0.005423709
##                                Romania 516 0.005006501
##                     Russian Federation 473 0.004589292
##                                 Rwanda 516 0.005006501
##                  Saint Kitts and Nevis 473 0.004589292
##                            Saint Lucia 473 0.004589292
##       Saint Vincent and the Grenadines 473 0.004589292
##                                  Samoa 559 0.005423709
##                             San Marino 430 0.004172084
##                  Sao Tome and Principe 602 0.005840917
##                           Saudi Arabia 559 0.005423709
##                                Senegal 602 0.005840917
##                                 Serbia 516 0.005006501
##                             Seychelles 516 0.005006501
##                           Sierra Leone 559 0.005423709
##                              Singapore 516 0.005006501
##                               Slovakia 473 0.004589292
##                               Slovenia 473 0.004589292
##                        Solomon Islands 559 0.005423709
##                                Somalia 387 0.003754876
##                           South Africa 473 0.004589292
##                            South Sudan 344 0.003337667
##                                  Spain 430 0.004172084
##                              Sri Lanka 430 0.004172084
##                     State of Palestine 559 0.005423709
##                                  Sudan 473 0.004589292
##                               Suriname 473 0.004589292
##                                 Sweden 516 0.005006501
##                            Switzerland 430 0.004172084
##                   Syrian Arab Republic 430 0.004172084
##                             Tajikistan 516 0.005006501
##                               Thailand 516 0.005006501
##                            Timor-Leste 516 0.005006501
##                                   Togo 559 0.005423709
##                                  Tonga 516 0.005006501
##                    Trinidad and Tobago 473 0.004589292
##                                Tunisia 516 0.005006501
##                                Turkiye 516 0.005006501
##                           Turkmenistan 559 0.005423709
##                                 Tuvalu 559 0.005423709
##                                 Uganda 559 0.005423709
##                                Ukraine 473 0.004589292
##                   United Arab Emirates 559 0.005423709
##                         United Kingdom 473 0.004589292
##            United Republic of Tanzania 516 0.005006501
##                          United States 516 0.005006501
##                                Uruguay 473 0.004589292
##                             Uzbekistan 559 0.005423709
##                                Vanuatu 516 0.005006501
##     Venezuela (Bolivarian Republic of) 602 0.005840917
##                               Viet Nam 473 0.004589292
##                                   WCAR 441 0.004278812
##                                  Yemen 516 0.005006501
##                                 Zambia 516 0.005006501
##                               Zimbabwe 516 0.005006501
```

### Dados faltantes


```r
# Dados faltantes ----
skim(data_long) # Por que são faltantes? Precisamos deles?
```


Table: Data summary

|                         |          |
|:------------------------|:---------|
|Name                     |data_long |
|Number of rows           |103066    |
|Number of columns        |6         |
|_______________________  |          |
|Column type frequency:   |          |
|character                |4         |
|numeric                  |2         |
|________________________ |          |
|Group variables          |None      |


**Variable type: character**

|skim_variable | n_missing| complete_rate| min| max| empty| n_unique| whitespace|
|:-------------|---------:|-------------:|---:|---:|-----:|--------:|----------:|
|country       |         0|          1.00|   4|  37|     0|      204|          0|
|unicef_region |         0|          1.00|   4|  13|     0|        9|          0|
|iso3          |      3865|          0.96|   3|   3|     0|      195|          0|
|vaccine       |         0|          1.00|   3|   5|     0|       14|          0|


**Variable type: numeric**

|skim_variable | n_missing| complete_rate|    mean|    sd|   p0|  p25|  p50|  p75| p100|hist  |
|:-------------|---------:|-------------:|-------:|-----:|----:|----:|----:|----:|----:|:-----|
|year          |         0|          1.00| 2001.12| 12.41| 1980| 1990| 2001| 2012| 2022|▇▇▇▇▇ |
|cov           |     39349|          0.62|   81.46| 22.10|    0|   75|   90|   97|   99|▁▁▁▂▇ |

```r
# Como são essas linhas?
data_long %>% 
  filter(!complete.cases(.)) %>% 
  view()
```

### Padronizando tabela

Para trabalharmos de forma fácil com uma tabela, precisamos padronizá-la.

Isso significa que **trocaremos e reordenaremos os nomes das colunas** para fazerem mais sentido, completaremos os valores NA quando for possível (e fizer sentido), e explicitaremos algumas coisas, como o nome das doenças contra as quais as vacinas protegem, e daremos o nome completo de cada região, pois somente temos os códigos delas.

**No caso dos valores NA**, sabemos que certas vacinas não estavam disponíveis para todos os países ao mesmo tempo. Por isso, deixaremos como NA e não trocaremos por 0. Valores faltantes são diferentes de 0, por mais que em muitos casos possam ser trocados.

Dessa forma, utilizaremos o **if_else().** Nele, estabelecemos que, se a coluna name for igual à region, então o type será "region", caso contrário, será "country". Completaremos o mesmo com a coluna de abreviação

Além disso, na tabela original, temos dados para todos os países e continentes. Ou seja, temos uma linha chamada "Brasil" e outra chamada "Latin America", por exemplo. Sabemos que o último não é um país, então **criaremos uma coluna chamada type** usando o **if_else()** para diferenciar quando quisermos trabalhar com cada tipo.

Para dar os nomes completos das regiões e criar uma coluna das doenças relacionadas às vacinas, usamos o **case_when()**, que é um if_else() que aceita mais relações.

Assim, *quando algo for igual a algo, chame ele de algo, se algo 2 for igual a algo 2, chame ele de algo 2, ... e se isso tudo for mentira, então deixe como está.*


```r
# Padronizando a tabela ----

data_long_standardized = data_long %>% 
  select(name = country, 
         country_abrev = iso3, 
         year, 
         vaccine, 
         coverage = cov, 
         region = unicef_region) %>% 
  
  
  
  mutate(
         # Anotando dados
         year = as.integer(year), #Aqui, converteremos year em número inteiro, para evitar que seja lido com decimais.
         type = if_else(name == region, # Se o nome for igual à região,
                        "region",       # então ele é uma região,
                        "country"),     # caso contrário, é um país.
         
         country_abrev = if_else(name == region, # Se o nome for igual à região,
                        name,       # então ele é uma região,
                        country_abrev),     # caso contrário, é um país.
         
         region = if_else(is.na(region), 
                          name, 
                          region),
         
         # Vacinas por doenças
         diseases = case_when(vaccine == "BCG" ~ "Tuberculosis",
                              vaccine == "DTP1" ~ "Difteria, Tetanus, Pertussis",
                              vaccine == "DT3" ~ "Difteria, Tetanus, Pertussis",
                              vaccine == "HEPB3" ~ "Hepatitis B",
                              vaccine == "HEPBB" ~ "Hepatitis B",
                              vaccine == "HIB3" ~ "Haemophilus influenzae B",
                              vaccine == "IPV1" ~ "Poliomielitis",
                              vaccine == "MCV1" ~ "Measles",
                              vaccine == "MCV2" ~ "Measles",
                              vaccine == "PCV3" ~ "Pneumococcus",
                              vaccine == "POL3" ~ "Poliomielitis",
                              vaccine == "RCV1" ~ "Rotavirus",
                              vaccine == "ROTAC" ~ "Rotavirus",
                              vaccine == "YFV" ~ "Yellow fever",
                              TRUE ~ vaccine
                              ),
         
         
         # Abreviação para nome completo
         region_complete = case_when(region == "EAPR" ~ "East Asia and Pacific", 
                              region == "ECAR" ~ "Europe and Central Asia",
                              region == "MENA" ~ "Middle East and North Africa",
                              region == "ESAR" ~ "Eastern and Southern Africa",
                              region == "LACR" ~ "Latin America and Caribbean",
                              region == "Non-programme" ~ "Non-programme",
                              region == "ROSA" ~ "South Asia",
                              region == "WCAR" ~ "West and Central Africa",
                              TRUE ~ region
  ))

#Salvar tabela
data_long_standardized %>% 
  saveRDS(file = "cobertura_vacinal_unicef_padronizada.rds")

#Tabela larga
data_wide = data_long_standardized %>% 
   pivot_wider(names_from = year, 
               values_from = coverage)
```

### Unindo tabelas


```r
#Tabela com vacinação
data_long_standardized = readRDS(file = "cobertura_vacinal_unicef_padronizada.rds")
data_long_standardized
```

```
## # A tibble: 103,066 × 9
##    name        country_abrev  year vaccine coverage region type    diseases    
##    <chr>       <chr>         <int> <chr>      <dbl> <chr>  <chr>   <chr>       
##  1 Afghanistan AFG            2022 BCG           88 ROSA   country Tuberculosis
##  2 Afghanistan AFG            2021 BCG           84 ROSA   country Tuberculosis
##  3 Afghanistan AFG            2020 BCG           87 ROSA   country Tuberculosis
##  4 Afghanistan AFG            2019 BCG           86 ROSA   country Tuberculosis
##  5 Afghanistan AFG            2018 BCG           89 ROSA   country Tuberculosis
##  6 Afghanistan AFG            2017 BCG           84 ROSA   country Tuberculosis
##  7 Afghanistan AFG            2016 BCG           78 ROSA   country Tuberculosis
##  8 Afghanistan AFG            2015 BCG           76 ROSA   country Tuberculosis
##  9 Afghanistan AFG            2014 BCG           74 ROSA   country Tuberculosis
## 10 Afghanistan AFG            2013 BCG           72 ROSA   country Tuberculosis
## # ℹ 103,056 more rows
## # ℹ 1 more variable: region_complete <chr>
```

```r
#Tabela com dados gerais de paises
paises_anotados = readRDS(file = "paises_anotados.rds")
paises_anotados
```

```
## # A tibble: 204 × 3
## # Groups:   name [204]
##    name                   continent region_complete             
##    <chr>                  <chr>     <chr>                       
##  1 Afghanistan            Asia      South Asia                  
##  2 Albania                Europe    Europe and Central Asia     
##  3 Algeria                Africa    Middle East and North Africa
##  4 Angola                 Africa    Eastern and Southern Africa 
##  5 Argentina              Americas  Latin America and Caribbean 
##  6 Austria                Europe    Non-programme               
##  7 Bangladesh             Asia      South Asia                  
##  8 Benin                  Africa    West and Central Africa     
##  9 Bosnia and Herzegovina Europe    Europe and Central Asia     
## 10 Botswana               Africa    Eastern and Southern Africa 
## # ℹ 194 more rows
```

```r
#Unindo tabelas
data_long_annotated = data_long_standardized %>% 
  inner_join(paises_anotados, by = "name")

glimpse(data_long_annotated) #Colunas duplicadas
```

```
## Rows: 103,066
## Columns: 11
## $ name              <chr> "Afghanistan", "Afghanistan", "Afghanistan", "Afghan…
## $ country_abrev     <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AF…
## $ year              <int> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014…
## $ vaccine           <chr> "BCG", "BCG", "BCG", "BCG", "BCG", "BCG", "BCG", "BC…
## $ coverage          <dbl> 88, 84, 87, 86, 89, 84, 78, 76, 74, 72, 78, 71, 68, …
## $ region            <chr> "ROSA", "ROSA", "ROSA", "ROSA", "ROSA", "ROSA", "ROS…
## $ type              <chr> "country", "country", "country", "country", "country…
## $ diseases          <chr> "Tuberculosis", "Tuberculosis", "Tuberculosis", "Tub…
## $ region_complete.x <chr> "South Asia", "South Asia", "South Asia", "South Asi…
## $ continent         <chr> "Asia", "Asia", "Asia", "Asia", "Asia", "Asia", "Asi…
## $ region_complete.y <chr> "South Asia", "South Asia", "South Asia", "South Asi…
```

```r
data_long_annotated = data_long_standardized %>% 
  inner_join(paises_anotados %>% 
               select(-region_complete), by = "name")

glimpse(data_long_annotated)
```

```
## Rows: 103,066
## Columns: 10
## $ name            <chr> "Afghanistan", "Afghanistan", "Afghanistan", "Afghanis…
## $ country_abrev   <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG"…
## $ year            <int> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014, …
## $ vaccine         <chr> "BCG", "BCG", "BCG", "BCG", "BCG", "BCG", "BCG", "BCG"…
## $ coverage        <dbl> 88, 84, 87, 86, 89, 84, 78, 76, 74, 72, 78, 71, 68, 64…
## $ region          <chr> "ROSA", "ROSA", "ROSA", "ROSA", "ROSA", "ROSA", "ROSA"…
## $ type            <chr> "country", "country", "country", "country", "country",…
## $ diseases        <chr> "Tuberculosis", "Tuberculosis", "Tuberculosis", "Tuber…
## $ region_complete <chr> "South Asia", "South Asia", "South Asia", "South Asia"…
## $ continent       <chr> "Asia", "Asia", "Asia", "Asia", "Asia", "Asia", "Asia"…
```


```r
#Tabela com mortes por doenças imunopreníveis, por país, ano, sexo e idade
Deaths_infectious_diseases = readRDS(file = "Deaths_infectious_diseases.rds")
glimpse(Deaths_infectious_diseases) # mais de 2 milhões de linhas
```

```
## Rows: 2,719,521
## Columns: 12
## $ who_region_name                         <chr> "Europe", "Europe", "Europe", …
## $ who_region_code                         <chr> "EU", "EU", "EU", "EU", "EU", …
## $ name                                    <chr> "Albania", "Albania", "Albania…
## $ country_abrev                           <chr> "ALB", "ALB", "ALB", "ALB", "A…
## $ sex                                     <chr> "All", "All", "All", "All", "A…
## $ year                                    <dbl> 1987, 1987, 1987, 1987, 1987, …
## $ age                                     <chr> "[All]", "[0]", "[1-4]", "[5-9…
## $ total_deaths                            <dbl> 69, 21, 14, 4, 0, 3, 5, 6, 2, …
## $ perc_deaths                             <dbl> 0.39824541, 0.85400569, 1.1336…
## $ death_rate_100thousand                  <dbl> 2.2431000, 26.0545906, 4.89510…
## $ death_rate_100thousand_age_standardized <dbl> 2.050773, NA, NA, NA, NA, NA, …
## $ death_disease                           <chr> "Hepatitis B", "Hepatitis B", …
```

```r
#Reduzir tabela
Deaths_infectious_diseases_filtered = Deaths_infectious_diseases %>% 
  filter(age == "[All]",
         sex == "All") %>%  # 904 mil linhas
  select(name, year, total_deaths:death_disease) 

#Quais colunas são iguais e têm nomes diferentes?
glimpse(data_long_standardized)
```

```
## Rows: 103,066
## Columns: 9
## $ name            <chr> "Afghanistan", "Afghanistan", "Afghanistan", "Afghanis…
## $ country_abrev   <chr> "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG", "AFG"…
## $ year            <int> 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014, …
## $ vaccine         <chr> "BCG", "BCG", "BCG", "BCG", "BCG", "BCG", "BCG", "BCG"…
## $ coverage        <dbl> 88, 84, 87, 86, 89, 84, 78, 76, 74, 72, 78, 71, 68, 64…
## $ region          <chr> "ROSA", "ROSA", "ROSA", "ROSA", "ROSA", "ROSA", "ROSA"…
## $ type            <chr> "country", "country", "country", "country", "country",…
## $ diseases        <chr> "Tuberculosis", "Tuberculosis", "Tuberculosis", "Tuber…
## $ region_complete <chr> "South Asia", "South Asia", "South Asia", "South Asia"…
```

```r
glimpse(Deaths_infectious_diseases_filtered)
```

```
## Rows: 43,076
## Columns: 7
## $ name                                    <chr> "Albania", "Albania", "Albania…
## $ year                                    <dbl> 1987, 1988, 1989, 1992, 1993, …
## $ total_deaths                            <dbl> 69, 58, 50, 24, 27, 19, 17, 6,…
## $ perc_deaths                             <dbl> 0.39824541, 0.33578417, 0.2751…
## $ death_rate_100thousand                  <dbl> 2.24310003, 1.84825213, 1.5711…
## $ death_rate_100thousand_age_standardized <dbl> 2.05077307, 1.74589545, 1.4595…
## $ death_disease                           <chr> "Hepatitis B", "Hepatitis B", …
```

```r
#Unir tabelas
data_long_annotated = data_long_annotated %>% 
    rename(disease_vac = diseases) %>% 
  left_join(Deaths_infectious_diseases_filtered,
             #by = "name") #Unir por uma coluna
             
             by = join_by(name, #Unir por mais colunas
                          year,
                          disease_vac == death_disease
                          ))

glimpse(data_long_annotated)
```

```
## Rows: 103,066
## Columns: 14
## $ name                                    <chr> "Afghanistan", "Afghanistan", …
## $ country_abrev                           <chr> "AFG", "AFG", "AFG", "AFG", "A…
## $ year                                    <dbl> 2022, 2021, 2020, 2019, 2018, …
## $ vaccine                                 <chr> "BCG", "BCG", "BCG", "BCG", "B…
## $ coverage                                <dbl> 88, 84, 87, 86, 89, 84, 78, 76…
## $ region                                  <chr> "ROSA", "ROSA", "ROSA", "ROSA"…
## $ type                                    <chr> "country", "country", "country…
## $ disease_vac                             <chr> "Tuberculosis", "Tuberculosis"…
## $ region_complete                         <chr> "South Asia", "South Asia", "S…
## $ continent                               <chr> "Asia", "Asia", "Asia", "Asia"…
## $ total_deaths                            <dbl> NA, NA, NA, NA, NA, NA, NA, NA…
## $ perc_deaths                             <dbl> NA, NA, NA, NA, NA, NA, NA, NA…
## $ death_rate_100thousand                  <dbl> NA, NA, NA, NA, NA, NA, NA, NA…
## $ death_rate_100thousand_age_standardized <dbl> NA, NA, NA, NA, NA, NA, NA, NA…
```

**Organizar colunas**


```r
#Organizar colunas
data_long_annotated = data_long_annotated %>% 
  select(type, name, country_abrev, continent, region, region_complete, year, everything())

#Salvar
data_long_annotated %>% 
  saveRDS(file = "cobertura_vacinal_anotada.rds")
```

### Estatísticas descritivas

Abaixo, queremos obter o resumo dos dados de cada país na região da América latina. Como a tabela tem linhas com dados faltantes, algumas operações podem confundir os resultados. Por isso, usamos a função drop_na().

Além disso, queremos filtrar somente os dados dos países latinoamericanos entre os anos 2000 e 2023. Para isso, usamos o between() dentro da função filter(), e especificamos que queremos o type == "country", pois também temos dados da região como um todo.

Como não queremos trabalhar com os nomes completos das regiões, podemos ser menos específicos. Por exemplo, se sabemos que existe a região "Latin America and Caribbean Region (LACR)", podemos somente usar uma função que pega um pedaço do nome completo e nos retorna aquela linha. Isso é feito com o str_detect().

Para calcularmos as estatísticas gerais com summarize, precisamos agrupar os dados com group_by. Isso porque temos dados da cobertura vacinal por país em 23 anos e para mais de uma vacina. Dessa forma, agruparemos por país (name) e vacina (vaccine). Ao final, vamos desagrupar esses dados.

**Por país**


```r
# Estatísticas de cada país em um continente
# Média, mediana, mínimo e máximo de uma variável numérica

latin_2000_2023 = data_long_annotated %>% 
  
  #Missing values: Aqui, é importante retirá-los para não repetir linhas
  
  drop_na(coverage) %>% 
   
  filter(between(year, 2000, 2023),
         str_detect(region_complete, "Latin"),
         type == "country") %>% 
  
  #Agrupar por vacina e país
  group_by(vaccine, name) %>% 
  
  #Resumir estatísticas
  summarise(
    mean = mean(coverage),
    median = median(coverage),
    max = max(coverage),
    min = min(coverage),
    sd = sd(coverage),
    var = var(coverage)
  ) %>% 
  
  #Desagrupar
  ungroup()
```

```
## `summarise()` has grouped output by 'vaccine'. You can override using the
## `.groups` argument.
```

```r
latin_2000_2023
```

```
## # A tibble: 402 × 8
##    vaccine name                              mean median   max   min    sd   var
##    <chr>   <chr>                            <dbl>  <dbl> <dbl> <dbl> <dbl> <dbl>
##  1 BCG     Argentina                         94.1     99    99    75  7.32 53.6 
##  2 BCG     Belize                            95.5     98    99    76  5.55 30.8 
##  3 BCG     Bolivia (Plurinational State of)  90.4     92    99    76  6.67 44.5 
##  4 BCG     Brazil                            95.1     99    99    69  8.46 71.6 
##  5 BCG     Chile                             96.1     96    99    91  2.28  5.21
##  6 BCG     Colombia                          89.8     89    97    84  3.29 10.8 
##  7 BCG     Costa Rica                        95.2     96    99    88  3.86 14.9 
##  8 BCG     Cuba                              99       99    99    99  0     0   
##  9 BCG     Dominica                          97.2     98    99    89  2.81  7.88
## 10 BCG     Dominican Republic                96.5     98    99    85  3.65 13.4 
## # ℹ 392 more rows
```

**Por continente** Aqui, faremos o mesmo, mas para cada continente.


```r
# Cobertura vacinal: Estatísticas de cada continente
continentes_vac = data_long_annotated %>% 
  drop_na(coverage,
          continent) %>% 
  filter(between(year, 2000, 2023),
         type == "country") %>% 
  group_by(vaccine, continent) %>% 
  summarise(
    mean = mean(coverage),
    median = median(coverage),
    max = max(coverage),
    min = min(coverage),
    sd = sd(coverage),
    var = var(coverage)
  ) %>% 
  ungroup()
```

```
## `summarise()` has grouped output by 'vaccine'. You can override using the
## `.groups` argument.
```

```r
#Visualizar
continentes_vac
```

```
## # A tibble: 79 × 8
##    vaccine continent  mean median   max   min    sd    var
##    <chr>   <chr>     <dbl>  <dbl> <dbl> <dbl> <dbl>  <dbl>
##  1 BCG     Africa     85.4     90    99    26 14.5  211.  
##  2 BCG     Americas   93.6     96    99    28  7.36  54.2 
##  3 BCG     Asia       91.7     96    99    29 10.8  117.  
##  4 BCG     Europe     86.7     97    99    16 23.6  557.  
##  5 BCG     Other      92.3     96    99     0 10.4  109.  
##  6 DTP1    Africa     85.3     91    99    35 14.1  198.  
##  7 DTP1    Americas   94.3     96    99    73  5.50  30.2 
##  8 DTP1    Asia       92.4     96    99    45  8.95  80.0 
##  9 DTP1    Europe     97.2     98    99    84  2.34   5.47
## 10 DTP1    Oceania    94.8     95    98    90  2.50   6.25
## # ℹ 69 more rows
```

### Mortes cumulativas

**Por continente**


```r
# Mortes cumulativas
# Estatísticas de cada continente
continentes_mortes = data_long_annotated %>% 
  
  drop_na(total_deaths,
          continent) %>%
  
  filter(between(year, 2000, 2023),
         type == "country") %>% 
  
  group_by(disease_vac, continent) %>%
  
  summarise(
    cumulativo = sum(total_deaths),
    mean = mean(total_deaths),
    median = median(total_deaths),
    max = max(total_deaths),
    min = min(total_deaths),
    sd = sd(total_deaths),
    var = var(total_deaths)
  ) %>% 
  
  #Aqui, queremos os países com maior número de mortes
  arrange(disease_vac, - cumulativo) %>% 
  ungroup()
```

```
## `summarise()` has grouped output by 'disease_vac'. You can override using the
## `.groups` argument.
```

```r
continentes_mortes
```

```
## # A tibble: 17 × 9
##    disease_vac  continent cumulativo     mean median   max   min      sd     var
##    <chr>        <chr>          <dbl>    <dbl>  <dbl> <dbl> <dbl>   <dbl>   <dbl>
##  1 Hepatitis B  Africa        210404  2.57e+3    392  7771     0 2.89e+3 8.37e+6
##  2 Hepatitis B  Other          87412  7.10e+1      4  2262     0 2.21e+2 4.90e+4
##  3 Hepatitis B  Americas       70991  1.08e+2     33   942     0 2.05e+2 4.21e+4
##  4 Hepatitis B  Asia           69672  1.93e+2     20  1352     0 3.11e+2 9.65e+4
##  5 Hepatitis B  Europe         36195  6.60e+1     27  1948     0 1.42e+2 2.03e+4
##  6 Hepatitis B  Oceania          767  1.97e+1     13    55     3 1.36e+1 1.86e+2
##  7 Measles      Asia           16976  4.16e+1      0  1787     0 2.27e+2 5.13e+4
##  8 Measles      Africa          1860  1.5 e+1      7   206     0 2.85e+1 8.13e+2
##  9 Measles      Other            538  3.63e-1      0    21     0 1.62e+0 2.63e+0
## 10 Measles      Europe           526  5.36e-1      0    14     0 1.58e+0 2.49e+0
## 11 Measles      Americas         236  3.07e-1      0    15     0 1.58e+0 2.50e+0
## 12 Measles      Oceania            8  1.03e-1      0     1     0 3.05e-1 9.32e-2
## 13 Tuberculosis Africa       1052032  1.70e+4    478 77589     6 2.71e+4 7.33e+8
## 14 Tuberculosis Other         800245  1.31e+3     67 32220     0 4.30e+3 1.85e+7
## 15 Tuberculosis Asia          601739  3.24e+3    555 28507     6 6.84e+3 4.68e+7
## 16 Tuberculosis Americas      290414  8.35e+2    306  6000     4 1.30e+3 1.69e+6
## 17 Tuberculosis Europe         83333  2.51e+2     75  2387     1 4.10e+2 1.68e+5
```

**Por país**


```r
# Mortes cumulativas
# Estatísticas de cada continente
paises_mortes = data_long_annotated %>% 
  drop_na(total_deaths,
          name) %>% 
  filter(between(year, 2000, 2023),
         type == "country") %>% 
  group_by(disease_vac, name) %>% 
  summarise(
    cumulativo = sum(total_deaths),
    mean = mean(total_deaths),
    median = median(total_deaths),
    max = max(total_deaths),
    min = min(total_deaths),
    sd = sd(total_deaths),
    var = var(total_deaths)
  ) %>% 
  arrange(disease_vac, desc(cumulativo)) %>% 
  ungroup()
```

```
## `summarise()` has grouped output by 'disease_vac'. You can override using the
## `.groups` argument.
```

```r
paises_mortes
```

```
## # A tibble: 296 × 9
##    disease_vac name            cumulativo  mean median   max   min     sd    var
##    <chr>       <chr>                <dbl> <dbl>  <dbl> <dbl> <dbl>  <dbl>  <dbl>
##  1 Hepatitis B Egypt               204890 5122.  5602.  7771  1563 2070.  4.28e6
##  2 Hepatitis B Brazil               33536  798.   781    942   693   68.2 4.65e3
##  3 Hepatitis B Russian Federa…      26997 1350.  1254.  2262   778  471.  2.22e5
##  4 Hepatitis B Republic of Ko…      26368  599.   572    869   349  173.  2.98e4
##  5 Hepatitis B Philippines          23446  782.   743   1037   632  115.  1.32e4
##  6 Hepatitis B Japan                19331  879.   844   1352   507  284.  8.06e4
##  7 Hepatitis B Mexico               17108  389.   372    586   230  103.  1.07e4
##  8 Hepatitis B Thailand             16792  442.   366    983   179  243.  5.89e4
##  9 Hepatitis B Italy                10577  504.   338   1948   236  482.  2.32e5
## 10 Hepatitis B Iran (Islamic …       6886  689.   610    870   547  133.  1.78e4
## # ℹ 286 more rows
```

# 5. Visualização

## Vacinação

### Gráfico de pontos simples

**Por continente**


```r
#Gráfico de pontos simples
continentes_pontos_vac = continentes_vac %>% #Dataframe
  filter(vaccine %in% "MCV1") %>%
  mutate(continent = fct_reorder(continent, median)) %>% 
  ggplot() + #Chamando a função. Aqui se usa "+" em vez de "%>%" 
  
  #Mapeando os eixos
  aes(x = median,
      y = continent,
      color = continent) +
  
  #Geometrias
  geom_point() +
  
  geom_label(aes(x = median, 
                y = continent, 
                label = median)) +
  
  #Tema
  theme_light() +
  
  #Labels
  labs(title = "Cobertura vacinal",
       x = "Mediana (Cobertura vacinal %)",
       y = "Continentes") 

continentes_pontos_vac
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-40-1.png)<!-- -->

**Por país**


```r
#Gráfico de pontos simples
pontos = latin_2000_2023 %>% #Dataframe
  filter(vaccine %in% "MCV1") %>%
  ggplot() + #Chamando a função. Aqui se usa "+" em vez de "%>%" 
  
  #Mapeando os eixos
  aes(x = median,
      y = name,
      color = median) +
  
  #Geometrias
  geom_point() +
  
  geom_text(aes(x = median, #Use geom_label para visualizar melhor
                y = name, 
                label = median)) +
  
  #Tema
  theme_light() +
  
  #Labels
  labs(title = "Cobertura vacinal",
       x = "Mediana (Cobertura vacinal%)",
       y = "Países")

pontos
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-41-1.png)<!-- -->

### Gráfico de barras

**Por continente**


```r
#Gráfico de barras simples
continente_barras_vac = continentes_vac %>% #Dataframe
  filter(vaccine %in% "MCV1") %>%
  mutate(continent = fct_reorder(continent, median)) %>% 
  ggplot() + #Chamando a função. Aqui se usa "+" em vez de "%>%" 
  
  #Mapeando os eixos
  aes(x = median,
      y = continent,
      fill = continent) +
  
  #Geometrias
  geom_col() +
  
  geom_text(aes(x = median, 
                y = continent, 
                label = median)) +
  
  #Tema
  theme_light() +
  
  #Labels
  labs(title = "Cobertura vacinal",
       x = "Mediana (Cobertura vacinal %)",
       y = "Continentes") 

continente_barras_vac
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-42-1.png)<!-- -->

**Por país**


```r
#Gráfico de barras simples
pais_barras_vac = latin_2000_2023 %>% #Dataframe
  filter(vaccine %in% "MCV1") %>%
  ggplot() + #Chamando a função. Aqui se usa "+" em vez de "%>%" 
  
  #Mapeando os eixos
  aes(x = median,
      y = name,
      fill = median) +
  
  #Geometrias
  geom_col() +
  
  geom_text(aes(x = median, 
                y = name, 
                label = median)) +
  
  #Tema
  theme_light() +
  
  #Labels
  labs(title = "Título",
       x = "Mediana (Cobertura vacinal%)",
       y = "Países")

pais_barras_vac
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-43-1.png)<!-- -->

## Mortes

**Por continente**


```r
#Gráfico de pontos simples
barras_mortes = continentes_mortes %>% #Dataframe
  filter(disease_vac == "Measles") %>% 
  mutate(continent = fct_reorder(continent, cumulativo)) %>% 
  ggplot() + #Chamando a função. Aqui se usa "+" em vez de "%>%" 
  
  #Mapeando os eixos
  aes(x = cumulativo,
      y = continent,
      fill = continent) +
  
  #Geometrias
  geom_col() +
  
  geom_label(aes(x = cumulativo, 
                y = continent, 
                label = cumulativo),
            hjust = -0.2) +
  
  #Tema
  theme_light() +
  
  #Labels
  labs(title = "Mortes cumulativas por Sarampo, de 2000 a 2023",
       x = "Mortes",
       y = "Continentes") +
  
  #Eixo x
  xlim(0, 21000) #Aumentar limites 
  
barras_mortes 
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-44-1.png)<!-- -->


```r
#Gráfico de pontos simples
paises_barras_mortes = paises_mortes %>% #Dataframe
  filter(disease_vac == "Measles") %>% 
  mutate(name = fct_reorder(name, cumulativo)) %>% 
  slice_max(order_by = cumulativo, n = 10) %>% 
  ggplot() + #Chamando a função. Aqui se usa "+" em vez de "%>%" 
  
  #Mapeando os eixos
  aes(x = cumulativo,
      y = name,
      fill = name) +
  
  #Geometrias
  geom_col() +
  
  geom_label(aes(x = cumulativo, 
                y = name, 
                label = cumulativo),
            hjust = -0.2) +
  
  #Tema
  theme_light() +
  
  #Labels
  labs(title = "Mortes cumulativas por Sarampo, de 2000 a 2023",
       x = "Mortes",
       y = "Continentes") +
  
  #Eixo x
  xlim(0, 21000) #Aumentar limites 
  
paises_barras_mortes
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-45-1.png)<!-- -->

## Visualização rápida com o Esquisse


```r
#Visualização rápida
# latin_2000_2023 %>% 
#   esquisser() 
```

## Melhorando o gráfico


```r
# Melhorando o gráfico -----

plot = 
  
  # Manipular tabela
  latin_2000_2023 %>%
  filter(vaccine %in% "MCV1") %>%
  mutate(name = fct_reorder(name, median)) %>% 
 
  #Criar base do gráfico
  ggplot() +
  aes(x = median, y = name, colour = median) + #Aesthetics (mapping)
  
  #Geometria
  geom_point(shape = "circle", 
             size = 1) +
  #Highlight (add sempre após geom_)
  gghighlight(median >= 95,
              label_key = name,
              label_params = list(size = 3),
              unhighlighted_params = list(colour = "red")) +
  
  #Labels
  geom_text(aes(x = median, 
                y = name, 
                label = median),
              hjust = -0.5,
              size = 3,
              color = "black") +
  
  #Marcações
  #Linhas
  geom_vline(xintercept = 95,
             colour = "black",
             size =0.2,
             linetype = 2) +
  
  #Tema, aparência
  theme_light() + 
  
  # Labels, titulo, subtitulo, titulo dos eixos
    
  labs(title = "Vacinação em países da América Latina",
     subtitle = "Sarampo, MCV1, Dose 1, entre 2000 e 2023",
     y = "Países",
     x = "Mediana (Cobertura %)",
     tag = "Figure A.",
     colour = "Cobertura vacinal",
     caption = "Fonte: Feito pela UPVacina") +
  
  # Aparência especifica
  theme(
    
    #Texto geral
    text = element_text(family = "sans",  #sans, mono, serif
                        color = "black"), 
    
    #Título, subtítulo e tag
    plot.title = element_text(size = 12, 
                              face = "bold", 
                              hjust = 0,
                              vjust = 0.5),
    plot.subtitle = element_text(size = 10),
    plot.tag.position = "topleft",
    plot.tag = element_text(vjust = 5,
                            size = 12, 
                            face = "bold"),
    
    #Legenda
    legend.title = element_text(face = "bold"),
    legend.text = element_text(size = 10),
    
    #Eixos
    axis.title.x = element_text(size = 10,
                                angle = 0,
                                color = "black"),
    axis.text.x = element_text(color = "black",
                               size = 8,
                               angle = 0),
    axis.text.y = element_text(size = 8,
                               color = "black"),
    
    #Margens do gráfico
    plot.margin = unit(c(0.5, #Top
                         1, #Right
                         0.5, #Bottom
                         0), #Left 
                       "cm") #Unidade) 
  ) 
```

```
## Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
## ℹ Please use `linewidth` instead.
## This warning is displayed once every 8 hours.
## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
## generated.
```

```r
  #Escala de cores
  # scale_colour_manual(low = "#DC0000B2", 
  #                       high = "#4DBBD5B2",
  #                       breaks = c(90, 100)) +
  # scale_colour_steps(low = "#DC0000B2", 
  #                       high = "#4DBBD5B2")


#Visualizar
plot
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-47-1.png)<!-- -->

```r
#Salvar
ggsave(plot, file = "Sarampo_LatinAmerica_2000_2023.png", width = 10, height = 5)
```

## Gráfico interativo


```r
plot %>% 
  ggplotly() 
```

```
## Warning in geom2trace.default(dots[[1L]][[5L]], dots[[2L]][[1L]], dots[[3L]][[1L]]): geom_GeomLabelRepel() has yet to be implemented in plotly.
##   If you'd like to see this geom implemented,
##   Please open an issue with your example code at
##   https://github.com/ropensci/plotly/issues

## Warning in geom2trace.default(dots[[1L]][[5L]], dots[[2L]][[1L]], dots[[3L]][[1L]]): geom_GeomLabelRepel() has yet to be implemented in plotly.
##   If you'd like to see this geom implemented,
##   Please open an issue with your example code at
##   https://github.com/ropensci/plotly/issues

## Warning in geom2trace.default(dots[[1L]][[5L]], dots[[2L]][[1L]], dots[[3L]][[1L]]): geom_GeomLabelRepel() has yet to be implemented in plotly.
##   If you'd like to see this geom implemented,
##   Please open an issue with your example code at
##   https://github.com/ropensci/plotly/issues

## Warning in geom2trace.default(dots[[1L]][[5L]], dots[[2L]][[1L]], dots[[3L]][[1L]]): geom_GeomLabelRepel() has yet to be implemented in plotly.
##   If you'd like to see this geom implemented,
##   Please open an issue with your example code at
##   https://github.com/ropensci/plotly/issues

## Warning in geom2trace.default(dots[[1L]][[5L]], dots[[2L]][[1L]], dots[[3L]][[1L]]): geom_GeomLabelRepel() has yet to be implemented in plotly.
##   If you'd like to see this geom implemented,
##   Please open an issue with your example code at
##   https://github.com/ropensci/plotly/issues
```

```{=html}
<div class="plotly html-widget html-fill-item" id="htmlwidget-6e3af3c6278ae8622449" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-6e3af3c6278ae8622449">{"x":{"data":[{"x":[98,94,90,92,96,89,97,93,93,90,99,97,85,95,93,95,91,96,65,97,88,96,99,95,91,91,98,94,99,77,91,95,85],"y":[29,17,7,13,23,6,26,14,15,8,31,27,3,19,16,20,9,24,1,28,5,25,32,21,10,11,30,18,33,2,12,22,4],"text":["highlight..........1: 98<br />highlight..........2: Antigua and Barbuda<br />highlight..........3: red<br />highlight..........group: 29","highlight..........1: 94<br />highlight..........2: Argentina<br />highlight..........3: red<br />highlight..........group: 17","highlight..........1: 90<br />highlight..........2: Bahamas<br />highlight..........3: red<br />highlight..........group: 7","highlight..........1: 92<br />highlight..........2: Barbados<br />highlight..........3: red<br />highlight..........group: 13","highlight..........1: 96<br />highlight..........2: Belize<br />highlight..........3: red<br />highlight..........group: 23","highlight..........1: 89<br />highlight..........2: Bolivia (Plurinational State of)<br />highlight..........3: red<br />highlight..........group: 6","highlight..........1: 97<br />highlight..........2: Brazil<br />highlight..........3: red<br />highlight..........group: 26","highlight..........1: 93<br />highlight..........2: Chile<br />highlight..........3: red<br />highlight..........group: 14","highlight..........1: 93<br />highlight..........2: Colombia<br />highlight..........3: red<br />highlight..........group: 15","highlight..........1: 90<br />highlight..........2: Costa Rica<br />highlight..........3: red<br />highlight..........group: 8","highlight..........1: 99<br />highlight..........2: Cuba<br />highlight..........3: red<br />highlight..........group: 31","highlight..........1: 97<br />highlight..........2: Dominica<br />highlight..........3: red<br />highlight..........group: 27","highlight..........1: 85<br />highlight..........2: Dominican Republic<br />highlight..........3: red<br />highlight..........group: 3","highlight..........1: 95<br />highlight..........2: Ecuador<br />highlight..........3: red<br />highlight..........group: 19","highlight..........1: 93<br />highlight..........2: El Salvador<br />highlight..........3: red<br />highlight..........group: 16","highlight..........1: 95<br />highlight..........2: Grenada<br />highlight..........3: red<br />highlight..........group: 20","highlight..........1: 91<br />highlight..........2: Guatemala<br />highlight..........3: red<br />highlight..........group: 9","highlight..........1: 96<br />highlight..........2: Guyana<br />highlight..........3: red<br />highlight..........group: 24","highlight..........1: 65<br />highlight..........2: Haiti<br />highlight..........3: red<br />highlight..........group: 1","highlight..........1: 97<br />highlight..........2: Honduras<br />highlight..........3: red<br />highlight..........group: 28","highlight..........1: 88<br />highlight..........2: Jamaica<br />highlight..........3: red<br />highlight..........group: 5","highlight..........1: 96<br />highlight..........2: Mexico<br />highlight..........3: red<br />highlight..........group: 25","highlight..........1: 99<br />highlight..........2: Nicaragua<br />highlight..........3: red<br />highlight..........group: 32","highlight..........1: 95<br />highlight..........2: Panama<br />highlight..........3: red<br />highlight..........group: 21","highlight..........1: 91<br />highlight..........2: Paraguay<br />highlight..........3: red<br />highlight..........group: 10","highlight..........1: 91<br />highlight..........2: Peru<br />highlight..........3: red<br />highlight..........group: 11","highlight..........1: 98<br />highlight..........2: Saint Kitts and Nevis<br />highlight..........3: red<br />highlight..........group: 30","highlight..........1: 94<br />highlight..........2: Saint Lucia<br />highlight..........3: red<br />highlight..........group: 18","highlight..........1: 99<br />highlight..........2: Saint Vincent and the Grenadines<br />highlight..........3: red<br />highlight..........group: 33","highlight..........1: 77<br />highlight..........2: Suriname<br />highlight..........3: red<br />highlight..........group: 2","highlight..........1: 91<br />highlight..........2: Trinidad and Tobago<br />highlight..........3: red<br />highlight..........group: 12","highlight..........1: 95<br />highlight..........2: Uruguay<br />highlight..........3: red<br />highlight..........group: 22","highlight..........1: 85<br />highlight..........2: Venezuela (Bolivarian Republic of)<br />highlight..........3: red<br />highlight..........group: 4"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(255,0,0,1)","opacity":1,"size":3.7795275590551185,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(255,0,0,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[95,95,95,95],"y":[19,20,21,22],"text":["median: 95<br />name: Ecuador<br />median: 95","median: 95<br />name: Grenada<br />median: 95","median: 95<br />name: Panama<br />median: 95","median: 95<br />name: Uruguay<br />median: 95"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(19,43,67,1)","opacity":1,"size":3.7795275590551185,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(19,43,67,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[96,96,96],"y":[23,24,25],"text":["median: 96<br />name: Belize<br />median: 96","median: 96<br />name: Guyana<br />median: 96","median: 96<br />name: Mexico<br />median: 96"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(34,73,108,1)","opacity":1,"size":3.7795275590551185,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(34,73,108,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[97,97,97],"y":[26,27,28],"text":["median: 97<br />name: Brazil<br />median: 97","median: 97<br />name: Dominica<br />median: 97","median: 97<br />name: Honduras<br />median: 97"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(51,106,152,1)","opacity":1,"size":3.7795275590551185,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(51,106,152,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[98,98],"y":[29,30],"text":["median: 98<br />name: Antigua and Barbuda<br />median: 98","median: 98<br />name: Saint Kitts and Nevis<br />median: 98"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(68,141,198,1)","opacity":1,"size":3.7795275590551185,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(68,141,198,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[99,99,99],"y":[31,32,33],"text":["median: 99<br />name: Cuba<br />median: 99","median: 99<br />name: Nicaragua<br />median: 99","median: 99<br />name: Saint Vincent and the Grenadines<br />median: 99"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(86,177,247,1)","opacity":1,"size":3.7795275590551185,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(86,177,247,1)"}},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","mode":"","frame":null},{"x":[98,96,97,99,97,95,95,96,97,96,99,95,98,99,95],"y":[29,23,26,31,27,19,20,24,28,25,32,21,30,33,22],"text":[98,96,97,99,97,95,95,96,97,96,99,95,98,99,95],"hovertext":["median: 98<br />name: Antigua and Barbuda<br />median: black<br />median: 98","median: 96<br />name: Belize<br />median: black<br />median: 96","median: 97<br />name: Brazil<br />median: black<br />median: 97","median: 99<br />name: Cuba<br />median: black<br />median: 99","median: 97<br />name: Dominica<br />median: black<br />median: 97","median: 95<br />name: Ecuador<br />median: black<br />median: 95","median: 95<br />name: Grenada<br />median: black<br />median: 95","median: 96<br />name: Guyana<br />median: black<br />median: 96","median: 97<br />name: Honduras<br />median: black<br />median: 97","median: 96<br />name: Mexico<br />median: black<br />median: 96","median: 99<br />name: Nicaragua<br />median: black<br />median: 99","median: 95<br />name: Panama<br />median: black<br />median: 95","median: 98<br />name: Saint Kitts and Nevis<br />median: black<br />median: 98","median: 99<br />name: Saint Vincent and the Grenadines<br />median: black<br />median: 99","median: 95<br />name: Uruguay<br />median: black<br />median: 95"],"textfont":{"size":11.338582677165356,"color":"rgba(0,0,0,1)"},"type":"scatter","mode":"text","hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[95,95],"y":[0.40000000000000002,33.600000000000001],"text":"xintercept: 95","type":"scatter","mode":"lines","line":{"width":0.75590551181102372,"color":"rgba(0,0,0,1)","dash":"dash"},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":50.837861954677827,"r":37.795275590551171,"b":46.460942070908629,"l":198.92071398920712},"plot_bgcolor":"rgba(255,255,255,1)","paper_bgcolor":"rgba(255,255,255,1)","font":{"color":"rgba(0,0,0,1)","family":"sans","size":14.611872146118724},"title":{"text":"<b> Vacinação em países da América Latina <\/b>","font":{"color":"rgba(0,0,0,1)","family":"sans","size":15.940224159402243},"x":0,"xref":"paper"},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[63.299999999999997,100.7],"tickmode":"array","ticktext":["70","80","90","100"],"tickvals":[70,80,90,100],"categoryorder":"array","categoryarray":["70","80","90","100"],"nticks":null,"ticks":"outside","tickcolor":"rgba(179,179,179,1)","ticklen":3.6529680365296811,"tickwidth":0.33208800332088001,"showticklabels":true,"tickfont":{"color":"rgba(0,0,0,1)","family":"sans","size":10.62681610626816},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(222,222,222,1)","gridwidth":0.33208800332088001,"zeroline":false,"anchor":"y","title":{"text":"Mediana (Cobertura %)","font":{"color":"rgba(0,0,0,1)","family":"sans","size":13.283520132835198}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,33.600000000000001],"tickmode":"array","ticktext":["Haiti","Suriname","Dominican Republic","Venezuela (Bolivarian Republic of)","Jamaica","Bolivia (Plurinational State of)","Bahamas","Costa Rica","Guatemala","Paraguay","Peru","Trinidad and Tobago","Barbados","Chile","Colombia","El Salvador","Argentina","Saint Lucia","Ecuador","Grenada","Panama","Uruguay","Belize","Guyana","Mexico","Brazil","Dominica","Honduras","Antigua and Barbuda","Saint Kitts and Nevis","Cuba","Nicaragua","Saint Vincent and the Grenadines"],"tickvals":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33],"categoryorder":"array","categoryarray":["Haiti","Suriname","Dominican Republic","Venezuela (Bolivarian Republic of)","Jamaica","Bolivia (Plurinational State of)","Bahamas","Costa Rica","Guatemala","Paraguay","Peru","Trinidad and Tobago","Barbados","Chile","Colombia","El Salvador","Argentina","Saint Lucia","Ecuador","Grenada","Panama","Uruguay","Belize","Guyana","Mexico","Brazil","Dominica","Honduras","Antigua and Barbuda","Saint Kitts and Nevis","Cuba","Nicaragua","Saint Vincent and the Grenadines"],"nticks":null,"ticks":"outside","tickcolor":"rgba(179,179,179,1)","ticklen":3.6529680365296811,"tickwidth":0.33208800332088001,"showticklabels":true,"tickfont":{"color":"rgba(0,0,0,1)","family":"sans","size":10.62681610626816},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(222,222,222,1)","gridwidth":0.33208800332088001,"zeroline":false,"anchor":"x","title":{"text":"Países","font":{"color":"rgba(0,0,0,1)","family":"sans","size":14.611872146118724}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":"transparent","line":{"color":"rgba(179,179,179,1)","width":0.66417600664176002,"linetype":"solid"},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":"rgba(255,255,255,1)","bordercolor":"transparent","borderwidth":1.8897637795275593,"font":{"color":"rgba(0,0,0,1)","family":"sans","size":13.283520132835198},"title":{"text":"","font":{"color":"rgba(0,0,0,1)","family":"sans","size":14.611872146118724}}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"58147caf2da0":{"x":{},"y":{},"colour":{},"type":"scatter"},"581421614396":{"x":{},"y":{},"colour":{}},"581470fc4765":{"x":{},"y":{},"colour":{},"label":{}},"581418491974":{"x":{},"y":{},"colour":{},"label":{}},"581429e32e73":{"xintercept":{}}},"cur_data":"58147caf2da0","visdat":{"58147caf2da0":["function (y) ","x"],"581421614396":["function (y) ","x"],"581470fc4765":["function (y) ","x"],"581418491974":["function (y) ","x"],"581429e32e73":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
```

## Unindo gráficos


```r
#Unindo gráficos -----

vaccination = data_long_annotated %>% 
  filter(name == "Brazil",
         vaccine == "MCV1") %>% 
    ggplot() +
  geom_line(mapping = aes(
    x = year,
    y = coverage),
    colour = "#4DBBD5B2",
    linewidth = 2) +
    geom_text(aes(x = year, 
                  y = coverage, 
                  label = coverage),
            vjust = -0.5,
            size = 2) +
    theme_minimal() +
  labs(title = "Cobertura vacinal contra o sarampo, Brasil",
       x = "Ano",
       y = "Cobertura vacinal (%)") +
   ylim(0, 110)

vaccination
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-49-1.png)<!-- -->


```r
#Mortes
deaths = data_long_annotated %>% 
  filter(name == "Brazil",
         vaccine == "MCV1") %>% 
    ggplot() +
  aes(x = year, y = total_deaths) +
  geom_col(fill = "#DC0000B2") +
  geom_text(aes(label = total_deaths),
            vjust = -0.5,
            size = 2) +
  theme_minimal() +
  theme(text = element_text(size = 10)) +
    labs(title = "Mortes por sarampo, Brasil",
       x = "Ano",
       y = "Mortes") +
   ylim(0, 3400)

deaths
```

```
## Warning: Removed 2 rows containing missing values or values outside the scale range
## (`geom_col()`).
```

```
## Warning: Removed 2 rows containing missing values or values outside the scale range
## (`geom_text()`).
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-50-1.png)<!-- -->

### Unindo gráficos em uma imagem


```r
#Unir gráficos
(vaccination / deaths) 
```

```
## Warning: Removed 2 rows containing missing values or values outside the scale range
## (`geom_col()`).
```

```
## Warning: Removed 2 rows containing missing values or values outside the scale range
## (`geom_text()`).
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-51-1.png)<!-- -->

```r
(vaccination + deaths) 
```

```
## Warning: Removed 2 rows containing missing values or values outside the scale range
## (`geom_col()`).
## Removed 2 rows containing missing values or values outside the scale range
## (`geom_text()`).
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-51-2.png)<!-- -->

```r
#Salvar
(vaccination / deaths) %>% 
  ggsave(file = "Sarampo_Brasil_1980_2023.png", width = 10, height = 5)
```

```
## Warning: Removed 2 rows containing missing values or values outside the scale range
## (`geom_col()`).
## Removed 2 rows containing missing values or values outside the scale range
## (`geom_text()`).
```

### Boxplots


```r
#Boxplot simples por ano
boxplot_years = data_long_annotated %>% 
  filter(type == "country",
         vaccine == "MCV1",
         year %in% c(1990, 2000, 2010, 2019)) %>% 
  
  
 ggplot() +
  aes(x = "", 
      y = coverage, 
      fill = continent) +
  geom_boxplot() +
  scale_fill_brewer(palette = "Set2", direction = 1) +
  theme_bw() + 
  theme(axis.text.x = element_text(angle = 45,
                                   vjust = 1,
                                   hjust = 1),
        plot.margin = unit(c(1, 1, 1, 1), "cm"),
        legend.position = "right") +
  facet_wrap(vars(year), ncol = 4) +
  labs(title = "Cobertura vacinal contra o sarampo",
       subtitle = "Primeira dose (MCV1)",
      x = "Região UNICEF",
       y = "Cobertura vacinal (%)",
       fill = "Região UNICEF")

#Visualizar
boxplot_years 
```

```
## Warning: Removed 37 rows containing non-finite outside the scale range
## (`stat_boxplot()`).
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-52-1.png)<!-- -->

## Paleta de cores científica


```r
# Cores
#Mudando a paleta
library(ggsci)
library(scales)
```

```
## Warning: package 'scales' was built under R version 4.3.2
```

```
## 
## Attaching package: 'scales'
```

```
## The following object is masked from 'package:purrr':
## 
##     discard
```

```
## The following object is masked from 'package:readr':
## 
##     col_factor
```

```r
vignette("ggsci") 

nrc = pal_npg("nrc", #Especificar paleta
              alpha = 0.7)(8) #Gerar 10 cores com transparencia = 70%

nrc %>% 
  show_col()
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-53-1.png)<!-- -->

```r
boxplot_years + scale_fill_npg()
```

```
## Scale for fill is already present.
## Adding another scale for fill, which will replace the existing scale.
```

```
## Warning: Removed 37 rows containing non-finite outside the scale range
## (`stat_boxplot()`).
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-53-2.png)<!-- -->


```r
#Boxplot simples de ano
boxplot_regions = data_long_annotated %>% 
  filter(type == "country",
         vaccine == "MCV1",
         year %in% c(1990, 2000, 2010, 2020)) %>% 
  mutate(year = as.factor(year)) %>% 
 ggplot() +
  aes(x = year, y = coverage, fill = year) +
  geom_boxplot() +
  geom_jitter(aes(label = name),
              alpha = 0.2,
              na.rm = T) +
  scale_fill_brewer(palette = "Set2", direction = 1) +
  scale_color_distiller(palette = "Set2", direction = 1) +
  theme_minimal() +
  facet_wrap(vars(continent)) +
  scale_fill_npg()
```

```
## Warning in geom_jitter(aes(label = name), alpha = 0.2, na.rm = T): Ignoring
## unknown aesthetics: label
```

```
## Scale for fill is already present.
## Adding another scale for fill, which will replace the existing scale.
```

```r
boxplot_regions
```

```
## Warning: Removed 37 rows containing non-finite outside the scale range
## (`stat_boxplot()`).
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-54-1.png)<!-- -->


```r
# Gráfico interativo
boxplot_regions %>%  
  ggplotly()
```

```
## Warning: Removed 37 rows containing non-finite outside the scale range
## (`stat_boxplot()`).
```

```{=html}
<div class="plotly html-widget html-fill-item" id="htmlwidget-41d349aebbeefc0f011c" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-41d349aebbeefc0f011c">{"x":{"data":[{"x":[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],"y":[79,null,38,43,86,79,89,30,88,86,null,73,83,87,51,61,47,85,78,54,80,76,79,87,null,74,56,35,38,57,59,76,71,25,93,81,83,52,56,null,38,32,53,79,87,90,82],"hoverinfo":"y","type":"box","fillcolor":"rgba(230,75,53,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"1990","legendgroup":"1990","showlegend":true,"xaxis":"x","yaxis":"y","frame":null},{"x":[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],"y":[70,73,89,70,90,90,69,78,74,31,64,97,93,68,97,82,75,60,90,98,94,82],"hoverinfo":"y","type":"box","fillcolor":"rgba(230,75,53,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"1990","legendgroup":"1990","showlegend":false,"xaxis":"x2","yaxis":"y","frame":null},{"x":[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],"y":[87,80,56,75,20,57,80,66,65,68,87,58,98,88,92,84,61,70,85,50,98,34,91,73],"hoverinfo":"y","type":"box","fillcolor":"rgba(230,75,53,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"1990","legendgroup":"1990","showlegend":false,"xaxis":"x3","yaxis":"y","frame":null},{"x":[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],"y":[99,99,null,null,87,95,43,99,null,85,87,60,84,76,null,97,99,78,90,75,96,88,92,85,71,null],"hoverinfo":"y","type":"box","fillcolor":"rgba(230,75,53,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"1990","legendgroup":"1990","showlegend":false,"xaxis":"x","yaxis":"y2","frame":null},{"x":[1,1],"y":[90,86],"hoverinfo":"y","type":"box","fillcolor":"rgba(230,75,53,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"1990","legendgroup":"1990","showlegend":false,"xaxis":"x2","yaxis":"y2","frame":null},{"x":[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],"y":[99,77,81,86,87,null,89,53,null,80,null,null,96,88,75,99,null,null,93,73,99,32,88,86,75,94,69,null,85,null,99,82,93,null,80,65,85,96,null,98,78,86,79,null,null,80,67,98,61,null,null,52,38,null,87,86,70,null,79,85,95,null,84,80,66,null,null,null,null,null,null,null,67,89],"hoverinfo":"y","type":"box","fillcolor":"rgba(230,75,53,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"1990","legendgroup":"1990","showlegend":false,"xaxis":"x3","yaxis":"y2","frame":null},{"x":[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],"y":[49,89,93,32,58,49,58,57,46,33,37,36,42,74,69,28,95,69,98,93,78,48,70,24,76,55,72,37,68,70,75,57,50,71,84,50,48,90,80,91,72,74,63,85,71,36,73],"hoverinfo":"y","type":"box","fillcolor":"rgba(77,187,213,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2000","legendgroup":"2000","showlegend":true,"xaxis":"x","yaxis":"y","frame":null},{"x":[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],"y":[91,82,94,97,97,90,85,98,88,96,99,92,86,97,97,96,86,99,91,89,55,88],"hoverinfo":"y","type":"box","fillcolor":"rgba(77,187,213,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2000","legendgroup":"2000","showlegend":false,"xaxis":"x2","yaxis":"y","frame":null},{"x":[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],"y":[84,99,56,78,86,94,65,96,94,94,99,92,99,74,95,84,96,27,76,96,57,71,71,98],"hoverinfo":"y","type":"box","fillcolor":"rgba(77,187,213,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2000","legendgroup":"2000","showlegend":false,"xaxis":"x3","yaxis":"y","frame":null},{"x":[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],"y":[88,95,91,74,82,99,97,null,91,84,75,87,93,94,82,88,89,89,79,99,89,80,92,98,96,95],"hoverinfo":"y","type":"box","fillcolor":"rgba(77,187,213,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2000","legendgroup":"2000","showlegend":false,"xaxis":"x","yaxis":"y2","frame":null},{"x":[2,2],"y":[91,85],"hoverinfo":"y","type":"box","fillcolor":"rgba(77,187,213,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2000","legendgroup":"2000","showlegend":false,"xaxis":"x2","yaxis":"y2","frame":null},{"x":[2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],"y":[99,98,95,94,86,97,93,78,80,94,null,74,99,85,89,97,67,96,99,96,86,95,97,88,78,98,97,84,88,97,99,94,96,70,95,8,98,97,81,97,93,99,46,93,98,83,91,99,81,73,84,99,34,86,93,93,92,91,96,61,99,76,78,42,84,87,92,92,null,97,84,69,99,99],"hoverinfo":"y","type":"box","fillcolor":"rgba(77,187,213,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2000","legendgroup":"2000","showlegend":false,"xaxis":"x3","yaxis":"y2","frame":null},{"x":[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3],"y":[82,58,56,62,64,88,78,98,72,73,92,98,66,90,93,68,75,92,95,46,79,96,97,92,81,90,67,67,96,46,64,68,44,95,92,62,76,96,85,72,99,86,65,82,95,93,53],"hoverinfo":"y","type":"box","fillcolor":"rgba(0,160,135,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2010","legendgroup":"2010","showlegend":true,"xaxis":"x","yaxis":"y","frame":null},{"x":[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3],"y":[94,97,85,92,64,89,93,98,95,83,90,99,93,92,99,95,95,92,93,95,88,99],"hoverinfo":"y","type":"box","fillcolor":"rgba(0,160,135,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2010","legendgroup":"2010","showlegend":false,"xaxis":"x2","yaxis":"y","frame":null},{"x":[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3],"y":[98,98,82,98,99,80,88,75,88,94,98,78,99,99,86,90,95,99,95,62,97,87,57,96],"hoverinfo":"y","type":"box","fillcolor":"rgba(0,160,135,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2010","legendgroup":"2010","showlegend":false,"xaxis":"x3","yaxis":"y","frame":null},{"x":[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3],"y":[95,96,99,96,93,95,98,93,90,99,89,90,91,97,92,80,97,97,95,85,95,91,99,89,98,95],"hoverinfo":"y","type":"box","fillcolor":"rgba(0,160,135,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2010","legendgroup":"2010","showlegend":false,"xaxis":"x","yaxis":"y2","frame":null},{"x":[3,3],"y":[94,91],"hoverinfo":"y","type":"box","fillcolor":"rgba(0,160,135,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2010","legendgroup":"2010","showlegend":false,"xaxis":"x2","yaxis":"y2","frame":null},{"x":[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3],"y":[74,80,85,98,99,88,94,73,95,99,95,39,99,null,98,96,95,98,98,89,97,98,92,99,56,94,97,99,99,66,99,98,99,98,96,89,99,99,66,56,88,99,95,99,99,99,87,94,87,95,64,98,98,97,70,96,94,94,99,82,97,97,68,75,63,95,99,85,93,98,97,79,96,94],"hoverinfo":"y","type":"box","fillcolor":"rgba(0,160,135,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2010","legendgroup":"2010","showlegend":false,"xaxis":"x3","yaxis":"y2","frame":null},{"x":[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],"y":[62,53,86,99,66,94,60,44,62,87,79,55,47,73,89,90,85,84,90,98,93,80,46,90,69,94,88,82,72,70,60,81,53,88,87,41,90,86,90,88,61,47,62,89,65,88,96],"hoverinfo":"y","type":"box","fillcolor":"rgba(60,84,136,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2020","legendgroup":"2020","showlegend":true,"xaxis":"x","yaxis":"y","frame":null},{"x":[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],"y":[82,91,98,91,88,90,91,93,80,95,82,65,74,81,79,77,90,80,95,77,97,92],"hoverinfo":"y","type":"box","fillcolor":"rgba(60,84,136,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2020","legendgroup":"2020","showlegend":false,"xaxis":"x2","yaxis":"y","frame":null},{"x":[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],"y":[66,95,76,96,74,95,99,72,99,76,99,96,97,89,96,99,87,76,98,83,97,91,97,83],"hoverinfo":"y","type":"box","fillcolor":"rgba(60,84,136,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2020","legendgroup":"2020","showlegend":false,"xaxis":"x3","yaxis":"y","frame":null},{"x":[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],"y":[99,78,91,96,24,87,97,97,92,97,91,94,92,80,88,94,94,97,61,95,93,95,97,91,99,96],"hoverinfo":"y","type":"box","fillcolor":"rgba(60,84,136,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2020","legendgroup":"2020","showlegend":false,"xaxis":"x","yaxis":"y2","frame":null},{"x":[4,4],"y":[93,91],"hoverinfo":"y","type":"box","fillcolor":"rgba(60,84,136,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2020","legendgroup":"2020","showlegend":false,"xaxis":"x2","yaxis":"y2","frame":null},{"x":[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],"y":[90,74,95,99,92,83,94,81,99,87,99,79,95,96,99,94,93,68,98,90,92,76,97,96,98,82,82,89,99,84,82,66,95,68,91,89,93,63,99,84,99,86,98,99,91,69,87,78,99,79,93,45,98,97,89,99,98,98,93,76,98,97,97,99,59,85,47,79,95,89,94,62,90,88],"hoverinfo":"y","type":"box","fillcolor":"rgba(60,84,136,1)","marker":{"opacity":null,"outliercolor":"rgba(0,0,0,1)","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"},"size":5.6692913385826778},"line":{"color":"rgba(51,51,51,1)","width":1.8897637795275593},"name":"2020","legendgroup":"2020","showlegend":false,"xaxis":"x3","yaxis":"y2","frame":null},{"x":[1.310440293699503,1.0680604416877031,0.60238833874464026,1.3432083262130619,1.0661600759252905,0.88136057984083882,0.95930585246533151,1.3836116440594197,1.1087262811139227,1.0449315415695311,0.94998998828232284,0.69987457692623134,0.82716181091964247,1.2290919924154879,1.0474897921085358,0.9412962546572089,0.70687204189598551,0.90062326695770023,0.85168451964855185,1.1117140911519527,0.97856469377875333,0.91807055007666349,1.3677939875051379,0.65694156643003221,1.2560237670317291,1.0471274128183723,0.82390006314963105,0.85297290496528144,0.69244248215109105,0.89163687601685515,0.78088525608181958,1.1607696905732154,1.1272915001958608,0.70091151930391793,0.65081238616257897,0.93857992682605984,0.79023568574339154,1.2350837560370564,1.1400816982612014,1.1660317603498698,1.1824218424037098,1.0206783402711153,0.60226134229451422,0.9026435911655426,0.77324301619082692,0.67834348827600477,1.1376705665141345],"y":[82.613259901292622,37.993945880606773,78.94690186567604,86.769275586493308,78.776405766420069,73.710036222264165,56.124397285655142,82.356053236313159,32.074911559373142,86.727245346456769,56.292440438456836,85.247367592155939,86.034951406903559,87.836879619397223,null,37.858417518250647,75.696397712267938,85.818787548691034,61.231309396773575,35.327429139800373,53.329624840803447,78.117246910184619,79.891765886545187,null,88.938188420422378,46.784516962990168,81.147955156303937,42.892156771942972,37.650223704427482,75.680156192369765,78.6190169999376,58.621897828392683,null,24.617287368141113,53.719375932402912,83.006170329824087,71.314913453347984,51.182347526587549,null,30.275116776488723,78.714838665723804,57.337807953171435,72.722915975563225,93.22255481984466,52.289014150016008,89.642814675532279,87.309670296311381],"text":["year: 1990<br />coverage: 83<br />year: 1990<br />name: Algeria","year: 1990<br />coverage: 38<br />year: 1990<br />name: Angola","year: 1990<br />coverage: 79<br />year: 1990<br />name: Benin","year: 1990<br />coverage: 87<br />year: 1990<br />name: Botswana","year: 1990<br />coverage: 79<br />year: 1990<br />name: Burkina Faso","year: 1990<br />coverage: 74<br />year: 1990<br />name: Burundi","year: 1990<br />coverage: 56<br />year: 1990<br />name: Cameroon","year: 1990<br />coverage: 82<br />year: 1990<br />name: Central African Republic","year: 1990<br />coverage: 32<br />year: 1990<br />name: Chad","year: 1990<br />coverage: 87<br />year: 1990<br />name: Comoros","year: 1990<br />coverage: 56<br />year: 1990<br />name: Cote d'Ivoire","year: 1990<br />coverage: 85<br />year: 1990<br />name: Djibouti","year: 1990<br />coverage: 86<br />year: 1990<br />name: Egypt","year: 1990<br />coverage: 88<br />year: 1990<br />name: Equatorial Guinea","year: 1990<br />coverage: NA<br />year: 1990<br />name: Eritrea","year: 1990<br />coverage: 38<br />year: 1990<br />name: Ethiopia","year: 1990<br />coverage: 76<br />year: 1990<br />name: Gabon","year: 1990<br />coverage: 86<br />year: 1990<br />name: Gambia","year: 1990<br />coverage: 61<br />year: 1990<br />name: Ghana","year: 1990<br />coverage: 35<br />year: 1990<br />name: Guinea","year: 1990<br />coverage: 53<br />year: 1990<br />name: Guinea-Bissau","year: 1990<br />coverage: 78<br />year: 1990<br />name: Kenya","year: 1990<br />coverage: 80<br />year: 1990<br />name: Lesotho","year: 1990<br />coverage: NA<br />year: 1990<br />name: Liberia","year: 1990<br />coverage: 89<br />year: 1990<br />name: Libya","year: 1990<br />coverage: 47<br />year: 1990<br />name: Madagascar","year: 1990<br />coverage: 81<br />year: 1990<br />name: Malawi","year: 1990<br />coverage: 43<br />year: 1990<br />name: Mali","year: 1990<br />coverage: 38<br />year: 1990<br />name: Mauritania","year: 1990<br />coverage: 76<br />year: 1990<br />name: Mauritius","year: 1990<br />coverage: 79<br />year: 1990<br />name: Morocco","year: 1990<br />coverage: 59<br />year: 1990<br />name: Mozambique","year: 1990<br />coverage: NA<br />year: 1990<br />name: Namibia","year: 1990<br />coverage: 25<br />year: 1990<br />name: Niger","year: 1990<br />coverage: 54<br />year: 1990<br />name: Nigeria","year: 1990<br />coverage: 83<br />year: 1990<br />name: Rwanda","year: 1990<br />coverage: 71<br />year: 1990<br />name: Sao Tome and Principe","year: 1990<br />coverage: 51<br />year: 1990<br />name: Senegal","year: 1990<br />coverage: NA<br />year: 1990<br />name: Sierra Leone","year: 1990<br />coverage: 30<br />year: 1990<br />name: Somalia","year: 1990<br />coverage: 79<br />year: 1990<br />name: South Africa","year: 1990<br />coverage: 57<br />year: 1990<br />name: Sudan","year: 1990<br />coverage: 73<br />year: 1990<br />name: Togo","year: 1990<br />coverage: 93<br />year: 1990<br />name: Tunisia","year: 1990<br />coverage: 52<br />year: 1990<br />name: Uganda","year: 1990<br />coverage: 90<br />year: 1990<br />name: Zambia","year: 1990<br />coverage: 87<br />year: 1990<br />name: Zimbabwe"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(230,75,53,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"1990","legendgroup":"1990","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1.1626648403704167,1.2408001152798533,1.2844322938472033,0.70639012996107331,1.0772288888692856,0.71702347639948127,0.63856565654277797,1.05531813390553,1.1565854979678989,1.2666177263483407,0.67824799306690697,0.84710333682596684,1.0193243294954299,0.63499583024531603,1.2048367992043496,0.7538891354575753,0.80160458404570822,1.2769481003284455,1.0092820161953568,1.1872634075582027,0.91495293453335758,1.142705798521638],"y":[93.127747426740825,78.011637665331364,89.329148588329559,97.098858487233514,82.210564705356958,90.082738666981456,93.986484372802082,70.042875917255884,60.186722052842377,97.608089864812797,67.682154947333032,30.744875507056712,89.693237715773279,74.183615805953735,74.80511732138693,81.981810190156096,73.240338577330107,68.676182976365084,64.318671918101614,69.977436274848884,90.235162881948057,96.895073581300679],"text":["year: 1990<br />coverage: 93<br />year: 1990<br />name: Argentina","year: 1990<br />coverage: 78<br />year: 1990<br />name: Brazil","year: 1990<br />coverage: 89<br />year: 1990<br />name: Canada","year: 1990<br />coverage: 97<br />year: 1990<br />name: Chile","year: 1990<br />coverage: 82<br />year: 1990<br />name: Colombia","year: 1990<br />coverage: 90<br />year: 1990<br />name: Costa Rica","year: 1990<br />coverage: 94<br />year: 1990<br />name: Cuba","year: 1990<br />coverage: 70<br />year: 1990<br />name: Dominican Republic","year: 1990<br />coverage: 60<br />year: 1990<br />name: Ecuador","year: 1990<br />coverage: 98<br />year: 1990<br />name: El Salvador","year: 1990<br />coverage: 68<br />year: 1990<br />name: Guatemala","year: 1990<br />coverage: 31<br />year: 1990<br />name: Haiti","year: 1990<br />coverage: 90<br />year: 1990<br />name: Honduras","year: 1990<br />coverage: 74<br />year: 1990<br />name: Jamaica","year: 1990<br />coverage: 75<br />year: 1990<br />name: Mexico","year: 1990<br />coverage: 82<br />year: 1990<br />name: Nicaragua","year: 1990<br />coverage: 73<br />year: 1990<br />name: Panama","year: 1990<br />coverage: 69<br />year: 1990<br />name: Paraguay","year: 1990<br />coverage: 64<br />year: 1990<br />name: Peru","year: 1990<br />coverage: 70<br />year: 1990<br />name: Trinidad and Tobago","year: 1990<br />coverage: 90<br />year: 1990<br />name: United States","year: 1990<br />coverage: 97<br />year: 1990<br />name: Uruguay"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(230,75,53,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"1990","legendgroup":"1990","showlegend":false,"xaxis":"x2","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1.1823166063055397,0.97005725987255575,0.62700993493199353,0.96650471016764639,0.98730134721845386,0.60515810512006274,0.99971537739038463,1.1589518584311009,1.1554186360910534,1.0385831179097296,0.89956523608416317,0.79877837635576721,0.79112491123378281,0.79096411168575287,1.2735444186255336,1.2807239200919867,1.0513820119202137,0.6214035227894783,1.1674407478421926,1.1422268487513065,0.73551806826144461,0.70623048748821016,0.71233831346035004,0.63014382328838114],"y":[20.234359136782587,86.61316112298519,64.695906646735963,33.903405788168314,98.213813886232671,55.687070776708424,58.346575539559126,75.216666403971615,91.268265858478841,73.35146833695471,87.300976611860094,65.975766940228638,61.085167063213888,69.650180128961807,92.174004209972921,67.796131941303614,56.861702917702495,98.16641911901533,50.087088961713015,84.710229125805199,88.349742139875886,83.943358438834551,80.21149505674839,79.74233058970421],"text":["year: 1990<br />coverage: 20<br />year: 1990<br />name: Afghanistan","year: 1990<br />coverage: 87<br />year: 1990<br />name: Bahrain","year: 1990<br />coverage: 65<br />year: 1990<br />name: Bangladesh","year: 1990<br />coverage: 34<br />year: 1990<br />name: Cambodia","year: 1990<br />coverage: 98<br />year: 1990<br />name: China","year: 1990<br />coverage: 56<br />year: 1990<br />name: India","year: 1990<br />coverage: 58<br />year: 1990<br />name: Indonesia","year: 1990<br />coverage: 75<br />year: 1990<br />name: Iraq","year: 1990<br />coverage: 91<br />year: 1990<br />name: Israel","year: 1990<br />coverage: 73<br />year: 1990<br />name: Japan","year: 1990<br />coverage: 87<br />year: 1990<br />name: Jordan","year: 1990<br />coverage: 66<br />year: 1990<br />name: Kuwait","year: 1990<br />coverage: 61<br />year: 1990<br />name: Lebanon","year: 1990<br />coverage: 70<br />year: 1990<br />name: Malaysia","year: 1990<br />coverage: 92<br />year: 1990<br />name: Mongolia","year: 1990<br />coverage: 68<br />year: 1990<br />name: Myanmar","year: 1990<br />coverage: 57<br />year: 1990<br />name: Nepal","year: 1990<br />coverage: 98<br />year: 1990<br />name: Oman","year: 1990<br />coverage: 50<br />year: 1990<br />name: Pakistan","year: 1990<br />coverage: 85<br />year: 1990<br />name: Philippines","year: 1990<br />coverage: 88<br />year: 1990<br />name: Saudi Arabia","year: 1990<br />coverage: 84<br />year: 1990<br />name: Singapore","year: 1990<br />coverage: 80<br />year: 1990<br />name: Sri Lanka","year: 1990<br />coverage: 80<br />year: 1990<br />name: Thailand"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(230,75,53,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"1990","legendgroup":"1990","showlegend":false,"xaxis":"x3","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1.1370423717424274,0.61241782940924172,1.3587145518511534,1.2099412461742758,1.1033221239224076,0.71900870967656372,0.60801313221454611,1.2167073668912054,1.001278367266059,0.80653290301561353,1.1981192311272024,1.2845200696960091,1.2821138119325042,1.2612406374886631,0.97854648437350988,1.383534878306091,1.3645031666383147,1.3739533022046091,1.1665004774928094,1.2001139977946877,1.225731030665338,1.1458358960226178,1.2100139116868376,1.1053688466548919,0.87604958843439817,0.66604591459035878],"y":[88.07699239775539,59.735878713987766,84.838729220069951,null,98.983619460649791,null,83.614680947922167,96.818570196814832,71.020241861417887,75.320561072975394,75.796131633408365,99.205896493978798,99.071284744143483,78.280501003563401,43.218769756518306,null,86.710995917767292,95.293458066135642,85.339676832407719,92.365804826468235,null,null,99.380645072646445,95.96947423629463,89.939643337577579,86.690129846706981],"text":["year: 1990<br />coverage: 88<br />year: 1990<br />name: Albania","year: 1990<br />coverage: 60<br />year: 1990<br />name: Austria","year: 1990<br />coverage: 85<br />year: 1990<br />name: Belgium","year: 1990<br />coverage: NA<br />year: 1990<br />name: Bosnia and Herzegovina","year: 1990<br />coverage: 99<br />year: 1990<br />name: Bulgaria","year: 1990<br />coverage: NA<br />year: 1990<br />name: Croatia","year: 1990<br />coverage: 84<br />year: 1990<br />name: Denmark","year: 1990<br />coverage: 97<br />year: 1990<br />name: Finland","year: 1990<br />coverage: 71<br />year: 1990<br />name: France","year: 1990<br />coverage: 75<br />year: 1990<br />name: Germany","year: 1990<br />coverage: 76<br />year: 1990<br />name: Greece","year: 1990<br />coverage: 99<br />year: 1990<br />name: Hungary","year: 1990<br />coverage: 99<br />year: 1990<br />name: Iceland","year: 1990<br />coverage: 78<br />year: 1990<br />name: Ireland","year: 1990<br />coverage: 43<br />year: 1990<br />name: Italy","year: 1990<br />coverage: NA<br />year: 1990<br />name: Montenegro","year: 1990<br />coverage: 87<br />year: 1990<br />name: Norway","year: 1990<br />coverage: 95<br />year: 1990<br />name: Poland","year: 1990<br />coverage: 85<br />year: 1990<br />name: Portugal","year: 1990<br />coverage: 92<br />year: 1990<br />name: Romania","year: 1990<br />coverage: NA<br />year: 1990<br />name: Serbia","year: 1990<br />coverage: NA<br />year: 1990<br />name: Slovenia","year: 1990<br />coverage: 99<br />year: 1990<br />name: Spain","year: 1990<br />coverage: 96<br />year: 1990<br />name: Sweden","year: 1990<br />coverage: 90<br />year: 1990<br />name: Switzerland","year: 1990<br />coverage: 87<br />year: 1990<br />name: United Kingdom"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(230,75,53,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"1990","legendgroup":"1990","showlegend":false,"xaxis":"x","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[1.3872138909995555,1.2783202635124327],"y":[86.383015028387305,89.605270992591983],"text":["year: 1990<br />coverage: 86<br />year: 1990<br />name: Australia","year: 1990<br />coverage: 90<br />year: 1990<br />name: New Zealand"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(230,75,53,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"1990","legendgroup":"1990","showlegend":false,"xaxis":"x2","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[0.96294166930019853,1.0379713201895355,0.95644259285181765,0.93331096768379207,1.0787245910614729,1.3551494475454091,1.0040673384442926,0.74345046579837804,1.399896045587957,1.028940773755312,0.87087070085108276,1.0353140367195011,0.66916548069566484,1.27200890686363,1.3198776528239251,0.72768377158790831,1.2678975239396095,0.71403480675071473,1.2748008210211994,0.91370961181819443,0.86621773540973668,0.77574591524899006,0.60529567338526247,0.68415045421570531,0.70983833633363247,0.67964455019682646,0.60479232072830191,0.85254680607467881,1.1258641617372631,0.66745243724435566,1.3575508557260036,0.92510665934532876,1.0384014381095767,0.98620221130549912,1.1793219417333602,1.3976677088066936,1.0205430099740624,1.0498111510649324,1.212477382645011,1.1208516187965869,1.2305483611300589,1.0749783255159855,0.89760689586400977,0.95562177486717703,1.3739398768171669,1.1903952196240426,0.89896182343363762,0.7351564783602953,1.2392857495695353,0.99721356946974993,1.0641814168542623,1.1022844349965453,0.63485674541443582,1.0401720404624939,0.94281093198806043,0.97328323815017936,1.3600686689838768,1.1335722129791974,0.701095307059586,0.83157005850225685,0.76164311990141864,1.0968896394595504,0.97728873491287227,1.3771244505420328,1.2647259997203948,0.92988985422998671,0.95237296335399146,0.7849626356735826,1.1997483490034937,1.2397916132584215,0.92676704302430157,1.2417370259761811,0.74277114458382132,1.0446584809571504],"y":[null,89.339293898455793,null,null,86.17030069231987,87.291842685267326,null,85.659782516956327,93.285215361230073,53.063226539082827,98.940969962999219,78.947490134462711,75.151733467541632,67.28116108644754,76.759736111015087,null,97.950951179862017,37.72138611972332,87.863631337322289,null,84.715990368276834,83.614577431417999,null,85.129758113622671,73.029361878335479,84.78374096378684,null,75.361312355659905,null,31.947345664538442,null,null,80.345449721440673,95.89438816271722,79.659293366596103,51.636149556562302,81.098841536417609,99.106462716311214,null,93.710096468962732,98.768231213465327,null,98.099190116673711,67.25945556610823,78.960026080161327,92.645691974461073,null,null,99.369170043617487,81.690238047949975,95.806157233752316,88.807397732138639,null,85.768467907421297,null,69.794860221818084,null,null,64.755916561372572,86.8825868004933,null,null,85.714939436689022,78.306498315557832,null,95.097505349479619,null,80.351682400144639,79.951604512147611,null,65.816852919012305,61.01416445709765,88.230761439539492,69.253349744901058],"text":["year: 1990<br />coverage: NA<br />year: 1990<br />name: Andorra","year: 1990<br />coverage: 89<br />year: 1990<br />name: Antigua and Barbuda","year: 1990<br />coverage: NA<br />year: 1990<br />name: Armenia","year: 1990<br />coverage: NA<br />year: 1990<br />name: Azerbaijan","year: 1990<br />coverage: 86<br />year: 1990<br />name: Bahamas","year: 1990<br />coverage: 87<br />year: 1990<br />name: Barbados","year: 1990<br />coverage: NA<br />year: 1990<br />name: Belarus","year: 1990<br />coverage: 86<br />year: 1990<br />name: Belize","year: 1990<br />coverage: 93<br />year: 1990<br />name: Bhutan","year: 1990<br />coverage: 53<br />year: 1990<br />name: Bolivia (Plurinational State of)","year: 1990<br />coverage: 99<br />year: 1990<br />name: Brunei Darussalam","year: 1990<br />coverage: 79<br />year: 1990<br />name: Cabo Verde","year: 1990<br />coverage: 75<br />year: 1990<br />name: Congo","year: 1990<br />coverage: 67<br />year: 1990<br />name: Cook Islands","year: 1990<br />coverage: 77<br />year: 1990<br />name: Cyprus","year: 1990<br />coverage: NA<br />year: 1990<br />name: Czechia","year: 1990<br />coverage: 98<br />year: 1990<br />name: Democratic People's Republic of Korea","year: 1990<br />coverage: 38<br />year: 1990<br />name: Democratic Republic of the Congo","year: 1990<br />coverage: 88<br />year: 1990<br />name: Dominica","year: 1990<br />coverage: NA<br />year: 1990<br />name: Estonia","year: 1990<br />coverage: 85<br />year: 1990<br />name: Eswatini","year: 1990<br />coverage: 84<br />year: 1990<br />name: Fiji","year: 1990<br />coverage: NA<br />year: 1990<br />name: Georgia","year: 1990<br />coverage: 85<br />year: 1990<br />name: Grenada","year: 1990<br />coverage: 73<br />year: 1990<br />name: Guyana","year: 1990<br />coverage: 85<br />year: 1990<br />name: Iran (Islamic Republic of)","year: 1990<br />coverage: NA<br />year: 1990<br />name: Kazakhstan","year: 1990<br />coverage: 75<br />year: 1990<br />name: Kiribati","year: 1990<br />coverage: NA<br />year: 1990<br />name: Kyrgyzstan","year: 1990<br />coverage: 32<br />year: 1990<br />name: Lao People's Democratic Republic","year: 1990<br />coverage: NA<br />year: 1990<br />name: Latvia","year: 1990<br />coverage: NA<br />year: 1990<br />name: Lithuania","year: 1990<br />coverage: 80<br />year: 1990<br />name: Luxembourg","year: 1990<br />coverage: 96<br />year: 1990<br />name: Maldives","year: 1990<br />coverage: 80<br />year: 1990<br />name: Malta","year: 1990<br />coverage: 52<br />year: 1990<br />name: Marshall Islands","year: 1990<br />coverage: 81<br />year: 1990<br />name: Micronesia (Federated States of)","year: 1990<br />coverage: 99<br />year: 1990<br />name: Monaco","year: 1990<br />coverage: NA<br />year: 1990<br />name: Nauru","year: 1990<br />coverage: 94<br />year: 1990<br />name: Netherlands (Kingdom of the)","year: 1990<br />coverage: 99<br />year: 1990<br />name: Niue","year: 1990<br />coverage: NA<br />year: 1990<br />name: North Macedonia","year: 1990<br />coverage: 98<br />year: 1990<br />name: Palau","year: 1990<br />coverage: 67<br />year: 1990<br />name: Papua New Guinea","year: 1990<br />coverage: 79<br />year: 1990<br />name: Qatar","year: 1990<br />coverage: 93<br />year: 1990<br />name: Republic of Korea","year: 1990<br />coverage: NA<br />year: 1990<br />name: Republic of Moldova","year: 1990<br />coverage: NA<br />year: 1990<br />name: Russian Federation","year: 1990<br />coverage: 99<br />year: 1990<br />name: Saint Kitts and Nevis","year: 1990<br />coverage: 82<br />year: 1990<br />name: Saint Lucia","year: 1990<br />coverage: 96<br />year: 1990<br />name: Saint Vincent and the Grenadines","year: 1990<br />coverage: 89<br />year: 1990<br />name: Samoa","year: 1990<br />coverage: NA<br />year: 1990<br />name: San Marino","year: 1990<br />coverage: 86<br />year: 1990<br />name: Seychelles","year: 1990<br />coverage: NA<br />year: 1990<br />name: Slovakia","year: 1990<br />coverage: 70<br />year: 1990<br />name: Solomon Islands","year: 1990<br />coverage: NA<br />year: 1990<br />name: South Sudan","year: 1990<br />coverage: NA<br />year: 1990<br />name: State of Palestine","year: 1990<br />coverage: 65<br />year: 1990<br />name: Suriname","year: 1990<br />coverage: 87<br />year: 1990<br />name: Syrian Arab Republic","year: 1990<br />coverage: NA<br />year: 1990<br />name: Tajikistan","year: 1990<br />coverage: NA<br />year: 1990<br />name: Timor-Leste","year: 1990<br />coverage: 86<br />year: 1990<br />name: Tonga","year: 1990<br />coverage: 78<br />year: 1990<br />name: Turkiye","year: 1990<br />coverage: NA<br />year: 1990<br />name: Turkmenistan","year: 1990<br />coverage: 95<br />year: 1990<br />name: Tuvalu","year: 1990<br />coverage: NA<br />year: 1990<br />name: Ukraine","year: 1990<br />coverage: 80<br />year: 1990<br />name: United Arab Emirates","year: 1990<br />coverage: 80<br />year: 1990<br />name: United Republic of Tanzania","year: 1990<br />coverage: NA<br />year: 1990<br />name: Uzbekistan","year: 1990<br />coverage: 66<br />year: 1990<br />name: Vanuatu","year: 1990<br />coverage: 61<br />year: 1990<br />name: Venezuela (Bolivarian Republic of)","year: 1990<br />coverage: 88<br />year: 1990<br />name: Viet Nam","year: 1990<br />coverage: 69<br />year: 1990<br />name: Yemen"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(230,75,53,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"1990","legendgroup":"1990","showlegend":false,"xaxis":"x3","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[2.2262488333508372,1.9076377091929317,1.6996030196547509,1.7543657297268509,2.1012758409604428,2.2941821066662671,2.3274383578449487,1.9233470289036632,2.2906981777399777,2.3294867703691127,2.3199763780459763,1.8952667584642768,1.8374810721725225,2.3448738196864722,1.8140486732125283,2.2082310443744064,1.8416582105681301,1.9395561812445521,1.6237507075071336,1.7297943480312825,1.8085367109626531,2.2868300518020988,1.8878218358382584,1.8135282164439559,1.6878223005682229,2.2767061186954378,1.9515922851860523,1.8500858079642057,2.2574756892397998,2.0733195640146733,1.7620527196675539,1.8222463179379702,1.8465750090777875,1.8313802488148212,2.2136148771271111,2.3420070903375745,2.1950283287093044,1.9043392091989517,2.3763833167031407,2.1239701911807058,1.7054001819342375,2.1028706412762403,1.8890934359282254,1.9213077494874597,1.982655461318791,2.1845575835555793,2.2837712103500962],"y":[79.650489278510207,32.057010341249409,70.034385242126888,90.97112286109477,48.151062072440979,72.044318486005068,48.75915751978755,36.212668229825795,28.316314920410512,69.874751001410189,67.759644793905323,49.946948562562469,98.134383114613598,49.974361706711349,76.376888822205359,36.273897210508586,54.991437529027465,88.614682231470937,90.310503241047257,42.265621931105855,71.366506407596177,77.631077252887195,73.758653162233529,63.000651986338198,92.723968931846315,56.788271477259698,72.657355828210711,49.337264087237415,45.687252128496766,83.728159077838058,93.092845059372479,71.300261867977682,68.861616947874424,36.761863578855994,32.728697165288033,74.096368229389185,68.976178479939705,48.04383571520448,37.251578812673685,24.307128080911934,72.378814912773663,57.65839425716549,57.674122161604465,94.60030367709696,56.908869957365098,85.102149668335912,74.899202096462247],"text":["year: 2000<br />coverage: 80<br />year: 2000<br />name: Algeria","year: 2000<br />coverage: 32<br />year: 2000<br />name: Angola","year: 2000<br />coverage: 70<br />year: 2000<br />name: Benin","year: 2000<br />coverage: 91<br />year: 2000<br />name: Botswana","year: 2000<br />coverage: 48<br />year: 2000<br />name: Burkina Faso","year: 2000<br />coverage: 72<br />year: 2000<br />name: Burundi","year: 2000<br />coverage: 49<br />year: 2000<br />name: Cameroon","year: 2000<br />coverage: 36<br />year: 2000<br />name: Central African Republic","year: 2000<br />coverage: 28<br />year: 2000<br />name: Chad","year: 2000<br />coverage: 70<br />year: 2000<br />name: Comoros","year: 2000<br />coverage: 68<br />year: 2000<br />name: Cote d'Ivoire","year: 2000<br />coverage: 50<br />year: 2000<br />name: Djibouti","year: 2000<br />coverage: 98<br />year: 2000<br />name: Egypt","year: 2000<br />coverage: 50<br />year: 2000<br />name: Equatorial Guinea","year: 2000<br />coverage: 76<br />year: 2000<br />name: Eritrea","year: 2000<br />coverage: 36<br />year: 2000<br />name: Ethiopia","year: 2000<br />coverage: 55<br />year: 2000<br />name: Gabon","year: 2000<br />coverage: 89<br />year: 2000<br />name: Gambia","year: 2000<br />coverage: 90<br />year: 2000<br />name: Ghana","year: 2000<br />coverage: 42<br />year: 2000<br />name: Guinea","year: 2000<br />coverage: 71<br />year: 2000<br />name: Guinea-Bissau","year: 2000<br />coverage: 78<br />year: 2000<br />name: Kenya","year: 2000<br />coverage: 74<br />year: 2000<br />name: Lesotho","year: 2000<br />coverage: 63<br />year: 2000<br />name: Liberia","year: 2000<br />coverage: 93<br />year: 2000<br />name: Libya","year: 2000<br />coverage: 57<br />year: 2000<br />name: Madagascar","year: 2000<br />coverage: 73<br />year: 2000<br />name: Malawi","year: 2000<br />coverage: 49<br />year: 2000<br />name: Mali","year: 2000<br />coverage: 46<br />year: 2000<br />name: Mauritania","year: 2000<br />coverage: 84<br />year: 2000<br />name: Mauritius","year: 2000<br />coverage: 93<br />year: 2000<br />name: Morocco","year: 2000<br />coverage: 71<br />year: 2000<br />name: Mozambique","year: 2000<br />coverage: 69<br />year: 2000<br />name: Namibia","year: 2000<br />coverage: 37<br />year: 2000<br />name: Niger","year: 2000<br />coverage: 33<br />year: 2000<br />name: Nigeria","year: 2000<br />coverage: 74<br />year: 2000<br />name: Rwanda","year: 2000<br />coverage: 69<br />year: 2000<br />name: Sao Tome and Principe","year: 2000<br />coverage: 48<br />year: 2000<br />name: Senegal","year: 2000<br />coverage: 37<br />year: 2000<br />name: Sierra Leone","year: 2000<br />coverage: 24<br />year: 2000<br />name: Somalia","year: 2000<br />coverage: 72<br />year: 2000<br />name: South Africa","year: 2000<br />coverage: 58<br />year: 2000<br />name: Sudan","year: 2000<br />coverage: 58<br />year: 2000<br />name: Togo","year: 2000<br />coverage: 95<br />year: 2000<br />name: Tunisia","year: 2000<br />coverage: 57<br />year: 2000<br />name: Uganda","year: 2000<br />coverage: 85<br />year: 2000<br />name: Zambia","year: 2000<br />coverage: 75<br />year: 2000<br />name: Zimbabwe"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(77,187,213,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2000","legendgroup":"2000","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1.8985497383400798,1.9661887686699628,2.3404923528432846,2.3542686814442275,1.6660168804228306,2.1221084177494047,1.7771454369649291,1.6276870302855968,2.1812007423490285,2.272425803542137,2.1731559561565517,2.2186069864779712,1.7438697474077345,1.7801324257627129,1.898439384251833,2.0163624441251158,1.7902911173179745,2.3864686505869033,1.6841399768367409,2.3795601097866892,2.3272683279588819,1.6466975232586265],"y":[90.695291652530429,98.604062282852823,95.76050640214234,97.001081490330392,88.132628212496641,81.609452195093041,93.77164497766644,85.052399487979713,98.719183663278812,96.724729129858318,86.020623958669603,55.299810783937573,97.746825727075333,88.286125210113823,96.260615426301953,86.032869159244001,97.157647870294753,92.009951527602965,97.257775478623813,89.763183433935041,91.247265807911759,89.260357510484752],"text":["year: 2000<br />coverage: 91<br />year: 2000<br />name: Argentina","year: 2000<br />coverage: 99<br />year: 2000<br />name: Brazil","year: 2000<br />coverage: 96<br />year: 2000<br />name: Canada","year: 2000<br />coverage: 97<br />year: 2000<br />name: Chile","year: 2000<br />coverage: 88<br />year: 2000<br />name: Colombia","year: 2000<br />coverage: 82<br />year: 2000<br />name: Costa Rica","year: 2000<br />coverage: 94<br />year: 2000<br />name: Cuba","year: 2000<br />coverage: 85<br />year: 2000<br />name: Dominican Republic","year: 2000<br />coverage: 99<br />year: 2000<br />name: Ecuador","year: 2000<br />coverage: 97<br />year: 2000<br />name: El Salvador","year: 2000<br />coverage: 86<br />year: 2000<br />name: Guatemala","year: 2000<br />coverage: 55<br />year: 2000<br />name: Haiti","year: 2000<br />coverage: 98<br />year: 2000<br />name: Honduras","year: 2000<br />coverage: 88<br />year: 2000<br />name: Jamaica","year: 2000<br />coverage: 96<br />year: 2000<br />name: Mexico","year: 2000<br />coverage: 86<br />year: 2000<br />name: Nicaragua","year: 2000<br />coverage: 97<br />year: 2000<br />name: Panama","year: 2000<br />coverage: 92<br />year: 2000<br />name: Paraguay","year: 2000<br />coverage: 97<br />year: 2000<br />name: Peru","year: 2000<br />coverage: 90<br />year: 2000<br />name: Trinidad and Tobago","year: 2000<br />coverage: 91<br />year: 2000<br />name: United States","year: 2000<br />coverage: 89<br />year: 2000<br />name: Uruguay"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(77,187,213,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2000","legendgroup":"2000","showlegend":false,"xaxis":"x2","yaxis":"y","hoverinfo":"text","frame":null},{"x":[2.0222038280218841,1.6349639859050513,2.1007820539176465,1.8515498707070948,1.6165383143350482,1.9295237893238664,2.3617172291502357,1.8398595567792655,2.1674791647121312,2.2187283277511596,2.1984745949506759,2.3122300343587994,2.0651224916800857,1.8208550646901132,2.1807958651334047,2.2067650891840458,2.0615299575030805,2.3658382223919032,1.714740215614438,1.9158858321607113,1.8071971468627452,2.0573212604969742,1.80715462397784,2.0034971401095389],"y":[27.046134617179632,97.735171545855707,73.757124477252361,65.145792586915192,84.295082352124155,55.801409642025831,76.302575251273808,85.744054024480278,95.259995794668797,96.311675837635988,94.120965743809933,99.366167214512828,71.221982434578237,95.881986985914409,92.391728051565593,83.751244200207296,70.815395968407387,98.827024735696611,56.610032635368405,78.223093606904143,94.399353028647596,96.248584548942745,99.024405898340049,94.228892394341528],"text":["year: 2000<br />coverage: 27<br />year: 2000<br />name: Afghanistan","year: 2000<br />coverage: 98<br />year: 2000<br />name: Bahrain","year: 2000<br />coverage: 74<br />year: 2000<br />name: Bangladesh","year: 2000<br />coverage: 65<br />year: 2000<br />name: Cambodia","year: 2000<br />coverage: 84<br />year: 2000<br />name: China","year: 2000<br />coverage: 56<br />year: 2000<br />name: India","year: 2000<br />coverage: 76<br />year: 2000<br />name: Indonesia","year: 2000<br />coverage: 86<br />year: 2000<br />name: Iraq","year: 2000<br />coverage: 95<br />year: 2000<br />name: Israel","year: 2000<br />coverage: 96<br />year: 2000<br />name: Japan","year: 2000<br />coverage: 94<br />year: 2000<br />name: Jordan","year: 2000<br />coverage: 99<br />year: 2000<br />name: Kuwait","year: 2000<br />coverage: 71<br />year: 2000<br />name: Lebanon","year: 2000<br />coverage: 96<br />year: 2000<br />name: Malaysia","year: 2000<br />coverage: 92<br />year: 2000<br />name: Mongolia","year: 2000<br />coverage: 84<br />year: 2000<br />name: Myanmar","year: 2000<br />coverage: 71<br />year: 2000<br />name: Nepal","year: 2000<br />coverage: 99<br />year: 2000<br />name: Oman","year: 2000<br />coverage: 57<br />year: 2000<br />name: Pakistan","year: 2000<br />coverage: 78<br />year: 2000<br />name: Philippines","year: 2000<br />coverage: 94<br />year: 2000<br />name: Saudi Arabia","year: 2000<br />coverage: 96<br />year: 2000<br />name: Singapore","year: 2000<br />coverage: 99<br />year: 2000<br />name: Sri Lanka","year: 2000<br />coverage: 94<br />year: 2000<br />name: Thailand"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(77,187,213,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2000","legendgroup":"2000","showlegend":false,"xaxis":"x3","yaxis":"y","hoverinfo":"text","frame":null},{"x":[1.9879113394767045,1.6072025796398521,2.1567810337990521,1.7987954402342439,2.0671880615875127,1.7128137832507491,1.6691174978390335,1.777441569417715,1.6236482068896294,2.3187435183674099,1.6872285936027764,2.2614521596580746,2.1094923710450528,1.7487189730629324,2.3799321915954352,1.9219184221699834,2.1458735954016448,2.2343809530138969,2.1579364933073522,2.0279827080667019,2.0000248225405812,2.0332385597750546,2.1070944804698231,1.8203450307250022,1.8531771956011653,2.2649527598172425],"y":[95.113108386844402,75.269641243852675,82.106738148815936,79.957040909491482,88.736827964894474,93.132960080169141,98.762679631449288,96.009906586632127,83.994723257236188,91.88721793778241,88.998438647389406,99.000010879337793,91.019112545624381,78.899967311508959,73.866469259373844,null,87.745692621916533,97.252840666286644,86.90105166882276,97.910436819307506,88.663354443572459,94.608665394410494,93.779745191335678,91.137517561763531,81.93385768048465,88.131319195777181],"text":["year: 2000<br />coverage: 95<br />year: 2000<br />name: Albania","year: 2000<br />coverage: 75<br />year: 2000<br />name: Austria","year: 2000<br />coverage: 82<br />year: 2000<br />name: Belgium","year: 2000<br />coverage: 80<br />year: 2000<br />name: Bosnia and Herzegovina","year: 2000<br />coverage: 89<br />year: 2000<br />name: Bulgaria","year: 2000<br />coverage: 93<br />year: 2000<br />name: Croatia","year: 2000<br />coverage: 99<br />year: 2000<br />name: Denmark","year: 2000<br />coverage: 96<br />year: 2000<br />name: Finland","year: 2000<br />coverage: 84<br />year: 2000<br />name: France","year: 2000<br />coverage: 92<br />year: 2000<br />name: Germany","year: 2000<br />coverage: 89<br />year: 2000<br />name: Greece","year: 2000<br />coverage: 99<br />year: 2000<br />name: Hungary","year: 2000<br />coverage: 91<br />year: 2000<br />name: Iceland","year: 2000<br />coverage: 79<br />year: 2000<br />name: Ireland","year: 2000<br />coverage: 74<br />year: 2000<br />name: Italy","year: 2000<br />coverage: NA<br />year: 2000<br />name: Montenegro","year: 2000<br />coverage: 88<br />year: 2000<br />name: Norway","year: 2000<br />coverage: 97<br />year: 2000<br />name: Poland","year: 2000<br />coverage: 87<br />year: 2000<br />name: Portugal","year: 2000<br />coverage: 98<br />year: 2000<br />name: Romania","year: 2000<br />coverage: 89<br />year: 2000<br />name: Serbia","year: 2000<br />coverage: 95<br />year: 2000<br />name: Slovenia","year: 2000<br />coverage: 94<br />year: 2000<br />name: Spain","year: 2000<br />coverage: 91<br />year: 2000<br />name: Sweden","year: 2000<br />coverage: 82<br />year: 2000<br />name: Switzerland","year: 2000<br />coverage: 88<br />year: 2000<br />name: United Kingdom"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(77,187,213,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2000","legendgroup":"2000","showlegend":false,"xaxis":"x","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[2.0502626327797771,1.9230129033327104],"y":[90.826803059875971,84.650675032846635],"text":["year: 2000<br />coverage: 91<br />year: 2000<br />name: Australia","year: 2000<br />coverage: 85<br />year: 2000<br />name: New Zealand"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(77,187,213,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2000","legendgroup":"2000","showlegend":false,"xaxis":"x2","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[2.3659292072057725,2.0351925421506167,1.6083757622167467,1.8824561681598424,2.1927326381206513,2.016092574223876,1.7160900862887503,2.0396703261882068,2.0855230621993543,2.0321977077051998,1.8958919424563647,1.6758579658344388,1.952303778193891,2.1791774354875089,2.283424135670066,2.3561924565583467,2.0553925912827253,2.2502157699316738,2.0975193545222282,1.6911217838525772,1.9510207844898104,1.6293458994477987,2.3153169715777038,1.7902471086010336,2.1525323132053016,2.2264116959646345,1.9590071504935622,1.8240653578191997,2.2831165287643671,2.3402443746104837,1.8118363285437227,2.3491815792396666,2.1239778744056821,2.3165904302150011,2.3705535992980002,1.6209818899631501,1.6575600672513247,1.6389860605821014,1.6233530057594181,1.7621619572862983,2.3663638398051261,2.1409488594159485,2.1505756404250862,2.0564535213634372,1.691937023960054,1.8436547409743071,2.1866672549396755,1.9591385086998343,2.0283876080065966,1.7591832874342799,2.3710252868011592,2.0468643032014371,1.7711946487426757,1.6946506878361105,1.7829267587512732,2.1014212315902112,2.2192131789401173,1.9184878865256905,1.7868808917701244,2.3737640069797634,2.2618102435022593,1.9706597413867712,1.7438832908868789,2.0911659635603428,1.7767142903059721,2.0623283063992859,1.9840407999232412,1.7484209515154361,1.6590402090921998,2.3184062475338578,2.0801481589674951,1.6237772541120647,2.1167945438995956,1.6766807507723569],"y":[97.378864393755791,95.224153517559174,92.184616439044476,67.009144194610414,93.128041200526056,93.886565373651678,97.92331420741975,96.349626569636172,78.197608857601878,83.643123151920733,99.037144192680714,86.136318329535428,33.922066260315475,76.20918693412095,85.656114272773266,97.132265648990867,78.118949613347652,45.689066111668943,99.048154110275206,93.216921888850635,92.145924688503143,80.605898192338643,72.975319669954473,92.271098440885538,85.686435369774699,98.693286274373534,98.922741279751065,80.10606735516339,97.65316369235515,41.94879015851766,97.332495024055248,97.109200190752745,93.229373981617385,98.703734637051824,74.332939142547545,94.259717942401764,84.821772133000195,97.900155557319522,7.6138056974858044,95.682301628030842,98.713952475786215,97.001714725978673,83.128525853715843,68.8524186193943,91.031241405196482,94.672317347675559,88.963628538139162,96.748067570850253,98.623844384960833,88.243092369474468,96.325417284294957,92.900900390371675,98.922470097802574,96.611112653650338,97.746682605706155,91.219515323080117,null,93.092448949441319,84.021656687371433,83.727719565853477,87.639879577234382,null,94.989330775663262,86.814878397062415,96.042869509384033,80.995820712111893,98.602621087618175,94.050064549222583,77.970246389321986,98.719138088822362,61.276084266789255,84.286220877990132,97.030242059752339,70.082858231104908],"text":["year: 2000<br />coverage: 97<br />year: 2000<br />name: Andorra","year: 2000<br />coverage: 95<br />year: 2000<br />name: Antigua and Barbuda","year: 2000<br />coverage: 92<br />year: 2000<br />name: Armenia","year: 2000<br />coverage: 67<br />year: 2000<br />name: Azerbaijan","year: 2000<br />coverage: 93<br />year: 2000<br />name: Bahamas","year: 2000<br />coverage: 94<br />year: 2000<br />name: Barbados","year: 2000<br />coverage: 98<br />year: 2000<br />name: Belarus","year: 2000<br />coverage: 96<br />year: 2000<br />name: Belize","year: 2000<br />coverage: 78<br />year: 2000<br />name: Bhutan","year: 2000<br />coverage: 84<br />year: 2000<br />name: Bolivia (Plurinational State of)","year: 2000<br />coverage: 99<br />year: 2000<br />name: Brunei Darussalam","year: 2000<br />coverage: 86<br />year: 2000<br />name: Cabo Verde","year: 2000<br />coverage: 34<br />year: 2000<br />name: Congo","year: 2000<br />coverage: 76<br />year: 2000<br />name: Cook Islands","year: 2000<br />coverage: 86<br />year: 2000<br />name: Cyprus","year: 2000<br />coverage: 97<br />year: 2000<br />name: Czechia","year: 2000<br />coverage: 78<br />year: 2000<br />name: Democratic People's Republic of Korea","year: 2000<br />coverage: 46<br />year: 2000<br />name: Democratic Republic of the Congo","year: 2000<br />coverage: 99<br />year: 2000<br />name: Dominica","year: 2000<br />coverage: 93<br />year: 2000<br />name: Estonia","year: 2000<br />coverage: 92<br />year: 2000<br />name: Eswatini","year: 2000<br />coverage: 81<br />year: 2000<br />name: Fiji","year: 2000<br />coverage: 73<br />year: 2000<br />name: Georgia","year: 2000<br />coverage: 92<br />year: 2000<br />name: Grenada","year: 2000<br />coverage: 86<br />year: 2000<br />name: Guyana","year: 2000<br />coverage: 99<br />year: 2000<br />name: Iran (Islamic Republic of)","year: 2000<br />coverage: 99<br />year: 2000<br />name: Kazakhstan","year: 2000<br />coverage: 80<br />year: 2000<br />name: Kiribati","year: 2000<br />coverage: 98<br />year: 2000<br />name: Kyrgyzstan","year: 2000<br />coverage: 42<br />year: 2000<br />name: Lao People's Democratic Republic","year: 2000<br />coverage: 97<br />year: 2000<br />name: Latvia","year: 2000<br />coverage: 97<br />year: 2000<br />name: Lithuania","year: 2000<br />coverage: 93<br />year: 2000<br />name: Luxembourg","year: 2000<br />coverage: 99<br />year: 2000<br />name: Maldives","year: 2000<br />coverage: 74<br />year: 2000<br />name: Malta","year: 2000<br />coverage: 94<br />year: 2000<br />name: Marshall Islands","year: 2000<br />coverage: 85<br />year: 2000<br />name: Micronesia (Federated States of)","year: 2000<br />coverage: 98<br />year: 2000<br />name: Monaco","year: 2000<br />coverage:  8<br />year: 2000<br />name: Nauru","year: 2000<br />coverage: 96<br />year: 2000<br />name: Netherlands (Kingdom of the)","year: 2000<br />coverage: 99<br />year: 2000<br />name: Niue","year: 2000<br />coverage: 97<br />year: 2000<br />name: North Macedonia","year: 2000<br />coverage: 83<br />year: 2000<br />name: Palau","year: 2000<br />coverage: 69<br />year: 2000<br />name: Papua New Guinea","year: 2000<br />coverage: 91<br />year: 2000<br />name: Qatar","year: 2000<br />coverage: 95<br />year: 2000<br />name: Republic of Korea","year: 2000<br />coverage: 89<br />year: 2000<br />name: Republic of Moldova","year: 2000<br />coverage: 97<br />year: 2000<br />name: Russian Federation","year: 2000<br />coverage: 99<br />year: 2000<br />name: Saint Kitts and Nevis","year: 2000<br />coverage: 88<br />year: 2000<br />name: Saint Lucia","year: 2000<br />coverage: 96<br />year: 2000<br />name: Saint Vincent and the Grenadines","year: 2000<br />coverage: 93<br />year: 2000<br />name: Samoa","year: 2000<br />coverage: 99<br />year: 2000<br />name: San Marino","year: 2000<br />coverage: 97<br />year: 2000<br />name: Seychelles","year: 2000<br />coverage: 98<br />year: 2000<br />name: Slovakia","year: 2000<br />coverage: 91<br />year: 2000<br />name: Solomon Islands","year: 2000<br />coverage: NA<br />year: 2000<br />name: South Sudan","year: 2000<br />coverage: 93<br />year: 2000<br />name: State of Palestine","year: 2000<br />coverage: 84<br />year: 2000<br />name: Suriname","year: 2000<br />coverage: 84<br />year: 2000<br />name: Syrian Arab Republic","year: 2000<br />coverage: 88<br />year: 2000<br />name: Tajikistan","year: 2000<br />coverage: NA<br />year: 2000<br />name: Timor-Leste","year: 2000<br />coverage: 95<br />year: 2000<br />name: Tonga","year: 2000<br />coverage: 87<br />year: 2000<br />name: Turkiye","year: 2000<br />coverage: 96<br />year: 2000<br />name: Turkmenistan","year: 2000<br />coverage: 81<br />year: 2000<br />name: Tuvalu","year: 2000<br />coverage: 99<br />year: 2000<br />name: Ukraine","year: 2000<br />coverage: 94<br />year: 2000<br />name: United Arab Emirates","year: 2000<br />coverage: 78<br />year: 2000<br />name: United Republic of Tanzania","year: 2000<br />coverage: 99<br />year: 2000<br />name: Uzbekistan","year: 2000<br />coverage: 61<br />year: 2000<br />name: Vanuatu","year: 2000<br />coverage: 84<br />year: 2000<br />name: Venezuela (Bolivarian Republic of)","year: 2000<br />coverage: 97<br />year: 2000<br />name: Viet Nam","year: 2000<br />coverage: 70<br />year: 2000<br />name: Yemen"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(77,187,213,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2000","legendgroup":"2000","showlegend":false,"xaxis":"x3","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[2.8121893156319855,2.6759816646575927,2.9542620010673999,2.6930133968591692,3.0489895157516003,3.0577159741893412,3.0160474117845295,3.3966101067140699,3.333414022438228,2.707824565656483,2.7676304524764417,3.168186163716018,3.2927795600146057,2.7615975171327589,2.8256486097350715,3.1124591903761027,2.9170136304572223,2.6821245130151512,2.8362317301332949,2.8446570890024305,3.3895908132195474,3.1718372141942384,2.7687231035903097,3.1536126241087912,3.2441808184608818,3.214543378353119,3.3424063021317125,2.8067643489688634,2.7456874363124371,2.9508458564057944,2.9054030055180191,2.9189877096563577,2.9650864722207189,3.0593738149851561,3.260709914751351,2.9181778190657495,3.2428991125896571,2.9273981986567379,2.955482495762408,3.0476974001154304,2.9021972583606841,3.1722600333392621,2.8581182580441236,2.8303175568580627,3.3163854395970702,2.9744182785972955,2.7526932083070279],"y":[95.272506830096248,61.679810209199786,67.761425377242261,96.211046290211385,92.289233752340081,91.798782753571871,79.027126665785914,52.719113536737858,46.243878174014391,72.391914624720812,64.106262165121734,85.252902496047312,96.156725664623082,44.311320040561256,95.241806876100597,63.820949953608213,62.148687074333431,91.985126802697778,93.066058806329963,57.763897214271125,76.396487974189228,86.346385997533801,87.875907580740744,64.75961114428938,98.394138954952354,66.170547560602429,92.833155092597011,77.656405605003243,67.359194381162524,98.815892879851162,97.959952891618016,81.671945898793638,74.905785065330562,66.645471447333691,56.353301194496453,95.157512506097561,92.218356572091579,80.730575575865799,81.76610843446106,46.056735968217254,71.80089909136295,90.130174291692668,68.062723270803687,96.986394920758897,72.978817319497466,96.203384930826729,90.22550728563219],"text":["year: 2010<br />coverage: 95<br />year: 2010<br />name: Algeria","year: 2010<br />coverage: 62<br />year: 2010<br />name: Angola","year: 2010<br />coverage: 68<br />year: 2010<br />name: Benin","year: 2010<br />coverage: 96<br />year: 2010<br />name: Botswana","year: 2010<br />coverage: 92<br />year: 2010<br />name: Burkina Faso","year: 2010<br />coverage: 92<br />year: 2010<br />name: Burundi","year: 2010<br />coverage: 79<br />year: 2010<br />name: Cameroon","year: 2010<br />coverage: 53<br />year: 2010<br />name: Central African Republic","year: 2010<br />coverage: 46<br />year: 2010<br />name: Chad","year: 2010<br />coverage: 72<br />year: 2010<br />name: Comoros","year: 2010<br />coverage: 64<br />year: 2010<br />name: Cote d'Ivoire","year: 2010<br />coverage: 85<br />year: 2010<br />name: Djibouti","year: 2010<br />coverage: 96<br />year: 2010<br />name: Egypt","year: 2010<br />coverage: 44<br />year: 2010<br />name: Equatorial Guinea","year: 2010<br />coverage: 95<br />year: 2010<br />name: Eritrea","year: 2010<br />coverage: 64<br />year: 2010<br />name: Ethiopia","year: 2010<br />coverage: 62<br />year: 2010<br />name: Gabon","year: 2010<br />coverage: 92<br />year: 2010<br />name: Gambia","year: 2010<br />coverage: 93<br />year: 2010<br />name: Ghana","year: 2010<br />coverage: 58<br />year: 2010<br />name: Guinea","year: 2010<br />coverage: 76<br />year: 2010<br />name: Guinea-Bissau","year: 2010<br />coverage: 86<br />year: 2010<br />name: Kenya","year: 2010<br />coverage: 88<br />year: 2010<br />name: Lesotho","year: 2010<br />coverage: 65<br />year: 2010<br />name: Liberia","year: 2010<br />coverage: 98<br />year: 2010<br />name: Libya","year: 2010<br />coverage: 66<br />year: 2010<br />name: Madagascar","year: 2010<br />coverage: 93<br />year: 2010<br />name: Malawi","year: 2010<br />coverage: 78<br />year: 2010<br />name: Mali","year: 2010<br />coverage: 67<br />year: 2010<br />name: Mauritania","year: 2010<br />coverage: 99<br />year: 2010<br />name: Mauritius","year: 2010<br />coverage: 98<br />year: 2010<br />name: Morocco","year: 2010<br />coverage: 82<br />year: 2010<br />name: Mozambique","year: 2010<br />coverage: 75<br />year: 2010<br />name: Namibia","year: 2010<br />coverage: 67<br />year: 2010<br />name: Niger","year: 2010<br />coverage: 56<br />year: 2010<br />name: Nigeria","year: 2010<br />coverage: 95<br />year: 2010<br />name: Rwanda","year: 2010<br />coverage: 92<br />year: 2010<br />name: Sao Tome and Principe","year: 2010<br />coverage: 81<br />year: 2010<br />name: Senegal","year: 2010<br />coverage: 82<br />year: 2010<br />name: Sierra Leone","year: 2010<br />coverage: 46<br />year: 2010<br />name: Somalia","year: 2010<br />coverage: 72<br />year: 2010<br />name: South Africa","year: 2010<br />coverage: 90<br />year: 2010<br />name: Sudan","year: 2010<br />coverage: 68<br />year: 2010<br />name: Togo","year: 2010<br />coverage: 97<br />year: 2010<br />name: Tunisia","year: 2010<br />coverage: 73<br />year: 2010<br />name: Uganda","year: 2010<br />coverage: 96<br />year: 2010<br />name: Zambia","year: 2010<br />coverage: 90<br />year: 2010<br />name: Zimbabwe"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,160,135,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2010","legendgroup":"2010","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[3.3396502856165169,2.6277452534064651,3.1195490207523107,2.7600714897736909,3.1974658252671362,2.861662538163364,3.1745351072400809,2.8957142299041152,3.0245718946680427,2.8707341756671667,2.6947468090802431,2.6038513392210008,2.6080272529274224,3.0457497425377369,2.8882392873987555,2.7350284626707433,3.2376278353855015,2.6068326111882927,2.9462693901732564,3.108999302610755,3.1719653852283956,2.8977738756686451],"y":[95.035963433608416,98.660736187733704,90.002540733478966,92.655211202427751,87.802618287131196,83.126422832906243,98.829515716060996,85.176846030913296,95.316320993006229,92.159117959439754,92.879650504142049,63.638024000078438,98.133285146020356,89.280943597666919,95.192543916776771,99.346169185079631,97.391523686051372,92.728103367798028,94.062127340026194,91.631923583894974,91.620755151472991,94.996129254810512],"text":["year: 2010<br />coverage: 95<br />year: 2010<br />name: Argentina","year: 2010<br />coverage: 99<br />year: 2010<br />name: Brazil","year: 2010<br />coverage: 90<br />year: 2010<br />name: Canada","year: 2010<br />coverage: 93<br />year: 2010<br />name: Chile","year: 2010<br />coverage: 88<br />year: 2010<br />name: Colombia","year: 2010<br />coverage: 83<br />year: 2010<br />name: Costa Rica","year: 2010<br />coverage: 99<br />year: 2010<br />name: Cuba","year: 2010<br />coverage: 85<br />year: 2010<br />name: Dominican Republic","year: 2010<br />coverage: 95<br />year: 2010<br />name: Ecuador","year: 2010<br />coverage: 92<br />year: 2010<br />name: El Salvador","year: 2010<br />coverage: 93<br />year: 2010<br />name: Guatemala","year: 2010<br />coverage: 64<br />year: 2010<br />name: Haiti","year: 2010<br />coverage: 98<br />year: 2010<br />name: Honduras","year: 2010<br />coverage: 89<br />year: 2010<br />name: Jamaica","year: 2010<br />coverage: 95<br />year: 2010<br />name: Mexico","year: 2010<br />coverage: 99<br />year: 2010<br />name: Nicaragua","year: 2010<br />coverage: 97<br />year: 2010<br />name: Panama","year: 2010<br />coverage: 93<br />year: 2010<br />name: Paraguay","year: 2010<br />coverage: 94<br />year: 2010<br />name: Peru","year: 2010<br />coverage: 92<br />year: 2010<br />name: Trinidad and Tobago","year: 2010<br />coverage: 92<br />year: 2010<br />name: United States","year: 2010<br />coverage: 95<br />year: 2010<br />name: Uruguay"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,160,135,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2010","legendgroup":"2010","showlegend":false,"xaxis":"x2","yaxis":"y","hoverinfo":"text","frame":null},{"x":[2.7981639798730611,3.0423294374719263,2.9282104991376401,3.1811799161136149,2.8685986094176767,3.2582478605210783,2.6374109387397766,2.9911980921402574,3.3685968000441791,2.9994328152388334,2.7642545089125634,3.1891211742535233,3.2358706656843426,3.0209898049011827,2.7346142239868643,3.3868051083758473,3.2298873167485,3.0779330942779781,2.8409381899982691,3.1950468398630618,3.1963552424684165,2.9817152362316848,2.6140091298148036,3.2781055130064489],"y":[62.147272231243548,99.174353458546108,87.76774387005716,90.328731418959791,99.343959287926552,81.781922964751715,78.217740145511925,74.998479477874938,96.147527561336759,94.042583760805428,97.814562222175297,98.082370411790905,79.861034649424255,95.14299178849906,96.844025628082449,88.147272482141858,86.386548051610589,99.345593800768256,56.805665120109914,86.829837660491464,98.101478155702353,95.005088817887014,99.276113031804556,98.267842081934219],"text":["year: 2010<br />coverage: 62<br />year: 2010<br />name: Afghanistan","year: 2010<br />coverage: 99<br />year: 2010<br />name: Bahrain","year: 2010<br />coverage: 88<br />year: 2010<br />name: Bangladesh","year: 2010<br />coverage: 90<br />year: 2010<br />name: Cambodia","year: 2010<br />coverage: 99<br />year: 2010<br />name: China","year: 2010<br />coverage: 82<br />year: 2010<br />name: India","year: 2010<br />coverage: 78<br />year: 2010<br />name: Indonesia","year: 2010<br />coverage: 75<br />year: 2010<br />name: Iraq","year: 2010<br />coverage: 96<br />year: 2010<br />name: Israel","year: 2010<br />coverage: 94<br />year: 2010<br />name: Japan","year: 2010<br />coverage: 98<br />year: 2010<br />name: Jordan","year: 2010<br />coverage: 98<br />year: 2010<br />name: Kuwait","year: 2010<br />coverage: 80<br />year: 2010<br />name: Lebanon","year: 2010<br />coverage: 95<br />year: 2010<br />name: Malaysia","year: 2010<br />coverage: 97<br />year: 2010<br />name: Mongolia","year: 2010<br />coverage: 88<br />year: 2010<br />name: Myanmar","year: 2010<br />coverage: 86<br />year: 2010<br />name: Nepal","year: 2010<br />coverage: 99<br />year: 2010<br />name: Oman","year: 2010<br />coverage: 57<br />year: 2010<br />name: Pakistan","year: 2010<br />coverage: 87<br />year: 2010<br />name: Philippines","year: 2010<br />coverage: 98<br />year: 2010<br />name: Saudi Arabia","year: 2010<br />coverage: 95<br />year: 2010<br />name: Singapore","year: 2010<br />coverage: 99<br />year: 2010<br />name: Sri Lanka","year: 2010<br />coverage: 98<br />year: 2010<br />name: Thailand"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,160,135,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2010","legendgroup":"2010","showlegend":false,"xaxis":"x3","yaxis":"y","hoverinfo":"text","frame":null},{"x":[2.874029565602541,3.3874096238985656,3.1244036812335252,2.9484050666913388,2.8391634276136757,2.7864312911406159,3.0341964328661559,2.9074978930875659,2.7881241859868169,3.2602755080908539,2.9377482645213604,3.1335638608783483,3.2895841568708422,3.0206138916313647,2.6412717239931225,3.0951406955718994,3.3088301258161663,3.0154963899403811,2.93247725982219,2.7753527646884324,3.0002528261393309,3.1648475540801884,2.6810307383537291,3.2004748256877065,2.7155921453610063,2.8189025511965156],"y":[99.302395031414932,80.146544854715472,94.798466903157532,91.392471741139886,96.828393772989514,95.786846588924533,84.99360809661448,98.129761750251049,88.848219987191257,97.230124533921483,99.228748341836038,98.787097596190875,92.673087967745957,89.60611705780029,91.322564507648352,90.101011738926175,93.124900661408901,98.178209702298048,96.39641102738679,94.624196698889136,95.242520511522883,95.264220242202285,94.892344852536922,97.345409257523713,91.652785705588755,89.110488363914186],"text":["year: 2010<br />coverage: 99<br />year: 2010<br />name: Albania","year: 2010<br />coverage: 80<br />year: 2010<br />name: Austria","year: 2010<br />coverage: 95<br />year: 2010<br />name: Belgium","year: 2010<br />coverage: 91<br />year: 2010<br />name: Bosnia and Herzegovina","year: 2010<br />coverage: 97<br />year: 2010<br />name: Bulgaria","year: 2010<br />coverage: 96<br />year: 2010<br />name: Croatia","year: 2010<br />coverage: 85<br />year: 2010<br />name: Denmark","year: 2010<br />coverage: 98<br />year: 2010<br />name: Finland","year: 2010<br />coverage: 89<br />year: 2010<br />name: France","year: 2010<br />coverage: 97<br />year: 2010<br />name: Germany","year: 2010<br />coverage: 99<br />year: 2010<br />name: Greece","year: 2010<br />coverage: 99<br />year: 2010<br />name: Hungary","year: 2010<br />coverage: 93<br />year: 2010<br />name: Iceland","year: 2010<br />coverage: 90<br />year: 2010<br />name: Ireland","year: 2010<br />coverage: 91<br />year: 2010<br />name: Italy","year: 2010<br />coverage: 90<br />year: 2010<br />name: Montenegro","year: 2010<br />coverage: 93<br />year: 2010<br />name: Norway","year: 2010<br />coverage: 98<br />year: 2010<br />name: Poland","year: 2010<br />coverage: 96<br />year: 2010<br />name: Portugal","year: 2010<br />coverage: 95<br />year: 2010<br />name: Romania","year: 2010<br />coverage: 95<br />year: 2010<br />name: Serbia","year: 2010<br />coverage: 95<br />year: 2010<br />name: Slovenia","year: 2010<br />coverage: 95<br />year: 2010<br />name: Spain","year: 2010<br />coverage: 97<br />year: 2010<br />name: Sweden","year: 2010<br />coverage: 92<br />year: 2010<br />name: Switzerland","year: 2010<br />coverage: 89<br />year: 2010<br />name: United Kingdom"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,160,135,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2010","legendgroup":"2010","showlegend":false,"xaxis":"x","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[2.9596442526206372,3.3371776940301059],"y":[94.022036708891392,90.621127711981529],"text":["year: 2010<br />coverage: 94<br />year: 2010<br />name: Australia","year: 2010<br />coverage: 91<br />year: 2010<br />name: New Zealand"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,160,135,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2010","legendgroup":"2010","showlegend":false,"xaxis":"x2","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[3.3614310685545208,3.3268559703603389,3.0285510741174222,3.1569606749340893,3.3355720607563852,3.3861373180523513,2.8381221579387783,3.1839214729145171,2.9112055504694583,3.2918178150430322,3.2782855864614246,2.6427030328661205,3.2944044770672916,3.1606897629797457,3.3444922870025038,3.3145960407331585,2.6189514065161346,2.6408633787184952,2.657583348825574,3.355048928782344,3.2682491498067976,2.9954144565388559,2.6429137723520397,3.1423006208613513,2.8849253799766301,3.0217050734907387,3.3868050195276735,2.6778405103832483,2.6611978041008113,3.0692612672224642,2.9188501026481388,2.7694325607270001,2.9902315309271215,2.7133248329162596,2.6857952639460563,3.1606486722826959,3.2922183100134133,3.1231583667919041,3.3878509355708957,2.902384435944259,3.0413623655214908,2.9893661696463822,2.8101558385416867,3.2357918193563817,2.7607368977740405,3.1206929823383689,2.6699455574154856,3.3000314872711898,2.6852102655917407,2.7143114758655429,3.2707736531272529,2.9344100050628183,2.6500188717618585,3.0946987912058832,3.2007937896996737,3.3900978093966843,2.8384452601894736,2.8387082377448678,2.8927956111729145,3.2035299699753521,2.6615659072995186,2.9144811240956185,3.1438188627362251,3.1870364753529428,3.3180777583271266,2.604542039334774,3.3773792564868925,3.3889130325987935,3.0591926703229548,2.6194692242890598,2.6082367930561303,3.0920351153239607,2.896972956135869,3.0466311428695918],"y":[98.74428290072828,97.702836943045256,97.363605787605053,89.375875370390716,93.818297560326755,85.230467418953779,99.219986247271294,98.21326343119145,95.382383031025526,88.259981020912534,94.140131948888296,97.082722012884915,75.052992085926235,98.680893235094842,87.027895722165709,98.124569936282938,99.003832063078875,65.98736043386161,98.825506479106849,95.178970747999841,93.851134275645023,95.733369665034118,93.886260391399261,94.804314627312124,95.006450820341712,99.260302322171626,98.808706146292394,89.347178805060679,99.385892974585289,63.845403200760487,94.76013312079013,95.661472415924067,96.207046606205409,97.092087787762281,72.991826161555949,96.865617009624842,79.938319128751758,92.844383964873856,98.699359790422022,95.814761229790747,99.013498948886991,98.154167936369774,38.974805892445147,62.660263595916334,98.797243705019355,98.215359607152635,96.746565036475658,97.765117704495793,98.747177158109849,94.922476668655875,98.815026716329157,56.35857280008495,88.094943149760368,99.246076364815238,97.789024528302249,74.343588420748716,null,98.24871170707047,86.807741758972412,81.621610212884846,93.710020574927327,65.787177504785362,99.185325579531494,96.762972030043599,99.280200345441699,85.300550947152075,56.39156327638775,94.098837820067999,91.869334594719106,97.827386842481786,69.962458319216964,79.188472378067672,97.70675828978419,67.848645590990785],"text":["year: 2010<br />coverage: 99<br />year: 2010<br />name: Andorra","year: 2010<br />coverage: 98<br />year: 2010<br />name: Antigua and Barbuda","year: 2010<br />coverage: 97<br />year: 2010<br />name: Armenia","year: 2010<br />coverage: 89<br />year: 2010<br />name: Azerbaijan","year: 2010<br />coverage: 94<br />year: 2010<br />name: Bahamas","year: 2010<br />coverage: 85<br />year: 2010<br />name: Barbados","year: 2010<br />coverage: 99<br />year: 2010<br />name: Belarus","year: 2010<br />coverage: 98<br />year: 2010<br />name: Belize","year: 2010<br />coverage: 95<br />year: 2010<br />name: Bhutan","year: 2010<br />coverage: 88<br />year: 2010<br />name: Bolivia (Plurinational State of)","year: 2010<br />coverage: 94<br />year: 2010<br />name: Brunei Darussalam","year: 2010<br />coverage: 97<br />year: 2010<br />name: Cabo Verde","year: 2010<br />coverage: 75<br />year: 2010<br />name: Congo","year: 2010<br />coverage: 99<br />year: 2010<br />name: Cook Islands","year: 2010<br />coverage: 87<br />year: 2010<br />name: Cyprus","year: 2010<br />coverage: 98<br />year: 2010<br />name: Czechia","year: 2010<br />coverage: 99<br />year: 2010<br />name: Democratic People's Republic of Korea","year: 2010<br />coverage: 66<br />year: 2010<br />name: Democratic Republic of the Congo","year: 2010<br />coverage: 99<br />year: 2010<br />name: Dominica","year: 2010<br />coverage: 95<br />year: 2010<br />name: Estonia","year: 2010<br />coverage: 94<br />year: 2010<br />name: Eswatini","year: 2010<br />coverage: 96<br />year: 2010<br />name: Fiji","year: 2010<br />coverage: 94<br />year: 2010<br />name: Georgia","year: 2010<br />coverage: 95<br />year: 2010<br />name: Grenada","year: 2010<br />coverage: 95<br />year: 2010<br />name: Guyana","year: 2010<br />coverage: 99<br />year: 2010<br />name: Iran (Islamic Republic of)","year: 2010<br />coverage: 99<br />year: 2010<br />name: Kazakhstan","year: 2010<br />coverage: 89<br />year: 2010<br />name: Kiribati","year: 2010<br />coverage: 99<br />year: 2010<br />name: Kyrgyzstan","year: 2010<br />coverage: 64<br />year: 2010<br />name: Lao People's Democratic Republic","year: 2010<br />coverage: 95<br />year: 2010<br />name: Latvia","year: 2010<br />coverage: 96<br />year: 2010<br />name: Lithuania","year: 2010<br />coverage: 96<br />year: 2010<br />name: Luxembourg","year: 2010<br />coverage: 97<br />year: 2010<br />name: Maldives","year: 2010<br />coverage: 73<br />year: 2010<br />name: Malta","year: 2010<br />coverage: 97<br />year: 2010<br />name: Marshall Islands","year: 2010<br />coverage: 80<br />year: 2010<br />name: Micronesia (Federated States of)","year: 2010<br />coverage: 93<br />year: 2010<br />name: Monaco","year: 2010<br />coverage: 99<br />year: 2010<br />name: Nauru","year: 2010<br />coverage: 96<br />year: 2010<br />name: Netherlands (Kingdom of the)","year: 2010<br />coverage: 99<br />year: 2010<br />name: Niue","year: 2010<br />coverage: 98<br />year: 2010<br />name: North Macedonia","year: 2010<br />coverage: 39<br />year: 2010<br />name: Palau","year: 2010<br />coverage: 63<br />year: 2010<br />name: Papua New Guinea","year: 2010<br />coverage: 99<br />year: 2010<br />name: Qatar","year: 2010<br />coverage: 98<br />year: 2010<br />name: Republic of Korea","year: 2010<br />coverage: 97<br />year: 2010<br />name: Republic of Moldova","year: 2010<br />coverage: 98<br />year: 2010<br />name: Russian Federation","year: 2010<br />coverage: 99<br />year: 2010<br />name: Saint Kitts and Nevis","year: 2010<br />coverage: 95<br />year: 2010<br />name: Saint Lucia","year: 2010<br />coverage: 99<br />year: 2010<br />name: Saint Vincent and the Grenadines","year: 2010<br />coverage: 56<br />year: 2010<br />name: Samoa","year: 2010<br />coverage: 88<br />year: 2010<br />name: San Marino","year: 2010<br />coverage: 99<br />year: 2010<br />name: Seychelles","year: 2010<br />coverage: 98<br />year: 2010<br />name: Slovakia","year: 2010<br />coverage: 74<br />year: 2010<br />name: Solomon Islands","year: 2010<br />coverage: NA<br />year: 2010<br />name: South Sudan","year: 2010<br />coverage: 98<br />year: 2010<br />name: State of Palestine","year: 2010<br />coverage: 87<br />year: 2010<br />name: Suriname","year: 2010<br />coverage: 82<br />year: 2010<br />name: Syrian Arab Republic","year: 2010<br />coverage: 94<br />year: 2010<br />name: Tajikistan","year: 2010<br />coverage: 66<br />year: 2010<br />name: Timor-Leste","year: 2010<br />coverage: 99<br />year: 2010<br />name: Tonga","year: 2010<br />coverage: 97<br />year: 2010<br />name: Turkiye","year: 2010<br />coverage: 99<br />year: 2010<br />name: Turkmenistan","year: 2010<br />coverage: 85<br />year: 2010<br />name: Tuvalu","year: 2010<br />coverage: 56<br />year: 2010<br />name: Ukraine","year: 2010<br />coverage: 94<br />year: 2010<br />name: United Arab Emirates","year: 2010<br />coverage: 92<br />year: 2010<br />name: United Republic of Tanzania","year: 2010<br />coverage: 98<br />year: 2010<br />name: Uzbekistan","year: 2010<br />coverage: 70<br />year: 2010<br />name: Vanuatu","year: 2010<br />coverage: 79<br />year: 2010<br />name: Venezuela (Bolivarian Republic of)","year: 2010<br />coverage: 98<br />year: 2010<br />name: Viet Nam","year: 2010<br />coverage: 68<br />year: 2010<br />name: Yemen"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(0,160,135,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2010","legendgroup":"2010","showlegend":false,"xaxis":"x3","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[4.302684985101223,3.9332546608522536,4.2666432673111556,3.8509321130812166,3.8311630558222531,3.8735054597258567,4.3375836094841365,3.9840943653136494,4.2922527290880677,3.7319795893505217,3.9121589211747052,4.0312911776825784,4.0917605955153702,3.8366282716393472,3.888103136792779,3.9399897124618293,4.3055292893201109,4.0490972280502318,4.0387540172785519,4.2232538826763628,3.7190514322370292,3.9141023974865674,4.2331554107367992,4.2397179521620272,4.0603004766628148,4.2848369812592866,3.8469639234244823,3.828039998561144,4.0944362984970208,3.7305890256538987,4.2682683188468218,4.0934194719418882,4.1341493485495446,3.8122147187590598,3.6015664072707296,3.6593195335939526,4.3194014454260472,4.2187892666086553,3.8377365527674554,4.304688565805554,3.8450145766139032,3.8086206294596194,4.2095656204968694,3.9913797548040746,3.6672806449234487,4.0068604093044993,4.3904848419129845],"y":[79.937856837734586,43.66553263626993,65.374764653295273,86.951676648482675,88.266956474073226,89.861760739795869,61.730224843695758,40.953053768910465,47.31880889311433,90.213612997345621,66.022810070961711,61.818864546716213,94.208978995867071,52.871673024073246,92.678086756542328,60.218457160703835,52.669806627742943,81.855169566534457,87.836803035996851,46.786604782566428,71.632183782570067,88.26981016360223,90.003030107729131,61.181629907339811,72.923692750930783,55.192338172532615,89.775970499962568,62.049529532529412,69.922937629371887,88.705111266858879,99.151952064037317,81.099565510079259,89.827619100548333,79.394370665587488,60.090933644399044,93.814526215754455,86.164133081957701,87.773978511989114,86.947652160935107,45.77529714591801,83.909735912829632,85.73197683077305,69.392577081732455,97.930625826679176,88.961352788843215,96.310542640648777,84.820625981129709],"text":["year: 2020<br />coverage: 80<br />year: 2020<br />name: Algeria","year: 2020<br />coverage: 44<br />year: 2020<br />name: Angola","year: 2020<br />coverage: 65<br />year: 2020<br />name: Benin","year: 2020<br />coverage: 87<br />year: 2020<br />name: Botswana","year: 2020<br />coverage: 88<br />year: 2020<br />name: Burkina Faso","year: 2020<br />coverage: 90<br />year: 2020<br />name: Burundi","year: 2020<br />coverage: 62<br />year: 2020<br />name: Cameroon","year: 2020<br />coverage: 41<br />year: 2020<br />name: Central African Republic","year: 2020<br />coverage: 47<br />year: 2020<br />name: Chad","year: 2020<br />coverage: 90<br />year: 2020<br />name: Comoros","year: 2020<br />coverage: 66<br />year: 2020<br />name: Cote d'Ivoire","year: 2020<br />coverage: 62<br />year: 2020<br />name: Djibouti","year: 2020<br />coverage: 94<br />year: 2020<br />name: Egypt","year: 2020<br />coverage: 53<br />year: 2020<br />name: Equatorial Guinea","year: 2020<br />coverage: 93<br />year: 2020<br />name: Eritrea","year: 2020<br />coverage: 60<br />year: 2020<br />name: Ethiopia","year: 2020<br />coverage: 53<br />year: 2020<br />name: Gabon","year: 2020<br />coverage: 82<br />year: 2020<br />name: Gambia","year: 2020<br />coverage: 88<br />year: 2020<br />name: Ghana","year: 2020<br />coverage: 47<br />year: 2020<br />name: Guinea","year: 2020<br />coverage: 72<br />year: 2020<br />name: Guinea-Bissau","year: 2020<br />coverage: 88<br />year: 2020<br />name: Kenya","year: 2020<br />coverage: 90<br />year: 2020<br />name: Lesotho","year: 2020<br />coverage: 61<br />year: 2020<br />name: Liberia","year: 2020<br />coverage: 73<br />year: 2020<br />name: Libya","year: 2020<br />coverage: 55<br />year: 2020<br />name: Madagascar","year: 2020<br />coverage: 90<br />year: 2020<br />name: Malawi","year: 2020<br />coverage: 62<br />year: 2020<br />name: Mali","year: 2020<br />coverage: 70<br />year: 2020<br />name: Mauritania","year: 2020<br />coverage: 89<br />year: 2020<br />name: Mauritius","year: 2020<br />coverage: 99<br />year: 2020<br />name: Morocco","year: 2020<br />coverage: 81<br />year: 2020<br />name: Mozambique","year: 2020<br />coverage: 90<br />year: 2020<br />name: Namibia","year: 2020<br />coverage: 79<br />year: 2020<br />name: Niger","year: 2020<br />coverage: 60<br />year: 2020<br />name: Nigeria","year: 2020<br />coverage: 94<br />year: 2020<br />name: Rwanda","year: 2020<br />coverage: 86<br />year: 2020<br />name: Sao Tome and Principe","year: 2020<br />coverage: 88<br />year: 2020<br />name: Senegal","year: 2020<br />coverage: 87<br />year: 2020<br />name: Sierra Leone","year: 2020<br />coverage: 46<br />year: 2020<br />name: Somalia","year: 2020<br />coverage: 84<br />year: 2020<br />name: South Africa","year: 2020<br />coverage: 86<br />year: 2020<br />name: Sudan","year: 2020<br />coverage: 69<br />year: 2020<br />name: Togo","year: 2020<br />coverage: 98<br />year: 2020<br />name: Tunisia","year: 2020<br />coverage: 89<br />year: 2020<br />name: Uganda","year: 2020<br />coverage: 96<br />year: 2020<br />name: Zambia","year: 2020<br />coverage: 85<br />year: 2020<br />name: Zimbabwe"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(60,84,136,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2020","legendgroup":"2020","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[4.0166158877313141,4.0171419041231271,4.1923875626176592,4.0671882491558788,3.6475842535495757,4.2688384125009176,3.8396128294989467,3.6290371976792812,3.9244504515081644,3.9525462990626692,3.8157248865813016,4.089164289273322,3.7739991692826154,4.0116713896393774,4.2607295079156753,4.2474973820149895,3.9415546376258135,4.3465378167107698,4.0524607546627518,3.6487486943602563,4.3366998571902515,4.1887508068233732],"y":[76.863950101844964,79.250600251369178,90.061706026270983,91.319652270339432,90.174178860336539,94.773282759264106,97.618975608237093,82.143051636032766,80.753278109803801,73.711347037926316,87.658325783535844,65.253507138788706,82.050192757323387,92.878281700797373,91.780402679182586,97.031989414617414,79.632762683741745,80.029353704303503,77.213351001590496,90.964318190887568,90.793061075173313,95.352799522131676],"text":["year: 2020<br />coverage: 77<br />year: 2020<br />name: Argentina","year: 2020<br />coverage: 79<br />year: 2020<br />name: Brazil","year: 2020<br />coverage: 90<br />year: 2020<br />name: Canada","year: 2020<br />coverage: 91<br />year: 2020<br />name: Chile","year: 2020<br />coverage: 90<br />year: 2020<br />name: Colombia","year: 2020<br />coverage: 95<br />year: 2020<br />name: Costa Rica","year: 2020<br />coverage: 98<br />year: 2020<br />name: Cuba","year: 2020<br />coverage: 82<br />year: 2020<br />name: Dominican Republic","year: 2020<br />coverage: 81<br />year: 2020<br />name: Ecuador","year: 2020<br />coverage: 74<br />year: 2020<br />name: El Salvador","year: 2020<br />coverage: 88<br />year: 2020<br />name: Guatemala","year: 2020<br />coverage: 65<br />year: 2020<br />name: Haiti","year: 2020<br />coverage: 82<br />year: 2020<br />name: Honduras","year: 2020<br />coverage: 93<br />year: 2020<br />name: Jamaica","year: 2020<br />coverage: 92<br />year: 2020<br />name: Mexico","year: 2020<br />coverage: 97<br />year: 2020<br />name: Nicaragua","year: 2020<br />coverage: 80<br />year: 2020<br />name: Panama","year: 2020<br />coverage: 80<br />year: 2020<br />name: Paraguay","year: 2020<br />coverage: 77<br />year: 2020<br />name: Peru","year: 2020<br />coverage: 91<br />year: 2020<br />name: Trinidad and Tobago","year: 2020<br />coverage: 91<br />year: 2020<br />name: United States","year: 2020<br />coverage: 95<br />year: 2020<br />name: Uruguay"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(60,84,136,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2020","legendgroup":"2020","showlegend":false,"xaxis":"x2","yaxis":"y","hoverinfo":"text","frame":null},{"x":[4.1005101215094326,4.0608567807823421,3.667478207871318,3.7563704352825882,4.1593753509223461,4.0564899707213042,4.3030780462548135,4.050892521999776,3.709505091048777,4.0299965308979155,4.2121547326445583,4.0580771729350094,4.3153501102700833,4.016130507551134,3.6848875394091012,4.0472019495442506,3.8711648976430295,3.6846696358174085,4.1576033860445021,4.0460044289007779,4.3034464539960027,3.9895533537492156,3.8098935356363652,4.0560963964089751],"y":[66.33499090429396,99.051566490903497,96.781252185627821,83.058468257077038,98.712043353542683,89.088493880629542,76.115059237554675,76.130840944126248,99.236804719828072,97.835871847160163,76.39306514412165,94.94558892138302,74.162427569739521,95.180020252428946,96.753106207400563,90.743705599568784,87.179801101982591,98.840340249985459,82.746954901143909,71.897488101385534,95.82024783715606,96.696437285281718,96.376710974797604,95.909201316907996],"text":["year: 2020<br />coverage: 66<br />year: 2020<br />name: Afghanistan","year: 2020<br />coverage: 99<br />year: 2020<br />name: Bahrain","year: 2020<br />coverage: 97<br />year: 2020<br />name: Bangladesh","year: 2020<br />coverage: 83<br />year: 2020<br />name: Cambodia","year: 2020<br />coverage: 99<br />year: 2020<br />name: China","year: 2020<br />coverage: 89<br />year: 2020<br />name: India","year: 2020<br />coverage: 76<br />year: 2020<br />name: Indonesia","year: 2020<br />coverage: 76<br />year: 2020<br />name: Iraq","year: 2020<br />coverage: 99<br />year: 2020<br />name: Israel","year: 2020<br />coverage: 98<br />year: 2020<br />name: Japan","year: 2020<br />coverage: 76<br />year: 2020<br />name: Jordan","year: 2020<br />coverage: 95<br />year: 2020<br />name: Kuwait","year: 2020<br />coverage: 74<br />year: 2020<br />name: Lebanon","year: 2020<br />coverage: 95<br />year: 2020<br />name: Malaysia","year: 2020<br />coverage: 97<br />year: 2020<br />name: Mongolia","year: 2020<br />coverage: 91<br />year: 2020<br />name: Myanmar","year: 2020<br />coverage: 87<br />year: 2020<br />name: Nepal","year: 2020<br />coverage: 99<br />year: 2020<br />name: Oman","year: 2020<br />coverage: 83<br />year: 2020<br />name: Pakistan","year: 2020<br />coverage: 72<br />year: 2020<br />name: Philippines","year: 2020<br />coverage: 96<br />year: 2020<br />name: Saudi Arabia","year: 2020<br />coverage: 97<br />year: 2020<br />name: Singapore","year: 2020<br />coverage: 96<br />year: 2020<br />name: Sri Lanka","year: 2020<br />coverage: 96<br />year: 2020<br />name: Thailand"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(60,84,136,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2020","legendgroup":"2020","showlegend":false,"xaxis":"x3","yaxis":"y","hoverinfo":"text","frame":null},{"x":[4.3143833372741938,4.3011710345745087,3.9833126347512007,3.6051080590113997,3.7040887720882893,3.8262317465618252,4.1922175502404571,4.1795657647773625,3.8556071680039166,4.2482410952448841,4.1260953927412629,3.8603797364979981,3.9120508536696432,4.0722070226445792,4.0621461868286133,4.2471901398152117,3.975241371616721,4.1574752312153578,4.1203613672405481,3.8178464513272048,3.8259398352354763,3.9237061763182282,4.3417518138885498,4.3173595432192089,4.1764873990789058,4.1281242860481147],"y":[90.78450296744704,95.346621110662824,96.137619350664323,60.701971654593947,87.900741044245663,91.084816767089066,94.073595460318032,94.826058085076511,93.931293060630566,96.617002042569226,97.25386920552701,98.690259357728067,93.050866384990513,91.722302870266134,92.049270905926818,24.208311509341002,97.01751265432685,80.313453662581736,98.823121914453807,86.660291185043747,77.628667373210192,93.825295907445252,96.386442115902895,96.845670014992351,96.614722601883116,90.621092171594498],"text":["year: 2020<br />coverage: 91<br />year: 2020<br />name: Albania","year: 2020<br />coverage: 95<br />year: 2020<br />name: Austria","year: 2020<br />coverage: 96<br />year: 2020<br />name: Belgium","year: 2020<br />coverage: 61<br />year: 2020<br />name: Bosnia and Herzegovina","year: 2020<br />coverage: 88<br />year: 2020<br />name: Bulgaria","year: 2020<br />coverage: 91<br />year: 2020<br />name: Croatia","year: 2020<br />coverage: 94<br />year: 2020<br />name: Denmark","year: 2020<br />coverage: 95<br />year: 2020<br />name: Finland","year: 2020<br />coverage: 94<br />year: 2020<br />name: France","year: 2020<br />coverage: 97<br />year: 2020<br />name: Germany","year: 2020<br />coverage: 97<br />year: 2020<br />name: Greece","year: 2020<br />coverage: 99<br />year: 2020<br />name: Hungary","year: 2020<br />coverage: 93<br />year: 2020<br />name: Iceland","year: 2020<br />coverage: 92<br />year: 2020<br />name: Ireland","year: 2020<br />coverage: 92<br />year: 2020<br />name: Italy","year: 2020<br />coverage: 24<br />year: 2020<br />name: Montenegro","year: 2020<br />coverage: 97<br />year: 2020<br />name: Norway","year: 2020<br />coverage: 80<br />year: 2020<br />name: Poland","year: 2020<br />coverage: 99<br />year: 2020<br />name: Portugal","year: 2020<br />coverage: 87<br />year: 2020<br />name: Romania","year: 2020<br />coverage: 78<br />year: 2020<br />name: Serbia","year: 2020<br />coverage: 94<br />year: 2020<br />name: Slovenia","year: 2020<br />coverage: 96<br />year: 2020<br />name: Spain","year: 2020<br />coverage: 97<br />year: 2020<br />name: Sweden","year: 2020<br />coverage: 97<br />year: 2020<br />name: Switzerland","year: 2020<br />coverage: 91<br />year: 2020<br />name: United Kingdom"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(60,84,136,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2020","legendgroup":"2020","showlegend":false,"xaxis":"x","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[3.615140165388584,3.7233053103089331],"y":[93.131111027300364,91.235436680726707],"text":["year: 2020<br />coverage: 93<br />year: 2020<br />name: Australia","year: 2020<br />coverage: 91<br />year: 2020<br />name: New Zealand"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(60,84,136,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2020","legendgroup":"2020","showlegend":false,"xaxis":"x2","yaxis":"y2","hoverinfo":"text","frame":null},{"x":[4.1658915743231777,3.6257447652518748,3.6279799027368425,4.2085135940462353,4.263950478844345,3.885725950449705,3.7149620719254015,4.3187484947964547,4.3288995757699009,4.3886936360970141,3.6536310259252787,3.9641382876783609,4.031953705847263,3.7288760533556342,4.1876981269568203,4.0373999275267121,3.6780153239145874,4.1465788876637815,3.7536652406677602,3.7580843698233366,4.1450391527265307,3.6550159579142929,3.8996700808405875,3.8917578702792524,3.9059538397938014,3.9965109508484602,4.0242847517132763,4.1246349506080149,4.2810131832957268,3.893343492411077,4.3594463333487514,3.7123862229287625,3.903687826730311,4.1261200705543164,3.60625801384449,3.9344607234001159,4.064896276593208,4.0145561035722492,3.9020867656916378,3.9579819958657025,3.6031821718439461,4.0175922796130177,4.0120233576744795,4.166111281886697,3.8728329146280887,3.6067920334637167,4.0844298018142577,4.3197284450754525,4.2474486671388147,4.1072703659534451,3.6924800388514996,3.8646720703691244,4.32784848343581,3.984819691814482,3.7817355783656241,3.6166747882962227,3.6376132162287833,3.8097508648410439,4.138705222122371,4.2810493631288411,3.7592491706833244,3.9893461920320989,3.7377366403117778,3.6547954076901079,3.902953233011067,4.3862110877409579,4.1902916267514225,3.7854520501568913,4.3812071448192,3.6766435995697977,4.1472276149317624,4.0181342801079154,3.9608944106847046,3.6291648598387836],"y":[98.190608095377684,88.716180737875405,93.644707056134934,81.776588212139899,86.690881711244586,89.329642424732441,97.189439000003034,81.868257399648428,92.640882402844724,74.126211405545476,99.12166290674358,94.811396377347407,68.06369963940233,86.960760388150817,85.843413889780635,93.852770595066247,99.096639300324028,62.135326859913768,91.876459538750353,91.1112218560651,76.321702648326749,96.262161249481139,90.901593739353117,82.810865702107549,97.606466650031507,99.021558872982865,92.763195317611093,82.28032462596893,92.276823912188405,79.356249655596912,98.984439144469803,89.600923865847292,98.6234812732786,97.970471413806081,95.126832549832756,88.952032490074629,78.948037095181647,87.829566940292722,97.999668681062758,93.733709768019622,98.686759538389737,62.683112473972145,92.990006775036449,47.179302603192625,89.989724921435112,98.229669683985406,84.258045327290887,97.116567385569212,94.934095968864852,88.89400099013001,98.737796396575874,65.750838184170419,89.962184154987341,96.815941979363558,96.045031934976578,80.857701745815575,69.223694441840053,99.280676740221679,45.240408607944843,59.240462820790711,97.807438387349251,78.859154882654551,99.134093566797674,95.193627928383648,97.814552610553804,92.602283194102341,84.715816056542096,99.18647141605615,83.737980909831819,98.810378983989352,78.107868200913074,76.332903877086935,96.645319748111064,67.743258876353508],"text":["year: 2020<br />coverage: 98<br />year: 2020<br />name: Andorra","year: 2020<br />coverage: 89<br />year: 2020<br />name: Antigua and Barbuda","year: 2020<br />coverage: 94<br />year: 2020<br />name: Armenia","year: 2020<br />coverage: 82<br />year: 2020<br />name: Azerbaijan","year: 2020<br />coverage: 87<br />year: 2020<br />name: Bahamas","year: 2020<br />coverage: 89<br />year: 2020<br />name: Barbados","year: 2020<br />coverage: 97<br />year: 2020<br />name: Belarus","year: 2020<br />coverage: 82<br />year: 2020<br />name: Belize","year: 2020<br />coverage: 93<br />year: 2020<br />name: Bhutan","year: 2020<br />coverage: 74<br />year: 2020<br />name: Bolivia (Plurinational State of)","year: 2020<br />coverage: 99<br />year: 2020<br />name: Brunei Darussalam","year: 2020<br />coverage: 95<br />year: 2020<br />name: Cabo Verde","year: 2020<br />coverage: 68<br />year: 2020<br />name: Congo","year: 2020<br />coverage: 87<br />year: 2020<br />name: Cook Islands","year: 2020<br />coverage: 86<br />year: 2020<br />name: Cyprus","year: 2020<br />coverage: 94<br />year: 2020<br />name: Czechia","year: 2020<br />coverage: 99<br />year: 2020<br />name: Democratic People's Republic of Korea","year: 2020<br />coverage: 62<br />year: 2020<br />name: Democratic Republic of the Congo","year: 2020<br />coverage: 92<br />year: 2020<br />name: Dominica","year: 2020<br />coverage: 91<br />year: 2020<br />name: Estonia","year: 2020<br />coverage: 76<br />year: 2020<br />name: Eswatini","year: 2020<br />coverage: 96<br />year: 2020<br />name: Fiji","year: 2020<br />coverage: 91<br />year: 2020<br />name: Georgia","year: 2020<br />coverage: 83<br />year: 2020<br />name: Grenada","year: 2020<br />coverage: 98<br />year: 2020<br />name: Guyana","year: 2020<br />coverage: 99<br />year: 2020<br />name: Iran (Islamic Republic of)","year: 2020<br />coverage: 93<br />year: 2020<br />name: Kazakhstan","year: 2020<br />coverage: 82<br />year: 2020<br />name: Kiribati","year: 2020<br />coverage: 92<br />year: 2020<br />name: Kyrgyzstan","year: 2020<br />coverage: 79<br />year: 2020<br />name: Lao People's Democratic Republic","year: 2020<br />coverage: 99<br />year: 2020<br />name: Latvia","year: 2020<br />coverage: 90<br />year: 2020<br />name: Lithuania","year: 2020<br />coverage: 99<br />year: 2020<br />name: Luxembourg","year: 2020<br />coverage: 98<br />year: 2020<br />name: Maldives","year: 2020<br />coverage: 95<br />year: 2020<br />name: Malta","year: 2020<br />coverage: 89<br />year: 2020<br />name: Marshall Islands","year: 2020<br />coverage: 79<br />year: 2020<br />name: Micronesia (Federated States of)","year: 2020<br />coverage: 88<br />year: 2020<br />name: Monaco","year: 2020<br />coverage: 98<br />year: 2020<br />name: Nauru","year: 2020<br />coverage: 94<br />year: 2020<br />name: Netherlands (Kingdom of the)","year: 2020<br />coverage: 99<br />year: 2020<br />name: Niue","year: 2020<br />coverage: 63<br />year: 2020<br />name: North Macedonia","year: 2020<br />coverage: 93<br />year: 2020<br />name: Palau","year: 2020<br />coverage: 47<br />year: 2020<br />name: Papua New Guinea","year: 2020<br />coverage: 90<br />year: 2020<br />name: Qatar","year: 2020<br />coverage: 98<br />year: 2020<br />name: Republic of Korea","year: 2020<br />coverage: 84<br />year: 2020<br />name: Republic of Moldova","year: 2020<br />coverage: 97<br />year: 2020<br />name: Russian Federation","year: 2020<br />coverage: 95<br />year: 2020<br />name: Saint Kitts and Nevis","year: 2020<br />coverage: 89<br />year: 2020<br />name: Saint Lucia","year: 2020<br />coverage: 99<br />year: 2020<br />name: Saint Vincent and the Grenadines","year: 2020<br />coverage: 66<br />year: 2020<br />name: Samoa","year: 2020<br />coverage: 90<br />year: 2020<br />name: San Marino","year: 2020<br />coverage: 97<br />year: 2020<br />name: Seychelles","year: 2020<br />coverage: 96<br />year: 2020<br />name: Slovakia","year: 2020<br />coverage: 81<br />year: 2020<br />name: Solomon Islands","year: 2020<br />coverage: 69<br />year: 2020<br />name: South Sudan","year: 2020<br />coverage: 99<br />year: 2020<br />name: State of Palestine","year: 2020<br />coverage: 45<br />year: 2020<br />name: Suriname","year: 2020<br />coverage: 59<br />year: 2020<br />name: Syrian Arab Republic","year: 2020<br />coverage: 98<br />year: 2020<br />name: Tajikistan","year: 2020<br />coverage: 79<br />year: 2020<br />name: Timor-Leste","year: 2020<br />coverage: 99<br />year: 2020<br />name: Tonga","year: 2020<br />coverage: 95<br />year: 2020<br />name: Turkiye","year: 2020<br />coverage: 98<br />year: 2020<br />name: Turkmenistan","year: 2020<br />coverage: 93<br />year: 2020<br />name: Tuvalu","year: 2020<br />coverage: 85<br />year: 2020<br />name: Ukraine","year: 2020<br />coverage: 99<br />year: 2020<br />name: United Arab Emirates","year: 2020<br />coverage: 84<br />year: 2020<br />name: United Republic of Tanzania","year: 2020<br />coverage: 99<br />year: 2020<br />name: Uzbekistan","year: 2020<br />coverage: 78<br />year: 2020<br />name: Vanuatu","year: 2020<br />coverage: 76<br />year: 2020<br />name: Venezuela (Bolivarian Republic of)","year: 2020<br />coverage: 97<br />year: 2020<br />name: Viet Nam","year: 2020<br />coverage: 68<br />year: 2020<br />name: Yemen"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(60,84,136,1)","opacity":0.20000000000000001,"size":5.6692913385826778,"symbol":"circle","line":{"width":1.8897637795275593,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"2020","legendgroup":"2020","showlegend":false,"xaxis":"x3","yaxis":"y2","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":37.917808219178085,"r":7.3059360730593621,"b":40.182648401826491,"l":43.105022831050235},"font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xaxis":{"domain":[0,0.32517938682322239],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,4.5999999999999996],"tickmode":"array","ticktext":["1990","2000","2010","2020"],"tickvals":[1,2,3,4],"categoryorder":"array","categoryarray":["1990","2000","2010","2020"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.6529680365296811,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y2","title":"","hoverformat":".2f"},"annotations":[{"text":"year","x":0.5,"y":0,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"top","annotationType":"axis","yshift":-21.917808219178088},{"text":"coverage","x":0,"y":0.5,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724},"xref":"paper","yref":"paper","textangle":-90,"xanchor":"right","yanchor":"center","annotationType":"axis","xshift":-27.762557077625573},{"text":"Africa","x":0.1625896934116112,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.68949771689498},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Americas","x":0.5,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.68949771689498},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Asia","x":0.83741030658838878,"y":1,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.68949771689498},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Europe","x":0.1625896934116112,"y":0.47031963470319632,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.68949771689498},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Oceania","x":0.5,"y":0.47031963470319632,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.68949771689498},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"},{"text":"Other","x":0.83741030658838878,"y":0.47031963470319632,"showarrow":false,"ax":0,"ay":0,"font":{"color":"rgba(26,26,26,1)","family":"","size":11.68949771689498},"xref":"paper","yref":"paper","textangle":-0,"xanchor":"center","yanchor":"bottom"}],"yaxis":{"domain":[0.52968036529680362,1],"automargin":true,"type":"linear","autorange":false,"range":[3.0252013336308297,103.97449733844026],"tickmode":"array","ticktext":["25","50","75","100"],"tickvals":[25,50,75,100],"categoryorder":"array","categoryarray":["25","50","75","100"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.6529680365296811,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":"","hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":0.32517938682322239,"y0":0.52968036529680362,"y1":1},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":0.32517938682322239,"y0":0,"y1":23.37899543378996,"yanchor":1,"ysizemode":"pixel"},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.34148727984344424,"x1":0.65851272015655571,"y0":0.52968036529680362,"y1":1},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.34148727984344424,"x1":0.65851272015655571,"y0":0,"y1":23.37899543378996,"yanchor":1,"ysizemode":"pixel"},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.67482061317677755,"x1":1,"y0":0.52968036529680362,"y1":1},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.67482061317677755,"x1":1,"y0":0,"y1":23.37899543378996,"yanchor":1,"ysizemode":"pixel"},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":0.32517938682322239,"y0":0,"y1":0.47031963470319632},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":0.32517938682322239,"y0":0,"y1":23.37899543378996,"yanchor":0.47031963470319632,"ysizemode":"pixel"},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.34148727984344424,"x1":0.65851272015655571,"y0":0,"y1":0.47031963470319632},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.34148727984344424,"x1":0.65851272015655571,"y0":0,"y1":23.37899543378996,"yanchor":0.47031963470319632,"ysizemode":"pixel"},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.67482061317677755,"x1":1,"y0":0,"y1":0.47031963470319632},{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0.67482061317677755,"x1":1,"y0":0,"y1":23.37899543378996,"yanchor":0.47031963470319632,"ysizemode":"pixel"}],"xaxis2":{"type":"linear","autorange":false,"range":[0.40000000000000002,4.5999999999999996],"tickmode":"array","ticktext":["1990","2000","2010","2020"],"tickvals":[1,2,3,4],"categoryorder":"array","categoryarray":["1990","2000","2010","2020"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.6529680365296811,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.34148727984344424,0.65851272015655571],"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y2","title":"","hoverformat":".2f"},"xaxis3":{"type":"linear","autorange":false,"range":[0.40000000000000002,4.5999999999999996],"tickmode":"array","ticktext":["1990","2000","2010","2020"],"tickvals":[1,2,3,4],"categoryorder":"array","categoryarray":["1990","2000","2010","2020"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.6529680365296811,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0.67482061317677755,1],"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"y2","title":"","hoverformat":".2f"},"yaxis2":{"type":"linear","autorange":false,"range":[3.0252013336308297,103.97449733844026],"tickmode":"array","ticktext":["25","50","75","100"],"tickvals":[25,50,75,100],"categoryorder":"array","categoryarray":["25","50","75","100"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.6529680365296811,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.68949771689498},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"domain":[0,0.47031963470319632],"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176002,"zeroline":false,"anchor":"x","title":"","hoverformat":".2f"},"showlegend":true,"legend":{"bgcolor":null,"bordercolor":null,"borderwidth":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.68949771689498},"title":{"text":"year","font":{"color":"rgba(0,0,0,1)","family":"","size":14.611872146118724}}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"581426f95594":{"x":{},"y":{},"fill":{},"type":"box"},"58143e6b11a1":{"x":{},"y":{},"fill":{},"label":{}}},"cur_data":"581426f95594","visdat":{"581426f95594":["function (y) ","x"],"58143e6b11a1":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
```


```r
#Boxplot por vacina
data_long_annotated %>% 
  filter(type == "country",
         year == 2015) %>% 
 ggplot() +
  aes(x = "", y = coverage, fill = continent) +
  geom_boxplot() +
  scale_fill_viridis_d(option = "plasma", direction = 1) +
  theme_minimal() +
  facet_wrap(vars(vaccine), 
             nrow = 1) +
  labs(x = "Regiões",
       y = "Cobertura",
       titulo = "Cobertura vacinal por região, em 2000") +
  scale_fill_lancet()  
```

```
## Scale for fill is already present.
## Adding another scale for fill, which will replace the existing scale.
```

```
## Warning: Removed 216 rows containing non-finite outside the scale range
## (`stat_boxplot()`).
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-56-1.png)<!-- -->

## Múltiplos gráficos


```r
# Múltiplos gráficos ----
#Todas as linhas
data_long_standardized %>%
 filter(year >= 2012& year <= 2022) %>%
 filter(region %in% "LACR") %>%
 ggplot() +
  aes(x = year, y = coverage, color = name) +
  geom_line() +
  theme_minimal() + 
  facet_wrap(vars(vaccine), scales = "free_x") 
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-57-1.png)<!-- -->

```r
#Fica muito poluído
```

### Isolando linhas com filter()


```r
#Highlight linhas específicas

#Método 1
br_cov = data_long_standardized %>%
 filter(year >= 2012 & year <= 2022,
        name %in% c("Brazil", "Colombia")) %>%
 ggplot() +
  aes(x = year, 
      y = coverage,
      colour = name) +
  
  geom_line(linewidth = 2) +

  theme_minimal() +
  
  facet_wrap(vars(vaccine)) + 
  
  labs(title = "Cobertura vacinal, por vacina",
       x = "Ano",
       y = "Cobertura (%)")  +
  
  scale_color_npg() 

br_cov 
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-58-1.png)<!-- -->

### Isolando linhas com gghighlight()


```r
#Método 2
br_cov = data_long_standardized %>%
 filter(year >= 2012 & year <= 2022,
        region %in% c("LACR")) %>%
 ggplot() +
  
  geom_line(aes(x = year, 
      y = coverage,
      colour = name),
      linewidth = 2) +

  theme_minimal() +
  
  theme(axis.text.x = element_text(angle = 90)) +
  
  facet_wrap(vars(vaccine)) + 
  
  labs(title = "Cobertura vacinal, por vacina",
       x = "Ano",
       y = "Cobertura (%)") +
  
  gghighlight(name %in% c("Brazil", "Colombia"), 
              calculate_per_facet = T, #Add quando tiver facets
              unhighlighted_params = list(linewidth = 1, 
                                          colour = "gray90", 
                                          alpha = 0.3)) +
  scale_color_npg() 
```

```
## Warning: Tried to calculate with group_by(), but the calculation failed.
## Falling back to ungrouped filter operation...
```

```
## label_key: name
```

```r
br_cov
```

```
## Warning: Removed 175 rows containing missing values or values outside the scale range
## (`geom_line()`).
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-59-1.png)<!-- -->


```r
#Mortes
br_mortes = data_long_annotated %>%
 filter(year >= 2012 & year <= 2022,
        region %in% c("LACR")) %>% 
  select(name, year, total_deaths, death_rate_100thousand, disease_vac) %>% 
  distinct() %>%
  drop_na(total_deaths) %>% 
 ggplot() +
  geom_line(aes(x = round(year, 0), 
      y = total_deaths,
      colour = name),
      linewidth = 2) +

  theme_minimal() +
  
  facet_wrap(vars(disease_vac), 
             scales = "free", 
             nrow = 3) + 
  
  labs(title = "Mortes por doença imunoprevenível",
       x = "Ano",
       y = "Mortes") +
  
  #highlight
  gghighlight(name %in% c("Brazil", "Colombia"), #Linhas somente com name == "Brazil'
              
              calculate_per_facet = T, #Add quando tiver facets
              
              unhighlighted_params = list(linewidth = 1, #Opções para linhas não marcadas
                                          colour = "gray90", 
                                          alpha = 0.5)) + 
  scale_color_npg() 
```

```
## Warning: Tried to calculate with group_by(), but the calculation failed.
## Falling back to ungrouped filter operation...
```

```
## label_key: name
```

```r
br_mortes 
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-60-1.png)<!-- -->


```r
# Unir gráficos
ggsave(br_cov + br_mortes, file = "br_cov_mortes.png") 
```

```
## Saving 7 x 5 in image
```

```
## Warning: Removed 175 rows containing missing values or values outside the scale range
## (`geom_line()`).
```

# 6. Modelo

Este modelo é útil para você criar gráficos de forma mais fácil, considerando as layers, funções e argumentos mais utilizados no ggplot. Caso queira gerar outros tipos de gráficos, use diferentes geometrias e consulte o (R graph gallery)[<https://r-graph-gallery.com/>].



# Analisando a distribuição

**Quantos países por continente registraram os dados na UNICEF?**


```r
#Quantos países por continente registraram os dados na UNICEF?

#Todos os continentes juntos
data_long_annotated %>%
 filter(type == "country",
        continent != "Other") %>% 
 select(coverage, year, continent, vaccine) %>% 
 drop_na(coverage) %>% 
 ggplot() +
  aes(x = year, fill = continent) +
  geom_histogram(bins = 43L) +
  theme_minimal() +
  facet_wrap(vars(vaccine)) +
  scale_fill_npg()
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-63-1.png)<!-- -->

**Continentes separados**


```r
# Continentes separados
data_long_annotated %>%
 filter(type == "country",
        continent != "Other") %>% 
 select(coverage, year, continent, vaccine) %>% 
 drop_na(coverage) %>% 
 ggplot() +
  aes(x = year, fill = continent) +
  geom_histogram(bins = 43L) +
  scale_fill_hue(direction = 1) +
  theme_minimal() +
  facet_grid(continent ~ vaccine, scales = "free")
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-64-1.png)<!-- -->

**Quantos países aumentaram sua cobertura vacinal em cada decada?**


```r
#Quantos países aumentaram sua cobertura vacinal em cada decada?

data_long_annotated %>%
 filter(type == "country",
        continent != "Other",
        year %in% c(1990, 2000, 2010, 2019)) %>%
 ggplot() +
  aes(x = coverage, fill = continent) +
  geom_histogram(bins = 10L) +
  theme_minimal() +
  theme(plot.caption = element_text(size = 13L),
        legend.position = "top",
        strip.text.y = element_text(angle = 0, 
                                    hjust = 0)) +
  facet_grid(~disease_vac~year, scales = "free") +
  facet_grid(continent ~ vaccine, scales = "free")
```

```
## Warning: Removed 1913 rows containing non-finite outside the scale range
## (`stat_bin()`).
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-65-1.png)<!-- -->

# Avançado: Dados demográficos e economicos com o Gapminder

O gapminder é um site e um pacote que apresenta diferentes dados sobre países ao longo dos anos. O pacote do R traz uma tabela dos anos 50 até 2007, com dados sobre expectativa de vida, PIB percapita e tamanho da população.


```r
install.packages("gapminder")
```

```
## Installing package into 'C:/Users/Wasim/AppData/Local/R/win-library/4.3'
## (as 'lib' is unspecified)
```

```
## package 'gapminder' successfully unpacked and MD5 sums checked
## 
## The downloaded binary packages are in
## 	C:\Users\Wasim\AppData\Local\Temp\RtmpwDUcnu\downloaded_packages
```

```r
library(gapminder)
```

```
## Warning: package 'gapminder' was built under R version 4.3.3
```

```r
gapminder %>% 
  filter(year %in% c(1952, 1982, 2002)) %>% 
ggplot() +
  aes(
    x = gdpPercap,
    y = lifeExp,
    colour = continent,
    size = pop,
    group = country
  ) +
  geom_point(shape = "circle") +
  scale_x_continuous(trans = "log10") +
  theme_minimal() +
  facet_wrap(vars(year), scales = "free_x") +
  gghighlight(country == "China") +
  scale_color_npg()
```

```
## Warning: Tried to calculate with group_by(), but the calculation failed.
## Falling back to ungrouped filter operation...
```

```
## label_key: country
```

![](Introducao_analise_exploratoria_files/figure-html/unnamed-chunk-66-1.png)<!-- -->
