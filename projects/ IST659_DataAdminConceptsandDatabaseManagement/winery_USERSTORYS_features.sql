-------------------------------
--Sintia (Sales) User Stories--
-------------------------------

--As a user, I would like to see how many chardonnay bottles we have in stock
-----------------------------------------------------------------------------
DECLARE @total_bottles AS INT
SET @total_bottles = (
	SELECT
		COUNT(b.bottle_id)
	FROM bottles b 
	INNER JOIN products p ON b.bottle_product_id = p.product_id
)

SELECT @total_bottles
GO


DECLARE @num_bottles_sold AS INT
SET @num_bottles_sold = (
	SELECT
		COUNT(b.bottle_id)
	FROM bottles b 
	INNER JOIN products p ON b.bottle_product_id = p.product_id
	WHERE b.bottle_sold = 1
)

SELECT @num_bottles_sold
GO


DROP VIEW IF EXISTS v_bottles_in_stock_by_product
GO
CREATE VIEW v_bottles_in_stock_by_product AS (
	SELECT 
		p.product_name
		, COUNT(b.bottle_id) as bottles_in_stock
	FROM products p 
	INNER JOIN bottles b ON b.bottle_product_id = p.product_id
	WHERE b.bottle_sold = 0
	GROUP BY p.product_name
)
GO

-- view to see all bottles, sold or not
DROP VIEW IF EXISTS v_bottles_sold_by_product
GO
CREATE VIEW v_bottles_sold_by_product AS (
	SELECT 
		p.product_name
		, COUNT(b.bottle_id) as bottles_sold
	FROM products p 
	INNER JOIN bottles b ON b.bottle_product_id = p.product_id
	WHERE b.bottle_sold = 1
	GROUP BY p.product_name
)
GO



DROP VIEW IF EXISTS v_bottles_sold_and_in_stock
GO
CREATE VIEW v_bottles_sold_and_in_stock AS (
	SELECT 
		a.product_name
		, a.bottles_in_stock
		, b.bottles_sold
	FROM v_bottles_in_stock_by_product a 
	JOIN v_bottles_sold_by_product b ON a.product_name = b.product_name
)
GO



--test
SELECT * FROM v_bottles_in_stock_by_product


--As a user, I would like to see how many orders we have had in 2022 and for what products
------------------------------------------------------------------------------------------
DROP VIEW IF EXISTS v_product_order_count_by_year
GO
CREATE VIEW v_product_order_count_by_year AS (
	SELECT
		YEAR(o.order_date) AS year
		, COUNT(o.order_id) AS order_count
		, p.product_name
	FROM products p
	JOIN bottles b ON b.bottle_product_id = p.product_id
	JOIN orders o ON o.order_bottle_id = b.bottle_id
	GROUP BY
		YEAR(o.order_date)
		, p.product_name
)
GO

-- test
SELECT * FROM v_product_order_count_by_year
ORDER BY year DESC
	


--As a user, I want to see our top seller products
--------------------------------------------------
DROP VIEW IF EXISTS v_top_selling_products
GO

CREATE VIEW v_top_selling_products AS
	SELECT
		COUNT(b.bottle_id) AS bottles_sold_to_date
		, p.product_name
	FROM bottles b
	JOIN products p ON p.product_id = b.bottle_product_id
	GROUP BY p.product_name
GO


--test
SELECT * FROM v_top_selling_products
ORDER BY bottles_sold_to_date DESC




-----------------------------------
--Bryan (Operations) User Stories--
-----------------------------------


-- As a business analyst, I can track a grape from the vineyard to the bottle, for quality assurance purposes. 
---------------------------------------------------------------------------------------------------------------
-- tracking would happen like: 'bottle' -> 'barrel' -> 'fermenter' -> 'vineyard' (harvest date + etc...)
DROP VIEW IF EXISTS v_vine_to_bottle
GO

CREATE VIEW v_vine_to_bottle AS
	SELECT 
		v.vineyard_id
		, v.vineyard_employee_id
		, g.grape_name
		, fv.fermenter_id
		, f.fermenter_employee_id
		, fv.fermenter_start_date
		, fv.fermenter_end_date
		, b1.barrel_number
		, b1.barrel_cellar_id
		, b1.barrel_start_date
		, b1.barrel_end_date
		, b2.bottle_label_number
		, b2.bottle_fill_date
		, o.order_id
		, o.order_shipper_id
		, c.customer_id
		, c.customer_email
	FROM vineyards v
	JOIN grapes g ON g.grape_id = v.vineyard_grape_id
	JOIN fermenters_vineyards fv ON fv.fermenter_vineyard_id = v.vineyard_id
	JOIN fermenters f ON fv.fermenter_id = f.fermenter_id
	JOIN barrels b1 ON b1.barrel_fermenter_id = fv.fermenter_id
	JOIN bottles b2 ON b2.bottle_barrel_id = b1.barrel_id
	JOIN orders o ON o.order_bottle_id = b2.bottle_id
	JOIN customers c ON c.customer_id = o.order_customer_id
	WHERE b2.bottle_sold = 1
GO

SELECT * FROM v_vine_to_bottle
 

-- As a business analyst, I can see how long a product was aged for, to ensure that the same product is being aged consistently. 
---------------------------------------------------------------------------------------------------------------------------------
DROP VIEW IF EXISTS v_product_aging
GO

CREATE VIEW v_product_aging AS
	SELECT 
		p.product_name
		, b2.barrel_number
		, b2.barrel_start_date
		, b2.barrel_end_date
	FROM products p
	JOIN bottles b1 ON b1.bottle_product_id = p.product_id
	JOIN barrels b2 ON b2.barrel_id = b1.bottle_barrel_id
GO


SELECT * FROM v_product_aging
GO

-- As a business analyst, I can see when it a product was bottled, for quality assurance/recall purposes in case there was an issue on the bottling line.
-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- USE v_vine_to_bottle for this (can get the same thing)
 

-- As a business analyst, I can see how long each product underwent the fermentation process and which fermenter was used, for quality assurance purposes.
-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- USE v_vine_to_bottle for this (can get the same thing)



-- Total sales by product


DROP VIEW IF EXISTS v_sales_revenue
GO

CREATE VIEW v_sales_revenue AS (
	SELECT
		p.product_name
		, p.product_price
		, v1.bottles_sold
	FROM products p
	JOIN v_bottles_sold_and_in_stock v1 ON p.product_name = v1.product_name
)
GO


SELECT * FROM v_sales_revenue