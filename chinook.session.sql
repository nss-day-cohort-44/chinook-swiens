-- non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
-- SELECT CustomerId, FirstName, LastName, Country 
-- FROM Customer 
-- WHERE Country NOT IN ("USA")

-- brazil_customers.sql: Provide a query only showing the Customers from Brazil.
-- SELECT CustomerId, FirstName, LastName, Country
-- FROM Customer
-- WHERE Country IN ("Brazil")

-- brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT FirstName, LastName, InvoiceId, InvoiceDate, BillingCountry
FROM Customer
JOIN Invoice
    ON Customer.CustomerId = Invoice.CustomerId
WHERE BillingCountry IN ("Brazil")

-- sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
SELECT FirstName
FROM Employee
WHERE Title LIKE ("Sales")


