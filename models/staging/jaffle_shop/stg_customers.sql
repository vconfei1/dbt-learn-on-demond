SELECT ID as customer_id, 
FIRST_NAME, 
LAST_NAME
FROM {{ source('jaffle_shop', 'jaffle_shop-customers')}}