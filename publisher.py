import zmq
import time

def main():
    # Prepare the context and socket
    context = zmq.Context()
    publisher = context.socket(zmq.PUB)

    # Bind the socket to a specific address (e.g., tcp://127.0.0.1:5555)
    publisher.bind("tcp://127.0.0.1:5555")

    try:
        while True:
            # Publish a message with a topic
            topic = b"example_topic"
            message = b"Hello, this is a message!"
            publisher.send_multipart([topic, message])

            # Wait for some time before publishing the next message
            time.sleep(1)

    except KeyboardInterrupt:
        # Close the socket and context on interruption
        publisher.close()
        context.term()

if __name__ == "__main__":
    main()

