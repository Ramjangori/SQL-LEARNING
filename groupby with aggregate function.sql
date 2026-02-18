-- Switch to world database
USE world;

-- View all countries
SELECT * FROM country;

-- View all cities
SELECT * FROM city;

-- Get country name, city name and total population per city
-- JOIN country and city using country code
-- GROUP BY is required because SUM() is used
SELECT cn.name, c.name, SUM(c.population)
FROM country AS cn
JOIN city AS c 
ON c.CountryCode = cn.Code
GROUP BY cn.name, c.name;


-- Get country name and total population per district
-- Grouping at district level inside each country
SELECT cn.name, c.district, SUM(c.population)
FROM city AS c
JOIN country AS cn 
ON c.countrycode = cn.code
GROUP BY cn.name, c.district;


-- Get region, country name, district and total population
-- Multi-level grouping (Region → Country → District)
SELECT cn.Region, cn.name, c.district, SUM(c.population)
FROM city AS c
JOIN country AS cn  
ON c.countrycode = cn.code 
GROUP BY cn.Region, cn.name, c.district;


-- View all country languages
SELECT * FROM countrylanguage;

-- Get total population for each language spoken
-- NOTE: This sums entire country population for each language
-- If a country has multiple languages, population will repeat
SELECT lang.language, SUM(cn.population)
FROM country AS cn
JOIN countrylanguage AS lang 
ON cn.code = lang.countrycode
GROUP BY lang.language;


-- Get total population grouped by language and official status
-- Must include isOfficial in GROUP BY since it is selected
SELECT lang.language, lang.isOfficial, SUM(cn.population)
FROM country AS cn
JOIN countrylanguage AS lang 
ON cn.code = lang.countrycode
GROUP BY lang.language, lang.isOfficial;
-- Switch to sakila database
USE sakila;

-- Show all tables
SHOW TABLES;

-- View film_actor table (many-to-many relationship table)
SELECT * FROM film_actor;

-- View actor table
SELECT * FROM actor;

-- Get actor id, actor name and total number of movies
-- COUNT() used to count films per actor
-- GROUP BY actor_id because aggregation is used
SELECT ac.actor_id, ac.first_name, COUNT(f.film_id)
FROM actor AS ac
JOIN film_actor AS f 
ON ac.actor_id = f.actor_id 
GROUP BY ac.actor_id, ac.first_name;


-- View film table
SELECT * FROM film;

-- If asked:
-- Get actor name, film rating and average film length per actor
-- Must join actor → film_actor → film
-- GROUP BY actor and rating

/*
SELECT ac.first_name, f.rating, AVG(f.length)
FROM actor ac
JOIN film_actor fa ON ac.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
GROUP BY ac.first_name, f.rating;
*/
