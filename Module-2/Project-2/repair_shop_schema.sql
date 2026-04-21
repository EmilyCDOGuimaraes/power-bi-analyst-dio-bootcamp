-- Car Repair Shop Database Schema
-- DIO Power BI Bootcamp - Module 2 Project 2

-- Customer (base table)
CREATE TABLE Customer (
    idCustomer INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(200)
);

-- Vehicle 
CREATE TABLE Vehicle (
    plate CHAR(7) PRIMARY KEY,
    Customer_idCustomer INT NOT NULL,
    brand VARCHAR(50),
    model VARCHAR(50),
    year INT,
    color VARCHAR(50),
    CONSTRAINT fk_vehicle_customer FOREIGN KEY (Customer_idCustomer) REFERENCES Customer(idCustomer)
);

-- Mechanic 
CREATE TABLE Mechanic (
    idMechanic INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100)
);

-- Service
CREATE TABLE Service (
    idService INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(250),
    serviceType VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Parts
CREATE TABLE Parts (
    idParts INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(250),
    price DECIMAL(10, 2)
);

-- ServiceOrder
CREATE TABLE ServiceOrder (
    idServiceOrder INT AUTO_INCREMENT PRIMARY KEY,
    Vehicle_plate CHAR(7) NOT NULL,
    Customer_idCustomer INT NOT NULL,
    status VARCHAR(50),
    orderDate DATE,
    completionDate DATE,
    description VARCHAR(250),
    totalValue DECIMAL(10, 2),
    CONSTRAINT fk_so_vehicle FOREIGN KEY (Vehicle_plate) REFERENCES Vehicle(plate),
    CONSTRAINT fk_so_customer FOREIGN KEY (Customer_idCustomer) REFERENCES Customer(idCustomer)
);

-- Payments
CREATE TABLE Payments (
    idPayments INT AUTO_INCREMENT PRIMARY KEY,
    ServiceOrder_idServiceOrder INT NOT NULL,
    paymentDate DATE,
    amount DECIMAL(10, 2),
    paymentType ENUM('Cash', 'Credit Card', 'Debit Card', 'PIX', 'Invoice') NOT NULL,
    CONSTRAINT fk_payments_so FOREIGN KEY (ServiceOrder_idServiceOrder) REFERENCES ServiceOrder(idServiceOrder)
);

-- ServiceOrder_has_Service
CREATE TABLE ServiceOrder_has_Service (
    ServiceOrder_idServiceOrder INT NOT NULL,
    Service_idService INT NOT NULL,
    PRIMARY KEY (ServiceOrder_idServiceOrder, Service_idService),
    quantity INT NOT NULL,
    CONSTRAINT fk_sos_so FOREIGN KEY (ServiceOrder_idServiceOrder) REFERENCES ServiceOrder(idServiceOrder),
    CONSTRAINT fk_sos_service FOREIGN KEY (Service_idService) REFERENCES Service(idService) 
);

-- ServiceOrder_has_Parts
CREATE TABLE ServiceOrder_has_Parts (
    ServiceOrder_idServiceOrder INT NOT NULL,
    Parts_idParts INT NOT NULL,
    PRIMARY KEY (ServiceOrder_idServiceOrder, Parts_idParts),
    quantity INT NOT NULL,
    CONSTRAINT fk_sop_so FOREIGN KEY (ServiceOrder_idServiceOrder) REFERENCES ServiceOrder(idServiceOrder),
    CONSTRAINT fk_sop_parts FOREIGN KEY (Parts_idParts) REFERENCES Parts(idParts)
);

-- ServiceOrder_has_Mechanic
CREATE TABLE ServiceOrder_has_Mechanic (
    ServiceOrder_idServiceOrder INT NOT NULL,
    Mechanic_idMechanic INT NOT NULL,
    PRIMARY KEY (ServiceOrder_idServiceOrder, Mechanic_idMechanic),
    CONSTRAINT fk_som_so FOREIGN KEY (ServiceOrder_idServiceOrder) REFERENCES ServiceOrder(idServiceOrder),
    CONSTRAINT fk_som_mechanic FOREIGN KEY (Mechanic_idMechanic) REFERENCES Mechanic(idMechanic)
);

-- Customers
INSERT INTO Customer (type, email, phone, address) VALUES
('PF', 'carlos@email.com', '11999990001', 'Rua das Palmeiras, 10, São Paulo'),
('PF', 'ana@email.com', '11999990002', 'Av. Brasil, 500, Campinas'),
('PJ', 'frota@empresa.com', '1133330000', 'Rua Industrial, 200, Santo André');

-- Vehicles
INSERT INTO Vehicle (plate, Customer_idCustomer, brand, model, year, color) VALUES
('ABC1234', 1, 'Toyota', 'Corolla', 2019, 'Silver'),
('XYZ5678', 2, 'Honda', 'Civic', 2021, 'Black'),
('DEF9012', 3, 'Ford', 'Transit', 2018, 'White');

-- Mechanics
INSERT INTO Mechanic (name, specialty) VALUES
('Roberto Silva', 'Engine'),
('Fernanda Costa', 'Electrical'),
('Paulo Mendes', 'Suspension');

-- Services
INSERT INTO Service (description, serviceType, price) VALUES
('Oil change', 'Maintenance', 150.00),
('Brake inspection', 'Inspection', 200.00),
('Engine diagnostic', 'Diagnostic', 350.00),
('Wheel alignment', 'Maintenance', 180.00);

-- Parts
INSERT INTO Parts (description, price) VALUES
('Oil filter', 45.00),
('Brake pad set', 220.00),
('Spark plug set', 80.00),
('Air filter', 60.00);

-- Service Orders
INSERT INTO ServiceOrder (Vehicle_plate, Customer_idCustomer, status, orderDate, completionDate, description, totalValue) VALUES
('ABC1234', 1, 'Completed', '2024-01-05', '2024-01-06', 'Oil change + brake inspection', 520.00),
('XYZ5678', 2, 'In Progress', '2024-01-10', NULL, 'Engine diagnostic', 350.00),
('DEF9012', 3, 'Completed', '2024-01-15', '2024-01-17', 'Full maintenance', 980.00),
('ABC1234', 1, 'Pending', '2024-02-01', NULL, 'Wheel alignment', 180.00);

-- Payments
INSERT INTO Payments (ServiceOrder_idServiceOrder, paymentType, paymentDate, amount) VALUES
(1, 'Credit Card', '2024-01-06', 520.00),
(3, 'PIX', '2024-01-17', 980.00);

-- ServiceOrder has Service
INSERT INTO ServiceOrder_has_Service (ServiceOrder_idServiceOrder, Service_idService, quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 3, 1),
(3, 1, 1),
(3, 4, 1);

-- ServiceOrder has Parts
INSERT INTO ServiceOrder_has_Parts (ServiceOrder_idServiceOrder, Parts_idParts, quantity) VALUES
(1, 1, 1),
(1, 2, 1),
(3, 1, 1),
(3, 3, 2),
(3, 4, 1);

-- ServiceOrder has Mechanic
INSERT INTO ServiceOrder_has_Mechanic (ServiceOrder_idServiceOrder, Mechanic_idMechanic) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 1),
(3, 3);