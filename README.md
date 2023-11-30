# Cyclistic-Case-Study

I analyzed data from a bike sharing company in order to understand the differences in the behaviour of casual vs member riders, with the aim of determining whether casual riders could be targeted to convert into members. **I found that there are opportunities for the casual rider segment to be targeted, as the data shows that casual riders already make up 41% of the entire rider segment that could be targeted for conversion**. Since casual riders have a longer ride length and larger usage of bikes during the weekend, there is an opportunity to offer different membership options that could incentivize casual riders to purchase a membership.

This repository contains a SQL file made in BigQuery with data obtained from Motivate International about a bike sharing company called Divvy. The original dataset contains 12 months worth of data split into 12 csv files for each month. I uploaded each spreadsheet into BigQuery and wrote around 150 lines of SQL code to prepare the data for analysis:
- Combined all the months
- Added a column to calculate ride length
- Removed testing locations, cleaned station names and removed duplicates
- Averaged and rounded up the longitude and latitude coordinates for each station
- Capped the ride length to 1440 minutes to limit analysis to rides completed in one day

The original dataset can be found here:
https://www.divvybikes.com/data-license-agreement

My final analysis and data visualizations made in Tableau can be viewed here:
https://gabrielarportfolio.cargo.site/



