library(tidyverse)

#Read in output from race_food analysis
race_food_df = read.csv('./results/race_food_analysis_tmp.txt',sep = '\t',header = TRUE)

#What is the average amount of food given per interaction in a given year?
race_food_df%>%
  #Remvove rows with NaN
  drop_na(Food.Pounds) %>%
  #Create violin plot
  ggplot(aes(x = race, y = Food.Pounds)) +
  geom_violin() +
  geom_boxplot(width=0.1) +
  labs(x = "Year",
       y = "Food provided at each transaction (lbs.)",
       face = 'bold') +
  theme_minimal() + 
  ggsave('./results/race_food.png')
