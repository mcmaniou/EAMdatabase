#Find all the clients (ID, name) that ordered weapon and missile systems of category 2 and core material not explosive
SELECT client.client_ID, client.name
FROM weapon_and_missile_system JOIN gunsdb.`order` ON weapon_and_missile_system.product_ID=`order`.productcode
                               JOIN client ON `order`.clientcode=client.client_ID
                               WHERE hazard_category="2" AND core_material!='explosive';