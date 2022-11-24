import threading
import signal

exit_event = threading.Event()
threads = list()


def signal_handler(signum, frame):
    exit_event.set()


signal.signal(signal.SIGINT, signal_handler)
