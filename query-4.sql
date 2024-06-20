with product2020 as (
    select
        t1.segment,
        count(distinct t2.product_code) as product_count_2020
    from
        gdb023.dim_product t1
    join
        gdb023.fact_sales_monthly t2 on t1.product_code = t2.product_code
    where
        t2.fiscal_year = '2020'
    group by
        t1.segment
),
product2021 as (
    select
        t1.segment,
        count(distinct t2.product_code) AS product_count_2021
    from
        gdb023.dim_product t1
    join
        gdb023.fact_sales_monthly t2 ON t1.product_code = t2.product_code
    where
        t2.fiscal_year = '2021'
    group by
        t1.segment
)
select
    p20.segment,
    p20.product_count_2020,
    p21.product_count_2021,
    (p21.product_count_2021 - p20.product_count_2020) AS difference
from
    product2020 p20
join
    product2021 p21 ON p20.segment = p21.segment;

