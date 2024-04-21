{{
  config(
    materialized = 'view',
    )
}}

select 
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    {{ dbt.datediff('started_at','ended_at',"second")}} as ride_length_sec,
    {{ dbt.datediff('started_at','ended_at',"minute")}} as ride_length_min,
    start_station_name,
    {{ dbt.safe_cast("start_station_id", api.Column.translate_type('integer')) }} as start_station_id,
    end_station_name,
    {{ dbt.safe_cast("end_station_id", api.Column.translate_type('integer')) }} as end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
    from {{ ref('cg_days') }}
    where start_station_id is not null and end_station_id is not null 