--Create a query to return product_line, the month from date, 
--displayed as 'June', 'July', and 'August', the warehouse, and net_revenue.


SELECT product_line, warehouse, ROUND(SUM(total * (1 - payment_fee))::numeric, 2) as net_revenue, 
CASE 
	WHEN EXTRACT(month from date) = 6 then 'June'
 	WHEN EXTRACT(month from date) = 7 then 'July'
	WHEN EXTRACT(month from date) = 8 then 'August'  
END as month
FROM sales
WHERE client_type = 'Wholesale'
GROUP BY product_line, warehouse, month
ORDER BY product_line DESC, month ASC, net_revenue DESC