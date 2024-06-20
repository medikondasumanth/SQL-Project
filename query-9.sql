with table1 as(
	select 
		t3.channel,
        round(sum(t2.gross_price*t1.sold_quantity)/1000000,2) as gross_sales_mln
	from 
		gdb023.fact_sales_monthly t1
	join
		gdb023.fact_gross_price t2
	on 
		t1.product_code = t2.product_code
	join
		gdb023.dim_customer t3
	on 
		t1.customer_code = t3.customer_code
	where
		t1.fiscal_year = "2021"
	group by
		t3.channel
)
select 
	channel,concat(gross_sales_mln,' M'),
    concat(round(gross_sales_mln/(select sum(gross_sales_mln) from table1)*100,2) ,' %') as percentage 
from 
	table1
group by
	channel
order by 
	percentage desc;