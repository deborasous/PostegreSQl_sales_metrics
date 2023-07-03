-- Active: 1688235154457@@127.0.0.1@5432@salesmetrics@public

CREATE TABLE
    Users(
        id INT PRIMARY KEY,
        name VARCHAR(200)
    );

CREATE TABLE
    Products(
        id INT PRIMARY KEY,
        product_name VARCHAR(200)
    );

CREATE TABLE
    Vendas(
        id INT PRIMARY KEY,
        user_id INTEGER,
        product_id INTEGER,
        product_price DECIMAL(10, 2),
        quantity_products INTEGER,
        data_compra DATE,
        Foreign Key (user_id) REFERENCES Users(id),
        Foreign Key (product_id) REFERENCES Products(id)
    );

/*INSERIR DADOS*/

INSERT INTO Users (id, name)
VALUES (1, 'John Doe'), (2, 'Jane Smith'), (3, 'Alice Johnson'), (4, 'Maria Eduarda');

INSERT INTO
    Products (id, product_name)
VALUES (1, 'Smartphone'), (2, 'Laptop'), (3, 'Headphones'), (4, 'TV'), (5, 'Smartwatch'), (6, 'Wireless Earbuds'), (7, 'Gaming Console'), (8, 'Camera');

INSERT INTO
    Vendas (
        id,
        user_id,
        product_id,
        product_price,
        quantity_products,
        data_compra
    )
VALUES (1, 2, 1, 10.50, 2, '2023-09-10'), (2, 4, 1, 10.50, 1, '2023-10-05'), (3, 1, 2, 15.75, 3, '2023-11-20'), (4, 3, 3, 8.99, 4, '2023-12-15'), (5, 1, 1, 10.50, 2, '2023-09-10'), (6, 3, 2, 15.75, 2, '2023-11-10'), (7, 1, 3, 8.99, 4, '2023-10-20'), (8, 4, 1, 10.50, 3, '2023-11-25'), (9, 4, 2, 15.75, 4, '2023-12-15'), (10, 2, 3, 8.99, 1, '2023-12-05');

INSERT INTO
    Vendas (
        id,
        user_id,
        product_id,
        product_price,
        quantity_products,
        data_compra
    )
VALUES (11, 1, 2, 15.75, 2, '2023-11-10');

/*SCRIPT SQL*/

SELECT
    u.name AS user_name,
    SUM(
        v.product_price * v.quantity_products
    ) AS total_amount_spent
FROM users u
    JOIN vendas v ON u.id = v.user_id
WHERE EXTRACT(
        MONTH
        FROM v.data_compra
    ) = 11
GROUP BY u.name
ORDER BY
    total_amount_spent DESC;