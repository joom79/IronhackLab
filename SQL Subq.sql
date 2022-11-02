#n this lab, you will be using the Sakila database of movie rentals. Create appropriate joins wherever necessary.

#Instructions

# 1. List all films whose length is longer than the average of all the films.
use sakila;
select avg(length) from sakila.film;

select * from sakila.film 
WHERE length > (select avg(length) from sakila.film); 

# 2. How many copies of the film Hunchback Impossible exist in the inventory system?
select count(film_id) from sakila.inventory
WHERE film_id = (select film_id from sakila.film 
	where title like "Hunchback Impossible");
#Answer: There are 6 copies of said movie.

# 3. Use subqueries to display all actors who appear in the film Alone Trip.
select film_id from sakila.film 
	where title like "Alone Trip";
    
select first_name, last_name from actor
where actor_id in (
		select actor_id from film_actor
		where  film_id = (
				select film_id from film
				where title = "Alone Trip"
      ));

# 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
#Identify all movies categorized as family films.

select title from sakila.film
where film_id in (select film_id from sakila.film_category
	where category_id = (select category_id from sakila.category
		where `name` like "Family"));


# 5. Get name and email from customers from Canada using subqueries. Do the same with joins. 
# Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
select first_name, last_name, email from customer
where address_id in (select address_id from address
where city_id in (select city_id from sakila.city
where country_id = (select country_id from sakila.country
	where country like "Canada")));
    
select first_name, last_name, email from sakila.customer as whatever1
inner join sakila.address as whatever2 using (address_id)
inner join sakila.city as whatever3 using (city_id)
inner join sakila.country as whatever4 using (country_id)
where country = "Canada";


# Optional

# 6. Which are films starred by the most prolific actor? 
# Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

# 7. Films rented by most profitable customer. 
# You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments

# 8. Customers who spent more than the average payments(this refers to the average of all amount spent per each customer).
