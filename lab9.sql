CREATE PROCEDURE increase_value(IN input_value INT, OUT result_value INT) AS $$
BEGIN
    SET result_value = input_value + 10;
END; $$
LANGUAGE plpgsql;


CREATE PROCEDURE compare_numbers(IN num1 INT, IN num2 INT, OUT comparison_result VARCHAR(10)) AS $$
BEGIN
    IF num1 > num2 THEN
        SET comparison_result = 'Greater';
    ELSEIF num1 = num2 THEN
        SET comparison_result = 'Equal';
    ELSE
        SET comparison_result = 'Lesser';
    END IF;
END; $$
LANGUAGE plpgsql;


CREATE PROCEDURE number_series(IN n INT, OUT series TEXT) AS $$
BEGIN
    DECLARE i INT DEFAULT 1;
    SET series = '';
    WHILE i <= n DO
        SET series = CONCAT(series, i, IF(i < n, ', ', ''));
        SET i = i + 1;
    END WHILE;
END; $$
LANGUAGE plpgsql;


CREATE PROCEDURE find_employee(IN employee_name VARCHAR(255)) AS $$
BEGIN
    SELECT * 
    FROM employees
    WHERE name = employee_name;
END; $$
LANGUAGE plpgsql;


CREATE PROCEDURE list_products(IN category_name VARCHAR(255)) AS $$
BEGIN
    SELECT * 
    FROM products
    WHERE category = category_name;
END; $$
LANGUAGE plpgsql;


CREATE PROCEDURE calculate_bonus(IN employee_id INT, OUT bonus_amount DECIMAL(10,2)) AS $$
BEGIN
    SELECT salary * 0.1 INTO bonus_amount
    FROM employees
    WHERE id = employee_id;
END; $$
LANGUAGE plpgsql;


CREATE PROCEDURE update_salary(IN employee_id INT) AS $$
BEGIN
    DECLARE bonus_amount DECIMAL(10,2);
    CALL calculate_bonus(employee_id, bonus_amount);
    UPDATE employees
    SET salary = salary + bonus_amount
    WHERE id = employee_id;
END; $$
LANGUAGE plpgsql;


CREATE PROCEDURE complex_calculation(IN input_string VARCHAR(255), IN input_number INT, OUT result VARCHAR(255)) AS $$
BEGIN
    DECLARE string_part VARCHAR(255);
    DECLARE numeric_part INT;

    SET string_part = CONCAT('Processed: ', UPPER(input_string));

    SET numeric_part = input_number * input_number;

    SET result = CONCAT(string_part, ' | Square: ', numeric_part);
END; $$
LANGUAGE plpgsql;