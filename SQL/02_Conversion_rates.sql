--conversion rates through the funnel

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
  ROUND(stage_2_cart * 100 / stage_1_views) as views_to_cart,
  stage_3_checkout,
  ROUND(stage_3_checkout * 100 / stage_2_cart) as cart_to_checkout,
  stage_4_payment,
  ROUND(stage_4_payment * 100 / stage_3_checkout) as checkout_to_payment,
  stage_5_purchase,
  ROUND(stage_5_purchase * 100 / stage_4_payment) as payment_to_purchase,
  ROUND(stage_5_purchase * 100 / stage_1_views) as overall_conversion_rate
from funnel_stages;

-- findings
/* views to cart rate conversion is very low. This could be a flag to check on. Recommendation could be to website improvements
or letting the searched products visible immediately to the customers. and the payment to purchase conersion rate is pretty good. So payments are done smoothly. */