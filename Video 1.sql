select * from orders;
select avg(sales) from orders;
select order_id, sales from orders
where sales > (select avg(sales) from orders);
select order_id, sales, region from orders
where sales = (select max(sales) from orders);
select * from returns;
select *  from orders
where order_id in (select distinct `order id` from returns);
select order_id, sales, category from orders as o
where category = 'Office Supplies' and sales > (select avg(sales) from orders as i where i.category = o.category);
select category, avg(sales) from orders group by 1;
#Office Supplies	119.43428753263741
#Furniture	342.9112954566099
#Technology	450.34492171581593

select * from orders as o
where exists (select `order id` from returns as r where r.`order id` = o. order_id);

select * from orders as o
where not exists (select `order id` from returns as r where r.`order id` = o. order_id);

select * from orders where sales >= any (select sales from orders where region = 'Central');
select * from orders where sales >= all (select sales from orders where region = 'Central');
 with sales_profit as
 (select region, sum(sales) sales, sum(profit) profit from orders group by region)
 select region, profit/sales from sales_profit;
 
 #practise problems
 
 #max sales from oreder = 22638.48
 select order_id, sales from orders
 where sales = (select max(sales) from orders);
 select * from orders as o
where not exists (select `order id` from returns as r where r.`order id` = o. order_id);

with avg_sales_region as
(select order_id, region, sales, avg(sales) avg_sales from orders group by 1,2,3)
select order_id, region, sales from avg_sales_region where sales > avg_sales;

select * from orders;
select distinct segment, (sum(sales)/Count(order_id)) as AOV from orders group by 1;
with AOV as (select distinct segment, sum(sales)/Count(order_id) qty from orders group by 1)
select distinct segment, qty from AOV;