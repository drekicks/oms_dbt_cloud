with customer_orders as (

    select
        o.orderid,
        o.orderdate,
        o.customerid,
        o.employeeid,
        o.storeid,
        o.statuscd,
        o.StatusDesc,
        count(distinct o.orderid) as OrderCount,
        sum(oi.TotalPrice) as Revenue,
        o.updated_at
    from {{ ref('orderitems_stg') }} oi
    join {{ ref('orders_stg') }} o
        on oi.orderid = o.orderid
    group by 1,2,3,4,5,6,7,10

)

select *
from customer_orders