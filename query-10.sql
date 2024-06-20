with table1 as(
select
	t2.division,t2.product_code,t2.product,(sum(t1.sold_quantity)) as total_sold_quantity
from 
	gdb023.fact_sales_monthly t1
join 
	gdb023.dim_product t2
on 
	t1.product_code = t2.product_code
where 
	fiscal_year = "2021"
group by 
	t2.division,t2.product_code,t2.product
),table2 as(
SELECT 
	*,
	ROW_NUMBER() OVER (PARTITION BY division ORDER BY total_sold_quantity DESC) AS Rank_order
FROM 
	table1
)

select 
    *
from 
	table2
where 
	Rank_order in (1,2,3)
