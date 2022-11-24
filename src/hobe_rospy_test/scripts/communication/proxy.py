import socket

import threadHandler
import threading


class Proxy:
    def __init__(self, addr, soc, adaptor):
        self.addr = addr
        self.soc = soc
        self.adaptor = adaptor
        self.soc.setblocking(False)
        self.soc.settimeout(1)
        self.alive = True
        self.thread = threading.Thread(target=self.run, daemon=True)
        threadHandler.threads.append(self.thread)
        self.thread.start()

    def run(self):
        while self.alive and not threadHandler.exit_event.isSet():
            try:
                data = self.soc.recv(1024)
                if len(data) > 0:
                    self.adaptor.onData(data)
            except socket.timeout:
                # print("time out!")
                continue
            except Exception as e:
                print("connection reset!" + str(type(e)))
                self.soc.close()
                self.adaptor.remove(self.addr)
                self.alive = False

    def send(self, data):
        self.soc.sendall(data)
