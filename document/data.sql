CREATE DATABASE myphamstoredb;
USE myphamstoredb;

CREATE TABLE User (
    id INT PRIMARY KEY auto_increment,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    fullName VARCHAR(255),
    isSuperuser BOOLEAN
);


CREATE TABLE Customer (
    id INT PRIMARY KEY auto_increment,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    fullName VARCHAR(255),
    phoneNumber VARCHAR(10),
    defaultAddress INT,
    createdDate DATETIME,
    updatedDate DATETIME
);
CREATE TABLE Address (
    id INT PRIMARY KEY auto_increment,
    phoneNumber VARCHAR(10),
    city VARCHAR(255),
    district VARCHAR(255),
    ward VARCHAR(255),
    detail TEXT,
    isDefault BOOLEAN DEFAULT FALSE,
    customerId int ,
    FOREIGN KEY (customerId) REFERENCES Customer(id)
);


CREATE TABLE Brand (
    id INT PRIMARY KEY auto_increment,
    name VARCHAR(255),
    logo TEXT
);

CREATE TABLE Category (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
);

CREATE TABLE Product (
    id INT PRIMARY KEY auto_increment, 
    name VARCHAR(255),
    price DOUBLE,
    stock INT,
    soldQuantity INT,
    description TEXT,
    introduction TEXT,
    `usage` TEXT,
    ingredients TEXT,
    isAvailable BOOLEAN,
    createdDate DATETIME,
    updatedDate DATETIME,
    brandId INT,
    categoryId int,
    FOREIGN KEY (brandId) REFERENCES Brand(id),
    foreign key (categoryId) references Category(id)
);

CREATE TABLE ProductImage (
    id INT PRIMARY KEY auto_increment,
    url TEXT,
    productId INT,
    FOREIGN KEY (productId) REFERENCES Product(id)
);

CREATE TABLE Review (
    id INT PRIMARY KEY auto_increment,
    rating FLOAT,
    comment TEXT,
    createdDate DATETIME,
    updatedDate DATETIME,
    customerId INT,
    productId INT,
    FOREIGN KEY (customerId) REFERENCES Customer(id),
    foreign key (productId) references Product(id)
);

CREATE TABLE `Order` (
    id INT PRIMARY KEY auto_increment,
    orderDate DATETIME,
    orderTotal DOUBLE,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled'),
    paymentMethod ENUM('Credit Card', 'PayPal', 'Cash on Delivery'),
    recipientName VARCHAR(255),
    recipientPhone VARCHAR(10),
    addressId INT ,
    customerId INT,
    FOREIGN KEY (addressId) REFERENCES Address(id),
    FOREIGN KEY (customerId) REFERENCES Customer(id)
);

CREATE TABLE OrderItem (
    orderId INT,
    productId INT,
    quantity INT,
    subTotal DOUBLE,
    PRIMARY KEY (orderId, productId),
    FOREIGN KEY (orderId) REFERENCES `Order`(id),
    FOREIGN KEY (productId) REFERENCES Product(id)
);
INSERT INTO User (email, password, fullName, isSuperuser) VALUES
('admin@example.com', 'password123', 'Admin User', TRUE),
('user1@example.com', 'password123', 'User One', FALSE),
('user2@example.com', 'password123', 'User Two', FALSE),
('user3@example.com', 'password123', 'User Three', FALSE),
('user4@example.com', 'password123', 'User Four', FALSE);
INSERT INTO Customer (email, password, fullName, phoneNumber, defaultAddress, createdDate, updatedDate) VALUES
('cust1@example.com', 'custpass123', 'Customer One', '0123456789', NULL, NOW(), NOW()),
('cust2@example.com', 'custpass123', 'Customer Two', '0987654321', NULL, NOW(), NOW()),
('cust3@example.com', 'custpass123', 'Customer Three', '0223344556', NULL, NOW(), NOW()),
('cust4@example.com', 'custpass123', 'Customer Four', '0334455667', NULL, NOW(), NOW()),
('cust5@example.com', 'custpass123', 'Customer Five', '0445566778', NULL, NOW(), NOW());
INSERT INTO Address (phoneNumber, city, district, ward, detail, isDefault, customerId) VALUES
('0123456789', 'City A', 'District X', 'Ward 1', '123 Street A', TRUE, 1),
('0987654321', 'City B', 'District Y', 'Ward 2', '456 Street B', TRUE, 2),
('0223344556', 'City C', 'District Z', 'Ward 3', '789 Street C', TRUE, 3),
('0334455667', 'City D', 'District W', 'Ward 4', '101 Street D', TRUE, 4),
('0445566778', 'City E', 'District V', 'Ward 5', '102 Street E', TRUE, 5);
INSERT INTO Brand (name, logo) VALUES
('Brand A', 'Logo A'),
('Brand B', 'Logo B'),
('Brand C', 'Logo C'),
('Brand D', 'Logo D'),
('Brand E', 'Logo E');
INSERT INTO Category (id, name, description) VALUES
(1, 'Category A', 'Description A'),
(2, 'Category B', 'Description B'),
(3, 'Category C', 'Description C'),
(4, 'Category D', 'Description D'),
(5, 'Category E', 'Description E');
INSERT INTO Product (name, price, stock, soldQuantity, description, introduction, `usage`, ingredients, isAvailable, createdDate, updatedDate, brandId, categoryId) VALUES
('Product 1', 100.00, 50, 10, 'Description 1', 'Introduction 1', 'Usage 1', 'Ingredients 1', TRUE, NOW(), NOW(), 1, 1),
('Product 2', 150.00, 30, 5, 'Description 2', 'Introduction 2', 'Usage 2', 'Ingredients 2', TRUE, NOW(), NOW(), 2, 2),
('Product 3', 200.00, 40, 20, 'Description 3', 'Introduction 3', 'Usage 3', 'Ingredients 3', TRUE, NOW(), NOW(), 3, 3),
('Product 4', 250.00, 25, 15, 'Description 4', 'Introduction 4', 'Usage 4', 'Ingredients 4', TRUE, NOW(), NOW(), 4, 4),
('Product 5', 300.00, 10, 8, 'Description 5', 'Introduction 5', 'Usage 5', 'Ingredients 5', TRUE, NOW(), NOW(), 5, 5);
INSERT INTO ProductImage (url, productId) VALUES
('https://example.com/img1.jpg', 1),
('https://example.com/img2.jpg', 2),
('https://example.com/img3.jpg', 3),
('https://example.com/img4.jpg', 4),
('https://example.com/img5.jpg', 5);
INSERT INTO Review (rating, comment, createdDate, updatedDate, customerId, productId) VALUES
(4.5, 'Great product!', NOW(), NOW(), 1, 1),
(4.0, 'Very good!', NOW(), NOW(), 2, 2),
(5.0, 'Excellent!', NOW(), NOW(), 3, 3),
(3.5, 'Good but could be better.', NOW(), NOW(), 4, 4),
(4.8, 'Loved it!', NOW(), NOW(), 5, 5);
INSERT INTO `Order` (orderDate, orderTotal, status, paymentMethod, recipientName, recipientPhone, addressId, customerId) VALUES
(NOW(), 500.00, 'Pending', 'Credit Card', 'Customer One', '0123456789', 1, 1),
(NOW(), 700.00, 'Shipped', 'PayPal', 'Customer Two', '0987654321', 2, 2),
(NOW(), 300.00, 'Delivered', 'Cash on Delivery', 'Customer Three', '0223344556', 3, 3),
(NOW(), 400.00, 'Cancelled', 'Credit Card', 'Customer Four', '0334455667', 4, 4),
(NOW(), 600.00, 'Pending', 'Credit Card', 'Customer Five', '0445566778', 5, 5);
INSERT INTO OrderItem (orderId, productId, quantity, subTotal) VALUES
(1, 1, 2, 200.00),
(2, 2, 3, 450.00),
(3, 3, 1, 150.00),
(4, 4, 2, 500.00),
(5, 5, 1, 300.00);
