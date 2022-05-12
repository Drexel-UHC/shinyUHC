{
  ## Dependencies
  library(tidyverse)
  library(sf)
  library(glue)

  ## Import Data
  load("raw-data/sf_zcta_bchc_simp.rdata")
  df_indicators = read_csv("raw-data/indicators_zcta_level.csv")
}



{ ## sf_zcta_philly.rdata
  sf_zcta_philly = sf_zcta_bchc_simp %>% filter(city == "Philadelphia")
  usethis::use_data(sf_zcta_philly, overwrite = T)
}

{ ## sf_zcta_philly.rdata
  tidy_indicators_philly = df_indicators %>% filter(city == "Philadelphia") %>%
    mutate(tooltip = glue("ZCTA: {zcta} <br>  {indicator_label}: {value}"))
  usethis::use_data(tidy_indicators_philly, overwrite = T)
}
