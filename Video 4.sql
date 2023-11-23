select * from orders;
select order_id, order_date, sales, quantity, discount, profit from orders;
select * from orders_subset;
select order_id, order_date,
o. region,
p. `regional manager`,
r. returned,
sales, quantity, discount, profit
from orders as o
left join people as p
on p.region = o.region
left join returns as r
on o.Order_ID = r.`order id`;
create view orders_enhanced as
(select order_id, order_date,
o. region,
p. `regional manager`,
r. returned,
sales, quantity, discount, profit
from orders as o
left join people as p
on p.region = o.region
left join returns as r
on o.Order_ID = r.`order id`
where region = "central");

select order_id, order_date,
o. region,
p. `regional manager`,
r. returned,
sales, quantity, discount, profit
from orders as o
left join people as p
on p.region = o.region
left join returns as r
on o.Order_ID = r.`order id`
where o.region = "central";

select * from orders;
call orders;
call orders(2022);

select order_id, sales, discount
, actual_discount(sales, discount) as function_discount, (sales*discount) as calculated_discount
from orders;

## practise problems
select * from order_details_consumer;
create view order_details_returned as
select order_id, sales
from orders as o
left join returns as r
on o.order_id = r.`order id`;
select * from order_details_returned;
call order_details_consumer;
call order_id_details('US-2019-105417');
select order_id, customer_name, sales, profit,
profit_margin_my(profit, sales) as function_profit
from orders;