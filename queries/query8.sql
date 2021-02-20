#Find the sum of the profits made from the client STARKINUSTRIES
SELECT sum(amount*price) AS Profits
FROM gunsdb.order JOIN client ON order.clientcode=client.client_ID
				  JOIN product ON order.productcode=product.product_ID
WHERE client.name="STARKINDUSTRIES";