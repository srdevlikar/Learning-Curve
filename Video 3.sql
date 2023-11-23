-- join, left join, right join, full join
select region, count(`Order ID`) from
(select r.`Order ID`, o.region
from orders as o
right join returns as r
on o.Order_ID = r.`Order ID`) as s
group by region
order by 2 desc;

-- cartesian product cross join no condition to be put or else it behaves as inner join

#practice problems
select * from orders;
select * from people;
select o.`Order_ID`, p.`Regional Manager`
from orders as o
left join people as p
on o.`region` = p.`Region`;

select * from returns;
select o.Order_ID, o.Region, o.sales
from orders as o
right join returns as r
on o.order_id = r.`order id`;

with regionwiseretunrs as
(select o.Order_ID, o.Region, o.sales
from orders as o
right join returns as r
on o.order_id = r.`order id`)
select distinct region, sum(sales) from orders group by 1;

with a as
(select *
from orders as o
left join returns as r
on o.order_id = r.`order id`)
select * from a where `order id`= 'null';
