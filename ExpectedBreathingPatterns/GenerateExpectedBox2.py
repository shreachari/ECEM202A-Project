import time
import matplotlib.pyplot as plt

box_breathing_array = []

# May want to play around with these slopes
inhale_slope = 50
exhale_slope = 50

# May want to play around with initial value
def generate_inhale_values(initial_value=0.0025):
    current_value = initial_value
    # 4 seconds means 40 values
    for i in range(40):
        current_value += inhale_slope * 0.1
        box_breathing_array.append(current_value)
        

def generate_hold_values():
	current_value = box_breathing_array[-1]
	for i in range(40):
		box_breathing_array.append(current_value)
        

def generate_exhale_values():
	current_value = box_breathing_array[-1]

	for i in range(40):
		current_value -= exhale_slope * 0.1
		box_breathing_array.append(current_value)

# 160 array elements
generate_inhale_values()
generate_hold_values()
generate_exhale_values()
generate_hold_values()

# 960 array elements
for i in range(6):
	generate_inhale_values(initial_value=box_breathing_array[-1])
	generate_hold_values()
	generate_exhale_values()
	generate_hold_values()	

# 80 elements
generate_inhale_values(initial_value=box_breathing_array[-1])
generate_hold_values()

# Total = 160+960+80 = 1200 = 120 seconds * 10 values/second

print(len(box_breathing_array))

plt.plot(box_breathing_array)
plt.xlabel('Index')
plt.ylabel('Value')
plt.title('Box Plot')
plt.show()

# Open a file for writing
with open('output3.txt', 'w') as file:
    # Iterate through the array and write each element to the file
    for element in box_breathing_array:
        file.write(str(element) + ', ')


