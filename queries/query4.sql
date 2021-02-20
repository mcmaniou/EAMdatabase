#Find all the data (that there are in the DB) of the clients that ordered the product 254698215 or 556798421
SELECT *
FROM client JOIN gunsdb.`order` ON client.client_ID = `order`.clientcode
WHERE productcode="254698215" OR productcode="556798421";