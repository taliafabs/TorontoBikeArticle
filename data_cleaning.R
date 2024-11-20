
#### Workplace setup ####

# Clean the bike thefts csv data
bike_thefts_csv <- read_csv("data/Bicycle_Thefts_Open_Data.csv") |>
  mutate(
    occurence_date = as_date(
      OCC_DATE, format = "%a, %d %b %Y %H:%M:%S GMT"
    ),
    report_date = as_date(
      REPORT_DATE, format = "%a, %d %b %Y %H:%M:%S GMT"
    )
  )

bike_thefts_clean <- bike_thefts_clean |>
  filter(REPORT_YEAR >= 2014 & 
           REPORT_YEAR <= 2023 & 
           !is.na(NEIGHBOURHOOD_158) &
           !is.na(STATUS) & 
           !is.na(PREMISES_TYPE)
         ) 

# Clean the bike thefts geojson data
bike_thefts_raw_sf <- read_sf("data/Bicycle_Thefts_Open_Data.geojson") |>
  mutate(
    occurence_date = as_date(
      OCC_DATE, format = "%a, %d %b %Y %H:%M:%S GMT"
    ),
    report_date = as_date(
      REPORT_DATE, format = "%a, %d %b %Y %H:%M:%S GMT"
    )
  )

bike_thefts_clean_sf <- bike_thefts_raw_sf |>
  filter(REPORT_YEAR >= 2014 & 
           REPORT_YEAR <= 2023 & 
           !is.na(NEIGHBOURHOOD_158) &
           !is.na(STATUS) & 
           !is.na(PREMISES_TYPE)
  ) 
  

#### Save the cleaned data ####
write_csv(bike_thefts_clean, ("cleaned_data/bike_thefts_clean.csv"))
write_sf(bike_thefts_clean_sf, "cleaned_data/bike_thefts_clean_sf.geojson")