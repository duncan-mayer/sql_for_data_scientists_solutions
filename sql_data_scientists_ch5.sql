# chapter 5 
# 1
SELECT vendor_name, market_date 
FROM vendor AS v
INNER JOIN vendor_booth_assignments AS vba
ON v.vendor_id = vba.vendor_id
ORDER BY vendor_name, market_date;

# 2
 # original query
 SELECT *
     FROM customer AS c
     RIGHT JOIN customer_purchases AS cp
         ON c.customer_id = cp.customer_id;
 # revised using left join
 SELECT * 
 FROM customer_purchases AS cp
 LEFT JOIN customer AS c
 ON cp.customer_id = c.customer_id;
 
 # 3
SELECT DISTINCT
vi.market_date, 
pr.product_name, 
pc.product_category_name
FROM vendor_inventory as vi
LEFT JOIN product AS pr
ON vi.product_id = pr.product_id
LEFT JOIN product_category AS pc
ON  pr.product_category_id = pc.product_category_id
WHERE pc.product_category_id = 1 AND vi.quantity > 0;
