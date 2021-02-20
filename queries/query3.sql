#Find all the factories (name, ID) that work on the project, which ID is 186426846
SELECT name, factory_ID
FROM factory JOIN factory_has_project ON factory.factory_ID=factory_has_project.factorycode
WHERE projectcode="186426846";