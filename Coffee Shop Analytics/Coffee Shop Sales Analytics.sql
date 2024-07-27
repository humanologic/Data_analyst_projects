-- Create Database -- 
create database coffee_database_db;

-- Select all the value from the table --  
select * from coffee_shop_sales

-- Describe the variables from the table --  
describe coffee_shop_sales

-- Convert the transaction_date from text into date --  
update coffee_shop_sales
set transaction_date = str_to_date(transaction_date, '%Y-%m-%d');
alter table coffee_shop_sales
modify column transaction_date date;

describe coffee_shop_sales

-- Convert the transaction_time from text into time -- 
update coffee_shop_sales
set transaction_time = str_to_date(transaction_time, '%H:%i:%s');
alter table coffee_shop_sales
modify column transaction_time time;

-- Calculate the total sales for each respective month --
-- January 
select concat(round(sum(unit_price * transaction_qty)/1000, 1), "K") as total_sales
from coffee_shop_sales
where month(transaction_date) = 1
-- February 
select concat(round(sum(unit_price * transaction_qty)/1000, 1), "K") as total_sales
from coffee_shop_sales
where month(transaction_date) = 2
-- March
select concat(round(sum(unit_price * transaction_qty)/1000, 1), "K") as total_sales
from coffee_shop_sales
where month(transaction_date) = 3
-- April
select concat(round(sum(unit_price * transaction_qty)/1000, 1), "K") as total_sales
from coffee_shop_sales
where month(transaction_date) = 4
-- May
select concat(round(sum(unit_price * transaction_qty)/1000, 1), "K") as total_sales
from coffee_shop_sales
where month(transaction_date) = 5
-- June 
select concat(round(sum(unit_price * transaction_qty)/1000, 1), "K") as total_sales
from coffee_shop_sales
where month(transaction_date) = 6

-- Calculate the difference in total sales between the selected month and the previous month --
-- Difference between February and January
select
	month(transaction_date) as month, -- Number of month 
    round(sum(unit_price * transaction_qty)) as total_sales, -- Total sales column
    (sum(unit_price * transaction_qty) - lag(sum(unit_price * transaction_qty), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(sum(unit_price * transaction_qty), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (1, 2) -- For months of January and February
group by
	month(transaction_date)
order by
	month(transaction_date);
-- Difference between March and February
select
	month(transaction_date) as month, -- Number of month 
    round(sum(unit_price * transaction_qty)) as total_sales, -- Total sales column
    (sum(unit_price * transaction_qty) - lag(sum(unit_price * transaction_qty), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(sum(unit_price * transaction_qty), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (2, 3) -- For months of February and March
group by
	month(transaction_date)
order by
	month(transaction_date);
-- Difference between April and March
select
	month(transaction_date) as month, -- Number of month 
    round(sum(unit_price * transaction_qty)) as total_sales, -- Total sales column
    (sum(unit_price * transaction_qty) - lag(sum(unit_price * transaction_qty), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(sum(unit_price * transaction_qty), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (3, 4) -- For months of March and April
group by
	month(transaction_date)
order by
	month(transaction_date);
-- Difference between May and April 
select
	month(transaction_date) as month, -- Number of month 
    round(sum(unit_price * transaction_qty)) as total_sales, -- Total sales column
    (sum(unit_price * transaction_qty) - lag(sum(unit_price * transaction_qty), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(sum(unit_price * transaction_qty), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (4, 5) -- For months of April and May
group by
	month(transaction_date)
order by
	month(transaction_date);
-- Difference between June and May
select
	month(transaction_date) as month, -- Number of month 
    round(sum(unit_price * transaction_qty)) as total_sales, -- Total sales column
    (sum(unit_price * transaction_qty) - lag(sum(unit_price * transaction_qty), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(sum(unit_price * transaction_qty), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (5, 6) -- For months of May and June
group by
	month(transaction_date)
order by
	month(transaction_date);

-- Calculate the total number of orders for each respective month --
-- January
select count(transaction_id) as total_orders
from coffee_shop_sales
where month(transaction_date) = 1
-- February
select count(transaction_id) as total_orders
from coffee_shop_sales
where month(transaction_date) = 2
-- March
select count(transaction_id) as total_orders
from coffee_shop_sales
where month(transaction_date) = 3
-- April
select count(transaction_id) as total_orders
from coffee_shop_sales
where month(transaction_date) = 4
-- May
select count(transaction_id) as total_orders
from coffee_shop_sales
where month(transaction_date) = 5
-- June
select count(transaction_id) as total_orders
from coffee_shop_sales
where month(transaction_date) = 6

-- Calculate the difference in total orders between the selected month and the previous month --
-- Difference between February and January
select
	month(transaction_date) as month, -- Number of month 
    round(count(transaction_id)) as total_orders, -- Total orders column
    (count(transaction_id) - lag(count(transaction_id), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(count(transaction_id), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (1, 2) -- For months of January and February
group by
	month(transaction_date)
order by
	month(transaction_date);
-- Difference between March and February
select
	month(transaction_date) as month, -- Number of month 
    round(count(transaction_id)) as total_orders, -- Total orders column
    (count(transaction_id) - lag(count(transaction_id), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(count(transaction_id), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (2, 3) -- For months of February and March
group by
	month(transaction_date)
order by
	month(transaction_date);
-- Difference between April and March
select
	month(transaction_date) as month, -- Number of month 
    round(count(transaction_id)) as total_orders, -- Total orders column
    (count(transaction_id) - lag(count(transaction_id), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(count(transaction_id), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (3, 4) -- For months of March and April
group by
	month(transaction_date)
order by
	month(transaction_date);
-- Difference between May and April 
select
	month(transaction_date) as month, -- Number of month 
    round(count(transaction_id)) as total_orders, -- Total orders column
    (count(transaction_id) - lag(count(transaction_id), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(count(transaction_id), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (4, 5) -- For months of April and May
group by
	month(transaction_date)
order by
	month(transaction_date);
-- Difference between June and May
select
	month(transaction_date) as month, -- Number of month 
    round(count(transaction_id)) as total_orders, -- Total orders column
    (count(transaction_id) - lag(count(transaction_id), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(count(transaction_id), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (5, 6) -- For months of May and June
group by
	month(transaction_date)
order by
	month(transaction_date);
    
-- Calculate the total quantity for each respective month --
select sum(transaction_qty) as total_quantity_sold
from coffee_shop_sales
where month(transaction_date) = 1
-- February
select sum(transaction_qty) as total_quantity_sold
from coffee_shop_sales
where month(transaction_date) = 2
-- March
select sum(transaction_qty) as total_quantity_sold
from coffee_shop_sales
where month(transaction_date) = 3
-- April
select sum(transaction_qty) as total_quantity_sold
from coffee_shop_sales
where month(transaction_date) = 4
-- May
select sum(transaction_qty) as total_quantity_sold
from coffee_shop_sales
where month(transaction_date) = 5
-- June
select sum(transaction_qty) as total_quantity_sold
from coffee_shop_sales
where month(transaction_date) = 6

-- Calculate the difference in total quantities between the selected month and the previous month --
-- Difference between February and January
select
	month(transaction_date) as month, -- Number of month 
    round(sum(transaction_qty)) as total_quantity_sold, -- Total orders column
    (sum(transaction_qty) - lag(sum(transaction_qty), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(sum(transaction_qty), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (1, 2) -- For months of January and February
group by
	month(transaction_date)
order by
	month(transaction_date);
-- Difference between March and February
select
	month(transaction_date) as month, -- Number of month 
    round(sum(transaction_qty)) as total_quantity_sold, -- Total orders column
    (sum(transaction_qty) - lag(sum(transaction_qty), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(sum(transaction_qty), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (2, 3) -- For months of February and March
group by
	month(transaction_date)
order by
	month(transaction_date);
-- Difference between April and March
select
	month(transaction_date) as month, -- Number of month 
    round(sum(transaction_qty)) as total_quantity_sold, -- Total orders column
    (sum(transaction_qty) - lag(sum(transaction_qty), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(sum(transaction_qty), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (3, 4) -- For months of March and April
group by
	month(transaction_date)
order by
	month(transaction_date);
-- Difference between May and April 
select
	month(transaction_date) as month, -- Number of month 
    round(sum(transaction_qty)) as total_quantity_sold, -- Total orders column
    (sum(transaction_qty) - lag(sum(transaction_qty), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(sum(transaction_qty), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (4, 5) -- For months of April and May
group by
	month(transaction_date)
order by
	month(transaction_date);
-- Difference between June and May
select
	month(transaction_date) as month, -- Number of month 
    round(sum(transaction_qty)) as total_quantity_sold, -- Total orders column
    (sum(transaction_qty) - lag(sum(transaction_qty), 1) -- Month sales difference 
    over (order by month(transaction_date))) / lag(sum(transaction_qty), 1) -- Divided by previous month sales 
    over (order by month(transaction_date)) * 100 as mom_increase_percentage -- Coverted to percentage 
from
	coffee_shop_sales
where
	month(transaction_date) in (5, 6) -- For months of May and June
group by
	month(transaction_date)
order by
	month(transaction_date);
    
-- Find out the total sales, total orders, and total quantites from selective date --
select
	concat(round(sum(unit_price * transaction_qty)/1000, 1), "K") as total_sales,
    concat(round(count(transaction_id)/1000, 1), "K") as total_orders,
    concat(round(sum(transaction_qty)/1000, 1), "K") as total_quantity_sold
from coffee_shop_sales
where
	transaction_date = '2023-01-01'
    
-- Calculating total sales for weekend and weekday in every month --
select
	case when dayofweek(transaction_date) in (1,7) then 'weekends'
    else 'weekdays'
    end as day_type,
    concat(round(sum(unit_price * transaction_qty)/1000, 1), "K") as total_sales
from coffee_shop_sales
where month(transaction_date) = 5
group by day_type
    
-- Calculating total sales for every month based on location --
select
	store_location,
    concat(round(sum(unit_price * transaction_qty)/1000, 1), "K") as total_sales
from coffee_shop_sales
where month(transaction_date) = 5
group by store_location
order by total_sales desc

-- Calculating average of total sales for every month --
select concat(round(avg(total_sales)/1000, 1), "K") as avg_sales
from 
	(
	select sum(unit_price * transaction_qty) as total_sales
	from coffee_shop_sales
	where month(transaction_date) = 5
	group by transaction_date
	) as internal_quary
    
-- Calculating total sales for every day of month --
Select
	day(transaction_date) as day_of_month,
    concat(round(sum(unit_price * transaction_qty)/1000, 2), "K") as total_sales
from coffee_shop_sales
where month(transaction_date) = 5
group by day(transaction_date)
order by day(transaction_date)

-- Comparing the average sales by total sales every day in one month --
select
	day_of_month,
    case
		when total_sales > avg_sales then 'Above average'
        when total_sales < avg_sales then 'Below average'
        else 'Equal to average'
	end as sales_status,
    total_sales
from
	(
    select
		day(transaction_date) as day_of_month,
        sum(unit_price * transaction_qty) as total_sales,
        avg(sum(unit_price * transaction_qty)) over () as avg_sales
	from coffee_shop_sales
    where month(transaction_date) = 5
    group by day(transaction_date)
    ) as sales_data
order by day_of_month;

-- Calculating total sales for every month based on product category --
select
	product_category,
    sum(unit_price * transaction_qty) as total_sales
from coffee_shop_sales
where month(transaction_date) = 5
group by product_category
order by total_sales desc

-- Find out best 10 total sales for every month based on product type --
select
	product_type,
    sum(unit_price * transaction_qty) as total_sales
from coffee_shop_sales
where month(transaction_date) = 5 and product_category = 'Coffee'
group by product_type
order by total_sales desc
limit 10

-- Calculating total sales by days and hours --
select
	sum(unit_price * transaction_qty) as total_sales,
    sum(transaction_qty) as total_quantity_sold,
    count(*) as total_orders
from coffee_shop_sales
where month(transaction_date) = 5 -- This number represented month
and dayofweek(transaction_date) = 2 -- This number represented day
and hour(transaction_time) = 8 -- This number represented hour

-- Calculating total sales in each hours --
select
	hour(transaction_time),
    sum(unit_price * transaction_qty) as total_sales
from coffee_shop_sales
where month(transaction_date) = 5
group by hour(transaction_time)
order by hour(transaction_time)

-- Calculating total sales in each days --
select
	case
		when dayofweek(transaction_date) = 2 then 'Monday'
        when dayofweek(transaction_date) = 3 then 'Tuesday'
        when dayofweek(transaction_date) = 4 then 'Wednesday'
        when dayofweek(transaction_date) = 5 then 'Thursday'
        when dayofweek(transaction_date) = 6 then 'Friday'
        when dayofweek(transaction_date) = 7 then 'Saturday'
        else 'Sunday'
	end as day_of_week,
    round(sum(unit_price * transaction_qty)) as total_sales
from coffee_shop_sales
where month(transaction_date) = 5
group by day_of_week