-- source funnel
WITH source_funnel as (
  select 
    traffic_source,
    count(distinct case when event_type = 'page_view' then user_id end) as views,
    count(distinct case when event_type = 'add_to_cart' then user_id end) as carts,
    count(distinct case when event_type = 'purchase' then user_id end) as purchases
  from `sales-funnel-analysis-509314.sql_practice.user_events`
  group by traffic_source
)
select
  traffic_source,
  views,
  carts,
  purchases,
  ROUND(purchases*100/views) AS views_to_purchase_conversion,
  ROUND(carts*100/views) AS views_to_cart_conversion,
  ROUND(purchases*100/carts) AS cart_to_purchase_conversion
from source_funnel
order by purchases desc;
  
--findings
/* Social media have drawn huge traffic but conversion rate is too less. email source got good conversion rate. So its better to focus more on thi source to increase conversions */