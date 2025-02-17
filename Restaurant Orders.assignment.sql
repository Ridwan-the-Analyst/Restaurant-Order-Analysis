select * from menu_items;
select * from order_details;

/* View the menu_items table and write a query to find the number of items on the menu */
SELECT COUNT(item_name) FROM menu_items;

/* What are the  most expensive items on the menu?*/
SELECT menu_item_id,menu_items,price
FROM menu_items
ORDER BY price DESC
LIMIT 1;

/* What are the least expensive items on the menu?*/
SELECT menu_item_id,menu_items,price
FROM menu_items
ORDER BY price
LIMIT 1;

/*How many Italian dishes are on the menu?*/ 
Select Count(*) 
from menu_items
where category ='Italian';

--What are the most expensive Italian dishes on the menu

Select * 
from menu_items
where category ='Italian'
Order by price desc
limit 1;


--What are the least expensive Italian dishes on the menu
Select * 
from menu_items
where category ='Italian'
Order by price
limit 1;

--How many dishes are in each category? 
select category,count(*) as all_dishes
from menu_items
group by category
order by all_dishes;

--What is the average dish price within each category?

select category,round(avg(price),1) as Average_Price
from menu_items
group by category
order by Average_price;

--View the order_details table. What is the date range of the table?

select Min(order_date) as Earliest_date, Max(order_date) as Latest_date
from order_details;

--How many orders were made within this date range? How many items were ordered within this date range?

select count(*) as Orders_Made
from order_details
where order_date between '2023-01-01' and '2023-03-31';


--Which orders had the most number of items?

SELECT order_id, COUNT(item_id) AS Total_Items_Ordered
FROM order_details
GROUP BY order_id
ORDER BY Total_Items_Ordered DESC
LIMIT 1;

--Combine the menu_items and order_details tables into a single table
Select m.menu_item_id, m.item_name, m.category, m.price, o.order_details_id, o.order_id, o.order_date, 
  o.order_time, o.item_id
From menu_items m
Join order_details o
on m.menu_item_id = o.item_id

--Not part of the questions. Inputting a CTE clause 
With combinedtable as (
 Select m.menu_item_id, m.item_name, m.category, m.price, o.order_details_id, o.order_id, 
   o.order_date, o.order_time, o.item_id
From menu_items m
Join order_details o
on m.menu_item_id = o.item_id)
Select * from combinedtable;

--What were the most ordered items? What categories were they in?
Select m.menu_item_id, m.item_name, m.category, Count(o.order_id) as total_order
From menu_items m
Join order_details o
on m.menu_item_id = o.item_id
Group by m.menu_item_id, m.category
Order by total_order desc
Limit 3

--What were the least ordered items? What categories were they in?

Select m.menu_item_id, m.item_name, m.category, Count(o.order_id) as total_order
From menu_items m
Join order_details o
on m.menu_item_id = o.item_id
Group by m.menu_item_id, m.category
Order by total_order asc
Limit 3

-- What were the top 5 orders that spent the most money?
Select o.order_id, m.item_name, sum(price) as Total_price
From menu_items m
join order_details o
on m.menu_item_id = o.item_id
Group by o.order_id, m.item_name
Order by Total_price desc
Limit 5

--View the details of the highest spend order. Which specific items were purchased?
Select *
From order_details o
Join menu_items m
on m.menu_item_id = o.item_id
Where order_id = '440'

-- View the details of the top 5 highest spend orders

Select *
From order_details o
Join menu_items m
on m.menu_item_id = o.item_id
where order_id IN (Select order_id
    From menu_items
    Order by SUM(price) desc
    Limit 5)









