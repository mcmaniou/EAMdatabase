# Create user administrator that can perform all queries in the DB
CREATE USER 'administrator'@'localhost' IDENTIFIED BY 'lackofimagination';
CREATE USER 'administrator'@'%' IDENTIFIED BY 'lackofimagination';
GRANT ALL ON `gunsdb`.* TO 'administrator' @'localhost';
GRANT ALL ON `gunsdb`.* TO 'administrator' @'%';

# Create user customer that can perform select queries in the DB
CREATE USER 'customer'@'localhost' IDENTIFIED BY 'outofideas';
CREATE USER 'customer'@'%' IDENTIFIED BY 'outofideas';
GRANT SELECT ON TABLE `gunsdb`.* TO 'customer' @'localhost';
GRANT SELECT ON TABLE `gunsdb`.* TO 'customer' @'%';

# Create user employee that can perform select and insert queries in the DB
CREATE USER 'employee'@'localhost' IDENTIFIED BY 'boooooring';
CREATE USER 'employee'@'%' IDENTIFIED BY 'boooooring';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `gunsdb`.* TO 'employee' @'localhost';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `gunsdb`.* TO 'employee' @'%';

# Create user supplier that can perform select and insert queries in the DB
CREATE USER 'supplier'@'localhost' IDENTIFIED BY 'familyfriendlypassword';
CREATE USER 'supplier'@'%' IDENTIFIED BY 'familyfriendlypassword';
GRANT SELECT ON TABLE `gunsdb`.* TO 'supplier' @'localhost';
GRANT SELECT ON TABLE `gunsdb`.* TO 'supplier' @'%';

# Create user themistoklis that can perform no queries in the DB
CREATE USER 'themistoklis'@'localhost' IDENTIFIED BY 'anotherboringpassword';
CREATE USER 'themistoklis'@'%' IDENTIFIED BY 'anotherboringpassword';
