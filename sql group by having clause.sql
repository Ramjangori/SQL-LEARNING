-- Select the world database
USE world;

-- Display all tables available in the database
SHOW TABLES;

-- Display all records from the country table
SELECT * FROM country;

-- Find total population of all countries
SELECT SUM(population) FROM country;

-- Find total population for each continent
SELECT continent, SUM(population)
FROM country
GROUP BY continent;

-- Find total population for each region
SELECT region, SUM(population)
FROM country
GROUP BY region;

-- Find total population for each region within each continent
SELECT continent, region, SUM(population)
FROM country
GROUP BY continent, region;

-- Find continents having more than 51 countries
SELECT continent, COUNT(name)
FROM country
GROUP BY continent
HAVING COUNT(name) > 51;

-- Find how many countries got independence in each year
SELECT indepyear, COUNT(name)
FROM country
GROUP BY indepyear;

-- Find how many countries got independence for each year in each continent
SELECT continent, indepyear, COUNT(name)
FROM country
GROUP BY continent, indepyear;

-- WHERE clause notes:
-- WHERE is written before GROUP BY
-- WHERE is used to filter table columns (non-aggregate)
-- Aggregate functions are NOT allowed in WHERE

-- HAVING clause notes:
-- HAVING is used to filter results based on aggregate functions
-- HAVING is written after GROUP BY
-- HAVING works on grouped data

-- Find average population of each continent
-- Show only those continents where total population is greater than 500000
SELECT continent, AVG(population)
FROM country
GROUP BY continent
HAVING SUM(population) > 500000;

-- Find average population and total number of countries for each government form
-- Consider only countries that got independence after 1890
-- Show only those government forms having at least 4 countries
SELECT GovernmentForm, AVG(population), COUNT(name)
FROM country
WHERE indepyear > 1890
GROUP BY GovernmentForm
HAVING COUNT(name) >= 4;
