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

-- 3 Using for each statements instead of for each row
select * from customers;

create trigger each_statement_trigger
after update on customers
for each statement
  execute procedure statement_function();

update customers
set years_old = years_old + 1;

select * from customers;

-- 4 focusing triggers with WITH
create trigger update_trigger_high
before update on clients
for each row
when (new.total_spent >= 1000)
execute procedure set_high_spender();

create trigger update_trigger_low
before update on clients
for each row
when (new.total_spent < 1000)
execute procedure set_low_spender();

select * from clients
order by client_id;

update clients
set total_spent = 5000
where last_name = 'Campbell';

update clients
set total_spent = 100
where last_name = 'Lewis';

select * from clients
order by client_id;

-- In what order are triggers executed?
create trigger update_alpha
before update on orders
for each row
execute procedure update_first();

create trigger update_bravo
before update on orders
for each row
execute procedure update_second();

select * from orders
order by order_id;

update orders
set quantity = 5
where order_id = 1234;

select * from orders
order by order_id;

-- Removing triggers
select * from information_schema.triggers;
drop trigger im_a_bad_trigger on orders;
select * from information_schema.triggers;