--q01
SELECT 
order_id,
customer_id,
item,
amount
from orders
where status = 'pending'
order by order_id;

-----------------------------------------------------
--q02
select
order_id,
customer_id,
item,
status
from orders
where amount is null
order by order_id;


-----------------------------------------------------
--q03
select
order_id,
customer_id,
item,
amount
from orders
where status = 'completed'
order by amount desc,order_id asc
limit 5;

-----------------------------------------------------
--q04
SELECT
customer_id,
first_name,
last_name,
region,
age
FROM customers
WHERE region IN ('North', 'West')
  AND age BETWEEN 25 AND 40
order by age ASC,customer_id ASC;


-----------------------------------------------------
--q05
SELECT
COUNT(*) AS total_orders,
SUM(amount) AS total_revenue,
AVG(amount) AS avg_order_value,
MIN(amount) AS min_order_value,
MAX(amount) AS max_order_value
FROM orders
WHERE status = 'completed';


-----------------------------------------------------	
--q06
SELECT
status,
count(*) as number_of_orders,
sum(amount) as total_amount
from orders
group by status
order by number_of_orders desc;


------------------------------------------------------
--q07
SELECT
item,
COUNT(*) AS number_of_orders,
SUM(amount) AS revenue
FROM orders
WHERE status = 'completed'
GROUP BY item
HAVING SUM(amount) > 20000
ORDER BY revenue DESC;


------------------------------------------------------
--q08
SELECT 
region,
count(customer_id) as number_of_customers,
avg(age) as average_age,
min(age) as min_age,
max(age) as max_age
FROM customers
GROUP BY region
order by region;


------------------------------------------------------
--q09
SELECT
o.order_id,
o.order_month,
c.first_name,
c.last_name,
c.region,
r.rep_name,
o.item,
o.quantity,
o.amount,
o.status
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN reps r
ON c.rep_id = r.rep_id
ORDER BY o.order_id;


--------------------------------------------------------
--q10
SELECT
c.customer_id,
c.first_name,
c.last_name,
c.region
from customers as c
left join orders as o
on c.customer_id = o.customer_id
where o.customer_id is null
order by c.customer_id;
 

---------------------------------------------------------
--q11
-- INNER JOIN is used because the report includes only completed orders.
-- COUNT(DISTINCT customer_id) is necessary so that a customer with
-- multiple orders in the same month is counted only once.

SELECT
c.region,
o.order_month,
COUNT(o.order_id) AS number_of_orders,
COUNT(DISTINCT c.customer_id) AS number_of_customers,
SUM(o.amount) AS total_revenue,
AVG(o.amount) AS average_revenue
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.region, o.order_month
ORDER BY c.region, o.order_month;


---------------------------------------------------------
--q12
SELECT
item,
SUM(amount) AS total_revenue,
CASE
WHEN SUM(amount) >= 60000 THEN 'High'
WHEN SUM(amount) >= 15000 THEN 'Medium'
ELSE 'Low'
END AS contribution_tier
FROM orders
WHERE status = 'completed'
GROUP BY item
ORDER BY total_revenue DESC;


----------------------------------------------------------
--q13
SELECT
r.rep_name,
o.order_month,
r.monthly_target,
SUM(o.amount) AS revenue,
CASE
WHEN SUM(o.amount) < r.monthly_target
THEN 'Below Target'
WHEN SUM(o.amount) < 1.1 * r.monthly_target
THEN 'On Target'
ELSE 'Above Target'
END AS performance_tier
FROM reps AS r
JOIN customers AS c
ON r.rep_id = c.rep_id
JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY
r.rep_name,
o.order_month,
r.monthly_target
ORDER BY
r.rep_name,
o.order_month;

