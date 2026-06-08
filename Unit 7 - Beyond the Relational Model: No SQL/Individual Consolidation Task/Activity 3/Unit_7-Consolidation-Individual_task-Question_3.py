from tinydb import TinyDB, Query

# Importing pandas to print the database
import pandas as pd

db = TinyDB('books_db.json')
table = db.table('books')
table.truncate() # empties the table to avoid duplication

# Setting up a small database
table.insert({'id': 'B001', 'title':'Animal Farm', 'author': 'George Orwell', 'year': '1945'})
table.insert({'id': 'B002', 'title':'Things Fall Apart', 'author': 'Chinua Achebe', 'year': '1958'})
table.insert({'id': 'B003', 'title':'Tell Freedom', 'author': 'Peter Abrahams', 'year': '1954'})
table.insert({'id': 'B004', 'title':'The Railway Children', 'author': 'Edith Nesbit', 'year': '1906'})
table.insert({'id': 'B005', 'title':'Holes', 'author': 'Louis Sachar', 'year': '1998'})
table.insert({'id': 'B006', 'title':'No Longer at Ease', 'author': 'Chinua Achebe', 'year': '1960'})
#table.insert({'id': 'B007', 'title':'The Enchanted Castle', 'author': 'Edith Nesbit', 'year': '1907'})


# Printing the initial table
print(" \nThe Initial Table")
df = pd.DataFrame(table.all())

# This will print the table without index numbering on the left
print(df.to_string(index=False))
print(" ")  # A blank line for neatness


# Q1) Insert a new record
print(" \nQuestion 1")

# inserting a new book record
table.insert({'id': 'B007', 'title':'Agnes Grey', 'author': 'Anne Bronte', 'year': '1847'})

# Printing the table with the new record entered
df = pd.DataFrame(table.all())
print(df.to_string(index=False))
print(" ")  # A blank line for neatness


# Q2) Retrieve all records where a specific attribute matches a value.
print(" \nQuestion 2")

# Assigning the query to the alias 'Book'
Book = Query()
results = table.search(Book.author == 'Chinua Achebe')

# Printing the search results
df = pd.DataFrame(results)
print("Search: Author = Chinua Achebe")
print(df.to_string(index=False))
print(" ")


# Q3) Update an existing record
print(" \nQuestion 3 ")

# Updating by field value - Updating the details for the book by Edith Nesbit
table.update({'year':'1907', 'title':'The Enchanted Castle'}, Book.author == 'Edith Nesbit')

# Printing the updated table
df = pd.DataFrame(table.all())
print(df.to_string(index=False))

print(" ")  # A blank line for neatness