USE sakila;

SELECT * FROM actor;

SELECT * FROM address;

SELECT * FROM category;

SELECT * FROM city;

SELECT * FROM country;

SELECT * FROM customer;

SELECT * FROM film;

SELECT * FROM film_actor;

SELECT * FROM film_category;

SELECT * FROM film_text;

SELECT * FROM inventory;

SELECT * FROM language;

SELECT * FROM payment;

SELECT * FROM rental;

SELECT * FROM staff;

SELECT * FROM store;

SELECT title FROM film; /* Select one column from a table. Get film titles.*/

SELECT name as 'movie_language' FROM language; /* 4. Select one column from a table and alias it. Get unique list of film languages under the alias language.*/

SELECT count(store_id) FROM store; /* 5.1 Find out how many stores does the company have */

SELECT staff_id from staff; /* 5.2 Find out how many employees staff does the company have */

SELECT first_name from staff; /* Return a list of employee first names only */