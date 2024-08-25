# Q1. How many restaurants have a rating greater than 4.5

select count(distinct restaurant_name) as highest_rating
from swiggy
where rating >4.5;

# Q2. Which is the top 1 city with the higest number of restaurents?

select city,count(distinct restaurant_name)as restaurant_count
from swiggy
group by city
order by restaurant_count desc
limit 1;

# Q3. How many restaurants have the word  pizza in the name

select distinct restaurant_name as pizza_restaurant
from swiggy
where restaurant_name like '%pizza%';

# Q4. What is the most common cuisin among the restaurants

select cuisine,count(*) as cuisine_count
from swiggy
group by cuisine
order by cuisine_count desc
limit 1;

# Q5. What is the average rating of restaurant in each city

select restaurant_name, city,round(avg(rating),2)
from swiggy 
group by restaurant_name,city;

# Q6. What is the highest price of the item under the recommended menue category for each restaurant?

select restaurant_name, menu_category, max(price) as max_price 
from swiggy
where menu_category = "Recommended"
group by restaurant_name, menu_category;

# Q7. Find the top 5 most expensive restaurant that offer cuisine other than indian cuisine

select distinct restaurant_name, cost_per_person
from swiggy
where cuisine <> "Indian"
order by cost_per_person desc
limit 5;

# Q8. Find the restaurants that have an average cost which is higher than the total average cost of all restaurants together.

select distinct restaurant_name, cost_per_person
from swiggy 
where cost_per_person>(select avg(cost_per_person)
							from swiggy);
                            
# Q9. Which restaurant offers the most number of items in the main course category

select restaurant_name, menu_category, count(item) as item_count
from swiggy
where menu_category like '%Main Course%'
group by restaurant_name,menu_category
order by item_count desc
limit 1;

# Q10. List the names of restaurants that are 100% vegeatarian in alphabetical order of restaurant name

select distinct restaurant_name,veg_or_non_veg
from swiggy
where veg_or_non_veg ="Veg"
order by restaurant_name;

# 11. Which is the restaurant providing the lowest average price for all items?

select distinct restaurant_name, avg(price) as average_price
from swiggy
group by restaurant_name
order by average_price 
limit 1;

# 12. Which top 5 restaurant offers highest number of categories

select restaurant_name, count(distinct menu_category) as number_of_category
from swiggy
group by restaurant_name
order by number_of_category desc
limit 5;

# 13. Which restaurant provides the highest percentage of non-vegatarian food?

select restaurant_name,
(count(case when veg_or_non_veg ='Non-veg' then 1 end)*100/count(*)) as non_veg_per
from swiggy
group by restaurant_name
order by non_veg_per desc
limit 1;
