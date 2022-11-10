# chapter 6
# 1
SELECT vendor_id, count(vendor_id) as rented_booths
FROM vendor_booth_assignments
GROUP BY vendor_id
ORDER BY rented_booths DESC;


# 2
SELECT 
MIN(vi.market_date) AS earliest_date, 
MAX(vi.market_date) AS latest_date, 
vi.product_id, 
p.product_name
FROM farmers_market.vendor_inventory AS vi
LEFT JOIN farmers_market.product AS p
ON vi.product_id = p.product_id
GROUP BY p.product_name, vi.product_id;

# 3
SELECT 
cp.customer_id, 
c.customer_first_name AS first_name, 
c.customer_last_name AS last_name, 
ROUND(SUM(cp.quantity * cp.cost_to_customer_per_qty), 2 ) AS total_spent
FROM farmers_market.customer_purchases AS cp
LEFT JOIN farmers_market.customer AS c
ON cp.customer_id = c.customer_id
GROUP BY cp.customer_id, first_name, last_name
HAVING total_spent > 50
ORDER BY last_name, first_name ASC;

