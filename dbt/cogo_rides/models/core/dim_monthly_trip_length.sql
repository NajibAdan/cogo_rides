{{
  config(
    materialized = 'table',
    )
}}

with rides_data as (
    select * from {{ ref('stg_trips') }}
)
select 
    start_station_name as station,
    {{ dbt.date_trunc('month', 'started_at')}} as ride_month,
    {{ dbt.date_trunc('year', 'started_at')}} as ride_year,
    sum(ride_length_sec) as monthly_total_ride_duration_sec,
    sum(ride_length_min) as monthly_total_ride_duration_min,
    avg(ride_length_sec) as monthly_avg_ride_duration_sec,
    avg(ride_length_min) as monthly_avg_ride_duration_min,
    count(ride_id) as monthly_total_trips,

    from rides_data
    group by 1,2,3

