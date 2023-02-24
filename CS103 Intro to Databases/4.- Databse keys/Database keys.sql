-- Key validation 
select 
  constraint_name, table_name, column_name
from 
  information_schema.key_column_usage
where
  table_name = 'author';

-- Composite Primary key
create table popular_books (
  book_title varchar(100),
  author_name varchar(50),
  number_sold integer,
  number_previewed integer,
  primary key(book_title, author_name)
);
select
  constraint_name, table_name, column_name
from
  information_schema.key_column_usage
where
  table_name = 'popular_books';

-- Foreign key
CREATE TABLE book (
  title varchar(100),
  isbn varchar(50) PRIMARY KEY,
  pages integer,
  price money,
  description varchar(256),
  publisher varchar(100)
);

CREATE TABLE chapter (
  id integer PRIMARY KEY,
  book_isbn varchar(50) REFERENCES book(isbn),
  number integer,
  title varchar(50),
  content varchar(1024)
);

select
  constraint_name, table_name, column_name
from
  information_schema.key_column_usage
where 
  table_name = 'chapter';

select * from book;
select * from chapter;

select book.title as book, chapter.title as chapters
from book, chapter
where book.isbn = chapter.book_isbn;
