-- ============================================================
-- SUBQUERY (Nested Query / Inner Query)
-- ============================================================

-- Definition:
-- A Subquery is a query written inside another SQL query.
-- It is also called Nested Query or Inner Query.

-- Structure:
-- 1. Outer Query  → Main query
-- 2. Inner Query  → Subquery (executed first)

-- Execution Flow:
-- Inner query executes first.
-- Its result is passed to the outer query.
-- Outer query executes based on inner query result.

-- Types:
-- 1. Single Row Subquery  (=, >, <, >=, <=)
-- 2. Multi Row Subquery   (IN, ANY, ALL)
-- 3. Correlated Subquery  (depends on outer query row-by-row)

-- ============================================================
-- DATABASE USED
-- ============================================================

USE world;

-- ============================================================
-- BASIC SUBQUERY EXAMPLES (Single Row Subquery)
-- ============================================================

-- 1. Get cities whose countrycode is same as city 'SILANG'

SELECT name, countrycode 
FROM city
WHERE countrycode = (
        SELECT countrycode 
        FROM city 
        WHERE name = 'SILANG'
);

-- Concept:
-- Inner query returns one countrycode.
-- Outer query fetches all cities with that countrycode.

---------------------------------------------------------------

-- 2. Get cities whose population is greater than city 'Oran'

SELECT name, countrycode, population
FROM city
WHERE population > (
        SELECT population 
        FROM city 
        WHERE name = 'Oran'
);

-- Concept:
-- Comparison subquery using > operator.

---------------------------------------------------------------

-- 3. Get all cities where district is same as 'Tafuna'

SELECT *
FROM city
WHERE district = (
        SELECT district
        FROM city
        WHERE name = 'Tafuna'
);

-- Concept:
-- Matching column value dynamically using subquery.

---------------------------------------------------------------

-- 4. Get city name and district where district is same as 'Americana'

SELECT name, district
FROM city
WHERE district = (
        SELECT district
        FROM city
        WHERE name = 'Americana'
);

---------------------------------------------------------------

-- 5. Get cities where population is less than 'Barueri'

SELECT name, population
FROM city
WHERE population < (
        SELECT population
        FROM city
        WHERE name = 'Barueri'
);

---------------------------------------------------------------

-- ============================================================
-- SUBQUERY ON COUNTRY TABLE
-- ============================================================

-- 6. Get countries where continent is same as 'Albania'

SELECT code, name
FROM country
WHERE continent = (
        SELECT continent
        FROM country
        WHERE name = 'Albania'
);

-- Concept:
-- Dynamic filtering instead of hardcoding continent.

---------------------------------------------------------------

-- 7. Get countries whose independence year is after 'Afghanistan'

SELECT *
FROM country
WHERE indepYear > (
        SELECT indepYear
        FROM country
        WHERE name = 'Afghanistan'
);

-- Concept:
-- Numeric comparison using subquery.

---------------------------------------------------------------

-- 8. Get countries where:
--    Region is same as Belgium
--    AND Independence year > 1800

SELECT name, continent, region, population
FROM country
WHERE region = (
        SELECT region
        FROM country
        WHERE name = 'Belgium'
)
AND indepYear > 1800;

-- Concept:
-- Subquery combined with AND condition.

---------------------------------------------------------------

-- ============================================================
-- IMPORTANT INTERVIEW POINTS
-- ============================================================

-- 1. Subquery must return:
--    • Single value (for =, >, <)
--    • Multiple values (for IN)

-- 2. If subquery returns multiple rows with "=" → ERROR

-- 3. Subquery can be used in:
--    • SELECT
--    • WHERE
--    • FROM
--    • HAVING

-- 4. Subquery is slower than JOIN in large datasets.

-- 5. JOIN is generally preferred for performance.

-- ============================================================
-- PERFORMANCE NOTE
-- ============================================================

-- Always prefer JOIN when:
-- • Data comes from related tables
-- • Large datasets are involved
-- • You need better optimization

-- Subquery is useful when:
-- • Logical clarity is required
-- • Complex filtering
-- • Aggregate comparisons

--  the city name and the countrycode where the country code should be same as of Ede city 
select name , countrycode from city 
   where countrycode in   (
       select distinct countrycode from city
           where name='Ede');
           
-- corelated and multirow assignment 
 