# Reading all content
 
with open('welcome.txt') as text_file:
  text_data = text_file.read()
print(text_data)

# Reading lines

with open('how_many_lines.txt') as lines_doc:
  for line in lines_doc.readlines():
    print(line) 

# Reading a line

with open('just_the_first.txt') as first_line_doc:
  first_line = first_line_doc.readline()
  print(first_line)

# Writing a file

with open('bad_bands.txt', 'w') as bad_bands_doc:
  bad_bands_doc.write('BTS')

# Appending to a file

with open('cool_dogs.txt', 'a') as cool_dogs_file:
  cool_dogs_file.write('Air Buddy\n')

  