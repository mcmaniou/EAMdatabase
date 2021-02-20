#Find the name, phone number, location and whether he is legal or not of the supplier Viking Air,
#as long as the name of the factories he supplies

SELECT supplier.name, supplier.phone_number, supplier.location, is_legal, factory.name
FROM factory_has_supplier JOIN supplier ON factory_has_supplier.suppliercode=supplier.supplier_ID
						  JOIN factory ON factory_has_supplier.factorycode=factory.factory_ID
WHERE supplier.name='Viking Air';
                         
