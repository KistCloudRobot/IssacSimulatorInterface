import threading
import time
import threadHandler
from communication.messageFactory import MessageFactory

class Publisher:
    def __init__(self, adaptor, robots):
        self.adaptor = adaptor
        self.robots = robots
        self.thread = threading.Thread(target=self.run, daemon=True)
        self.flag = 100

    def start(self):
        self.thread.run()

    def run(self):
        while not threadHandler.exit_event.isSet():
            time.sleep(1)
            for robot in self.robots.values():
                # if robot == "Palletizer":
                #     message = MeassageFactory.newRTSRMessage()
                message = MessageFactory.newRTSRMessage(robot.name, robot.status, robot.pos[0], robot.pos[2], robot.theta, robot.speed.linear.x, robot.battery, robot.loading)
                self.adaptor.broadcast(message)
            # edit 1029
            # for object in self.objects.values():
            #     # print("obj info test: {} - {}".format(object.name, object.pos))
            #     self.flag = 200
            #     message = MessageFactory.newObjRTSRMessage(object.name, object.pos[0], object.pos[2], object.pos[1])
            #     self.adaptor.broadcast(message)
