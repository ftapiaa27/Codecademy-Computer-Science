select * from customers
order by customer_id;

create trigger log_change
after update on customers
for each row
when ((old.first_name != new.first_name)
  or (old.last_name != new.last_name))
execute procedure log_customers_change();

update customers
set last_name = 'Pomodoro'
where customer_id = 1;

update customers
set first_name = 'Pan'
where customer_id = 2;

update customers
set email_address = 'Dennis.Hall@yopmail.com'
where customer_id = 3;

create trigger log_insert
after insert on customers
for each statement
execute procedure log_customers_change();

insert into customers (first_name, last_name, email_address, home_phone, city, state_name, years_old)
values ('Jeffrey','Cook','Jeffrey.Cook@example.com','202-555-0398','Jersey city','New Jersey',66);
insert into customers (first_name, last_name, email_address, home_phone, city, state_name, years_old)
values ('Fausto','Tapia','Fausto.Tapia@example.com','669-129-8920','Zapopan','Jalisco',22);
insert into customers (first_name, last_name, email_address, home_phone, city, state_name, years_old)
values ('Juan','Suarez','Juan.Suarez@example.com','333-354-1249','Zapopan','Jalisco',15);



create trigger min_age
before update on customers
for each row
when (new.years_old < 13)
execute procedure override_with_min_age();

update customers
set years_old = 17
where customer_id = 2;

update customers
set last_name = 'Rojas', years_old = 11
where customer_id = 6;

select * from customers
order by customer_id;
select * from customers_log;

drop trigger if exists min_age on customers;

select * from information_schema.triggers;

