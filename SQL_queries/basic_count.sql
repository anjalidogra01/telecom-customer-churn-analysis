select Gender, count(Gender) as TotalCount,
count(Gender)*1.0/ (select count(*) from stg_churn) as Percentage
from stg_churn
group by Gender


select Contract, count(Contract) as TotalCount,
count(Contract)*1.0/ (select count(*) from stg_churn) as Percentage
from stg_churn
group by Contract


select Customer_Status, count(Customer_Status) as TotalCount,
count(Customer_Status)*100.0/ (select count(*) from stg_churn) as Percentage
from stg_churn
group by Customer_Status

select City, count(City) as TotalCount,
count(City)*100.0/ (select count(*) from stg_churn) as Percentage
from stg_churn
group by City
order by Percentage desc
