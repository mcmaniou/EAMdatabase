#Find the data (ID, price, diameter) of all the products of the type munition that are made of steel and cosy less than 8000
SELECT munition.product_ID, price, bullet_diameter
FROM munition JOIN product ON munition.product_ID=product.product_ID
WHERE material="steel" AND price<"8000.00"; 