CREATE DATABASE sales_db;
use sales_db;
SELECT * FROM orders LIMIT 5;
# a. Use EXTRACT(MONTH FROM order_date) to Get Month and Name of Month

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month_number,
    MONTHNAME(order_date) AS month_name
FROM
    orders
GROUP BY
    year, month_number, month_name
ORDER BY
    year, month_number;
    
#b. Monthly Revenue and Order Volume Grouped by Year and Month

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT transaction_id) AS order_volume,
    SUM(total_revenue) AS total_revenue
FROM
    orders
GROUP BY
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;
    
# c.Monthly Revenue Using SUM()

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(total_revenue) AS monthly_revenue
FROM
    orders
GROUP BY
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;
    
# d.Monthly Order Volume Using COUNT(DISTINCT transaction_id)

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT transaction_id) AS order_volume
FROM
    orders
GROUP BY
    year, month
ORDER BY
    year, month;

# e.Sort Monthly Results by Total Revenue (Descending Order)

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT transaction_id) AS order_volume,
    SUM(total_revenue) AS total_revenue
FROM
    orders
GROUP BY
    year, month
ORDER BY
    total_revenue DESC;
    
# f.Limit Results for a Specific Time Period

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT transaction_id) AS order_volume,
    SUM(total_revenue) AS total_revenue
FROM
    orders
WHERE
    order_date BETWEEN '2024-03-01' AND '2024-05-31'
GROUP BY
    year, month
ORDER BY
    year, month;