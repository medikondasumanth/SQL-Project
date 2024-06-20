select 
	t1.product_code ,  t2.product ,t1.manufacturing_cost
from
	gdb023.fact_manufacturing_cost t1
join
	gdb023.dim_product t2 on t1.product_code = t2.product_code 
where 
	t1.manufacturing_cost in( 
    select max(manufacturing_cost) from gdb023.fact_manufacturing_cost
    union
	select min(manufacturing_cost) from gdb023.fact_manufacturing_cost)
order by
    t1.manufacturing_cost desc;