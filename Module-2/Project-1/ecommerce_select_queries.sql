-- Q1: How many orders did each customer make?
SELECT c.idCustomer, c.email, COUNT(o.idOrder) AS totalOrders
FROM Customer c
LEFT JOIN Orders o ON c.idCustomer = o.Customer_idCustomer
GROUP BY c.idCustomer, c.email;

-- Q2: Orders with their total value (derived attribute)
SELECT o.idOrder, o.orderDate, o.status,
    SUM(pho.quantity * pho.unitPrice) + o.shippingCost AS totalOrderValue
FROM Orders o
JOIN ProductHasOrders pho ON o.idOrder = pho.Orders_idOrder
GROUP BY o.idOrder, o.orderDate, o.status, o.shippingCost;

-- Q3: Customers who spent more than 1000 (HAVING)
SELECT c.email, SUM(pho.quantity * pho.unitPrice) AS totalSpent
FROM Customer c
JOIN Orders o ON c.idCustomer = o.Customer_idCustomer
JOIN ProductHasOrders pho ON o.idOrder = pho.Orders_idOrder
GROUP BY c.email
HAVING totalSpent > 1000
ORDER BY totalSpent DESC;

-- Q4: Products, their suppliers and stock locations (JOIN)
SELECT p.name AS product, s.companyName AS supplier, st.location AS stockLocation
FROM Product p
JOIN ProductHasSupplier phs ON p.idProduct = phs.Product_idProduct
JOIN Supplier s ON phs.Supplier_idSupplier = s.idSupplier
JOIN ProductHasStock phst ON p.idProduct = phst.Product_idProduct
JOIN Stock st ON phst.Stock_idStock = st.idStock;

-- Q5: Orders filtered by status (WHERE + ORDER BY)
SELECT o.idOrder, c.email, o.status, o.orderDate
FROM Orders o
JOIN Customer c ON o.Customer_idCustomer = c.idCustomer
WHERE o.status = 'Delivered'
ORDER BY o.orderDate DESC;

-- Q6: Any seller that is also a supplier?
SELECT se.companyName AS seller, su.companyName AS supplier
FROM Seller se
JOIN Supplier su ON se.companyName = su.companyName;

-- Q7: Delivery status and tracking per order
SELECT o.idOrder, c.email, d.deliveryStatus, d.trackingCode
FROM Orders o
JOIN Customer c ON o.Customer_idCustomer = c.idCustomer
JOIN Delivery d ON o.idOrder = d.Order_idOrder;

-- Q8: Payment methods per order
SELECT o.idOrder, COUNT(p.idPayment) AS paymentMethods, 
    GROUP_CONCAT(p.paymentType) AS methods
FROM Orders o
JOIN Payment p ON o.idOrder = p.Order_idOrder
GROUP BY o.idOrder;