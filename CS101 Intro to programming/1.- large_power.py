# # Write your over_budget function here:
# def over_budget(budget, food_bill, electricity_bill, internet_bill, rent):
#     if (food_bill + electricity_bill + internet_bill + rent) > budget:
#         return True
#     else:
#         return False

# # Uncomment these function calls to test your over_budget function:
# print(over_budget(100, 20, 30, 10, 40))
# # should print False
# print(over_budget(80, 20, 30, 10, 30))
# # should print True

# # Write your twice_as_large function here:
# def twice_as_large(num1, num2):
#     return True if num1 > 2*num2 else False


# # Uncomment these function calls to test your twice_as_large function:
# print(twice_as_large(10, 5))
# # should print False
# print(twice_as_large(11, 5))
# # should print True

# def more_than_n(lst, item, n):
#     print(lst.count(item))
#     if n < lst.count(item):
#         return True
#     else:
#         return False

# print(more_than_n([2, 4, 6, 2, 3, 2, 1, 2], 2, 3))


# def combine_sort(lst1, lst2):
#     new_list = lst1 + lst2
#     return sorted(new_list)

# print(combine_sort([4, 10, 2, 5], [-10, 2, 5, 10]))

# def every_three_nums(start):
#     list = []
#     if start > 100:
#         return list
#     for i in range(4):
#         list.append(start)
#         start = start + 3
#         if start > 100:
#             return list
#     return list
# print(every_three_nums(95))

# def remove_middle(lst, start, end):
#     del(lst[start:end+1])
#     return lst
# print(remove_middle([4, 8 , 15, 16, 23, 42], 1, 3))

# def more_frequent_item(lst, item1, item2):
#     a = lst.count(item1)
#     b = lst.count(item2)
#     return item1 if a >= b else item2

# print(more_frequent_item([2, 3, 3, 2, 3, 2, 3, 2, 3], 2, 3))


# def double_index(lst, index):
#     lst1 = lst
#     if index >= len(lst):
#         return lst
#     lst1[index] = lst1[index] * 2
#     return lst1
# print(double_index([3, 8, -10, 12], 4))

# def middle_element(lst):
#     i = len(lst) // 2
#     if len(lst) % 2 == 0:
#         return (lst[i] + lst[i-1])/2
#     else:
#         return lst[i]

# print(middle_element([5, 2, -10, -4, 4, 5]))


# def larger_sum(lst1, lst2):
#     s1 = 0
#     s2 = 0
#     for i in range(len(lst1)):
#         s1 += lst1[i]
#     for i in range(len(lst2)):
#         s2 += lst2[i]
#     return lst1 if s1 >= s2 else lst2

# print(larger_sum([1, 9, 5], [2, 3, 7]))


# def over_nine_thousand(lst):
#     sum = 0
#     for i in range(len(lst)):
#         sum += lst[i]
#         if sum > 9000:
#             return sum
#     return sum
# print(over_nine_thousand([8000, 900, 120, 5000]))


# def reversed_list(lst1, lst2):
#     for i in range(len(lst1)//2):
#         if lst1[i] != lst2[-1-i]:
#             return False
#     else:
#         if len(lst1) % 2 != 0:
#             if lst1[i+1] != lst2[i+1]:
#                 return False
#     return True


# print(reversed_list([1, 2, 3], [3, 2, 1]))
# print(reversed_list([1, 5, 3], [3, 2, 1]))

# You can start with the
# Cat class or erase this
# and use your own!
class Cat:
  def __init__(self, input_name, input_breed, input_age = 0):
    self.name = input_name
    self.breed = input_breed
    self.age = input_age
    self.is_cuddly = True
  
  # Create method where two
  # pets interact.
  # Ex: def name(self, pet):
  def cuddle(self, other_cat):
    if(other_cat.is_cuddly):
      print("{name1} is now cuddling with {name2}".format(name1 = self.name, name2 = other_cat.name))
    else:
      print("{name} says stfu".format(name = other_cat.name))

# Create two pets.
cat_one = Cat("Leo", "Tabby", 3)
cat_two = Cat("Marc", "UglyKind", 7)
# Call your method below.
cat_one.cuddle(cat_two)