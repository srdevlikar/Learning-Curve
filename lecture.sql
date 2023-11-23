select * from orders;
select * from returns;
select * from people;
select region, avg(sales) region_avgsales from orders group by 1;

#type 1
with regional_avgsales as
(select region, avg(sales) region_avgsales from orders group by 1)
select * from orders as o
left join regional_avgsales as r
on o.region = r.region
where o.sales < r.region_avgsales;

# type 2
with regional_avgsales as
(select region, avg(sales) region_avgsales from orders group by 1)
select * from orders as o
inner join regional_avgsales as r
on o.region = r.region
and o.sales < r.region_avgsales;

select * from orders as o
where sales <(select avg(sales) from orders as i where o.region = i.region);

select returned, avg(sales) from
(select o.* , coalesce(r.Returned, 'No') as returned
from orders as o
left join returns as r
on o.order_id = r.`order id`) as a
group by 1;

select * from orders as o
where exists (select * from returns as r where o.order_id = r.`order id`);

with orders_rgm as
(select o.*, p.`regional manager` from orders as o
left join people as p
on o.region = p.region)
select `regional manager`, sum(sales)
from orders_rgm
group by 1;

with segment_details as
(select segment, sum(sales) ssales, count(customer_id) customers
from orders group by 1)
select segment, ssales, customers, ssales/customers as arpu
from segment_details;

select order_id, sales, avg(sales) over (partition by Ship_Mode),
min(sales) over(partition by Ship_Mode),
max(sales) over (partition by ship_mode)
from orders as o;

select * from (select order_id, region, sales,
row_number() over (partition by region order by sales desc) as rnk_high
from orders) as z where rnk_high = 2;

select * from (select order_id, region, sales,
row_number() over (partition by region order by sales asc) as rnk_low
from orders) as z where rnk_low = 2;

with annual_sales as 
(select year(order_date) as yr, sum(sales) as currentsales 
from orders as o group by 1),
yoy_sales as (
select *, lag(currentsales) over (order by yr) as previoussales
from annual_sales)
select *, currentsales/coalesce(previoussales) as YOY from yoy_sales;

select Category, sum(sales) from orders as o
inner join returns as r
on o.Order_ID = r.`order id`
group by 1;

select *
from orders as o
left join returns as r
on o.order_id = r.`order id`
where r.`Order ID` is null;

create view west_orders as
(select order_id, order_date, customer_name, sales from orders where region = 'west');

select last_day(order_date) as lastday, o.* from orders as o
where last_day(order_date) = '2022-07-31';

select order_id, sales, profit, profit/sales as calculated,
profit_margin (sales, profit) as funprofit_marginc_pm from orders;