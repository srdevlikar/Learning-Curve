select * from orders;
select order_id, sales,
case
when sales < 100 then 'Bad'
when sales < 1000 then 'OK'
else 'Good' end as sales_type,
case when Profit > 0 then "negative" when profit < 0 then "positive" else "NA" end as profit_type,
case when sales between 0 and 100 then '0-100' when sales between 101 and 1000 then '100-1000' when sales > 1000 then '>1000' else 'NA' end as sales_bins
 from orders;
 
 select 
 case
 when sales between 0 and 100 then '0-100'
 when sales between 101 and 1000 then '100-1000'
 when sales > 1000 then '>1000'
 else 'NA' end as sales_bins,
 count(order_id) from orders group by sales_bins;
 
 select region, category, sum(sales) as total_sales from orders group by category, region;
 select region,
 sum(case when category = 'Furniture' then sales else 0 end) as total_sales_furniture,
 sum(case when category = 'Office Supplies' then sales else 0 end) as total_sales_Office_Supplies,
 sum(case when category = 'Technology' then sales else 0 end) as total_sales_Technology
 from orders group by region;
 
 select ship_mode, category, `sub-category`, round(sum(sales)) as sales
 from orders
 group by 1,2,3
 order by 1,2,3;
 
  select ship_mode, category, `sub-category`, round(sum(sales)) as sales
 from orders
 group by 1,2,3
 order by ship_mode,
 case
 when ship_mode = 'First Class' then category
 when ship_mode = 'Same Day' then `sub-category`
 else category end;
 
 Practice Probelms;
 
 select order_id, discount, 
 case
 when discount < 0.2 then 'low'
 when discount > 0.2 then 'high'
 else 'medium' end as discount
 from orders;
 
 select order_id,
case when ship_mode = "First Class" then 'Yes'
when ship_mode <> 'First Class' then 'No'
else 'NA' end as Ship_mode_First_Class
from orders;

select order_id, sales, discount
from orders where
case when discount > 0 and sales > 1000 then order_id
when discount < 0 and sales < 500 then 'No'
end;