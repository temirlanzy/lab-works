
-- 1. Create database called «lab2»
CREATE DATABASE lab2;

-- 2. Create a simple table countries
CREATE TABLE countries (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(255),
    region_id INT,
    population INT
);

-- 3. Insert a row with any data into the table countries
INSERT INTO countries (country_name, region_id, population) 
VALUES ('Country1', 1, 500000);

-- 4. Insert one row into the table countries against the column country_id and country_name
INSERT INTO countries (country_id, country_name) 
VALUES (2, 'Country2');

-- 5. Insert NULL value to region_id column for a row of countries table
INSERT INTO countries (country_name, region_id, population) 
VALUES ('Country3', NULL, 700000);

-- 6. Insert 3 rows by a single insert statement
INSERT INTO countries (country_name, region_id, population) 
VALUES ('Country4', 2, 900000), 
       ('Country5', 3, 400000), 
       ('Country6', 4, 600000);

-- 7. Set default value ‘Kazakhstan’ to country_name column
ALTER TABLE countries 
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

-- 8. Insert default value to country_name column for a row of countries table
INSERT INTO countries (region_id, population) 
VALUES (5, 800000);

-- 9. Insert only default values against each column of countries table
INSERT INTO countries () 
VALUES ();

-- 10. Create duplicate of countries table named countries_new with all structure using LIKE keyword
CREATE TABLE countries_new LIKE countries;

-- 11. Insert all rows from countries table to countries_new table
INSERT INTO countries_new 
SELECT * FROM countries;

-- 12. Change region_id of country to «1» if it equals NULL
UPDATE countries 
SET region_id = 1 
WHERE region_id IS NULL;

-- 13. Increase population of each country by 10% and return country_name and updated population
SELECT country_name, population * 1.1 AS 'New Population' 
FROM countries;

-- 14. Remove all rows from countries table which has less than 100k population
DELETE FROM countries 
WHERE population < 100000;

-- 15. Remove all rows from countries_new table if country_id exists in countries table, return deleted data
DELETE FROM countries_new 
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;

-- 16. Remove all rows from countries table, return deleted data
DELETE FROM countries
RETURNING *;
