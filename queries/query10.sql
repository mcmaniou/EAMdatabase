#Find the IDs of the suppliers that supply more than one factories
SELECT DISTINCT D.suppliercode
FROM factory_has_supplier JOIN factory_has_supplier AS D ON factory_has_supplier.suppliercode=D.suppliercode
WHERE factory_has_supplier.factorycode!=D.factorycode;