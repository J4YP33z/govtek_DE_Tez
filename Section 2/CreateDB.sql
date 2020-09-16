CREATE TABLE salespersons
(
    staff_id integer PRIMARY KEY,
    name varchar(255) NOT NULL
);

CREATE TABLE customers
(
    customer_id integer PRIMARY KEY,
    name varchar(255) NOT NULL,
    phone varchar(64) NOT NULL
);

CREATE TABLE variants
(
    model_variant varchar(64) PRIMARY KEY,
    manufacturer varchar(64) NOT NULL,
    model varchar(64) NOT NULL,
    weight integer NOT NULL,
    engine_capacity integer NOT NULL
);

CREATE TABLE cars
(
    serial_number integer PRIMARY KEY,
    model_variant varchar(64) NOT NULL,
    new boolean NOT NULL,
    price integer NOT NULL,
    FOREIGN KEY (model_variant) REFERENCES variants (model_variant)
);

CREATE TABLE transactions
(
    txn_id integer PRIMARY KEY,
    staff_id integer NOT NULL,
    customer_id integer NOT NULL,
    serial_number integer NOT NULL,
    sale_date date NOT NULL,
    sale_time timestamp NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES salespersons (staff_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (serial_number) REFERENCES cars (serial_number)
);

