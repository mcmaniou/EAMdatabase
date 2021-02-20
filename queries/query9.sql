#Find the list (all data) of all the arms.
SELECT *
FROM arm LEFT JOIN product ON arm.product_ID=product.product_ID;
