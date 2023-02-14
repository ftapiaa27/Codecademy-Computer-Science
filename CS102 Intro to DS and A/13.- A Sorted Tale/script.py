import utils
import sorts

bookshelf = utils.load_books('books_small.csv')
long_bookshelf = utils.load_books('books_large.csv')

for book in long_bookshelf:
    book['title_lower'] = book['title'].lower()
    book['author_lower'] = book['author'].lower()
  
def by_title_ascending(book_a, book_b):
    return book_a['title_lower'] > book_b['title_lower']

def by_author_ascending(book_a, book_b):
    return book_a['author_lower'] > book_b['author_lower']

def by_total_lenght(book_a, book_b):
    a = len(book_a['title']) + len(book_a['author'])
    b = len(book_b['title']) + len(book_b['author'])
    return a > b
  
bookshelf_v1 = long_bookshelf.copy()
bookshelf_v2 = long_bookshelf.copy()

# for book in bookshelf:
#     print(book['title'])

# sort_1 = sorts.bubble_sort(long_bookshelf, by_title_ascending)
# for book in sort_1:
#     print(book['title'])

# sort_2 = sorts.bubble_sort(long_bookshelf, by_author_ascending)


sorts.quicksort(bookshelf_v2, 0, len(bookshelf_v2) - 1, by_title_ascending)
# for book in bookshelf_v2:
#     print(book['title'])