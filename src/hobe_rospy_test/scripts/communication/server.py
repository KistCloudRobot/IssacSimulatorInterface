import socket
import threading

import threadHandler
from configuration import Communication


class SocketServer:
    def __init__(self, listener):
        self.listener = listener
        self.serverSocket: socket.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.serverSocket.bind((Communication.HOST, Communication.PORT))
        self.serverSocket.settimeout(1)
        print("server url : " + str(Communication.HOST) + ":" + str(Communication.PORT))
        self.runThread = threading.Thread(target=self.run, daemon=False)
        threadHandler.threads.append(self.runThread)

    def start(self):
        self.runThread.start()

    def run(self):
        self.serverSocket.listen()
        while not threadHandler.exit_event.isSet():
            try:
                connSoc, addr = self.serverSocket.accept()
                print("new connection from : " + str(addr))
                self.listener.newConnection(addr, connSoc)
            except socket.timeout:
                continue
            except Exception as e:
                raise e
