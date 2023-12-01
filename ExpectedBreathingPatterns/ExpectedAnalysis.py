# Expected breathing data analysis

import sys
import matplotlib.pyplot as plt
import numpy as np
import json

file_path = sys.argv[1]
#print(file_path)

# Initialize an empty list to store the float numbers
data_array = []

# Open the file and read each line
with open(file_path, 'r') as file:
    for line in file:
        # Convert each line to a float and append to the list
        number = float(line.strip())
        data_array.append(number)

# Print the resulting float array
#print(data_array)

# Displaying initial data as a graph
plt.subplot(2, 1, 1)  # 2 rows, 1 column, first subplot
plt.plot(data_array)
plt.xlabel('Index')
plt.ylabel('Value')
plt.title('Initial Plot')


# Applying a moving average filter to smooth the data
# The window_size determines the number of adjacent values to consider for smoothing
# Experiment with different window sizes to find a balance between smoothing and maintaining important features in your data.
window_size = int(sys.argv[2])
smoothed_array = np.convolve(data_array, np.ones(window_size)/window_size, mode='valid')

# Plotting the smoothed array
plt.subplot(2, 1, 2)  # 2 rows, 1 column, second subplot
plt.plot(smoothed_array)
plt.xlabel('Index')
plt.ylabel('Smoothed Value')
plt.title(f'Smoothed Plot (Window Size = {window_size})')


plt.show()

# Open a file for writing
with open('output.txt', 'w') as file:
    # Iterate through the array and write each element to the file
    for element in smoothed_array:
        file.write(str(element) + ', ')