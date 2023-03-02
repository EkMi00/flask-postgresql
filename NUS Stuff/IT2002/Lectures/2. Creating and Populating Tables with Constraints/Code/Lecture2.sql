CREATE TABLE downloads(
    first_name VARCHAR(64),
    last_name VARCHAR(64),
    email VARCHAR(64),
    dob DATE,
    since DATE,
    customerid VARCHAR(16),
    country VARCHAR(16),
    name VARCHAR(32),
    version CHAR(3),
    price NUMERIC);

CREATE TABLE customers (
    first_name VARCHAR(64),
    last_name VARCHAR(64),
    email VARCHAR(64),
    dob DATE,
    since DATE,
    customerid VARCHAR(16),
    country VARCHAR(16));

CREATE TABLE games (
    name VARCHAR(32),
    version CHAR(3),
    price DECIMAL(2,2));

CREATE TABLE downloads(
    customerid VARCHAR(16),
    name VARCHAR(32),
    version CHAR(3));


INSERT INTO downloads VALUES("...", "..."...)

PRIMARY KEY(customerid, name, version)

FOREIGN KEY (customerid, name) REFERENCES customer(customerid, name)

INSERT INTO singapore_customers
SELECT *
FROM customers c
WHERE country = 'Singapore'
