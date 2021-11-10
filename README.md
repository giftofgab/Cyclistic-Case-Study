# Cyclistic-Case-Study

This repository contains a SQL file made in BigQuery with data obtained from Motivate International about a bike sharing company called Divvy. The original dataset contains 12 months worth of data split into 12 csv files for each month. I uploaded each spreadsheet into BigQuery and did the following:
- Combined all the months
- Added a column to calculate ride length
- Removed testing locations, cleaned station names and removed duplicates
- Averaged and rounded up the longitude and latitude coordinates for each station
- Capped the ride length to 1440 minutes to limit analysis to rides completed in one day

The original dataset can be found here:
https://www.divvybikes.com/data-license-agreement

My final analysis and data visualizations made in Tableau can be viewed here:
https://gabrielarportfolio.cargo.site/



