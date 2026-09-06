with source as (

    select *
    from {{ source('oms', 'orderitems') }}

),

renamed as (

    select
        "orderitemid" as orderitemid,
        "orderid" as orderid,
        "quantity" as quantity,
        "unitprice" as unitprice,
        "productid" as productid,
        "quantity" * "unitprice" as TotalPrice,
        "updated_at" as updated_at
    from source

)

select *
from renamed