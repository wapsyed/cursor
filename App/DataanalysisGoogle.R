# Carregar as bibliotecas necessárias
library(ggplot2)
library(dplyr)
library(tidyr)



# Transformar os dados para formato longo
pivot_df <- df %>%
  pivot_longer(cols = -c(Teste, Marcador),
               names_to = "Sample",
               values_to = "Value")

# Converter 'Value' para numérico
pivot_df$Value <- as.numeric(pivot_df$Value)

# Criar o gráfico
ggplot(pivot_df, aes(x = Sample, y = Value, fill = Teste)) +
  geom_boxplot() +
  facet_wrap(~ Marcador, ncol = 2) +
  labs(title = "Valores por Amostra e Marcador",
       x = "Amostra",
       y = "Valor") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))