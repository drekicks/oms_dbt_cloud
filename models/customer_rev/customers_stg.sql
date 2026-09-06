with source as (

    select *
    from {{ source('oms', 'customers') }}

),

renamed as (

    select
        "customerid" as customerid,
        "firstname" as first_name,
        "lastname" as last_name,
        "email" as email,
        "phone" as phone,
        "address" as address,
        "city" as city,
        "state" as state,
        "updated_at" as updated_at,
        concat("firstname", ' ',"lastname") as CustomerName
    from source

)

select *
from renamed