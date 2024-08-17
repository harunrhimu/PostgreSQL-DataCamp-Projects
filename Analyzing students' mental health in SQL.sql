--Explore and analyze the students data to see how the length of stay (stay) 
--impacts the average mental health diagnostic scores of the international students present in the study.



SELECT stay,	count (*) AS count_int,
	round(avg(todep),2) as average_phq,
	round(avg(tosc),2) as average_scs,
	round(avg(toas),2) as average_as,
from 'students.csv'
where Inter_dom ='Inter'
group by stay
order by stay DESC;