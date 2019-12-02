library(tidyverse)

#Read in clean ENTRY EXIT tsv file
ee.df = read.csv('./results/client_entry_exit_annotated.txt',sep = '\t',header = TRUE)
#Add a colun to count number of entries
ee.df$cnt = 1

#Durham and Chapel Hill Unemployment Rate
dur_ch_unemp = read.csv('./data/durham_chapel_hill_unemployment_rate.txt',sep = ',',header = TRUE)

# Clean unemployment data
dur.ch.unemp.clean = dur_ch_unemp %>%
  # Filter for years 2014 - 2019
  filter(Year >= 2014 & Year <= 2019) %>%
  # Group data by year
  group_by(Year) %>%
  # Find average unemployment rate per year
  summarise(avg.unemploy = mean(unemployment.rate)) 

# Clean shelter data
ee.df.clean = ee.df %>%
  # Format data variable
  separate(Entry.Date, sep = "/", into = c("Month", "Day", "Year")) %>%
  # Filter for years 2014 - 2019
  filter(Year >= 2014 & Year <= 2019) %>%
  # Reduce dataframe to only include two variables
  select(Year,cnt) %>%
  # Group data by year
  group_by(Year) %>%
  # Find total number of clients entering shelter per year
  summarise(num.entries = sum(cnt)) 

# Join unemployment and shelter data 
data = dur.ch.unemp.clean %>% full_join(ee.df.clean %>% mutate(Year = as.integer(Year)))
  
# Plot Data
ggplot(data, aes(x = Year, group = 1)) +
  geom_line(aes(y = num.entries, colour  = "Number of clients \n entering shelter")) +
  geom_point(aes(y = num.entries)) +
  geom_line(aes(y = avg.unemploy * 100, colour  = "Unemployment Rate")) +
  geom_point(aes(y = avg.unemploy * 100)) +
  scale_y_continuous(sec.axis = sec_axis(~./100, name = " Average Durham Chapel-Hill Unemployment Rate[%]")) +
  labs(y = "Number of clients entering shelter",face = 'bold', colour = "Data Type") +
  theme_minimal()
  ggsave('./results/annual_shelter_entries_unemployment.png', width = 10)
  
# #What is the average amount of food given per interaction in a given year?
# race_food_df%>%
#   #Remvove rows with NaN
#   drop_na(Food.Pounds) %>%
#   #Create violin plot
#   ggplot(aes(x = race, y = Food.Pounds)) +
#   geom_violin() +
#   geom_boxplot(width=0.1) +
#   labs(x = "Year",
#        y = "Food provided at each transaction (lbs.)",
#        face = 'bold') +
#   theme_minimal() + 
#   ggsave('./results/race_food.png')
