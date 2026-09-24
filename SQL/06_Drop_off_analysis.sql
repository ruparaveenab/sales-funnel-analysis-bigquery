WITH funnel_stages as (
  select 
    count(distinct case when event_type = 'page_view' then user_id end) as stage_1_views,
    count(distinct case when event_type = 'add_to_cart' then user_id end) as stage_2_cart,
    count(distinct case when event_type = 'checkout_start' then user_id end) as stage_3_checkout,
    count(distinct case when event_type = 'payment_info' then user_id end) as stage_4_payment,
    count(distinct case when event_type = 'purchase' then user_id end) as stage_5_purchase
  from `sales-funnel-analysis-509314.sql_practice.user_events`
)
select 
  stage_1_views,
  stage_2_cart,
  ROUND((stage_1_views - stage_2_cart) * 100 / stage_1_views) as drop_off_views_to_cart,
  stage_3_checkout,
  ROUND((stage_2_cart - stage_3_checkout) * 100 / stage_2_cart) as drop_off_cart_to_checkout,
  stage_4_payment,
  ROUND((stage_3_checkout - stage_4_payment) * 100 / stage_3_checkout) as drop_off_checkout_to_payment,
  stage_5_purchase,
  ROUND((stage_4_payment - stage_5_purchase) * 100 / stage_4_payment) as drop_off_payment_to_purchase,
  ROUND(stage_5_purchase * 100 / stage_1_views) as overall_conversion_rate,
  ROUND((stage_1_views - stage_5_purchase) * 100 / stage_1_views) as overall_drop_off_rate
from funnel_stages;