library(tidyverse)
#Read in UMD data
umd_df = read.csv('./data/UMD_Services_Provided_20190719.tsv',sep = '\t',header = TRUE)

#Data cleaning
umd_df_clean = umd_df %>%  
  #Format data variable
  separate(Date, sep = "/", into = c("Month", "Day", "Year")) %>%
  #Reduce the dataframe to specific year range and remove Food.Pounds outliers 
  filter(Year >= 2006 & Year <= 2019 & Food.Pounds < 100)

#Gathering the Annual total amount of food given and total amount of clothes given
umd_df_clean = umd_df_clean%>%
  #Reduce dataframe to only include two variables
  select(Year,Food.Pounds) %>%
  #Remove any row with NaN
  drop_na(Food.Pounds) %>%
  #Group data by year
  group_by(Year) %>%
  #Find aggregate food provide per year
  summarise(food.give = sum(Food.Pounds))



#Generate Scatter plots
line_plot <- function(input){
  ggplot(umd_df_clean, aes(x = Year, y = food.give, group = 1)) +
    geom_line(linetype  = "dashed") +
    geom_point() +
    scale_x_discrete("Year") +
    xlim(as.character(seq(input[1],input[2],by = 1))) +
    labs(x = "Year",
         y = "Aggregate Food distributed (lbs.)",
         face = 'bold') +
    theme_minimal()
  
}



month_plot <- function(year, click){
  validate(
    need(click, "To view a breakdown of the total month-to-month food provided 
         for a given year please click on a datapoint above.")
  )
  
  #Convert x coordinate into year
  click_year = as.character(seq(year[1],year[2],by = 1))[round(click$x)]
  
  #Get Monthly data
  umd_df_clean = umd_df %>%  
    #Format data variable
    separate(Date, sep = "/", into = c("Month", "Day", "Year")) %>%
    #Reduce the dataframe to specific year range and remove Food.Pounds outliers 
    filter(Year >= 2006 & Year <= 2019 & Food.Pounds < 100)
  
  umd_df_clean_mo = umd_df_clean%>%
    #Reduce dataframe to only include two variables
    select(Month,Year,Food.Pounds) %>%
    #Remove any row with NaN
    drop_na(Food.Pounds) %>%
    #Year of client interest
    filter(Year == click_year) %>%
    #Group data by year
    group_by(Month) %>%
    #Attempt to order months numerically (Need to DEBUG)
    arrange(as.integer(as.character((Month)))) %>%
    #Find aggregate food provide per year
    summarise(food.give = sum(Food.Pounds))
  
  ggplot(umd_df_clean_mo, aes(x = Month, y = food.give, group = 1)) +
    geom_line(linetype  = "dashed") +
    geom_point() +
    labs(title = paste("Total Food Provided per Month in", click_year),
        x = "Month",
         y = "Aggregate Food distributed (lbs.)",
         face = 'bold') +
    theme_minimal()
  
}
