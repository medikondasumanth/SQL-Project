SELECT 
    MONTHNAME(t1.date) AS Month,
    t1.fiscal_year as Year,
    round(sum(t1.sold_quantity*t3.gross_price),2) AS Gross_sales_Amount
FROM 
    gdb023.fact_sales_monthly t1
JOIN 
    gdb023.dim_customer t2
ON
    t1.customer_code = t2.customer_code
JOIN
	gdb023.fact_gross_price t3
ON
	t1.product_code= t3.product_code
WHERE 
    t2.customer = 'Atliq Exclusive'
GROUP BY
    Month,Year
ORDER BY
    t1.fiscal_year;


