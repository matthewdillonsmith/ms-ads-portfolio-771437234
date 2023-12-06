/* CREATE DATABASE winery */

/* Tables
---------

vineyards  -> maybe our winery does not just pull grapes from their own vineyard?  buys grapes from others as well?
equipment -> information on winery equipment (presses, tanks, farming, etc.)
labs -> where the wine is tested
cellars -> where the wine is stored
employees
customers
products
sales
distributors
vendors
paymentinfo -> "creditcards"?  maybe just keep "paymentinfo" and include EFT, CC, DC, etc...  need to find out what info goes into these..

*/

CREATE TABLE vinyards (
	vinyard_id INT NOT NULL IDENTITY(0,1) UNIQUE
	, vinyard_name VARCHAR(50) NOT NULL UNIQUE
	, vinyard_address VARCHAR(255) NOT NULL
	, CONSTRAINT pk_vinyards_vinyard_id PRIMARY KEY (vinyard_id)
)

CREATE TABLE labs (
	lab_id INT NOT NULL IDENTITY(0, 1) UNIQUE
	, lab_vinyard_location INT NOT NULL
	, CONSTRAINT pk_labs_lab_id PRIMARY KEY (lab_id)
	, CONSTRAINT fk_labs_lab_vinyard_location FOREIGN KEY (lab_vinyard_location) REFERENCES vinyards(vinyard_id)
)

CREATE TABLE equipment (
	equipment_id VARCHAR(50) NOT NULL UNIQUE
	, equipment_type VARCHAR(50) NOT NULL
	, equipment_vinyard_assigned INT NOT NULL
	, equipment_lab_assigned INT NOT NULL
	, CONSTRAINT pk_equipment_equipment_id PRIMARY KEY (equipment_id)
	, CONSTRAINT fk_equipment_equipment_vinyard_assigned FOREIGN KEY(equipment_vinyard_assigned) REFERENCES vinyards(vinyard_id)
	, CONSTRAINT fk_equipment_equipment_lab_assigned FOREIGN KEY(equipment_lab_assigned) REFERENCES labs(lab_id)
)

CREATE TABLE cellars (
	cellar_id INT NOT NULL IDENTITY(1,1) UNIQUE
	, cellar_vinyard_location INT NOT NULL
	, CONSTRAINT pk_cellars_cellar_id PRIMARY KEY (cellar_id)
	, CONSTRAINT fk_cellars_cellar_vinyard_location FOREIGN KEY (cellar_vinyard_location) REFERENCES vinyards(vinyard_id)
)

CREATE TABLE employees (
	employee_id INT NOT NULL IDENTITY(1,1) UNIQUE
	, employee_last_name VARCHAR(50) NOT NULL
	, employee_first_name VARCHAR(50) NOT NULL
)

CREATE TABLE customers ()

CREATE TABLE products ()

CREATE TABLE sales ()

CREATE TABLE distributors ()

CREATE TABLE vendors ()

CREATE TABLE paymentinfo ()
