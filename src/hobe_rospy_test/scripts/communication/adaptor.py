import threading
import socket

import threadHandler
from communication.server import SocketServer
from communication.proxy import Proxy
from service.serviceFactory import ServiceFactory


class Adaptor:
    def __init__(self, robotController):
        self.robotController = robotController
        self.server = SocketServer(self)
        self.proxies = dict()
        self.mutex = threading.Lock()

    def start(self):
        self.server.start()

    def remove(self, addr):
        self.mutex.acquire()
        self.proxies.pop(addr)
        self.mutex.release()

    def onData(self, data):
        service = ServiceFactory.newServiceFromBytes(data)
        self.robotController.serviceQueue.append(service)

    def newConnection(self, addr, connSoc):
        proxy = Proxy(addr, connSoc, self)
        self.mutex.acquire()
        self.proxies[addr] = proxy
        self.mutex.release()

    def broadcast(self, data: bytes):
        removalSockets = list()
        self.mutex.acquire()
        for addr, proxy in self.proxies.items():
            try:
                # print(data)
                proxy.send(data)
            except BrokenPipeError:
                print("disconnected : " + str(addr))
                if addr not in removalSockets:
                    removalSockets.append(addr)
            except Exception as e:
                print("what? : " + str(e) + " " + str(e.args))
                if addr not in removalSockets:
                    removalSockets.append(addr)
        self.mutex.release()

        for addr in removalSockets:
            self.remove(addr)
