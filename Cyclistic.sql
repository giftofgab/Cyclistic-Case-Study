-- Selecting all the months for analysis
WITH 
all_months as(
SELECT *
FROM `bikeshare-project-326818.Divvy.April 2020`
UNION ALL 
SELECT *
FROM `bikeshare-project-326818.Divvy.May 2020`
UNION ALL
SELECT *
FROM `bikeshare-project-326818.Divvy.June 2020`
UNION ALL 
SELECT *
FROM `bikeshare-project-326818.Divvy.July 2020`
UNION ALL 
SELECT *
FROM `bikeshare-project-326818.Divvy.August 2020`
UNION ALL
SELECT *
FROM `bikeshare-project-326818.Divvy.September 2020`
UNION ALL 
SELECT *
FROM `bikeshare-project-326818.Divvy.October 2020`
UNION ALL 
SELECT *
FROM `bikeshare-project-326818.Divvy.November 2020`
UNION ALL
-- Changing the data type for start station id and end station id to integer for the months below 
SELECT 
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    safe_cast(`start_station_id` as int),
    end_station_name,
    safe_cast(`end_station_id` as int),
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
FROM `bikeshare-project-326818.Divvy.December 2020`
UNION ALL
SELECT 
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    safe_cast(`start_station_id` as int),
    end_station_name,
    safe_cast(`end_station_id` as int),
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
FROM `bikeshare-project-326818.Divvy.January 2021`
UNION ALL
SELECT 
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    safe_cast(`start_station_id` as int),
    end_station_name,
    safe_cast(`end_station_id` as int),
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
FROM `bikeshare-project-326818.Divvy.February 2021`
UNION ALL
SELECT 
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    safe_cast(`start_station_id` as int),
    end_station_name,
    safe_cast(`end_station_id` as int),
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
FROM `bikeshare-project-326818.Divvy.March 2021`
UNION ALL
SELECT 
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    safe_cast(`start_station_id` as int),
    end_station_name,
    safe_cast(`end_station_id` as int),
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
FROM `bikeshare-project-326818.Divvy.April 2021`),
-- Make sure duplicates are removed for start station name and end station name 
-- Adding a column to show length of ride, separating start/end time and date and removing any negative and large values for ride length and removing test/maintenance rides from dataset
clean_station AS(
    SELECT
    ride_id,
    rideable_type,
    member_casual,
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_minute,
    EXTRACT(date from started_at) AS started_date,
    EXTRACT(date from ended_at) AS ended_date,
    EXTRACT(time from started_at) AS started_time,
    EXTRACT(time from ended_at) AS ended_time,
    FROM all_months
    WHERE 
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) between 1 and 1440),
-- Calculate and round up average latitude and longitude for each station to improve accuracy for coordinates
-- Clean station names and remove any testing locations 
average_station AS(
        SELECT
        DISTINCT 
        TRIM(REPLACE(REPLACE(start_station_name,'(*)',''),'(Temp)','')) start_station_name,
        TRIM(REPLACE(REPLACE(start_station_name,'(*)',''),'(Temp)','')) end_station_name,
        ROUND(AVG(start_lat),3) as start_lat,
        ROUND(AVG(start_lng),3) as start_lng,
        ROUND(AVG(end_lat),3) as end_lat,
        ROUND(AVG(end_lng),3) as end_lng,
        ride_id
        FROM (SELECT ride_id,start_station_name,end_station_name,start_lat,start_lng,end_lat,end_lng
                FROM all_months
                WHERE 
                start_station_name NOT LIKE '%TEST%' AND end_station_name NOT LIKE '%TEST%')
        GROUP BY
        start_station_name,
        end_station_name,
        ride_id),
-- Combine cleaned tables containing clean station names and updated latitude and longitude coordinates
final_table AS(
            SELECT *
            FROM average_station 
            LEFT JOIN clean_station
            ON average_station.ride_id = clean_station.ride_id)
SELECT * 
FROM final_table





