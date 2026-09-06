{{config(materialized='table')}}

with customer_rev as (
    select 
        os.customerid,
        c.CustomerName,
        sum(os.OrderCount) as OrderCount,
        sum(os.Revenue) as Revenue
    from {{ref('orders_fact')}} os join {{ref('customers_stg')}} c
    on os.customerid = c.customerid
    group by os.customerid, c.CustomerName
)
select * from customer_rev