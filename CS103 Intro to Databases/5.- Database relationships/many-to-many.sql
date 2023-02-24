-- part 1
create table books_authors (
  book_isbn varchar(50) references book(isbn),
  author_email varchar(20) references author(email),
  primary key(book_isbn, author_email)
);

select
  constraint_name, table_name, column_name
from
  information_schema.key_column_usage
where
  table_name = 'books_authors'

-- part 2
select * from book;
select * from author;

insert into books_authors 
  values (
    '123457890',
    'jkey@db.com'
  );
insert into books_authors 
  values (
    '123457890',
    'cindex@db.com'
  );
insert into books_authors 
  values (
    '987654321',
    'cindex@db.com'
  );

select 
  book.title as book_title, author.name as author_name,
  book.description as book_description
from books_authors
join book on books_authors.book_isbn = book.isbn
join author on books_authors.author_email = author.email;

select
  author.name as author_name, author.email as author_email, book.title as book_title
from books_authors, author, book
where books_authors.author_email = author.email
and books_authors.book_isbn = book.isbn;