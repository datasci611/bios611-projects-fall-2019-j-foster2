### Project Overview

The dashboard provided here was built to analyze data collected by Urban ministries of Durham(UMD), a non-profit organization that is helping reduce homelessness. UMD originally founded in 1983 works to end poverty and homelessness by offering food, shelter and futures to community members. Here I focus on providing an interactive application that can be used by UMD to better understand their own data and to hopefully find trends that will inform future decisions. Specifically, I look to provide a tool through which trends in food and clothing distribution can be better understood by the staff of UMD. 

The user can look at the total amount of food/clothing provided annually compared to the average Durham Chapel Hill unemployment rate. I focused on the date range between 2006 and 2018 because there was a noticeable increase in the data available from UMD following 2006 ,and given data collection for 2019 is incomplete I chose to exclude that from the dashboard. If the user is interested in the month-to-month distribution of food/clothing simply click on the data point associated with the year of interest. 

A preliminary analysis of the total food vs. average unemployment data shows a qualitatively rough correlation between total food provide and average unemployment rate from 2006-2010, while there is an inverse relationship from 2012-2018. This later observation is striking because as unemployment decreases one would expect the amount of food being provided by UMD to also decrease. However, this may be due to how the unemployment rate was calculate by the bureau of labor statistics. The same trend exists between clothing being distributed and the average unemployment rate. Considering additional variables driving the increase in the clothing provided by UMD will likely help to understand this discrepancy. 

### Dashboard

Please find my dashboard at https://j-foster2.shinyapps.io/project_2/

### Raw Data

UMD_Services_Provided_20190719.tsv file is in data directory. - Data provided by UMD.

durham_chapel_hill_unemployment_rate.txt file is in data directory. These data include the unemployment rate for Durham and Chapel Hill NC, and were provided by the bureau of labor statistics. 
