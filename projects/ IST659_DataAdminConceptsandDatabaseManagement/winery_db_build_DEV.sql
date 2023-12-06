IF NOT EXISTS (SELECT * FROM SYS.DATABASES WHERE NAME = 'winerydev')
	CREATE DATABASE winerydev
GO

USE winerydev
GO


----------
-- DOWN --
----------

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_orders_order_id')
	ALTER TABLE orders DROP CONSTRAINT pk_orders_order_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_orders_order_customer_id')
	ALTER TABLE orders DROP CONSTRAINT fk_orders_order_customer_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_orders_order_product_id')
	ALTER TABLE orders DROP CONSTRAINT fk_orders_order_product_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_orders_order_shipper')
	ALTER TABLE orders DROP CONSTRAINT fk_orders_order_shipper

DROP TABLE IF EXISTS orders
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_products_product_id')
	ALTER TABLE products DROP CONSTRAINT pk_products_product_id

DROP TABLE IF EXISTS products
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_bottles_bottle_id')
	ALTER TABLE bottles DROP CONSTRAINT pk_bottles_bottle_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_bottles_bottle_batch_id')
	ALTER TABLE bottles DROP CONSTRAINT fk_bottles_bottle_batch_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_bottles_bottle_employee_fill_id')
	ALTER TABLE bottles DROP CONSTRAINT fk_bottles_bottle_employee_fill_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_bottles_bottle_employee_label_id')
	ALTER TABLE bottles DROP CONSTRAINT fk_bottles_bottle_employee_label_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_bottles_bottle_label_id')
	ALTER TABLE bottles DROP CONSTRAINT fk_bottles_bottle_label_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_bottles_bottle_warehouse_stored')
	ALTER TABLE bottles DROP CONSTRAINT fk_bottles_bottle_warehouse_stored

DROP TABLE IF EXISTS bottles
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_employees_employee_id')
	ALTER TABLE employees DROP CONSTRAINT pk_employees_employee_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'u_employees_employee_email')
	ALTER TABLE employees DROP CONSTRAINT u_employees_employee_email

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_employees_employee_department')
	ALTER TABLE employees DROP CONSTRAINT fk_employees_employee_department

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_employees_employee_position')
	ALTER TABLE employees DROP CONSTRAINT fk_employees_employee_position

DROP TABLE IF EXISTS employees
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_positions_position_code')
	ALTER TABLE positions DROP CONSTRAINT pk_positions_position_code

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'u_positions_position_name')
	ALTER TABLE positions DROP CONSTRAINT u_positions_position_name

DROP TABLE IF EXISTS positions
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_departments_department_code')
	ALTER TABLE departments DROP CONSTRAINT pk_departments_department_code

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'u_departments_department_name')
	ALTER TABLE departments DROP CONSTRAINT u_departments_department_name

DROP TABLE IF EXISTS departments
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_warehouse_lookup_warehouse_id')
	ALTER TABLE warehouse_lookup DROP CONSTRAINT pk_warehouse_lookup_warehouse_id

DROP TABLE IF EXISTS warehouse_lookup
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_label_lookup_label_id')
	ALTER TABLE label_lookup DROP CONSTRAINT pk_label_lookup_label_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'u_label_lookup_label_name')
	ALTER TABLE label_lookup DROP CONSTRAINT u_label_lookup_label_name

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'u_label_lookup_label_product_name')
	ALTER TABLE label_lookup DROP CONSTRAINT u_label_lookup_label_product_name

DROP TABLE IF EXISTS label_lookup
GO


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_barrels_barrel_id')
	ALTER TABLE barrels DROP CONSTRAINT pk_barrels_barrel_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_barrels_barrel_cellar_id')
	ALTER TABLE barrels DROP CONSTRAINT fk_barrels_barrel_cellar_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_barrels_barrel_batch_id')
	ALTER TABLE barrels DROP CONSTRAINT fk_barrels_barrel_batch_id

DROP TABLE IF EXISTS barrels
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_cellars_cellar_id')
	ALTER TABLE cellars DROP CONSTRAINT pk_cellars_cellar_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_cellars_cellar_slot_status')
	ALTER TABLE cellars DROP CONSTRAINT fk_cellars_cellar_slot_status

DROP TABLE IF EXISTS cellars
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_cellar_status_lookup')
	ALTER TABLE cellar_status_lookup DROP CONSTRAINT pk_cellar_status_lookup

DROP TABLE IF EXISTS cellar_status_lookup
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_batches_batch_id')
	ALTER TABLE batches DROP CONSTRAINT pk_batches_batch_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_batches_batch_vineyard_id')
	ALTER TABLE batches DROP CONSTRAINT fk_batches_batch_vineyard_id

DROP TABLE IF EXISTS batches
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_fermentation_recipie_lookup_recipie_id')
	ALTER TABLE fermentation_recepie_lookup DROP CONSTRAINT pk_fermentation_recipie_lookup_recipie_id

DROP TABLE IF EXISTS fermentation_recepie_lookup
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_vineyards_vineyard_id')
	ALTER TABLE vineyards DROP CONSTRAINT pk_vineyards_vineyard_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_vineyards_vineyard_status')
	ALTER TABLE vineyards DROP CONSTRAINT fk_vineyards_vineyard_status

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_vineyards_vineyard_grape_id')
	ALTER TABLE vineyards DROP CONSTRAINT fk_vineyards_vineyard_grape_id

DROP TABLE IF EXISTS vineyards
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_equipment_equipment_id_and_serial')
	ALTER TABLE equipment DROP CONSTRAINT pk_equipment_equipment_id_and_serial

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'u_equipment_equipment_serial')
	ALTER TABLE equipment DROP CONSTRAINT u_equipment_equipment_serial

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_equipment_equipment_type')
	ALTER TABLE equipment DROP CONSTRAINT fk_equipment_equipment_type

DROP TABLE IF EXISTS equipment
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'equipment_type_lookup_equipment_type_id')
	ALTER TABLE equipment_type_lookup DROP CONSTRAINT equipment_type_lookup_equipment_type_id

DROP TABLE IF EXISTS equipment_type_lookup
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_grape_lookup_grape_id')
	ALTER TABLE grape_lookup DROP CONSTRAINT pk_grape_lookup_grape_id

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'u_grape_lookup_grape_name')
	ALTER TABLE grape_lookup DROP CONSTRAINT u_grape_lookup_grape_name

DROP TABLE IF EXISTS grape_lookup
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_vineyard_status_lookup_status_id')
	ALTER TABLE vineyard_status_lookup DROP CONSTRAINT pk_vineyard_status_lookup_status_id

DROP TABLE IF EXISTS vineyard_status_lookup
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_shippers_shipper_id')
	ALTER TABLE shippers DROP CONSTRAINT pk_shippers_shipper_id 
	
DROP TABLE IF EXISTS shippers
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_payments_payment_order_id')
	ALTER TABLE payments DROP CONSTRAINT pk_payments_payment_order_id
	
DROP TABLE IF EXISTS payments
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_customers_customer_id')
	ALTER TABLE customers DROP CONSTRAINT pk_customers_customer_id  

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'u_customers_customer_email')
	ALTER TABLE customers DROP CONSTRAINT u_customers_customer_email  

DROP TABLE IF EXISTS customers
GO




-------------------
-- UP (Metadata) --
-------------------

-- HR Tables
CREATE TABLE departments (
	department_code VARCHAR(50) NOT NULL -- pk
	, department_name VARCHAR(255) NOT NULL -- unique
	, CONSTRAINT pk_departments_department_code PRIMARY KEY (department_code)
	, CONSTRAINT u_departments_department_name UNIQUE (department_name)
)
GO

CREATE TABLE positions (
	position_code VARCHAR(50) NOT NULL -- pk
	, position_name VARCHAR(50) NOT NULL -- unique
	, position_pay_rate MONEY NOT NULL
	, CONSTRAINT pk_positions_position_code PRIMARY KEY (position_code)
	, CONSTRAINT u_positions_position_name UNIQUE (position_name)

)
GO

CREATE TABLE employees (
	employee_id INT IDENTITY(1,1) NOT NULL -- pk
	, employee_lastname VARCHAR(255) NOT NULL
	, employee_firstname VARCHAR(255) NOT NULL
	, employee_email VARCHAR(255) NOT NULL -- unique
	, employee_department VARCHAR(50) NOT NULL -- fk from departments table (department_code)
	, employee_position VARCHAR(50) NOT NULL -- fk from positions table (position_code)
	, CONSTRAINT pk_employees_employee_id PRIMARY KEY (employee_id)
	, CONSTRAINT u_employees_employee_email UNIQUE (employee_email)
	, CONSTRAINT fk_employees_employee_department FOREIGN KEY (employee_department) REFERENCES departments(department_code)
	, CONSTRAINT fk_employees_employee_position FOREIGN KEY (employee_position) REFERENCES positions(position_code)
)
GO


-- Operations tables

-- vineyard_status_lookup
CREATE TABLE vineyard_status_lookup (
	status_id INT IDENTITY(1,1) NOT NULL -- pk
	, status_description VARCHAR(50) NOT NULL
	, CONSTRAINT pk_vineyard_status_lookup_status_id PRIMARY KEY (status_id)
)
GO

-- grape_lookup
CREATE TABLE grape_lookup (
	grape_id INT IDENTITY(1,1) NOT NULL -- pk
	, grape_name VARCHAR(50) NOT NULL -- u
	, CONSTRAINT pk_grape_lookup_grape_id PRIMARY KEY (grape_id)
	, CONSTRAINT u_grape_lookup_grape_name UNIQUE (grape_name)
)
GO

-- fermenters | <-- put these tables into one 'equipment_lookup' table?  More efficent data storage
-- presses	  | would be able to tie equipment to batches, barrels, etc...
CREATE TABLE equipment_type_lookup (
	equipment_type_id INT IDENTITY(1,1) NOT NULL -- pk
	, equimpent_type_desc VARCHAR(50) NOT NULL
	, CONSTRAINT equipment_type_lookup_equipment_type_id PRIMARY KEY (equipment_type_id)
)
GO

CREATE TABLE equipment (
	equipment_id INT IDENTITY(1,1) NOT NULL -- pk.1
	, equipment_serial_number VARCHAR(255) NOT NULL -- pk.2
	, equipment_type INT NOT NULL
	, CONSTRAINT pk_equipment_equipment_id_and_serial PRIMARY KEY (equipment_id)
	, CONSTRAINT u_equipment_equipment_serial_number UNIQUE (equipment_serial_number) -- need to add to "DOWN" above
	, CONSTRAINT u_equipment_equipment_serial UNIQUE(equipment_serial_number)
	, CONSTRAINT fk_equipment_equipment_type FOREIGN KEY (equipment_type) REFERENCES equipment_type_lookup(equipment_type_id)
)
GO

-- vineyards
CREATE TABLE vineyards (
	vineyard_id INT IDENTITY (1,1) NOT NULL -- pk
	, vineyard_name VARCHAR(50) NOT NULL
	, vineyard_plant_date DATE NOT NULL
	, vineyard_harvest_equipment_id INT NOT NULL-- fk
	, vineyard_harvest_date DATE NOT NUll -- may need to break this off into a seperate table ('harvests')
	, vineyard_status INT NOT NULL -- fk, vinyard_status_lookup(status_id)
	, vineyard_grape_id INT NOT NULL -- fk, grape_lookup(grape_id)
	--, vineyard_employee_planter    -- | may just get rid of both of these fields and just have 'vineyard_manager' (fk, references 'employees(employee_id)'
	--, vineyard_employee_harvestor  -- | OR, keep these and have them as fk's to an 'equipment' table
	, CONSTRAINT pk_vineyards_vineyard_id PRIMARY KEY (vineyard_id)
	, CONSTRAINT fk_vineyards_vineyard_harvest_equipment_id FOREIGN KEY (vineyard_harvest_equipment_id) REFERENCES equipment(equipment_id) -- need to add to "DOWN" above
	, CONSTRAINT fk_vineyards_vineyard_status FOREIGN KEY (vineyard_status) REFERENCES vineyard_status_lookup(status_id)
	, CONSTRAINT fk_vineyards_vineyard_grape_id FOREIGN KEY (vineyard_grape_id) REFERENCES grape_lookup(grape_id)
)	
GO

-- fermentation_recipie_lookup
CREATE TABLE fermentation_recepie_lookup (
	recipie_id INT IDENTITY(1,1) NOT NULL -- pk
	, recipie_desc VARCHAR(255)
	, CONSTRAINT pk_fermentation_recipie_lookup_recipie_id PRIMARY KEY (recipie_id)
)

-- batches
CREATE TABLE batches (
	batch_id INT IDENTITY(1,1) NOT NULL -- moved this from 'vinyards'.  relations make more sense this way
	, batch_vineyard_id INT NOT NULL --fk, vineyards(vineyard_id)
	--, batch_press INT NOT NULL -- fk, equipment(equipment_id) [?]
	--, batch_fermenter INT NOT NULL -- fk, equipment(equipment_id) [?]
	, batch_fermentation_recipe INT NOT NULL-- fk, fermenation_recipie_lookup(fermentation_recipie_id) [?]
	, batch_fermentation_start DATE NOT NULL
	, batch_fementation_end DATE NOT NULL
	-- do we need to add any data to this table regarding batch properties?
	, CONSTRAINT pk_batches_batch_id PRIMARY KEY (batch_id)
	, CONSTRAINT fk_batches_batch_vineyard_id FOREIGN KEY (batch_vineyard_id) REFERENCES vineyards(vineyard_id)
	, CONSTRAINT fk_batches_batch_fermentation_recipe FOREIGN KEY (batch_fermentation_recipe) REFERENCES fermentation_recepie_lookup(recipie_id)
)
GO

-- cellars
CREATE TABLE cellar_status_lookup ( -- need to flesh this out a little more....
	cellar_status_id INT IDENTITY(1,1) NOT NULL
	, cellar_status_desc VARCHAR(255) NOT NULL
	, CONSTRAINT pk_cellar_status_lookup PRIMARY KEY (cellar_status_id)
)
GO

--CREATE TABLE cellar_space_lookup ()

CREATE  TABLE cellars (
	cellar_id INT IDENTITY(1,1) NOT NULL -- pk
	, cellar_status INT -- fk
	, CONSTRAINT pk_cellars_cellar_id PRIMARY KEY (cellar_id)
	, CONSTRAINT fk_cellars_cellar_slot_status FOREIGN KEY (cellar_status) REFERENCES cellar_status_lookup(cellar_status_id)
)

-- barrels
CREATE TABLE barrels (
	barrel_id INT IDENTITY(1,1) NOT NULL -- pk
	, barrel_fill_date DATE NOT NULL-- was 'barrel start date'
	, barrel_open_date DATE NOT NULL-- was 'barrel end date'
	, barrel_cellar_id INT NOT NULL -- fk, cellars
	, barrel_cellar_slot INT NOT NULL -- I think we need to work out this relational logic.  its a great idea, but Im not sure it'll work out they way it's currently set...
	, barrel_batch_id INT NOT NULL -- fk, 
	, barrel_employee_fill_id INT NOT NULL -- fk, employees(employee_id)
	, barrel_employee_open_id INT NOT NULL -- fk, employees(employee_id)
	, CONSTRAINT pk_barrels_barrel_id PRIMARY KEY (barrel_id)
	, CONSTRAINT fk_barrels_barrel_cellar_id FOREIGN KEY (barrel_cellar_id) REFERENCES cellars(cellar_id)
	, CONSTRAINT fk_barrels_barrel_batch_id FOREIGN KEY (barrel_batch_id) REFERENCES batches(batch_id)
)
GO

CREATE TABLE label_lookup (
	label_id INT IDENTITY(1,1) NOT NULL -- pk
	, label_name VARCHAR(50) NOT NULL -- u
	, label_product_name VARCHAR(50) NOT NULL -- u
	, CONSTRAINT pk_label_lookup_label_id PRIMARY KEY (label_id)
	, CONSTRAINT u_label_lookup_label_name UNIQUE (label_name)
	, CONSTRAINT u_label_lookup_label_product_name UNIQUE (label_product_name)
)

-- warehouses  -- dont think we need this (cellars are already here...)
CREATE TABLE warehouse_lookup (
	warehouse_id INT IDENTITY(1,1) NOT NULL -- pk
	, warehouse_number INT NOT NULL -- u
	, CONSTRAINT pk_warehouse_lookup_warehouse_id PRIMARY KEY (warehouse_id)
	-- What else should we put here.  concerned about the scheme now not making sense.  Bring up on Monday meeting.
)

-- bottles -- do we need this table? (maybe this is the 'product' in the sales area?
CREATE TABLE bottles (
	bottle_id INT IDENTITY(1,1) NOT NULL -- pk
	, bottle_batch_id INT NOT NULL -- fk batches(batch_id)
	, bottle_product_name VARCHAR(50) NOT NULL
	, bottle_bottled_datetime DATETIME NOT NULL
	, bottle_employee_fill_id INT NOT NULL -- fk employees(employee_id)
	, bottle_employee_label_id INT NOT NULL -- fk employees(employee_id)
	, bottle_label_id INT NOT NULL -- fk label_lookup(label_id)
	, bottle_warehouse_stored INT NOT NULL -- fk warehouse_lookup(warehouse_id)
	, CONSTRAINT pk_bottles_bottle_id PRIMARY KEY (bottle_id)
	, CONSTRAINT fk_bottles_bottle_batch_id FOREIGN KEY (bottle_batch_id) REFERENCES batches(batch_id)
	, CONSTRAINT fk_bottles_bottle_employee_fill_id FOREIGN KEY (bottle_employee_fill_id) REFERENCES employees(employee_id)
	, CONSTRAINT fk_bottles_bottle_employee_label_id FOREIGN KEY (bottle_employee_label_id) REFERENCES employees(employee_id)
	, CONSTRAINT fk_bottles_bottle_label_id FOREIGN KEY (bottle_label_id) REFERENCES label_lookup(label_id)
	, CONSTRAINT fk_bottles_bottle_warehouse_stored FOREIGN KEY (bottle_warehouse_stored) REFERENCES warehouse_lookup(warehouse_id)
)



-- Sales Tables --
CREATE TABLE products (
	product_id INT IDENTITY(1,1) NOT NULL
	, product_name VARCHAR(50) NOT NULL
    , product_description VARCHAR(200) NOT NULL
	, product_price MONEY NOT NULL
	, product_units_in_stock INT NOT NULL
	, CONSTRAINT pk_products_product_id PRIMARY KEY (product_id)
	, CONSTRAINT fk_bottle_bottle_id FOREIGN KEY(product_id) REFERENCES bottles(bottle_id)
)
GO

CREATE table customers (
    customer_id INT IDENTITY NOT NULL
    , customer_firstname VARCHAR(20) NOT NULL
    , customer_lastname VARCHAR(20) NOT NULL
    , customer_email VARCHAR(50) NOT NULL
    , customer_address VARCHAR(200) NOT NULL
    , customer_shipping_address VARCHAR(200) NOT NULL
    , customer_city VARCHAR (50) NOT NULL
    , customer_state CHAR(2) NOT NULL
    , CONSTRAINT pk_customers_customer_id PRIMARY KEY (customer_id)
    , CONSTRAINT u_customers_customer_email UNIQUE (customer_email)
)
GO

CREATE table payments (
    payment_order_id INT IDENTITY NOT NULL
	, payment_customer_id INT NOT NULL
    , payment_credit_card_num INT NOT NULL
    , payment_credit_card_exp DATE NOT NULL
    , payment_credit_code INT NOT NULL
    , payment_credit_card_type VARCHAR (10) NOT NULL
    , CONSTRAINT pk_payments_payment_order_id PRIMARY KEY (payment_order_id)
	, CONSTRAINT fk_payments_payment_customer_id FOREIGN KEY (payment_customer_id) REFERENCES customers(customer_id)
  
)
GO


CREATE table shippers (
    shipper_id INT IDENTITY NOT NULL
    , shipper_name VARCHAR(50) NOT NULL
    , shipper_phone INT NOT NULL
    , CONSTRAINT pk_shippers_shipper_id PRIMARY KEY (shipper_id)
  
)
GO


CREATE TABLE orders (
	order_id VARCHAR(20) NOT NULL
	, order_customer_id INT NOT NULL
	, order_product_id INT NOT NULL
	, order_quantity INT NOT NULL
	, order_shipper INT NOT NULL
	, CONSTRAINT pk_orders_order_id PRIMARY KEY (order_id) -- Moved this from 'products'; felt this made more sense to have a seperate orders table to track them
	, CONSTRAINT fk_orders_order_customer_id FOREIGN KEY (order_customer_id) REFERENCES customers(customer_id)
	, CONSTRAINT fk_orders_order_product_id FOREIGN KEY (order_product_id) REFERENCES products(product_id)
	, CONSTRAINT fk_orders_order_shipper FOREIGN KEY (order_shipper) REFERENCES shippers(shipper_id)
)
GO


---------------
-- UP (DATA) --
---------------

-- HR Tables
INSERT INTO departments 
	VALUES
		('7264', 'Executive'				)
		, ('8190', 'Human Resources'		)
		, ('9293', 'Operations'				)
		, ('3735', 'Sales and Marketing'	)
		, ('2263', 'Laboratory and Research')
		, ('8905', 'Agriculture'			)
		, ('2005', 'Supply Chain Managment'	)
		, ('9881', 'Analytics'				)
GO


INSERT INTO positions
	VALUES
		('7264-1', 'President', 100)
		, ('8190-1', 'Chief People Officer', 75)
		, ('8190-2', 'Manager - Human Resources', 60)
		, ('8190-3', 'Associate - Human Resources', 40)
		, ('8190-4', 'Analyst - Human Resources', 50)
		, ('9293-1', 'Cheif Operations Officer', 75)
		, ('9293-2', 'Manager - Operations', 60)
		, ('9293-3', 'Analyst - Operations', 50)
		, ('3735-1', 'Chief Sales and Marketing Officer', 75)
		, ('3735-2', 'Manager - Sales', 60)
		, ('3735-3', 'Manager - Marketing', 60)
		, ('3735-4', 'Associate - Sales', 40)
		, ('3735-5', 'Associate - Marketing', 40)
		, ('3735-6', 'Analyst - Sales and Marketing', 50)
		, ('2263-1', 'Cheif Research Officer', 75)
		, ('2263-2', 'Manager - Lab Testing', 60)
		, ('2263-3', 'Manager - Research', 60)
		, ('2263-4', 'Scientist - Research and Development', 65)
		, ('2263-5', 'Laboratory Tech', 40)
		, ('2263-6', 'Analyst - Research and Development', 50)
		, ('8905-1', 'Manager - Agriculture', 60)
		, ('8905-2', 'Equipment Operator', 40)
		, ('8905-3', 'Mechanic - Heavy Equipment', 40)
		, ('8905-4', 'Mechanic - Small Equipment', 40)
		, ('2005-1', 'Director - Supply Chain Management', 70)
		, ('2005-2', 'Manager - Warhousing', 60)
		, ('2005-3', 'Manager - Shipping', 60)
		, ('2005-4', 'Associate - Supply Chain', 40)
		, ('2005-5', 'Analyst - Supply Chain', 50)
		, ('9881-1', 'Chief Analytics Officer', 75)
		, ('9881-2', 'Analytics Manager - Sales and Marketing', 60)
		, ('9881-3', 'Analytics Manager - Operations', 60)
		, ('9881-4', 'Analytics Manager - Human Resources', 60)
		, ('9881-5', 'Analytics Manager - Research and Development', 60)
		, ('9881-6', 'Analytics Manager - Agriculture', 60)
		, ('9881-7', 'Analytics Manager - Supply Chain', 60)
GO


INSERT INTO employees	
	VALUES
		('de Chateau Cuse', 'Prezzy', 'prezzy.dechateaucuse@chateaucuse.org', '7264', '7264-1') 
		, ('Smith', 'Matt', 'matt.smith@chateaucuse.org', '8190', '8190-1')
		, ('Stabel', 'Sintia', 'sintia.stabel@chateaucuse.org', '3735', '3735-1')
		, ('Damico', 'Bryan', 'bryan.damico@chateaucuse.org', '9293', '9293-1')
		, ('Roberts','Uriel','u.roberts@chateaucuse.org','2263','2263-6')
		, ('Gallegos','Xyla','g_xyla@chateaucuse.org','9881','9881-1')
		, ('Fleming','Piper','fleming_piper809@chateaucuse.org','8190','8190-3')
		, ('Monroe','Teagan','teagan-monroe@chateaucuse.org','9881','9881-3')
		, ('Hess','Julie','h_julie@chateaucuse.org','9293','9293-3')
		, ('Collins','Mark','markcollins@chateaucuse.org','2005','2005-5')
		, ('Wolf','Vaughan','w-vaughan9300@chateaucuse.org','2005','2005-3')
		, ('Beard','Malcolm','bmalcolm6433@chateaucuse.org','8905','8905-3')
		, ('Avery','Melvin','m.avery1826@chateaucuse.org','2263','2263-3')
		, ('Everett','Caryn','e-caryn1429@chateaucuse.org','9881','9881-2')
		, ('Cooke','Quamar','quamarcooke@chateaucuse.org','9881','9881-5')
		, ('Valdez','Clarke','clarke-valdez@chateaucuse.org','3735','3735-4')
		, ('Curry','Rylee','c.rylee6926@chateaucuse.org','2005','2005-2')
		, ('Delaney','Hu','d.hu8553@chateaucuse.org','9881','9881-2')
		, ('Ball','Mason','masonball7238@chateaucuse.org','2005','2005-3')
		, ('Glass','Rylee','rylee_glass3763@chateaucuse.org','9881','9881-7')
		, ('Rasmussen','Cain','cain-rasmussen@chateaucuse.org','3735','3735-3')
		, ('Guy','Jesse','jesse.guy2752@chateaucuse.org','9881','9881-3')
		, ('Morgan','Thane','morgan.thane9944@chateaucuse.org','2005','2005-2')
		, ('Landry','Phyllis','phyllis-landry@chateaucuse.org','8190','8190-4')
		, ('Rodriguez','Porter','r_porter@chateaucuse.org','9293','9293-3')
		, ('Merrill','Hope','m.hope@chateaucuse.org','2005','2005-2')
		, ('Flynn','Brynne','f-brynne@chateaucuse.org','9881','9881-6')
		, ('Barker','Matthew','b_matthew@chateaucuse.org','9881','9881-6')
		, ('Alston','Xanthus','axanthus8347@chateaucuse.org','8190','8190-4')
		, ('Cline','Silas','silas-cline1290@chateaucuse.org','9881','9881-3')
		, ('Solomon','Amethyst','samethyst@chateaucuse.org','9881','9293-3')
		, ('Finch','Gail','f.gail2047@chateaucuse.org','2263','2263-3')
		, ('Leblanc','Aurelia','a_leblanc@chateaucuse.org','9881','9293-3')
		, ('Thornton','Whilemina','w.thornton@chateaucuse.org','2005','2005-1')
		, ('Thornton','Aladdin','aladdin.thornton2226@chateaucuse.org','9293','9293-3')
		, ('Singleton','Fleur','singletonfleur@chateaucuse.org','3735','3735-4')
		, ('Morgan','Isaac','morgan-isaac9858@chateaucuse.org','3735','3735-4')
		, ('Parks','Brennan','brennan-parks77@chateaucuse.org','9881','9881-5')
		, ('Hensley','Adam','hadam1719@chateaucuse.org','2263','2263-5')
		, ('Hurley','Desirae','hurley-desirae8136@chateaucuse.org','2263','2263-5')
		, ('Casey','Joan','j.casey@chateaucuse.org','8905','8905-2')
		, ('Valenzuela','Amal','v-amal1047@chateaucuse.org','8905','8905-3')
		, ('Emerson','Gretchen','e-gretchen@chateaucuse.org','2005','2005-1')
		, ('Holder','Gemma','gemma-holder@chateaucuse.org','3735','3735-6')
		, ('Steele','Zoe','z.steele2340@chateaucuse.org','3735','3735-4')
		, ('Abbott','Eve','e.abbott@chateaucuse.org','2005','2005-1')
		, ('Chambers','Steven','chambers_steven@chateaucuse.org','3735','3735-4')
		, ('Potter','Lars','p.lars@chateaucuse.org','8905','8905-2')
		, ('Marquez','Bradley','bradley.marquez@chateaucuse.org','9881','9881-6')
		, ('Duran','Oprah','o_duran2756@chateaucuse.org','2263','2263-3')
		, ('Coleman','Drake','drake.coleman7999@chateaucuse.org','9881','9881-2')
		, ('Peters','Rhiannon','r_peters2991@chateaucuse.org','9881','9881-6')
		, ('Wilkerson','Lysandra','wilkersonlysandra@chateaucuse.org','3735','3735-5')
		, ('Love','Nola','l.nola9817@chateaucuse.org','9881','9881-6')
GO
--------------------------------
-- Create Views for Reporting --
--------------------------------

DROP VIEW IF EXISTS employees_departments_positions
IF NOT EXISTS (SELECT 1 FROM SYS.VIEWS WHERE NAME = 'employees_departments_positions')
BEGIN
	EXEC(
		 '
		 CREATE VIEW employees_departments_positions AS 
			SELECT 
				e.*
				, p.position_name
				, p.position_pay_rate
				, d.department_name
			FROM employees e 
				JOIN positions p 
				ON e.employee_position = p.position_code
				JOIN departments d
				ON e.employee_department = d.department_code
		'
		)
END
GO


------------
-- Verify --
------------

-- HR Tables
--SELECT * FROM departments
--SELECT * FROM positions
--SELECT * FROM employees
--
---- Operations tables
--SELECT * FROM vineyard_status_lookup
--SELECT * FROM grape_lookup
--SELECT * FROM equipment_type_lookup
--SELECT * FROM equipment
--SELECT * FROM vineyards
--SELECT * FROM fermentation_recepie_lookup
--SELECT * FROM batches
--SELECT * FROM cellar_status_lookup
--SELECT * FROM cellars
--SELECT * FROM barrels
--
---- Sales tables
--SELECT * FROM customers
--SELECT * FROM payments
--SELECT * FROM shippers
--SELECT * FROM orders
--SELECT * FROM products
--
---- Views (for specific report tables)
--SELECT * FROM employees_departments_positions
--GO





