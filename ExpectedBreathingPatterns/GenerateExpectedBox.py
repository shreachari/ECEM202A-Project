import time
import matplotlib.pyplot as plt

box_breathing_array = []

# May want to play around with these slopes
inhale_slope = 50
exhale_slope = 50

# May want to play around with initial value
def generate_inhale_values(duration=4, interval=0.1, initial_value=0.0025):
    current_value = initial_value
    start_time = time.time()

    while time.time() - start_time <= duration:
        current_value += inhale_slope * interval
        box_breathing_array.append(current_value)
        time.sleep(interval)

def generate_hold_values(duration=4, interval=0.1):
	current_value = box_breathing_array[-1]
	start_time = time.time()

	while time.time() - start_time <= duration:
		box_breathing_array.append(current_value)
		time.sleep(interval)

def generate_exhale_values(duration=4, interval=0.1):
	current_value = box_breathing_array[-1]
	start_time = time.time()

	while time.time() - start_time <= duration:
		current_value -= exhale_slope * interval
		box_breathing_array.append(current_value)
		time.sleep(interval)


generate_inhale_values()
generate_hold_values()
generate_exhale_values()
generate_hold_values()

# 16 seconds are completed
# We need 120/16=7.5
box_breathing_array = box_breathing_array * 7

# we need another inhale and hold round
generate_inhale_values(initial_value=box_breathing_array[-1])
generate_hold_values()

plt.plot(box_breathing_array)
plt.xlabel('Index')
plt.ylabel('Value')
plt.title('Box Plot')
plt.show()

# Open a file for writing
with open('output2.txt', 'w') as file:
    # Iterate through the array and write each element to the file
    for element in box_breathing_array:
        file.write(str(element) + ', ')


