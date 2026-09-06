with source as (

    select *
    from {{ source('oms', 'orders') }}

),

renamed as (

    select
        "orderid" as orderid,
        "orderdate" as orderdate,
        "customerid" as customerid,
        "employeeid" as employeeid,
        "storeid" as storeid,
        "status" as statuscd,
        case 
            when "status" = '01' then 'In Progress'
            when "status" = '02' then 'Completed'
            when "status" = '03' then 'Cancelled'
        end as StatusDesc,
        case 
            when "storeid" = 1000 then 'Online'
            else 'In-store'
        end as Order_Channel,
        "updated_at" as updated_at,
        current_timestamp as dbt_updated_at
    from source

)

select *
from renamed