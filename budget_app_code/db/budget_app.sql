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

CREATE TABLE budgets
(
  id SERIAL8 primary key,
  budget_name VARCHAR(255)
  budget_amount NUMERIC(10,2),
  start_time DATETIME,
  end_time DATETIME
);

CREATE TABLE budget_transactions
(
  id SERIAL8 primary key,
  transaction_id INT8 references transcations(id) ON DELETE CASCADE,
  budget_id INT8 references budgets(id) ON DELETE CASCADE

)

-- To wipe and start again

  -- Close Postico first, then enter the following in the terminal

    -- DROPDB budget_app
    -- CREATEDB budget_app
    -- psql -d budget_app -f ../../db/budget_app.sql

-- note: the path to this file will change depending on where I am in the file tree
