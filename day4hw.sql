--QUESTION 1.List all customers who live in Texas (use JOINs)

--SELECT first_name, last_name, district 
--FROM customer 
--JOIN address 
--ON customer.address_id = address.address_id
--WHERE district LIKE 'Texas';

--first_name|last_name|district|
----------+---------+--------+
--Jennifer  |Davis    |Texas   |
--Richard   |Mccrary  |Texas   |
--Bryan     |Hardison |Texas   |
--Ian       |Still    |Texas   |
--Kim       |Cruz     |Texas   |

--QUESTION 2. List all payments of more than $7.00 with the customer’s first and last name

--SELECT first_name, last_name, amount 
--FROM customer 
--JOIN payment 
--ON payment.customer_id = customer.customer_id
--WHERE amount >= 7.00

--  first_name|last_name  |amount|
----------+-----------+------+
--Peter     |Menard     |  7.99|
--Peter     |Menard     |  7.99|
--Peter     |Menard     |  7.99|
--Douglas   |Graf       |  8.99|
--Ryan      |Salisbury  |  8.99|
--Ryan      |Salisbury  |  8.99|
--Ryan      |Salisbury  |  7.99|
--Roger     |Quintanilla|  8.99|
--Joe       |Gilliland  |  8.99|
--Jonathan  |Scarborough|  7.99|
--Harry     |Arce       |  9.99|


--QUESTION 3. Show all customer names who have made over $175 in payments (use subqueries)

--SELECT first_name, last_name, SUM(amount)
--FROM payment 
--JOIN customer 
--ON payment.customer_id = customer.customer_id 
--GROUP BY first_name, last_name
--HAVING SUM(amount) >= 175;
--
--
--SELECT first_name, last_name, total_amount
--FROM (
--  SELECT customer_id, SUM(amount) AS total_amount
--  FROM payment 
--  GROUP BY customer_id
--  HAVING SUM(amount) >= 175
--) AS payment_totals
--JOIN customer 
--ON payment_totals.customer_id = customer.customer_id;
--first_name|last_name|total_amount|
------------+---------+------------+
--Rhonda    |Kennedy  |      191.62|
--Clara     |Shaw     |      189.60|
--Eleanor   |Hunt     |      211.55|
--Marion    |Snyder   |      194.61|
--Tommy     |Collazo  |      183.63|
--Karl      |Seal     |      208.58|

--QUESTION 4. List all customers that live in Argentina (use the city table)

--SELECT customer.first_name, customer.last_name, country.country
--FROM customer
--JOIN address 
--ON customer.address_id = address.address_id
--JOIN city 
--ON city.city_id = address.city_id
--JOIN country 
--ON country.country_id = city.country_id
--WHERE country = 'Argentina';
--
--first_name|last_name|country  |
------------+---------+---------+
--Willie    |Markham  |Argentina|
--Jordan    |Archuleta|Argentina|
--Jason     |Morrissey|Argentina|
--Kimberly  |Lee      |Argentina|
--Micheal   |Forman   |Argentina|
--Darryl    |Ashcraft |Argentina|
--Julia     |Flores   |Argentina|
--Florence  |Woods    |Argentina|
--Perry     |Swafford |Argentina|
--Lydia     |Burke    |Argentina|
--Eric      |Robert   |Argentina|
--Leonard   |Schofield|Argentina|
--Willie    |Howell   |Argentina|


--QUESTION 5. Show all the film categories with their count in descending order

--SELECT  category.category_id ,"name" , COUNT(film) AS num_of_film_cat
--FROM category
--JOIN film_category
--ON category.category_id = film_category.category_id
--JOIN film 
--ON film.film_id = film_category.film_id 
--GROUP BY category.category_id, "name"
--ORDER BY num_of_film_cat DESC;
--
--category_id|name       |num_of_film_cat|
-------------+-----------+---------------+
--         15|Sports     |             74|
--          9|Foreign    |             73|
--          8|Family     |             69|
--          6|Documentary|             68|
--          2|Animation  |             66|
--          1|Action     |             64|
--         13|New        |             63|
--          7|Drama      |             62|
--         14|Sci-Fi     |             61|
--         10|Games      |             61|
--          3|Children   |             60|
--          5|Comedy     |             58|
--          4|Classics   |             57|
--         16|Travel     |             57|
--         11|Horror     |             56|
--         12|Music      |             51|



--QUESTION 6. What film had the most actors in it (show film info)?

--SELECT film_actor.film_id, film.title, COUNT(actor.actor_id) AS numactor
--FROM film 
--JOIN film_actor 
--ON film.film_id = film_actor.film_id 
--JOIN actor 
--ON actor.actor_id = film_actor.actor_id 
--GROUP BY film_actor.film_id, film.title
--ORDER BY numactor DESC 
--
--film_id|title                      |numactor|
---------+---------------------------+--------+
--    508|Lambs Cincinatti           |      15|



--QUESTION 7. Which actor has been in the least movies?

--SELECT film_actor.actor_id, first_name, last_name, COUNT(film)
--FROM film 
--JOIN film_actor 
--ON film.film_id = film_actor.film_id 
--JOIN actor 
--ON actor.actor_id = film_actor.actor_id 
--GROUP BY film_actor.actor_id, first_name, last_name
--ORDER BY COUNT(film) ASC;
--
--actor_id|first_name |last_name   |count|
----------+-----------+------------+-----+
--     148|Emily      |Dee         |   14|



--QUESTION 8. Which country has the most cities?

--SELECT city.country_id, country, COUNT(city) AS num_cities
--FROM country 
--JOIN city 
--ON country.country_id = city.country_id
--GROUP BY country, city.country_id 
--ORDER BY COUNT(city) DESC 
--
--country_id|country                              |num_cities|
------------+-------------------------------------+----------+
--        44|India                                |        60|
--        23|China                                |        53|
--       103|United States                        |        35|


--QUESTION 9.List the actors who have been in between 20 and 25 films.

--SELECT film_actor.actor_id, first_name, last_name, COUNT(film)
--FROM film 
--JOIN film_actor 
--ON film.film_id = film_actor.film_id 
--JOIN actor 
--ON actor.actor_id = film_actor.actor_id 
--GROUP BY film_actor.actor_id, first_name, last_name
--HAVING count(film) BETWEEN 20 AND 25
--
--
--actor_id|first_name |last_name  |count|
----------+-----------+-----------+-----+
--     114|Morgan     |Mcdormand  |   25|
--     153|Minnie     |Kilmer     |   20|
--      32|Tim        |Hackman    |   23|
--     132|Adam       |Hopper     |   22|
--      46|Parker     |Goldberg   |   24|
--     163|Christopher|West       |   21|
--      10|Christian  |Gable      |   22|
--     138|Lucille    |Dee        |   24|
--     112|Russell    |Bacall     |   25|
--     189|Cuba       |Birch      |   24|































