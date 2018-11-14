DROP TABLE budget_transactions;
DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE budgets;


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
  transaction_amount NUMERIC,
  merchant_id INT8 references merchants(id) ON DELETE CASCADE,
  tag_id INT8 references tags(id) ON DELETE CASCADE,
  essential VARCHAR(255),
  time_added VARCHAR(255)
);

CREATE TABLE budgets
(
  id SERIAL8 primary key,
  budget_name VARCHAR(255),
  budget_amount NUMERIC,
  start_time VARCHAR(255),
  end_time VARCHAR(255)
);

CREATE TABLE budget_transactions
(
  id SERIAL8 primary key,
  transaction_id INT8 references transactions(id) ON DELETE CASCADE,
  budget_id INT8 references budgets(id) ON DELETE CASCADE
);

-- To wipe and start again

  -- Close Postico first, then enter the following in the terminal

    -- DROPDB budget_app
    -- CREATEDB budget_app
    -- psql -d budget_app -f ../../db/budget_app.sql

-- note: the path to this file will change depending on where I am in the file tree
