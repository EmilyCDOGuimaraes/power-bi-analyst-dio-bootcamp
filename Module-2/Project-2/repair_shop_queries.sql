-- Q1: How many service orders per customer?
SELECT c.idCustomer, c.email, COUNT(so.idServiceOrder) AS totalOrders
FROM Customer c
LEFT JOIN ServiceOrder so ON c.idCustomer = so.Customer_idCustomer
GROUP BY c.idCustomer, c.email;

-- Q2: Total parts and labor cost per service order (derived attribute)
SELECT so.idServiceOrder, so.description, so.orderDate,
    so.totalValue AS billedTotal,
    (SELECT COALESCE(SUM(s.price * sos.quantity), 0)
     FROM ServiceOrder_has_Service sos
     JOIN Service s ON sos.Service_idService = s.idService
     WHERE sos.ServiceOrder_idServiceOrder = so.idServiceOrder) +
    (SELECT COALESCE(SUM(pt.price * sop.quantity), 0)
     FROM ServiceOrder_has_Parts sop
     JOIN Parts pt ON sop.Parts_idParts = pt.idParts
     WHERE sop.ServiceOrder_idServiceOrder = so.idServiceOrder) AS calculatedTotal
FROM ServiceOrder so;

-- Q3: Orders with total value above 500 (HAVING)
SELECT c.email, COUNT(so.idServiceOrder) AS orders,
    SUM(so.totalValue) AS totalSpent
FROM Customer c
JOIN ServiceOrder so ON c.idCustomer = so.Customer_idCustomer
GROUP BY c.email
HAVING totalSpent > 500
ORDER BY totalSpent DESC;

-- Q4: Which mechanics worked on which vehicles? (JOIN)
SELECT m.name AS mechanic, v.brand, v.model, v.plate, so.status
FROM Mechanic m
JOIN ServiceOrder_has_Mechanic som ON m.idMechanic = som.Mechanic_idMechanic
JOIN ServiceOrder so ON som.ServiceOrder_idServiceOrder = so.idServiceOrder
JOIN Vehicle v ON so.Vehicle_plate = v.plate
ORDER BY m.name;

-- Q5: Completed orders only (WHERE + ORDER BY)
SELECT so.idServiceOrder, c.email, v.plate, so.orderDate, so.completionDate, so.totalValue
FROM ServiceOrder so
JOIN Customer c ON so.Customer_idCustomer = c.idCustomer
JOIN Vehicle v ON so.Vehicle_plate = v.plate
WHERE so.status = 'Completed'
ORDER BY so.completionDate DESC;

-- Q6: Parts used per service order
SELECT so.idServiceOrder, v.model, p.description AS part, sop.quantity, p.price,
    sop.quantity * p.price AS partTotal
FROM ServiceOrder so
JOIN Vehicle v ON so.Vehicle_plate = v.plate
JOIN ServiceOrder_has_Parts sop ON so.idServiceOrder = sop.ServiceOrder_idServiceOrder
JOIN Parts p ON sop.Parts_idParts = p.idParts