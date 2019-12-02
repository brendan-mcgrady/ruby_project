DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS tags;

CREATE TABLE tags(
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE merchants(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE transactions(
  id SERIAL PRIMARY KEY,
  merchant_id INT REFERENCES merchants(id),
  tag_id INT REFERENCES tags(id),
  trans_timestamp TIMESTAMP,
  amount DECIMAL(5, 2)
);
