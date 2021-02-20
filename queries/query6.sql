#Find all the machines (IDs) and whether they are automated (1) or not (0), that are in the factory 255699123
SELECT machine_ID, automated
FROM machine WHERE faccode="255699123";