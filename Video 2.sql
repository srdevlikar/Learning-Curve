select * from orders;
select Segment, sum(sales) from orders group by 1;

#Consumer	1170659.7869999947
#Home Office	440068.4325000005
#Corporate	715806.1347999984

select order_id, segment, sales,
sum(sales) over (partition by segment) as total_sales_segment,
avg(sales) over (partition by segment) as avg_sales_segment,
min(sales) over (partition by segment) as min_sales_segment,
max(sales) over (partition by segment) as max_sales_segment,
count(order_id) over (partition by segment) as total_order_by_segment,
sum(sales) over (rows between unbounded preceding and unbounded following) as total_sales 
from orders;
select order_id, segment, sales,
row_number() over (partition by Segment order by sales desc) as rowno_in_segment,
row_number() over (order by sales desc) as rowno_total,
dense_rank() over (partition by Segment order by sales desc) as denserank_in_segment,
dense_rank() over (order by sales desc) as denserank_total
from orders;
select * from
(select order_id, segment, sales,
row_number() over (partition by segment order by sales desc) as rowno_sales
from orders) a
where rowno_sales = 3;

with monthly_sales as
(select last_day(order_date) as month, round(sum(sales)) as sales from orders group by 1),
mom_sales as
(select *, 
-- first_value(sales) over (order by month) as firstvalue,
-- last_value(sales) over (order by month rows between unbounded preceding and unbounded following) as lastvalue,
-- lead(sales) over (order by month) as leadvalue,
lag(sales) over (order by month) as lagvalue
from monthly_sales)
select * , sales/lagvalue from mom_sales as mom_variation;

#practice problems

select order_id, sales, category, 
sum(sales) over (partition by category) as total_sales,
avg(sales) over (partition by category) as avg_sales,
min(sales) over (partition by category) as min_sales,
max(sales) over (partition by category) as max_sales
from orders;

select * from orders;

select * from
(select order_id, sales, category,
row_number() over (partition by category order by order_id) as row_category
from orders) as a
where row_category = 2;

with MOM_Sales as
(select last_day(order_date) as month, round(sum(sales)) as sales from orders group by 1),
yoy_sales as
(select lag(sales) over (order by month) as YOY_Sales from MOM_Sales)
select YOY_Sales from yoy_sales as YOY_Variation;
