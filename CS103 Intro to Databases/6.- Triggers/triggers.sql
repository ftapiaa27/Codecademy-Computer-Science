-- 1
CREATE TRIGGER insert_trigger
  BEFORE INSERT ON customers
  FOR EACH ROW
  EXECUTE PROCEDURE insert_function();

SELECT * FROM customers;

INSERT INTO customers (first_name, last_name)
VALUES ('John', 'Doe');

SELECT * FROM customers;

-- 2
select * from customers
order by customer_id;

create trigger after_trigger
after update on customers
for each row
  execute procedure
    log_customers_change();

update customers
set years_old = years_old + 10
where customer_id = 1;

select * from customers
order by customer_id;

select * from customers_log;

-- 3
select * from customers;

create trigger each_statement_trigger
after update on customers
for each row
  execute procedure statement_function();

update customers
set years_old = years_old + 1;

select * from customers;

-- 4
