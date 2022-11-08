# CHAPTER 4, 
# 1
SELECT product_id, product_name,
CASE WHEN LOWER(product_qty_type) = 'unit' 
THEN 'unit'
ELSE 'bulk' 
END AS prod_qty_type_condensed
FROM product;
# 2 
SELECT product_name,
CASE WHEN LOWER(product_name) LIKE '%pepper%' 
THEN 1
ELSE 0
END AS pepper_flag
FROM product;

# 3 
# mispelling, or when its name doesnt contain pepper, for example, if it is written just as "jalepeno"