with customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('fct_orders') }}
),

customer_orders as (
    SELECT customer_id, 
    min(ORDER_DATE) as first_order_date, 
    max(ORDER_DATE) as most_recent_order_date, 
    count(order_id) as number_of_orders,
    sum(amount) as lifetime_value
FROM orders 
GROUP BY 1
),

final as (
    SELECT customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        customer_orders.lifetime_value

    from customers

    left join customer_orders using (customer_id)

)

select * from final
