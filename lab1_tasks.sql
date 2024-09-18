
-- 1. Create database called «lab1»
CREATE DATABASE lab1;

-- Use the lab1 database
USE lab1;

-- 2. Create table «users» with following fields
CREATE TABLE users (
    id INT AUTO_INCREMENT,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    PRIMARY KEY (id)
);

-- 3. Add integer column (0 or 1) «isadmin» to «users» table
ALTER TABLE users
ADD COLUMN isadmin INT;

-- 4. Change type of «isadmin» column to boolean
ALTER TABLE users
MODIFY COLUMN isadmin BOOLEAN;

-- 5. Set default value as false to «isadmin» column
ALTER TABLE users
ALTER COLUMN isadmin SET DEFAULT FALSE;

-- 6. Add primary key constraint to id column
-- (Already added during table creation)

-- 7. Create table «tasks» with following fields
CREATE TABLE tasks (
    id INT AUTO_INCREMENT,
    name VARCHAR(50),
    user_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 8. Delete «tasks» table
DROP TABLE tasks;

-- 9. Delete «lab1» database
DROP DATABASE lab1;
