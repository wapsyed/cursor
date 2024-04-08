library(readr)
Hepatitis_B <- read_csv("raw-data/WHO mortality/WHOMortalityDatabase_Trends_years_many_countries_by_age_sex-Hepatitis B_8th abril 2024 11_54.csv", 
                                                                                                         skip = 6)
View(Hepatitis_B)

#Padronização -----

Hepatitis_B %>% 
  clean_names() %>% 
  glimpse()

Hepatitis_B %>% 
  clean_names() %>% 
  filter(sex == "All",
         age == "Age_all") %>% 
  
  select(who_region_name = region_name, 
         who_region_code = region_code,
         name = country_name, 
         country_abrev = country_code,
         age_group,
         number,
         perc_deaths,
         death_rate_100thousand,
         death_rate_100thousand_age_standardized)