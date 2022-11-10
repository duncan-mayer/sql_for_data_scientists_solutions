# chapter 7
# 1A
SELECT DISTINCT
market_date,
customer_id,
DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY market_date ASC) AS visit_number
FROM farmers_market.customer_purchases;
# 1B 
SELECT DISTINCT
market_date,
customer_id,
DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY market_date DESC) AS visit_number
FROM farmers_market.customer_purchases;
# 1C 
SELECT * FROM 
(
SELECT DISTINCT
market_date,
customer_id,
DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY market_date DESC) AS visit_number
FROM farmers_market.customer_purchases ) as x
WHERE x.visit_number = 1;

# 2 
SELECT DISTINCT
product_id,
customer_id,
COUNT(product_id) OVER (PARTITION BY customer_id, product_id) as total_bought
FROM customer_purchases
ORDER BY total_bought DESC, customer_id;

# 3 
# LEAD -1 didnt work, this produces the same result, however, the missing week is switched
SELECT
      market_date,
       LEAD(SUM(quantity * cost_to_customer_per_qty), 1) OVER (ORDER BY
  market_date) AS next_market_date_total_sales,
      SUM(quantity * cost_to_customer_per_qty) AS market_date_total_sales
  FROM farmers_market.customer_purchases
  GROUP BY market_date
  ORDER BY market_date;