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

