
# What is the distribution of food provided by race?

import pandas as pd 
import numpy as np


# Gather UMD demographic data set - 
df_demo = pd.read_csv('https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/CLIENT_191102.tsv', sep = '\t')

# Filter UMD demographic data set for clients with ID equal to or smaller than 16792 
# (Max Client number in original data set)
df_demo = df_demo[df_demo['Client ID'] <= 16792]

# Gather UMD services data 
df_service = pd.read_csv('../data/UMD_Services_Provided_20190719.tsv', sep = '\t')

# Isolate Client number and Food Pounds
df_food = df_service.loc[:,['Client File Number', 'Food Pounds']]


# Isolate all racial categories
race_hold = []
race_client_id = []
for race in df_demo['Client Primary Race'].unique().tolist():
    if df_demo['Client ID'].loc[df_demo['Client Primary Race'] == race].to_list():
        race_hold.append(race) 
        race_client_id.append(df_demo['Client ID'].loc[df_demo['Client Primary Race'] == race].to_list())

# Find data on food provided
race_df_out = []
for race_id, race in zip(race_client_id, race_hold):
    hold = df_food.loc[df_food['Client File Number'].isin(race_id)].drop_duplicates(subset = 'Client File Number')
    hold['race'] = race 
    race_df_out.append(hold)
    
race_food_out = pd.concat(race_df_out)

# Create tmp txt file for ggplot visualization
race_food_out.to_csv('../results/race_food_analysis_tmp.txt',index = False, sep = '\t')
