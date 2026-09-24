SELECT * FROM `sales-funnel-analysis-509314.sql_practice.user_events` LIMIT 100;

-- define the different stages of the sales funnel --

WITH funnel_stages as (
  select 
    count(distinct case when event_type = 'page_view' then user_id end) as stage_1_views,
    count(distinct case when event_type = 'add_to_cart' then user_id end) as stage_2_cart,
    count(distinct case when event_type = 'checkout_start' then user_id end) as stage_3_checkout,
    count(distinct case when event_type = 'payment_info' then user_id end) as stage_4_payment,
    count(distinct case when event_type = 'purchase' then user_id end) as stage_5_purchase
  from `sales-funnel-analysis-509314.sql_practice.user_events`
  -- where event_date >= Timestamp(date_sub(current_date(), interval 30 day)) 
  --if required for last 30 days
)

select * from funnel_stages;








 
