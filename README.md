### 1. View the menu_items table and write a query to find the number of items on the menu

```sql
SELECT COUNT(*) FROM menu_items;

SELECT COUNT(menu_item_id) FROM menu_items;
```

--2.What are the least and most expensive items on the menu?
SELECT * FROM menu_items
ORDER BY price;

SELECT * FROM menu_items
ORDER BY price DESC;

--3. How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?
SELECT COUNT(category) FROM menu_items
WHERE category = 'Italian'
;

SELECT * FROM menu_items
WHERE category = 'Italian'
ORDER BY price;

SELECT * FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC;

--4. How many dishes are in each category? What is the average dish price within each category?

SELECT COUNT(item_name) AS dish_count, category
FROM menu_items
GROUP BY category;

SELECT category, ROUND(AVG(price),2)  AS Average_dish_price FROM menu_items
GROUP  BY category
ORDER BY AVG(price) DESC;

--5. View the order_details table. What is the date range of the table?

SELECT * FROM order_details;

SELECT MIN(order_date) AS start_date, MAX(order_date) AS end_date FROM order_details;

--6. How many orders were made within this date range?

SELECT DISTINCT COUNT(order_id) AS Total_Order FROM order_details;

--7. How many items were ordered within this date range?
SELECT menu_item_id, COUNT(item_id)
FROM menu_items m
JOIN order_details o
ON m.menu_item_id = o.item_id
GROUP BY menu_item_id;

SELECT COUNT(item_id) AS Total_item_ordered
FROM order_details;

--8. Which orders had the most number of items?

SELECT order_id, COUNT(item_id)
FROM order_details
GROUP BY order_id
ORDER BY COUNT(item_id) DESC;


--9. How many orders had more than 12 items?

SELECT order_id, COUNT(item_id)
FROM order_details
GROUP BY order_id
HAVING COUNT(item_id) > 12
ORDER BY COUNT(item_id) DESC;

--10. Combine the menu_items and order_details tables into a single table
SELECT * FROM 
menu_items m
INNER JOIN order_details o
ON m.menu_item_id = o.item_id;

--11. What were the least and most ordered items? What categories were they in?

SELECT m.category, m.item_name, COUNT(o.order_id) 
FROM menu_items m
JOIN order_details o
ON m.menu_item_id = o.item_id
GROUP BY m.category, m.item_name
ORDER BY COUNT(order_id) ASC
FETCH FIRST 5 ROWS ONLY;

SELECT m.category, m.item_name, COUNT(o.order_id) 
FROM menu_items m
JOIN order_details o
ON m.menu_item_id = o.item_id
GROUP BY m.category, m.item_name
ORDER BY COUNT(order_id) DESC
FETCH FIRST 5 ROWS ONLY;


--12. What were the top 5 orders that spent the most money?
SELECT o.order_id, SUM(m.price)
FROM menu_items m
JOIN order_details o
ON m.menu_item_id = o.item_id
GROUP BY o.order_id 
ORDER BY SUM(price) DESC
FETCH FIRST 5 ROWS ONLY;

-- 13. View the details of the highest spend order. Which specific items were purchased?
SELECT *
FROM menu_items m
JOIN order_details o
ON m.menu_item_id = o.item_id
WHERE order_id = 440;


---14. View the details of the top 5 highest spend orders

SELECT *
FROM menu_items m
JOIN order_details o
ON m.menu_item_id = o.item_id
WHERE order_id IN(440,2075,1957,330,2675);
