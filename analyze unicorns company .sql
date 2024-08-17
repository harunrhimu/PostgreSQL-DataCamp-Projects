--Your task is to first identify the three best-performing industries based on the number of new unicorns created in 2019, 2020, and 2021 combined.

--From those industries (1), you will need to find the number of unicorns within these industries (2), the year that they became a unicorn (3), 
--and their average valuation, converted to billions of dollars and rounded to two decimal places (4).

--With the above information you can then finish your query to return a table containing industry, year, num_unicorns, and average_valuation_billions. 
--For readability, the firm have asked you to sort your results by year and number of unicorns, both in descending order.

yearly_rankings AS 
(
	SELECT 
		COUNT(i.*) as num_unicorns, 
			i.industry,
			EXTRACT (year from d.date_joined) as year, 	
				avg(f.valuation) as average_valuation
	FROM industries as i 	 
	JOIN dates as d					
	ON i.company_id = d.company_id	 					 
	JOIN funding as f 
	ON d.company_id = f.company_id
	GROUP BY industry, year),
	
	SELECT industry, year, num_unicorns, Round(avg(average_valuation/1000000000),2) as average_valuation_billions
	FROM yearly_rankings 
	WHERE year IN ('2019', '2020', '2021') 
		AND industry IN (select industry FROM top_industries)
	GROUP BY  industry, num_unicorns, year 
	ORDER BY year DESC, num_unicorns DESC;
	
WITH top_industries AS 
(
	SELECT i.industry, 
		count(*)
	FROM industries i
	JOIN dates d
	ON i.company_id = d.company_id
	WHERE extract(year from d.date_joined) in (2019, 2020, 2021)
	GROUP BY i.industry
	ORDER BY count(*) DESC
	LIMIT 3
),
WITH top_industries AS 
(
	SELECT i.industry, 
		count(i.*)
FROM industries i
JOIN dates d
ON i.company_id = d.company_id
WHERE extract (year from d.date_joined) in ('2019','2020', '2021')
GROUP BY industry
ORDER BY count DESC
LIMIT 3 ),
yearly_rankings AS 
(
	SELECT 
		COUNT(i.company_id) as num_unicorns, 
		i.industry,
		EXTRACT(year from d.date_joined) as year, 	
		avg(f.valuation) as average_valuation
	FROM industries as i 	 
	JOIN dates as d					
	ON i.company_id = d.company_id	 					 
	JOIN funding as f 
	ON d.company_id = f.company_id
	GROUP BY i.industry, year
)

SELECT industry, year, num_unicorns, Round(avg(average_valuation/1000000000),2) as average_valuation_billions
FROM yearly_rankings 
WHERE year IN (2019, 2020, 2021) 
	AND industry IN (SELECT industry FROM top_industries)
GROUP BY industry, num_unicorns, year 
ORDER BY year DESC, num_unicorns DESC;	