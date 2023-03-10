create table restaurant (
  id integer primary key,
  name varchar(20),
  description varchar(100),
  ratings decimal,
  telephone char(10),
  hours varchar(100)
);
create table address (
  id integer primary key,
  street_number varchar(10),
  street_name varchar(20),
  city varchar(20),
  state varchar(15),
  google_map_link varchar(50),
  restaurant_id integer references restaurant(id)
);
create table category(
  id char(2) primary key,
  name varchar(20),
  description varchar(200)
);
create table dish(
  id integer primary key,
  name varchar(50),
  description varchar(200),
  is_spicy boolean
);
create table review(
  id integer primary key,
  rating decimal,
  description varchar(200),
  date date,
  restaurant_id integer references restaurant(id)
);
create table categories_dishes(
  category_id char(2) references category(id),
  dish_id integer references dish(id),
  price money,
  primary key(category_id, dish_id)
);
/*
select 
  constraint_name, table_name, column_name
from
  information_schema.key_column_usage;
*/
/* 
 *--------------------------------------------
 Insert values for restaurant
 *--------------------------------------------
 */
INSERT INTO restaurant VALUES (
  1,
  'Bytes of China',
  'Delectable Chinese Cuisine',
  3.9,
  '6175551212',
  'Mon - Fri 9:00 am to 9:00 pm, Weekends 10:00 am to 11:00 pm'
);

/* 
 *--------------------------------------------
 Insert values for address
 *--------------------------------------------
 */
INSERT INTO address VALUES (
  1,
  '2020',
  'Busy Street',
  'Chinatown',
  'MA',
  'http://bit.ly/BytesOfChina',
  1
);

/* 
 *--------------------------------------------
 Insert values for review
 *--------------------------------------------
 */
INSERT INTO review VALUES (
  1,
  5.0,
  'Would love to host another birthday party at Bytes of China!',
  '05-22-2020',
  1
);

INSERT INTO review VALUES (
  2,
  4.5,
  'Other than a small mix-up, I would give it a 5.0!',
  '04-01-2020',
  1
);

INSERT INTO review VALUES (
  3,
  3.9,
  'A reasonable place to eat for lunch, if you are in a rush!',
  '03-15-2020',
  1
);

/* 
 *--------------------------------------------
 Insert values for category
 *--------------------------------------------
 */
INSERT INTO category VALUES (
  'C',
  'Chicken',
  null
);

INSERT INTO category VALUES (
  'LS',
  'Luncheon Specials',
  'Served with Hot and Sour Soup or Egg Drop Soup and Fried or Steamed Rice  between 11:00 am and 3:00 pm from Monday to Friday.'
);

INSERT INTO category VALUES (
  'HS',
  'House Specials',
  null
);

/* 
 *--------------------------------------------
 Insert values for dish
 *--------------------------------------------
 */
INSERT INTO dish VALUES (
  1,
  'Chicken with Broccoli',
  'Diced chicken stir-fried with succulent broccoli florets',
  false
);

INSERT INTO dish VALUES (
  2,
  'Sweet and Sour Chicken',
  'Marinated chicken with tangy sweet and sour sauce together with pineapples and green peppers',
  false
);

INSERT INTO dish VALUES (
  3,
  'Chicken Wings',
  'Finger-licking mouth-watering entree to spice up any lunch or dinner',
  true
);

INSERT INTO dish VALUES (
  4,
  'Beef with Garlic Sauce',
  'Sliced beef steak marinated in garlic sauce for that tangy flavor',
  true
);

INSERT INTO dish VALUES (
  5,
  'Fresh Mushroom with Snow Peapods and Baby Corns',
  'Colorful entree perfect for vegetarians and mushroom lovers',
  false
);

INSERT INTO dish VALUES (
  6,
  'Sesame Chicken',
  'Crispy chunks of chicken flavored with savory sesame sauce',
  false
);

INSERT INTO dish VALUES (
  7,
  'Special Minced Chicken',
  'Marinated chicken breast sauteed with colorful vegetables topped with pine nuts and shredded lettuce.',
  false
);

INSERT INTO dish VALUES (
  8,
  'Hunan Special Half & Half',
  'Shredded beef in Peking sauce and shredded chicken in garlic sauce',
  true
);
/*
 *--------------------------------------------
 Insert valus for cross-reference table, categories_dishes
 *--------------------------------------------
 */
INSERT INTO categories_dishes VALUES (
  'C',
  1,
  6.95
);

INSERT INTO categories_dishes VALUES (
  'C',
  3,
  6.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  1,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  4,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'LS',
  5,
  8.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  6,
  15.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  7,
  16.95
);

INSERT INTO categories_dishes VALUES (
  'HS',
  8,
  17.95
);
-- Display restaurant name, address and phone number
select restaurant.name as restaurant_name, address.street_name,
  address.street_number, restaurant.telephone
from restaurant, address
where restaurant.id = address.restaurant_id;

-- Display best rating
/* Option 1
select rating as best_rating, description
from review
order by rating desc
limit 1; */

select max(rating) as best_rating
from review;

-- Display dish name, price, category & sort by dish name
select dish.name as dish_name, categories_dishes.price, 
  category.name as category_name
from categories_dishes
join category
  on categories_dishes.category_id = category.id
join dish
  on categories_dishes.dish_id = dish.id
order by dish.name;

-- Modification of previous query
select category.name as category_name, dish.name as dish_name, categories_dishes.price  
from categories_dishes
join category
  on categories_dishes.category_id = category.id
join dish
  on categories_dishes.dish_id = dish.id
order by categories_dishes.price;

-- Display all spicy dishes
select dish.name as spicy_dish_name, category.name as category, categories_dishes.price
from categories_dishes
join category
  on categories_dishes.category_id = category.id
join dish
  on categories_dishes.dish_id = dish.id
where dish.is_spicy = true;

-- Display dishes that belong to more than 1 category
select dish.name as dish_name, count(dish_id) as dish_count
from categories_dishes
join dish
  on categories_dishes.dish_id = dish.id
group by dish.name
having count(dish_id) > 1
order by dish_count desc;

-- Display review 2.0
select rating, description
from review
where rating = (select max(rating) from review); 