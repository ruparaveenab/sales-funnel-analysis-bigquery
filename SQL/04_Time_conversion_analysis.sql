-- time to conversion analysis

WITH user_journey as (
  select 
    user_id,
    min(case when event_type = 'page_view' then event_date end) as view_time,
    min(case when event_type = 'add_to_cart' then event_date end) as cart_time,
    min(case when event_type = 'purchase' then event_date end) as purchase_time
  from `sales-funnel-analysis-509314.sql_practice.user_events`
  group by user_id
  having min(case when event_type = 'purchase' then event_date end) is not null
)

select 
  count(*) as converted_users,
  Round(AVG(Timestamp_diff(cart_time,view_time,minute)),2) as avg_view_to_cart_minutes,
  Round(AVG(Timestamp_diff(purchase_time,cart_time,minute)),2) as avg_cart_to_purchase_minutes,
  Round(AVG(Timestamp_diff(purchase_time,view_time,minute)),2) as avg_view_to_purchase_minutes,
from user_journey;

--findings
/*No red flags here to check on. But user spending 24 minutes from view to purchase, this can be checked with business, like is it expected to take 24 minutes on average for the users as per their business model*/