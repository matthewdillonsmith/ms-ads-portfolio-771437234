/* 
NOTE TO SELF:
	Make sure you change the code below to change the name of the db we are using for the final project db!!!!
*/

IF NOT EXISTS (SELECT * FROM SYS.DATABASES WHERE NAME = 'winerytest')
	CREATE DATABASE winerytest
GO

USE winerytest
GO


--DOWN
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_employees_employee_id')
	ALTER TABLE employees DROP CONSTRAINT pk_employees_employee_id
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'u_employees_employee_email')
	ALTER TABLE employees DROP CONSTRAINT u_employees_employee_email
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_employees_employee_department')
	ALTER TABLE employees DROP CONSTRAINT fk_employees_employee_department
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'fk_employees_employee_position')
	ALTER TABLE employees DROP CONSTRAINT fk_employees_employee_position
GO

DROP TABLE IF EXISTS employees
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_positions_position_code')
	ALTER TABLE positions DROP CONSTRAINT pk_positions_position_code
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'u_positions_position_name')
	ALTER TABLE positions DROP CONSTRAINT u_positions_position_name
GO

DROP TABLE IF EXISTS positions
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'pk_departments_department_code')
	ALTER TABLE departments DROP CONSTRAINT pk_departments_department_code
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	WHERE CONSTRAINT_NAME = 'u_departments_department_name')
	ALTER TABLE departments DROP CONSTRAINT u_departments_department_name
GO

DROP TABLE IF EXISTS departments
GO



-- UP (Metadata)
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
	employee_id INT IDENTITY(001,1) NOT NULL -- pk
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




-- UP (DATA)

INSERT INTO departments 
	VALUES
		('dc001', 'dept1')
		, ('dc002', 'dept2')
		, ('dc003', 'dept3')
GO

INSERT INTO positions
	VALUES
		('pc001', 'postiion1', 10)
		, ('pc002', 'position2', 20)
		, ('pc003', 'position3', 30)
GO

INSERT INTO employees	
	VALUES
		('smith', 'matt', 'matt.smith@chateaucuse.org', 'dc001', 'pc001')
		, ('stabel', 'sintia', 'sintia.stabel@chateaucuse.org', 'dc002', 'pc002')
		, ('damico', 'bryan', 'bryan.damico@chateaucuse.org', 'dc003', 'pc003')
GO

-- Verify
SELECT * FROM departments
SELECT * FROM positions
SELECT * FROM employees