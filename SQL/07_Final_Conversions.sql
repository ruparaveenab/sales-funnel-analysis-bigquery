WITH funnel_stages as (
  select 
    count(distinct case when event_type = 'page_view' then user_id end) as page_views,
    count(distinct case when event_type = 'add_to_cart' then user_id end) as add_to_cart,
    count(distinct case when event_type = 'checkout_start' then user_id end) as checkout,
    count(distinct case when event_type = 'payment_info' then user_id end) as payment_info,
    count(distinct case when event_type = 'purchase' then user_id end) as purchase
  from `sales-funnel-analysis-509314.sql_practice.user_events`
),
funnel as (
SELECT
  stage,
  users,
  CASE stage
      WHEN 'page_view' THEN 1
      WHEN 'add_to_cart' THEN 2
      WHEN 'checkout' THEN 3
      WHEN 'payment_info' THEN 4
      WHEN 'purchase' THEN 5
    END AS stage_order
FROM funnel_stages
UNPIVOT (
  users FOR stage IN (
    page_views,
    add_to_cart,
    checkout,
    payment_info,
    purchase
  )
)
),
previous_users_count as(
  select stage, users, stage_order,
  LAG(users) over(order by stage_order) as previous_users
from funnel
)

SELECT
  stage,
  users,

  -- Conversion Percentage 
  coalesce(
  CASE
    WHEN stage_order = 1 THEN 100
    ELSE ROUND(SAFE_DIVIDE(users, previous_users) * 100, 2)
  END,0) AS conversion_percentage,

  --Drop Off
  coalesce(
  CASE
    WHEN stage_order = 1 THEN 0
    ELSE previous_users - users
  END,0) AS drop_off,

  -- Drop Off Percentage
  coalesce(
  CASE
    WHEN stage_order = 1 THEN 0
    ELSE ROUND(
      SAFE_DIVIDE(previous_users - users, previous_users) * 100, 2)
  END,0) AS drop_off_percentage

FROM previous_users_count
ORDER BY stage_order;