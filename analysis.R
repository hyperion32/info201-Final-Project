library(dplyr)

# read in the first csv
df <- read.csv("data/hchs/datasets/hchs-sol-sueno-ancillary-dataset-0.5.0.csv")


# read in the second csv
df_personal <- read.csv("data/hchs/datasets/hchs-sol-baseline-dataset-0.5.0.csv")

# read in the third csv and filter
df_sleep <- read.csv("data/sleep_data_analysis.csv")
filtered_sleep <- df_sleep %>%
  select(age, sleep_dur_wkday)

# select physical activity variables
df_personal_select <- df_personal %>% 
  select('Patient ID' = pid, 'Physical activity level (low, mod, high)' = GPAQ_LEVEL, 
         'Total physical activity (min/week)' = GPAQ_MV_WEEK, 
         'Total physical activity (min/day)' = GPAQ_TOTAL, 
         'Work-related physical activity (min/day)' = GPAQ_WORK)

# select sleep variables
df_select <- df %>% 
  select('Patient ID' = PID, 
         'Average sleep time in main sleep over weekdays' = SAWA101, 
         'Average sleep efficiency in main sleep over weekdays' = SAWA107, 
         'Average in-bed duration from main sleep period over all days' = SAWA50)

# join the dataframes together
df_graph <- left_join(df_personal_select, df_select, by ='Patient ID', na.rm = FALSE)


# new dataframe with desired physical activity variables
limited_var_x <- select(df_graph, - "Patient ID", - "Physical activity level (low, mod, high)",
                        - "Average sleep time in main sleep over weekdays",
                        - "Average sleep efficiency in main sleep over weekdays",
                        - "Average in-bed duration from main sleep period over all days")

# new dataframe with desired sleep variables
limited_var_y <- select(df_graph, - "Patient ID", - "Physical activity level (low, mod, high)",
                        - "Total physical activity (min/week)",
                        - "Total physical activity (min/day)",
                        - "Work-related physical activity (min/day)")




#eturn_value <- mean(df_viz_2, age column avg)






