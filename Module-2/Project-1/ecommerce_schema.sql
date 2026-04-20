-- E-commerce Database Schema
-- DIO Power BI Bootcamp - Module 2 Project 1

-- Customer (base table)
CREATE TABLE Customer (
    idCustomer INT AUTO_INCREMENT PRIMARY KEY,
    type ENUM('PF', 'PJ') NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(200)
);

-- Customer PF - Individual
CREATE TABLE CustomerPF (
    idCustomerPF INT PRIMARY KEY AUTO_INCREMENT,
    Customer_idCustomer INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    dateBirth DATE,
    CONSTRAINT fk_customer_pf FOREIGN KEY (Customer_idCustomer) REFERENCES Customer(idCustomer)
);

-- Customer PJ - Company
CREATE TABLE CustomerPJ (
    idCustomerPJ INT PRIMARY KEY AUTO_INCREMENT,
    Customer_idCustomer INT NOT NULL,
    companyName VARCHAR(100) NOT NULL,
    CNPJ CHAR(14) UNIQUE NOT NULL,
    CONSTRAINT fk_customerpj FOREIGN KEY (Customer_idCustomer) REFERENCES Customer(idCustomer)
);

-- Product
CREATE TABLE Product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(250),
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(50)
);

-- Orders
CREATE TABLE Orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    Customer_idCustomer INT NOT NULL,
    status VARCHAR(50),
    orderDate DATE,
    description VARCHAR(250),
    shippingCost DECIMAL(10, 2),
    CONSTRAINT fk_order_customer FOREIGN KEY (Customer_idCustomer) REFERENCES Customer(idCustomer)
);

-- Payment 
CREATE TABLE Payment (
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    Order_idOrder INT NOT NULL,
    paymentType ENUM('Invoice', 'Credit Card', 'Debit Card', 'PIX'),
    paymentDate DATE,
    paymentStatus VARCHAR(50),
    CONSTRAINT fk_payment_order FOREIGN KEY (Order_idOrder) REFERENCES Orders(idOrder)
);

-- Stock
CREATE TABLE Stock (
    idStock INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(100),
    quantity INT
);

-- Supplier
CREATE TABLE Supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    companyName VARCHAR(100) NOT NULL,
    contact VARCHAR(100),
    CNPJ CHAR(14) UNIQUE NOT NULL
);

-- Seller
CREATE TABLE Seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    companyName VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- Delivery
CREATE TABLE Delivery (
    idDelivery INT AUTO_INCREMENT PRIMARY KEY,
    Order_idOrder INT NOT NULL,
    deliveryStatus VARCHAR(50),
    trackingCode VARCHAR(50),
    CONSTRAINT fk_delivery_order FOREIGN KEY (Order_idOrder) REFERENCES Orders(idOrder)
);

-- Product has Supplier
CREATE TABLE ProductHasSupplier (
    Product_idProduct INT NOT NULL,
    Supplier_idSupplier INT NOT NULL,
    PRIMARY KEY (Product_idProduct, Supplier_idSupplier),
    CONSTRAINT fk_ps_product FOREIGN KEY (Product_idProduct) REFERENCES Product(idProduct),
    CONSTRAINT fk_ps_supplier FOREIGN KEY (Supplier_idSupplier) REFERENCES Supplier(idSupplier)
);

-- Product has Stock
CREATE TABLE ProductHasStock (
    Product_idProduct INT NOT NULL,
    Stock_idStock INT NOT NULL,
    PRIMARY KEY (Product_idProduct, Stock_idStock),
    CONSTRAINT fk_pst_product FOREIGN KEY (Product_idProduct) REFERENCES Product(idProduct),
    CONSTRAINT fk_pst_stock FOREIGN KEY (Stock_idStock) REFERENCES Stock(idStock)
);

-- Product has Orders
CREATE TABLE ProductHasOrders (
    Product_idProduct INT NOT NULL,
    Orders_idOrder INT NOT NULL,
    quantity INT,
    unitPrice DECIMAL(10, 2),
    PRIMARY KEY (Product_idProduct, Orders_idOrder),
    CONSTRAINT fk_po_product FOREIGN KEY (Product_idProduct) REFERENCES Product(idProduct),
    CONSTRAINT fk_po_order FOREIGN KEY (Orders_idOrder) REFERENCES Orders(idOrder)
);

-- Seller has Product
CREATE TABLE SellerHasProduct (
    Seller_idSeller INT NOT NULL,
    Product_idProduct INT NOT NULL,
    quantity INT,
    PRIMARY KEY (Seller_idSeller, Product_idProduct),
    CONSTRAINT fk_sp_seller FOREIGN KEY (Seller_idSeller) REFERENCES Seller(idSeller),
    CONSTRAINT fk_sp_product FOREIGN KEY (Product_idProduct) REFERENCES Product(idProduct)
);


-- INSERT part

-- Customers
INSERT INTO Customer (type, email, phone, address) VALUES
('PF', 'joao@email.com', '11999999001', 'Rua A, 100, São Paulo'),
('PF', 'maria@email.com', '11999999002', 'Rua B, 200, Rio de Janeiro'),
('PJ', 'contato@techcorp.com', '1133334444', 'Av. Paulista, 1000, São Paulo'),
('PJ', 'vendas@shopbr.com', '1133335555', 'Rua das Flores, 50, Curitiba');

-- CustomerPF
INSERT INTO CustomerPF (Customer_idCustomer, name, lastName, CPF, dateBirth) VALUES
(1, 'João', 'Silva', '12345678901', '1990-05-15'),
(2, 'Maria', 'Oliveira', '98765432100', '1985-08-22');

-- CustomerPJ
INSERT INTO CustomerPJ (Customer_idCustomer, companyName, CNPJ) VALUES
(3, 'Tech Corp Ltda', '12345678000195'),
(4, 'Shop BR Comércio', '98765432000110');

-- Products
INSERT INTO Product (name, description, price, category) VALUES
('Notebook Dell', 'Notebook i7 16GB RAM', 4500.00, 'Electronics'),
('Mouse Logitech', 'Wireless mouse', 150.00, 'Peripherals'),
('Monitor LG 27"', '4K IPS Monitor', 2200.00, 'Electronics'),
('Teclado Mecânico', 'RGB mechanical keyboard', 350.00, 'Peripherals');

-- Suppliers
INSERT INTO Supplier (companyName, contact, CNPJ) VALUES
('Dell Brasil', 'dell@supplier.com', '11111111000111'),
('Logitech Brasil', 'logi@supplier.com', '22222222000122');

-- Sellers
INSERT INTO Seller (companyName, location) VALUES
('Seller Tech', 'São Paulo'),
('Mega Store', 'Rio de Janeiro');

-- Stock
INSERT INTO Stock (location, quantity) VALUES
('Galpão SP', 100),
('Galpão RJ', 50);

-- Orders
INSERT INTO Orders (Customer_idCustomer, status, orderDate, description, shippingCost) VALUES
(1, 'Delivered', '2024-01-10', 'First order', 25.00),
(2, 'Processing', '2024-01-15', 'Second order', 15.00),
(3, 'Delivered', '2024-01-20', 'Corporate order', 0.00),
(1, 'Cancelled', '2024-02-01', 'Cancelled order', 25.00);

-- Payment
INSERT INTO Payment (Order_idOrder, paymentType, paymentDate, paymentStatus) VALUES
(1, 'Credit Card', '2024-01-10', 'Approved'),
(1, 'PIX', '2024-01-10', 'Approved'),
(2, 'Debit Card', '2024-01-15', 'Approved'),
(3, 'Invoice', '2024-01-20', 'Pending');

-- Delivery
INSERT INTO Delivery (Order_idOrder, deliveryStatus, trackingCode) VALUES
(1, 'Delivered', 'BR123456789'),
(2, 'In Transit', 'BR987654321'),
(3, 'Delivered', 'BR111222333');

-- ProductHasOrders
INSERT INTO ProductHasOrders (Product_idProduct, Orders_idOrder, quantity, unitPrice) VALUES
(1, 1, 1, 4500.00),
(2, 1, 2, 150.00),
(3, 2, 1, 2200.00),
(1, 3, 2, 4500.00);

-- ProductHasSupplier
INSERT INTO ProductHasSupplier (Product_idProduct, Supplier_idSupplier) VALUES
(1, 1),
(2, 2),
(3, 1);

-- ProductHasStock
INSERT INTO ProductHasStock (Product_idProduct, Stock_idStock) VALUES
(1, 1),
(2, 1),
(3, 2);

-- SellerHasProduct
INSERT INTO SellerHasProduct (Seller_idSeller, Product_idProduct, quantity) VALUES
(1, 1, 10),
(1, 2, 25),
(2, 3, 8);