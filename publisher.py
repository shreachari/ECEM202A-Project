import time
import zmq

context = zmq.Context()
socket = context.socket(zmq.PUB)
socket.bind("tcp://127.0.0.1:12345")  # Use the same port as specified in the iOS app

try:
    count = 0
    while True:
        message = f"Hello, iOS: {count}"
        print(f"Publishing: {message}")
        socket.send_string(message)
        count += 1
        time.sleep(1)
except KeyboardInterrupt:
    print("Publisher stopped.")
finally:
    socket.close()
    context.term()

