What are The oldest business in the world?


-- Select the oldest and newest founding years from the businesses table
SELECT 
    MIN(year_founded), 
        MAX(year_founded) 
    FROM businesses
		
-- Get the count of rows in businesses where the founding year was before 1000
SELECT count(year_founded) 
    FROM businesses 
        WHERE year_founded <=1000
	
-- Select all columns from businesses where the founding year was before 1000
-- Arrange the results from oldest to newest
SELECT *
    FROM businesses 
        WHERE year_founded <=1000
        ORDER BY Year_founded asc	
	
-- Select business name, founding year, and country code from businesses; and category from categories
-- where the founding year was before 1000, arranged from oldest to newest
SELECT b.business, b.year_founded, b.country_code, c.category
    FROM businesses b
    JOIN categories c
    ON b.category_code = c.category_code
        WHERE year_founded <=1000
        ORDER BY Year_founded ASC
	
-- Select the category and count of category (as "n")
-- arranged by descending count, limited to 10 most common categories
SELECT c.category, count(c.category) as n
FROM businesses as b
INNER JOIN categories as c 
ON b.category_code = c.category_code
GROUP BY c.category
ORDER BY n desc
LIMIT 10	
	
-- Select the oldest founding year (as "oldest") from businesses, 
-- and continent from countries
-- for each continent, ordered from oldest to newest 
SELECT min(b.year_founded) as oldest, c.continent
FROM businesses as b
INNER JOIN countries as c
ON b.country_code = c.country_code
GROUP BY c.continent
ORDER BY oldest ASC	
	
--Select the business, founding year, category, country, and continent
SELECT  b.business, b.year_founded, cat.category, c.country, c.continent
FROM businesses as b
INNER JOIN countries as c
ON b.country_code = c.country_code
INNER JOIN categories as cat
ON b.category_code = cat.category_code	
	

-- Count the number of businesses in each continent and category
SELECT c.continent,  cat.category, count(b.business) as n
FROM businesses as b
INNER JOIN countries as c
ON b.country_code = c.country_code
INNER JOIN categories as cat
ON b.category_code = cat.category_code
GROUP BY cat.category, c.continent
ORDER BY n	
	

-- Repeat that previous query, filtering for results having a count greater than 5
SELECT c.continent,  cat.category, count(b.business) as n
FROM businesses as b
INNER JOIN countries as c
ON b.country_code = c.country_code
INNER JOIN categories as cat
ON b.category_code = cat.category_code
GROUP BY cat.category, c.continent
HAVING count(b.business) >5
ORDER BY n DESC	
	
	
	
	
	
	
	