select unique_products_2020,unique_products_2021,round((unique_products_2021-unique_products_2020)/unique_products_2020*100.0,2) as percentage_chg
from(select
(select count(distinct(product_code)) from gdb023.fact_sales_monthly where fiscal_year = 2020) as unique_products_2020,
(select count(distinct(product_code)) from gdb023.fact_sales_monthly where fiscal_year = 2021) as unique_products_2021)
as subquery;

