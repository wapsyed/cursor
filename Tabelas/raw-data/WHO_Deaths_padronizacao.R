library(readr)

#Padronização -----

#Hepatitis

Hepatitis_B <- read_csv("raw-data/WHO mortality/WHOMortalityDatabase_Trends_years_many_countries_by_age_sex-Hepatitis B_8th abril 2024 11_54.csv", 
skip = 6)

Hepatitis_B = Hepatitis_B %>% 
  clean_names() %>% 
  select(who_region_name = region_name, 
         who_region_code = region_code,
         name = country_name, 
         country_abrev = country_code,
         sex,
         year,
         age = age_group,
         total_deaths = number,
         perc_deaths = percentage_of_cause_specific_deaths_out_of_total_deaths,
         death_rate_100thousand = death_rate_per_100_000_population,
         death_rate_100thousand_age_standardized = age_standardized_death_rate_per_100_000_standard_population) %>% 
  mutate(death_disease = "Hepatitis B",

         death_rate_100thousand = as.double(str_remove(death_rate_100thousand, ",")))

#Diphteria
Diphteria <- read_csv("raw-data/WHO mortality/WHOMortalityDatabase_Deaths_sex_age_a_country_area_year-Diphtheria_8th abril 2024 11_53.csv",
skip = 6)

Diphteria = Diphteria %>% 
  clean_names() %>% 
  select(who_region_name = region_name, 
         who_region_code = region_code,
         name = country_name, 
         country_abrev = country_code,
         sex,
         year,
         age = age_group,
         total_deaths = number,
         perc_deaths = percentage_of_cause_specific_deaths_out_of_total_deaths,
         death_rate_100thousand = death_rate_per_100_000_population,
         death_rate_100thousand_age_standardized = age_standardized_death_rate_per_100_000_standard_population) %>% 
  mutate(death_disease = "Diphteria",

         death_rate_100thousand = as.double(str_remove(death_rate_100thousand, ",")))


#Measles 
Measles <- read_csv("raw-data/WHO mortality/WHOMortalityDatabase_Deaths_sex_age_a_country_area_year-Measles_8th abril 2024 11_53.csv",
          skip = 6)

Measles = Measles %>% 
  clean_names() %>% 
  select(who_region_name = region_name, 
         who_region_code = region_code,
         name = country_name, 
         country_abrev = country_code,
         sex,
         year,
         age = age_group,
         total_deaths = number,
         perc_deaths = percentage_of_cause_specific_deaths_out_of_total_deaths,
         death_rate_100thousand = death_rate_per_100_000_population,
         death_rate_100thousand_age_standardized = age_standardized_death_rate_per_100_000_standard_population) %>% 
  mutate(death_disease = "Measles",

         death_rate_100thousand = as.double(str_remove(death_rate_100thousand, ",")))

#Meningitis
Meningitis <- read_csv("raw-data/WHO mortality/WHOMortalityDatabase_Deaths_sex_age_a_country_area_year-Meningitis_8th abril 2024 11_54.csv",
        skip = 6)

Meningitis = Meningitis %>% 
  clean_names() %>% 
  select(who_region_name = region_name, 
         who_region_code = region_code,
         name = country_name, 
         country_abrev = country_code,
         sex,
         year,
         age = age_group,
         total_deaths = number,
         perc_deaths = percentage_of_cause_specific_deaths_out_of_total_deaths,
         death_rate_100thousand = death_rate_per_100_000_population,
         death_rate_100thousand_age_standardized = age_standardized_death_rate_per_100_000_standard_population) %>% 
  mutate(death_disease = "Meningitis",

         death_rate_100thousand = as.double(str_remove(death_rate_100thousand, ",")))


#Pertussis
Pertussis <- read_csv("raw-data/WHO mortality/WHOMortalityDatabase_Deaths_sex_age_a_country_area_year-Pertussis_8th abril 2024 11_53.csv",
           skip = 6)

Pertussis = Pertussis %>% 
  clean_names() %>% 
  select(who_region_name = region_name, 
         who_region_code = region_code,
         name = country_name, 
         country_abrev = country_code,
         sex,
         year,
         age = age_group,
         total_deaths = number,
         perc_deaths = percentage_of_cause_specific_deaths_out_of_total_deaths,
         death_rate_100thousand = death_rate_per_100_000_population,
         death_rate_100thousand_age_standardized = age_standardized_death_rate_per_100_000_standard_population) %>% 
 mutate(death_disease = "Pertussis",

         death_rate_100thousand = as.double(str_remove(death_rate_100thousand, ",")))


#Poliomyelitis
Poliomyelitis <- read_csv("raw-data/WHO mortality/WHOMortalityDatabase_Deaths_sex_age_a_country_area_year-Poliomyelitis_8th abril 2024 11_53.csv",
          skip = 6)

Poliomyelitis = Poliomyelitis %>% 
  clean_names() %>% 
  select(who_region_name = region_name, 
         who_region_code = region_code,
         name = country_name, 
         country_abrev = country_code,
         sex,
         year,
         age = age_group,
         total_deaths = number,
         perc_deaths = percentage_of_cause_specific_deaths_out_of_total_deaths,
         death_rate_100thousand = death_rate_per_100_000_population,
         death_rate_100thousand_age_standardized = age_standardized_death_rate_per_100_000_standard_population) %>% 
mutate(death_disease = "Poliomyelitis",

         death_rate_100thousand = as.double(str_remove(death_rate_100thousand, ",")))


#Tetanus
Tetanus <- read_csv("raw-data/WHO mortality/WHOMortalityDatabase_Deaths_sex_age_a_country_area_year-Tetanus_8th abril 2024 11_54.csv",
  skip = 6)

Tetanus = Tetanus %>% 
  clean_names() %>% 
  select(who_region_name = region_name, 
         who_region_code = region_code,
         name = country_name, 
         country_abrev = country_code,
         sex,
         year,
         age = age_group,
         total_deaths = number,
         perc_deaths = percentage_of_cause_specific_deaths_out_of_total_deaths,
         death_rate_100thousand = death_rate_per_100_000_population,
         death_rate_100thousand_age_standardized = age_standardized_death_rate_per_100_000_standard_population) %>% 
mutate(death_disease = "Tetanus",

         death_rate_100thousand = as.double(str_remove(death_rate_100thousand, ",")))

#Tuberculosis
Tuberculosis <- read_csv("raw-data/WHO mortality/WHOMortalityDatabase_Deaths_sex_age_a_country_area_year-Tuberculosis_8th abril 2024 11_53.csv",
        skip = 6)

Tuberculosis = Tuberculosis %>% 
  clean_names() %>% 
  select(who_region_name = region_name, 
         who_region_code = region_code,
         name = country_name, 
         country_abrev = country_code,
         sex,
         year,
         age = age_group,
         total_deaths = number,
         perc_deaths = percentage_of_cause_specific_deaths_out_of_total_deaths,
         death_rate_100thousand = death_rate_per_100_000_population,
         death_rate_100thousand_age_standardized = age_standardized_death_rate_per_100_000_standard_population) %>% 
mutate(death_disease = "Tuberculosis",

         death_rate_100thousand = as.double(str_remove(death_rate_100thousand, ",")))

#Other infectious diseases

Other_infectious <- read_csv("raw-data/WHO mortality/WHOMortalityDatabase_Bubble_plot_country_area_burden_Other infectious diseases_8th abril 2024 11_49.csv",
 skip = 6)

Other_infectious = Other_infectious %>% 
  clean_names() %>% 
  select(who_region_name = region_name, 
         who_region_code = region_code,
         name = country_name, 
         country_abrev = country_code,
         year,
         sex,
         age = age_group,
         total_deaths = number,
         perc_deaths = percentage_of_cause_specific_deaths_out_of_total_deaths,
         death_rate_100thousand = death_rate_per_100_000_population,
         death_rate_100thousand_age_standardized = age_standardized_death_rate_per_100_000_standard_population) %>% 
mutate(death_disease = "Other_infectious",
       death_rate_100thousand = as.double(str_remove(death_rate_100thousand, ","))) 


deaths_who = bind_rows(Hepatitis_B, Measles, Meningitis, Other_infectious, Diphteria, Pertussis, Poliomyelitis, Tetanus, Tuberculosis)
deaths_who %>% saveRDS("Deaths_infectious_diseases.rds")


#Tabela com mortes por doenças imunopreníveis, por país, ano, sexo e idade
Deaths_infectious_diseases = readRDS(file = "Deaths_infectious_diseases.rds")
glimpse(Deaths_infectious_diseases) # mais de 2 milhões de linhas

Deaths_infectious_diseases %>% 
  count(death_disease)

#Reduzir tabela
Deaths_infectious_diseases_filtered = Deaths_infectious_diseases %>% 
  filter(age == "[All]",
         sex == "All") %>%  # 904 mil linhas
  select(name, year, total_deaths:death_disease) %>% 
  left_join(paises_anotados, by = "name")

Deaths_infectious_diseases_filtered %>% 
  saveRDS(file = "Deaths_infectious_diseases_filtered.rds")

#Quais colunas são iguais e têm nomes diferentes?
glimpse(Deaths_infectious_diseases_filtered)

  