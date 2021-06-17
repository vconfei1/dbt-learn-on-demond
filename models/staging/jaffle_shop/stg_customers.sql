with customers as (
    SELECT ID as customer_id, 
    FIRST_NAME, 
    LAST_NAME
    FROM `nth-droplet-316902.raw.jaffle_shop-customers`
)

select * from customers