def recursive_knapsack(weight_cap, weights, values, i):
    if weight_cap == 0 or i == 0:
        return 0
    elif weights[i - 1] > weight_cap:
        return recursive_knapsack(weight_cap, weights, values, i - 1)
    else:
        include_item = values[i - 1] + recursive_knapsack(weight_cap - weights[i - 1], weights, values, i - 1);
        exclude_item = recursive_knapsack(weight_cap, weights, values, i - 1);
        return max(include_item, exclude_item)

def dynamic_knapsack(weight_cap, weights, values):
    rows = len(weights) + 1
    cols = weight_cap + 1
    # Set up 2D array
    matrix = [ [] for x in range(rows) ]

    # Iterate through every row
    for index in range(rows):
        # Initialize columns for this row
        matrix[index] = [ -1 for y in range(cols) ]

        # Iterate through every column
        for weight in range(cols):
            # Write your code here
            if index == 0 or weight == 0:
                matrix[index][weight] = 0
            elif weights[index - 1] <= weight:
                include = values[index - 1] + matrix[index - 1][weight - weights[index - 1]]
                exclude = matrix[index - 1][weight]
                print("-", include, exclude)
                matrix[index][weight] = max(include, exclude)
            else:
                matrix[index][weight] = matrix[index - 1][weight]
    for i in range(rows):
        print(matrix[i])
  # Return the value of the bottom right of matrix
    return matrix[rows-1][weight_cap]

# Use this to test your function:
weight_cap = 50
weights = [31, 10, 20]#, 19, 4, 3, 6]
values = [70, 20, 39]#, 37, 7, 5, 10]
print(dynamic_knapsack(weight_cap, weights, values))
