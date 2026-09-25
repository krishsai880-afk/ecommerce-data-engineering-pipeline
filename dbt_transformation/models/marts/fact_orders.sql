with orders as (
    select *
    from {{ ref("stg_orders") }}
),
order_summary as (
    select
        order_id,
        customer_id,
        order_status,
        order_approved_at,
        order_delivered_at,
        case
            when order_delivered_at is not null
                 and order_approved_at is not null
            then timestamp_diff(order_delivered_at, order_approved_at, day)
            else null
        end as approval_to_delivery_days
    from orders
)
select *
from order_summary
