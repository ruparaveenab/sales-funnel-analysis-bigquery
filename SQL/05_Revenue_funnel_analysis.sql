-- revenue funnel analysis

with revenue_funnel as(
  select
    count(distinct case when event_type = 'page_view' then user_id end) as total_visitors,
    count(distinct case when event_type = 'purchase' then user_id end) as total_buyers,
    sum(case when event_type = 'purchase' then amount end) as total_revenue,
    count(case when event_type = 'purchase' then 1 end) as total_orders
  from `sales-funnel-analysis-509314.sql_practice.user_events`
)
select 
  total_visitors,
  total_buyers,
  total_orders,
  total_revenue,
  total_revenue / total_orders as avg_order_value,
  total_revenue / total_visitors as revenue_per_visitor,
  total_revenue / total_buyers as revenue_per_buyer
from revenue_funnel;
 

 --findings

 /* With this we can identify the cost for all the categories and we can derive Customer Acquistion Cost(CAC) and can derive whether it a profit or loss*/
