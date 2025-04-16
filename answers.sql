-- Question 1: Achieving 1NF (FIRST Normal Form)


-- Transform ProductDetail table to achieve 1NF
-- Create a new normalized table: ProductDetail_1NF
CREATE TABLE ProductDetail_1NF (
  OrderID INT,
  CustomerName VARCHAR(255),
  Product VARCHAR(255)
);

-- Insert each product as a separate row
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
  (101, 'John Doe', 'Laptop'),
  (101, 'John Doe', 'Mouse'),
  (102, 'Jane Smith', 'Tablet'),
  (102, 'Jane Smith', 'Keyboard'),
  (102, 'Jane Smith', 'Mouse'),
  (103, 'Emily Clark', 'Phone');








-- Question 2: Achieving 2NF (Second Normal Form)

-- Step 1: Create Orders table to store OrderID and CustomerName
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(255)
);

-- Insert unique OrderID and CustomerName pairs
INSERT INTO Orders (OrderID, CustomerName)
VALUES 
  (101, 'John Doe'),
  (102, 'Jane Smith'),
  (103, 'Emily Clark');

-- Step 2: Create OrderDetails_2NF table to store OrderID, Product, and Quantity
CREATE TABLE OrderDetails_2NF (
  OrderID INT,
  Product VARCHAR(255),
  Quantity INT,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert detailed order information
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
VALUES 
  (101, 'Laptop', 2),
  (101, 'Mouse', 1),
  (102, 'Tablet', 3),
  (102, 'Keyboard', 1),
  (102, 'Mouse', 2),
  (103, 'Phone', 1);
