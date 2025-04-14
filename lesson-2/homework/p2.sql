CREATE TABLE data_types_demo (
    id TINYINT,
    age SMALLINT,
    salary INT,
    national_debt BIGINT
);

INSERT INTO data_types_demo (id, age, salary, national_debt)
VALUES (25, 32767, 500000, 9000000000);

SELECT * FROM data_types_demo;


