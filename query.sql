USE classicmodels;

-- find out the revenue contributed by product lines
SELECT p.productLine, sum(o.quantityOrdered * o.priceEach)
FROM products p
INNER JOIN
orderdetails o ON p.productCode = o.productCode
GROUP BY p.productLine
ORDER BY p.productCode;


-- monthly revenue
SELECT (YEAR(payments.paymentDate) * 100) + MONTH(payments.paymentDate) AS yyyyMM, 
DATE_FORMAT(payments.paymentDate, '%Y-%m') as new_date_format,
sum(payments.amount)
FROM payments
GROUP BY (YEAR(payments.paymentDate) * 100) + MONTH(payments.paymentDate)
ORDER BY yyyyMM;

-- find country origin of customers
SELECT 
    country, COUNT(country) AS count_countries
FROM
    customers 
GROUP BY country
ORDER BY count_countries DESC
LIMIT 10;


-- top 10 best performing sales rep
SELECT CONCAT(e.lastName, " ", e.firstName) as name, COUNT(c.salesRepEmployeeNumber) as customers_served
FROM employees e
INNER JOIN customers c ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY c.salesRepEmployeeNumber
ORDER BY customers_served DESC;
