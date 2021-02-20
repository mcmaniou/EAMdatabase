#Find the name, phone number, location of the suppliers of the location ΣΙΝΔΟΣ as long as the factories (name, ID, location, city) that operate in this area 

SELECT supplier.name, supplier.phone_number, supplier.address, factory.name, factory_ID, factory.location, city
FROM factory_has_supplier JOIN supplier ON factory_has_supplier.suppliercode=supplier.supplier_ID
						  JOIN factory ON factory_has_supplier.factorycode=factory.factory_ID
WHERE supplier.is_legal="1" AND factory.location='ΣΙΝΔΟΣ';