DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE transactions;

CREATE TABLE merchants
(
  id SERIAL8 primary key,
  merchant_name VARCHAR(255) not null
);

CREATE TABLE tags
(
  id SERIAL8 primary key,
  tag_name VARCHAR(255) not null
);

CREATE TABLE transactions
(
  id SERIAL8 primary key,
  amount NUMERIC(10,2),
  merchant_id INT8 references merchants(id) ON DELETE CASCADE,
  tag_id INT8 references tags(id) ON DELETE CASCADE,
  essential VARCHAR(255),
  time_added NUMERIC(4,2),
  day_added VARCHAR(255),
  month_added VARCHAR(255),
  total_spend NUMERIC(10,2),
  remaining_budget NUMERIC(10,2)
);
