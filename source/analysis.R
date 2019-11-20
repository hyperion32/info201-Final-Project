library(dplyr)
df <- read.csv("../data/hchs/datasets/hchs-sol-sueno-ancillary-dataset-0.5.0.csv")

df_personal <- read.csv("../data/hchs/datasets/hchs-sol-baseline-dataset-0.5.0.csv")

df_personal_select <- df_personal %>% 
  select('Patient ID' = pid, 'Physical activity level (low, mod, high)' = GPAQ_LEVEL, 
         'Total physical activity (min/week)' = GPAQ_MV_WEEK, 
         'Total physical activity (min/day)' = GPAQ_TOTAL, 
         'Work-related physical activity (min/day)' = GPAQ_WORK)

df_select <- df %>% 
  select('Patient ID' = PID, 
         'Average sleep time in main sleep over weekdays' = SAWA101, 
         'Average sleep efficiency in main sleep over weekdays' = SAWA107, 
         'Average in-bed duration from main sleep period over all days' = SAWA50)

df_graph <- left_join(df_personal_select, df_select, by ='Patient ID', na.rm = FALSE)
