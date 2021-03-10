-- non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT CustomerId, FirstName, LastName, Country 
FROM Customer 
WHERE Country NOT IN ("USA")

-- brazil_customers.sql: Provide a query only showing the Customers from Brazil.
SELECT CustomerId, FirstName, LastName, Country
FROM Customer
WHERE Country IN ("Brazil")

-- brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT FirstName, LastName, InvoiceId, InvoiceDate, BillingCountry
FROM Customer
JOIN Invoice
    ON Customer.CustomerId = Invoice.CustomerId
WHERE BillingCountry IN ("Brazil")

-- sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
SELECT FirstName
FROM Employee
WHERE Title LIKE "%Sales%"

-- unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
SELECT DISTINCT BillingCountry
FROM Invoice

-- sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT Employee.FirstName, Employee.LastName, Invoice.InvoiceId
FROM Employee
JOIN Customer 
    ON Employee.EmployeeId = Customer.SupportRepId
JOIN Invoice 
    ON Customer.CustomerId = Invoice.CustomerId

-- invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT Total, 
Customer.FirstName as customerFirstName, 
Customer.LastName as customerLastName, 
BillingCountry, 
Employee.FirstName, 
Employee.LastName 
FROM Invoice    
JOIN Customer 
    ON Customer.CustomerId = Invoice.CustomerId
JOIN Employee 
    ON Customer.SupportRepId = Employee.EmployeeId


-- total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?
SELECT
	NumberOfInvoices,
	InvoiceYear
FROM
	(SELECT
		COUNT(i.InvoiceId) NumberOfInvoices,
		strftime ('%Y', i.InvoiceDate) InvoiceYear
	FROM Invoice i
	GROUP BY InvoiceYear) AS Aggregate
WHERE InvoiceYear IN ("2009", "2011") 

-- total_sales_{year}.sql: What are the respective total sales for each of those years?
SELECT
	TotalOfSales,
	InvoiceYear
FROM
	(SELECT
		SUM(i.Total) TotalOfSales,
		strftime ('%Y', i.InvoiceDate) InvoiceYear
	FROM Invoice i
	GROUP BY InvoiceYear) AS Aggregate
WHERE InvoiceYear IN ("2009", "2011")

-- invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT(InvoiceLineId) NumOfLineItems 
FROM InvoiceLine
WHERE InvoiceId = 37
    
 



