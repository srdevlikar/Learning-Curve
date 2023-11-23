select * from orders;
select * from orders where segment = 'Consumer';
select * from orders where category = 'Technology';
select order_id, State, Category, Sales from orders where Category = 'Technology';
select Order_Date from orders;
select Ship_Mode from orders;
select segment from orders where Segment= 'Home Office';
select segment, Customer_ID from orders where segment='Consumer';
select * from orders where Region = 'Central' and (segment = 'Consumer' or segment = 'Corporate');
select * from orders where state <> 'Alabama' and state <> 'Texas';
select * from orders where Order_Date >= '2022-01-01' and Order_Date <= '2022-03-31';
select * from orders where Order_Date between '2022-01-01' and '2022-03-31';
select * from orders where Sales between '500' and '600';
select * from orders where customer_name in ('Darren Powers',
'Phillina Ober',
'Mick Brown',
'Maria Etezadi',
'Jack OBriant',
'Maria Etezadi',
'Lycoris Saunders',
'Vivek Sundaresam');
select * from orders where customer_name is not NULL;
select * from orders where Customer_Name like '%er%';
select * from orders order by state desc;
select * from orders where Region = 'Central' and (segment = 'Consumer' or segment = 'Corporate') order by state;
select  distinct state from orders;

Practice Problems;
select * from orders;
select * from orders where state = 'Michigan';
select order_id, state, sales, quantity from orders where category = 'Technology';
select customer_id, state, category from orders where state = 'Texas' and category = 'Office Supplies';
select * from orders where customer_name like '%usa%' order by Customer_Name;
select distinct category from orders;
select * from orders where category = 'Office Supplies' or category = 'Technology';