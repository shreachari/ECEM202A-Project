import time
import matplotlib.pyplot as plt

box_breathing_array = []

def generate_inhale_values(duration=4, interval=0.1, initial_value=0, slope=50):
    current_value = initial_value
    start_time = time.time()

    while time.time() - start_time <= duration:
        current_value += slope * interval
        box_breathing_array.append(current_value)
        time.sleep(interval)

def generate_hold_values(duration=4, interval=0.1):
	current_value = box_breathing_array[-1]
	start_time = time.time()

	while time.time() - start_time <= duration:
		box_breathing_array.append(current_value)
		time.sleep(interval)

def generate_exhale_values(duration=4, interval=0.1, slope=50):
	current_value = box_breathing_array[-1]
	start_time = time.time()

	while time.time() - start_time <= duration:
		current_value -= slope * interval
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


