#solutions to sql for data scientists chapter 2
# 1
SELECT customer_id, quantity, cost_to_customer_per_qty, product_id
FROM  customer_purchases
WHERE product_id in (4, 9);
# 2
SELECT customer_id, product_id, quantity, cost_to_customer_per_qty, product_id
FROM  customer_purchases
WHERE vendor_id > 7 AND vendor_id < 11;

SELECT customer_id, product_id, quantity, cost_to_customer_per_qty, product_id
FROM  customer_purchases
WHERE vendor_id BETWEEN 7 and 11;
# 3 
SELECT
      market_date,
      customer_id,
      vendor_id,
      quantity * cost_to_customer_per_qty price
  FROM farmers_market.customer_purchases
  WHERE
      market_date IN
          (
          SELECT market_date
          FROM farmers_market.market_date_info
          WHERE market_rain_flag = 0
          )
LIMIT 5;

SELECT
      market_date,
      customer_id,
      vendor_id,
      quantity * cost_to_customer_per_qty price
  FROM farmers_market.customer_purchases
  WHERE
      market_date IN
          (
          SELECT market_date
          FROM farmers_market.market_date_info
          WHERE market_rain_flag != 1
          )
LIMIT 5
