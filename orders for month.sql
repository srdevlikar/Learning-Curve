CREATE DEFINER=`root`@`localhost` PROCEDURE `orders_for_month`()
BEGIN
select last_day(order_date) as lastday, o.* from orders as o
where last_day(order_date) = '2022-07-31';
END