-- Task 1: Create database
CREATE DATABASE lab4;

-- Connect to the created database
\c lab4;

-- Task 2: Create tables
CREATE TABLE Warehouses (
    code INT PRIMARY KEY,
    location VARCHAR(255),
    capacity INT
);

CREATE TABLE Boxes (
    code CHAR(4) PRIMARY KEY,
    contents VARCHAR(255),
    value REAL,
    warehouse INT,
    FOREIGN KEY (warehouse) REFERENCES Warehouses(code)
);

-- Insert data into Warehouses
INSERT INTO Warehouses (code, location, capacity) VALUES
(1, 'Chicago', 3),
(2, 'Chicago', 4),
(3, 'New York', 7),
(4, 'Los Angeles', 2),
(5, 'San Francisco', 8);

-- Insert data into Boxes
INSERT INTO Boxes (code, contents, value, warehouse) VALUES
('0MN7', 'Rocks', 180, 3),
('4H8P', 'Rocks', 250, 1),
('4RT3', 'Scissors', 190, 4),
('7G3H', 'Rocks', 200, 1),
('8JN6', 'Papers', 75, 1),
('8Y6U', 'Papers', 50, 3),
('9J6F', 'Papers', 175, 2),
('LL08', 'Rocks', 140, 4),
('P0H6', 'Scissors', 125, 1),
('P2T6', 'Scissors', 150, 2),
('TU55', 'Papers', 90, 5);

-- Task 4: Select all warehouses with all columns
SELECT * FROM Warehouses;

-- Task 5: Select all boxes with a value larger than $150
SELECT * FROM Boxes WHERE value > 150;

-- Task 6: Select all boxes distinct by contents
SELECT DISTINCT contents FROM Boxes;

-- Task 7: Select the warehouse code and the number of the boxes in each warehouse
SELECT warehouse, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse;

-- Task 8: Select only those warehouses where the number of boxes is greater than 2
SELECT warehouse, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse
HAVING COUNT(*) > 2;

-- Task 9: Create a new warehouse in New York with a capacity for 3 boxes
INSERT INTO Warehouses (code, location, capacity) VALUES (6, 'New York', 3);

-- Task 10: Create a new box with code "H5RT", containing "Papers", with value of $200, and located in warehouse 2
INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('H5RT', 'Papers', 200, 2);

-- Task 11: Reduce the value of the third largest box by 15%
UPDATE Boxes
SET value = value * 0.85
WHERE code = (SELECT code FROM Boxes ORDER BY value DESC LIMIT 1 OFFSET 2);

-- Task 12: Remove all boxes with a value lower than $150
DELETE FROM Boxes WHERE value < 150;

-- Task 13: Remove all boxes located in New York and return all deleted data
DELETE FROM Boxes
WHERE warehouse = (SELECT code FROM Warehouses WHERE location = 'New York')
RETURNING *;