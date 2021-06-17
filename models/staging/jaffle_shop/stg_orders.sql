with orders as (
    SELECT ID as order_id, 
    USER_ID as customer_id, 
    ORDER_DATE, 
    STATUS
    FROM `nth-droplet-316902.raw.jaffle_shop-orders`
)

select * from orders