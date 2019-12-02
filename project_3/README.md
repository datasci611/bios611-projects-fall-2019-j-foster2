### Project Overview

The analyses performed here were conducted on data collected by Urban ministries of Durham(UMD), a non-profit organization that is helping reduce homelessness. UMD originally founded in 1983 works to end poverty and homelessness by offering food, shelter and futures to community members. Here I focus on the relationship between length of stay in the UMD shelter and different demographics. The goal of the analysis is determine if the length of stay fluctuates between different demographics. Specifically, I asked the following questions: 

1. What is the relationship between length of stay in the shelter and race, gender, and veteran status?
2. Is there a relationship between local unemployment rate and the number of individuals entering the shelter? 

### Audience

The analyses provided here are meant to help guide the leaders and mangers of UMD. 

### Analysis

Starting with the ENTRY_EXIT_191102.tsv data set, the number of days spent at UMD shelter was calculated for each of the records. Each client ID was annotated with race, gender, and veteran status from the CLIENT_191102.tsv. For each of the demographic categories the distribution of numbers of days at shelter was visualized as violin plots. To begin assessing the connection between number of visits to the shelter and unemployment rate, the total number of visits to the shelter for each year between 2014 and 2019 as calculated and plotted as a line plot, as well as the average unemployment rate for a given year. These data suggest that different groups of people stay at the shelter for varying times periods. For example, both white and African-american clients are have a wider distribution of time stayed in the shelter. In regards to length of stay and local unemployment rate, as the unemployment rate decreases the number of clients entering the shelter has also decreased. A detailed report of the analyses performed here can be found in the results directory of this repository.

### Raw Data

Demographics data:
CLIENT_191102.tsv - https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/CLIENT_191102.tsv

Entry and Exit data:
ENTRY_EXIT_191102.tsv - https://raw.githubusercontent.com/biodatascience/datasci611/gh-pages/data/project2_2019/ENTRY_EXIT_191102.tsv

Durham and Chapel Unemployment data:
durham_chapel_hill_unemployment_rate.txt - stored in data directory - provided by the bureau of labor statistics

### Instructions for replicating results

Dependencies: docker v18.03.1-ce

umd_shelter_analysis.tar.gz

tar -zxvf umd_shelter_analysis.tar.gz

cd umd_shelter_analysis

make




