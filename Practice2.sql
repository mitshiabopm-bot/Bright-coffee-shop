---Exploratory data analysis---

--To check all the columns lines in my data--
--to check the data type in my data--

select*
From Bright.Coffee.Shop
limit 10;

--I want to check my categorical column--

select distinct store_id
From bright.coffee.shop;

select distinct store_location
From bright.coffee.shop;

select distinct product_category
From bright.coffee.shop;

select distinct product_type
From bright.coffee.shop;

---checking transaction_time---

SELECT min(transaction_time) as opening_hour
From bright.coffee.shop;

SELECT max(transaction_time) as closing_hour
From bright.coffee.shop;

---checking transaction_date---


SELECT max(transaction_date) as last_operating_date
From bright.coffee.shop;

SELECT min(transaction_date) as first_operating_date
From bright.coffee.shop;

SELECT min(transaction_time) as opening_time
From bright.coffee.shop;

SELECT max(transaction_date) as last_operating_date
From bright.coffee.shop;

SELECT max(transaction_time) as closing_operating_date
From bright.coffee.shop;

select transaction_date,
        dayname(transaction_date) as day_name,
        case
         when day_name in ('Sun','Sat') then 'weekend'
        else 'weekday'
        end as day_classification
From bright.coffee.shop;

        
       
----------------------------------------------------------------------------------------------------

---Case_study---

select transaction_date,
        dayname(transaction_date) as day_name,
        Case
        when dayname(transaction_date) in ('Sun','Sat')Then'weekend'
        ELSE'weekday'
        end as day_classification, 
        monthname(transaction_date) as month_name,
        transaction_time,
        case
        when(transaction_time) between '06:00:00' and '09:00:00'then 'early_morning'
        when(transaction_time) between '09:00:01' and '11:59:59'then 'late_morning' 
        when(transaction_time) between '12:00:00' and '15:00:00'then 'early_afternoon'
        when(transaction_time) between '15:00:01' and '16:59:59'then 'late_afternoon' 
        when(transaction_time) >= '17:00:00'then 'evening'
        end as time_bucket,
        hour(transaction_time) as hour_of_day,
        store_location,
        product_category,
        product_detail,
        product_type,
        transaction_qty,
        unit_price,
        transaction_qty*unit_price as revenue
From bright.coffee.shop;
