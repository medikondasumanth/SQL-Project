with table1 as (
	select 
		customer_code ,
        avg(pre_invoice_discount_pct) as average_discount_percentage 
	from 
		gdb023.fact_pre_invoice_deductions 
	where
		fiscal_year = "2021"
	group by
		customer_code
),
table2 as (
	select 
		customer_code ,customer, market
	from 
		gdb023.dim_customer
	where 
		market = 'India'
)

select 
	t1.customer_code, t2.customer , round(t1.average_discount_percentage,4)
from 
	table1 t1
join 
	table2 t2
on 
	t1.customer_code = t2.customer_code
order by
	average_discount_percentage desc
limit
	5
   