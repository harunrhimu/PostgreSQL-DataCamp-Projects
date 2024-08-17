--Key Performance Indicators (KPIs) Requirements:
select *
FROM [SQLPractice].[dbo].[financial_loan]

select count(id) as Total_applications
from financial_loan

select count(id) as 
from financial_loan
where month(issue_date) = 12 --extract month from issue_date

SELECT
purpose AS PURPOSE,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY purpose
ORDER BY purpose






































































































