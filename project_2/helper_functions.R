library(tidyverse)
library(forcats)
#Read in UMD data
umd_df = read.csv('./data/UMD_Services_Provided_20190719.tsv',sep = '\t',header = TRUE)
#Durham and Chapel Hill Unemployment Rate
dur_ch_unemp = read.csv('./data/durham_chapel_hill_unemployment_rate.txt',sep = ',',header = TRUE)


#Data cleaning
umd_df_clean = umd_df %>%  
  #Format data variable
  separate(Date, sep = "/", into = c("Month", "Day", "Year")) %>%
  #Reduce the dataframe to specific year range and remove Food.Pounds outliers 
  filter(Year >= 2006 & Year <= 2019 & Food.Pounds < 100)

#Annual total amount of food provided by UMD
umd_df_clean = umd_df_clean%>%
  #Reduce dataframe to only include two variables
  select(Year,Food.Pounds) %>%
  #Remove any row with NaN
  drop_na(Food.Pounds) %>%
  #Group data by year
  group_by(Year) %>%
  #Find aggregate food provide per year
  summarise(food.give = sum(Food.Pounds))

#Isolate the gross weight of clothes provided by UMD annually
umd_df_clean_clothing = umd_df%>%
  #Format data variable
  separate(Date, sep = "/", into = c("Month", "Day", "Year")) %>%
  #Reduce the dataframe to specific year range
  filter(Year >= 2006 & Year <= 2019) %>%
  #Reduce dataframe to only include two variables
  select(Year, Clothing.Items) %>%
  #Remove any row with NaN
  drop_na(Clothing.Items) %>%
  #Group data by year
  group_by(Year) %>%
  #Find aggregate food provide per year
  summarise(clothing.give = sum(Clothing.Items))

unemp_clean = dur_ch_unemp %>%
  mutate(Month = Period) %>%
  select(Month, Year, unemployment.rate) %>%
  group_by(Year) %>%
  #Find aggregate food provide per year
  summarise(avg.unemployment.rate = mean(unemployment.rate))


#Generate Scatter plots
line_plot <- function(year, service){
  if (service == 1) {
    data = umd_df_clean %>%
      mutate(unemployment = unemp_clean$avg.unemployment.rate) %>%
      filter(Year >= year[1] & Year <= year[2])
  
    ggplot(data, aes(x = Year, group = 1)) +
      geom_line(aes(y = food.give, colour  = "Food Provided")) +
      geom_point(aes(y = food.give)) +
      geom_line(aes(y = unemployment * 10000, colour  = "Unemployment Rate")) +
      geom_point(aes(y = unemployment * 10000)) +
      scale_y_continuous(sec.axis = sec_axis(~./10000, name = " Average Durham Chapel-Hill Unemployment Rate[%]")) +
      labs(
        y = "Aggregate Food distributed (lbs.)",
        face = 'bold') +
      labs(title = "Total Food Provided per Year and Durham Chapel Hill Unemployment Rate") +
      labs(colour = "Data Type") +
      theme_minimal() 
    
    
    } else {
    data = umd_df_clean_clothing %>%
      mutate(unemployment = unemp_clean$avg.unemployment.rate) %>%
      filter(Year >= year[1] & Year <= year[2])
    
    ggplot(data, aes(x = Year, group = 1)) +
      geom_line(aes(y = clothing.give, colour  = "Clothing Provided")) +
      geom_point(aes(y = clothing.give)) +
      geom_line(aes(y = unemployment * 5000, colour  = "Unemployment Rate")) +
      geom_point(aes(y = unemployment * 5000)) +
      scale_y_continuous(sec.axis = sec_axis(~./5000, name = " Average Durham Chapel-Hill Unemployment Rate[%]")) +
      labs(
        y = "Aggregate Clothing distributed",
        face = 'bold') +
      labs(title = "Total Clothing Provided per Year and Durham Chapel Hill Unemployment Rate") +
      labs(colour = "Data Type") +
      theme_minimal() 
    
  }
  
}



month_plot <- function(year, click, service){
  if (service == 1) {
    validate(
      need(click, "To view a breakdown of the total food provided month-to-month 
         for a given year please click on a food datapoint above.")
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
    
    ggplot(umd_df_clean_mo, aes(x = reorder(Month, as.integer(Month)), y = food.give, group = 1)) +
      geom_line(linetype  = "dashed") +
      geom_point() +
      labs(title = paste("Total Food Provided per Month in", click_year),
           x = "Month",
           y = "Aggregate Food distributed (lbs.)",
           face = 'bold') +
      scale_x_discrete(labels=c("1" = "Jan",
                                "2" = "Feb",
                                "3" = "Mar",
                                "4" = "Apr",
                                "5" = "May",
                                "6" = "Jun",
                                "7" = "Jul",
                                "8" = "Aug",
                                "9" = "Sep",
                                "10" = "Oct",
                                "11" = "Nov",
                                "12" = "Dec")) + 
      theme_minimal()
    
  } else {
    
    validate(
      need(click, "To view a breakdown of the total clothing provided month-to-month 
         for a given year please click on a clothing datapoint above.")
    )
    
    #Convert x coordinate into year
    click_year = as.character(seq(year[1],year[2],by = 1))[round(click$x)]
    
    #Get Monthly data
    umd_df_clean = umd_df %>%  
      #Format data variable
      separate(Date, sep = "/", into = c("Month", "Day", "Year")) %>%
      #Reduce the dataframe to specific year range 
      filter(Year >= 2006 & Year <= 2019)
    
    umd_df_clean_clothing_mo = umd_df_clean%>%
      #Reduce dataframe to only include two variables
      select(Month,Year,Clothing.Items) %>%
      #Remove any row with NaN
      drop_na(Clothing.Items) %>%
      #Year of client interest
      filter(Year == click_year) %>%
      #Group data by year
      group_by(Month) %>%
      #Attempt to order months numerically (Need to DEBUG)
      arrange(as.integer(as.character((Month)))) %>%
      #Find aggregate food provide per year
      summarise(clothing.give = sum(Clothing.Items))
    
    ggplot(umd_df_clean_clothing_mo, aes(x = reorder(Month, as.integer(Month)), y = clothing.give, group = 1)) +
      geom_line(linetype  = "dashed") +
      geom_point() +
      labs(title = paste("Total Clothing Provided per Month in", click_year),
           x = "Month",
           y = "Aggregate Clothing distributed (lbs.)",
           face = 'bold') +
      scale_x_discrete(labels=c("1" = "Jan",
                                "2" = "Feb",
                                "3" = "Mar",
                                "4" = "Apr",
                                "5" = "May",
                                "6" = "Jun",
                                "7" = "Jul",
                                "8" = "Aug",
                                "9" = "Sep",
                                "10" = "Oct",
                                "11" = "Nov",
                                "12" = "Dec")) + 
      theme_minimal()
    
  }
    
  
  
}
