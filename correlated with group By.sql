-- ============================================
-- DATABASE SELECTION
-- ============================================

USE world;



-- ============================================
-- 1️⃣ Get cities whose population is greater
-- than the average population of their country
-- (Correlated Subquery)
-- ============================================

SELECT name, population
FROM city AS c
WHERE population > (
    SELECT AVG(population)
    FROM city
    WHERE countryCode = c.countryCode   -- correlate with outer query
);



-- ============================================
-- 2️⃣ Find the city having maximum population
-- in each country
-- ============================================

SELECT name, population, countryCode
FROM city AS c
WHERE population = (
    SELECT MAX(population)
    FROM city
    WHERE countryCode = c.countryCode   -- compare within same country
);



-- ============================================
-- 3️⃣ Get city name, city population,
-- and country name where city population
-- is greater than average population
-- of that country
-- ============================================

SELECT c.name,
       c.population,
       cn.name AS country_name
FROM city AS c
JOIN country AS cn
     ON cn.code = c.countryCode
WHERE c.population > (
    SELECT AVG(c2.population)
    FROM city AS c2
    WHERE c2.countryCode = c.countryCode
);



-- ============================================
-- 4️⃣ Count number of countries in South America
-- ============================================

SELECT COUNT(name) AS south_america_country_count
FROM country
WHERE continent = 'South America';



-- ============================================
-- 5️⃣ Get continents having total number
-- of countries greater than South America
-- ============================================

SELECT continent,
       COUNT(name) AS total_country
FROM country
GROUP BY continent
HAVING COUNT(name) > (
    SELECT COUNT(name)
    FROM country
    WHERE continent = 'South America'
);



-- ============================================
-- PRACTICE QUERIES
-- ============================================


-- Q1️⃣ Total salary per department

SELECT department,
       SUM(salary) AS total_salary
FROM employee
GROUP BY department;



-- Q2️⃣ Count employees per department

SELECT department,
       COUNT(name) AS total_employee
FROM employee
GROUP BY department;



-- Q3️⃣ Get substring from 3rd character
-- and convert to uppercase

SELECT UPPER(SUBSTR(name, 3)) AS modified_name
FROM employee;



-- Q4️⃣ Get names having exactly 6 characters
-- Each underscore (_) represents one character

SELECT name
FROM employee
WHERE name LIKE '______';



-- Q5️⃣ Get employees who joined after 30 Nov 2020

SELECT name
FROM employee
WHERE join_date >= '2020-11-30';



-- Q6️⃣ Calculate experience in years
-- (Correct way using MySQL function)

SELECT TIMESTAMPDIFF(YEAR, join_date, CURDATE()) AS experience_years
FROM employee;



-- Q7️⃣ Round salary to 2 decimal places

SELECT ROUND(salary, 2) AS rounded_salary
FROM employee;