--Using the product_emissions table, find the number of unique companies and their total carbon footprint PCF
--for each industry group, filtering for the most recent year in the database.


SELECT industry_group, 
		count(distinct company) as num_companies, 	
		round(sum(carbon_footprint_pcf), 1) as total_industry_footprint
FROM product_emissions
WHERE year in (select max(year) FROM product_emissions)
GROUP BY  industry_group
ORDER BY total_industry_footprint DESC
