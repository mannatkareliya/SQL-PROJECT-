create database pizza_store;
use pizza_store;
select * from pizza_sales;

/*1. Total Revenue: The sum of the total price of all pizza orders*/

select round(sum(total_price),2) as totalrevenue from pizza_sales;


/*2. Average Order Value: The average amount spent per order, calculated by 
dividing the total revenue by the total number of orders*/
select round(sum(total_price)/count(order_id),2) as average_order_value 
from pizza_sales;

/*3.Total Pizzas Sold: The sum of the quantities of all pizza sold.*/
select sum(quantity) as total_pizza_sold from pizza_sales;

/*4. Total Orders: The total number of orders placed.*/
select count(order_id) as totalplaced from pizza_sales;

/*5. Average Pizza Per Order: The average number of pizzas sold per order, 
calculated by dividing the total number of pizzas sold by the total number of 
orders.*/
select round(sum(quantity)/count(distinct order_id),2) as 
average_pizza_per_order from pizza_sales;


/*   #CHARTS REQUIREMENT:#
1.Daily trend for total Orders: Create a bar chart that displays the daily trend of 
total orders over a specific time period. This chart will help us identify any 
patterns or fluctuations in order volumes on a daily basis.*/

select order_date ,sum(total_price)
from pizza_sales
group by order_date;

/*2. monthly trend for total orders : create a line chart that illustrates
the hourly trend of total orders throughout that day.This chart will allow
us to identify peak hours or period of high order activity.*/

select extract(hour from order_time) as hourofday ,count(order_id) as total_price
from pizza_sales
group by extract(hour from order_time)
order by hourofday;

/*3. Percentage of Sales by Pizza Category: Create a pie that shows the distribution 
of sales across different pizza categories. This chart will provide insights into 
that popularity of various pizza categories and their contribution to overall 
sales.*/

select pizza_category,round(sum(total_price),2) as category_sales
from pizza_sales
group by pizza_category;

/*4. Percentage of Sales by Pizza Size: generate a pie chart that represents that 
percentage of sales attributed to different pizza sizes. This chart will help us to 
understand customer preferences for pizza sizes and their impact on sales.*/

select pizza_size,round(sum(total_price),2) as pizza_sales
from pizza_sales
group by pizza_size;

/*5. Total Pizza Sold by Pizza Category: Create a funnel chart that presents the total 
number of pizzas sold for each pizza category. This chart will allow us to 
compare the sales performance of different pizza categories.*/

select pizza_category,sum(quantity) as pizza_sold
from pizza_sales
group by pizza_category;

/*#size wise#*/
select pizza_size,sum(quantity) as pizza_sold
from pizza_sales
group by pizza_size;

/*6.Top 5 Best Sellers by Revenue, Total Quantity and Total Orders: Create a bar 
chart highlighting the top 5 best-selling pizza based on the Revenue, Total 
Quantity, Total Orders. This chart will help us identify the most popular pizza 
options.*/

select * from pizza_sales;
select pizza_name_id as pizza_name,round(sum(total_price),2) as revenue
from pizza_sales
group by pizza_name_id 
order by sum(total_price) desc
limit 5;


/* total quantity*/

select pizza_name_id,sum(quantity) as total_quantity
from pizza_sales
group by pizza_name_id 
order by total_quantity desc 
limit 5 ;


/* total orders*/

select pizza_name_id,count(order_id) as total_orders
from pizza_sales
group by pizza_name_id 
order by total_orders
limit 5;




