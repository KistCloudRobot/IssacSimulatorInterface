import threading
import time

import threadHandler
from communication.adaptor import Adaptor
from communication.messageFactory import MessageFactory
from service.service import *
from robotProxy import RobotProxy
from palletizerProxy import PalletizerProxy
from observer import Observer
from publisher import Publisher
from value import ServiceResult, RobotID, ObjectID


class RobotController:
    def __init__(self):
        self.adaptor = Adaptor(self)
        ## choi- add
        self.robots = {
            RobotID.AMR_LIFT01: RobotProxy(RobotID.AMR_LIFT01),
            RobotID.AMR_LIFT02: RobotProxy(RobotID.AMR_LIFT02),
            RobotID.AMR_LIFT03: RobotProxy(RobotID.AMR_LIFT03),
            RobotID.AMR_LIFT04: RobotProxy(RobotID.AMR_LIFT04),
            # RobotID.Palletizer: PalletizerProxy(RobotID.Palletizer)
        }
        self.observer = Observer(self)
        self.publisher = Publisher(self.adaptor, self.robots)
        self.serviceQueue = list()
        self.runThread = threading.Thread(target=self.run)
        threadHandler.threads.append(self.runThread)
        # bae
        self.palletizer = PalletizerProxy(RobotID.Palletizer1)

    def start(self):
        print('START')

        self.adaptor.start()
        self.runThread.start()
        self.publisher.start()
        print('START')

    def run(self):
        while not threadHandler.exit_event.isSet():
            time.sleep(0.15)
            if len(self.serviceQueue) > 0:
                self.serviceReceived(self.serviceQueue.pop())

            for robot in self.robots.values():
                result = robot.execute()
                if result:
                    self.serviceFinished(robot.service)
                    robot.setService(None)
            # bae
            result = self.palletizer.execute()
            # print("====results:", result)
            if result:
                self.serviceFinished(self.palletizer.service)
                self.palletizer.setService(None)

    def serviceReceived(self, service):
        if isinstance(service, LoginService):
            ackMessage = MessageFactory.newAckMessage(service)
            self.adaptor.broadcast(ackMessage)
            service.setResult(ServiceResult.Success)
            self.serviceFinished(service)
        elif isinstance(service, RobotService):
            # print("RobotService")
            self.robots[service.robotName].setService(service)
            ackMessage = MessageFactory.newAckMessage(service)
            self.adaptor.broadcast(ackMessage)
            #bae
            if service.result is not None:
                self.serviceFinished(service)
        elif isinstance(service, PalletizerService):
            # print("Palletizer Service")
            self.palletizer.setService(service)
            if not (isinstance(service, EnterPalletizerService) or isinstance(service, ExitPalletizerService)):
                ackMessage = MessageFactory.newAckMessage(service)
                self.adaptor.broadcast(ackMessage)
            # print("\n.. service.result:  ", service.result)
            if service.result is not None:
                # print("++.. service.result:  ", service.result)
                self.serviceFinished(service)

    def serviceFinished(self, service):
        ackEndMessage = MessageFactory.newAckEndMessage(service)
        # print("ackEndMessage:", ackEndMessage)
        self.adaptor.broadcast(ackEndMessage)

    def changeRobotStatus(self, robotName, x, y, theta):
        robot = self.robots[robotName]
        robot.pos[0] = x
        
        robot.pos[2] = y
        robot.theta = theta
        # if robotName == 'AMR_LIFT02':
        # print('{} - {} - {}'.format(robotName,robot.pos,robot.theta))

    ##hwan
    def changePalletizerJoint(self, robotName, joint):
        robot = self.robots[robotName]
        robot.joint=joint
       
        # if robotName == 'AMR_LIFT02':
        # print('{} - {} - {}'.format(robotName,robot.pos,robot.theta))
        
    # edit 1029
    def changeObjectStatus(self, objectName, x, y, z):
        object = self.objects[objectName]
        object.pos[0] = x
        object.pos[1] = z
        object.pos[2] = y
        # print('{} - {}'.format(objectName, object.pos))

    def palletizerPackingFinish(self, palletizerID, node):
        message = MessageFactory.newPalletizerPackingFinish(palletizerID, node)
        self.adaptor.broadcast(message)

if __name__ == '__main__':
    rc = RobotController()
    rc.start()
    while True:
        pass
