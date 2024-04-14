{{
  config(
    materialized = 'table',
    partition_by = {
        'field': 'started_at',
        'data_type' : 'timestamp',
        'granularity' : 'day'
    },
    cluster_by = 'start_station_name'
    )
}}

select * from {{ source('dwh', 'cogo_rides_external_table') }}
{%if var('is_test_run', default=true) %}
limit 100
{% endif %}