from service.service import *
from palletizerBehavior import *
from mapManager import MapManager
from geometry_msgs.msg import Twist
from sensor_msgs.msg import JointState
from hobe_rospy_test.srv import PalletService
from value import ServiceResult, Direction, RobotStatus
import rospy

from typing import Optional

class PalletizerProxy:
    def __init__(self, name):
        self.name = name
        self.service = None
        self.rosService = rospy.ServiceProxy("/control_palletizer", PalletService)

    def setService(self, service):
        
        if self.service is None:  # 로봇에 서비스가 할당되어있지 않을 때
            self.service = service
            print("[" + str(self.name.name) + "] " + " " + str(type(self.service).__name__))
        else:  # 로봇에 이미 서비스가 할당되어 있을 때
            if service is None:
                self.service = service
            else:
                service.result = ServiceResult.CannotAssignNewService

    def execute(self):
        # print("Palletizer!!execute")
        serviceResult = False
        if self.service is not None:

            if isinstance(self.service, PalletizerStartService):
                self.handlePalletizerStartService()
            elif isinstance(self.service, PalletizerStopService):
                self.handlePalletizerStopService()
            elif isinstance(self.service, EnterPalletizerService):
                self.handleEnterPalletizerService()
                self.setService(None)
                return False
            elif isinstance(self.service, ExitPalletizerService):
                self.handleExitPalletizerService()
                self.setService(None)
                return False
            else:
                raise Exception("undefined service type")
            # print("===", self.service.result)

            if self.service.result is not None:
                serviceResult = True

        return serviceResult

    def handlePalletizerStartService(self):
        palletizerStart(self)
        self.service.result = ServiceResult.Success

    def handlePalletizerStopService(self):
        palletizerStop(self)
        self.service.result = ServiceResult.Success

    def handleEnterPalletizerService(self):
        enterPalletizer(self)

    def handleExitPalletizerService(self):
        exitPalletizer(self)
