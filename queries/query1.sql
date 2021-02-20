#Find all the factories(name, location, city, address) that produce the product, which ID is 254698215
SELECT name, location, city, address
FROM factory JOIN produce ON factory.factory_ID=produce.factorycode
WHERE productcode="254698215" 