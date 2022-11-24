import numpy as np
import math

from service.service import LoadService, UnloadService
from configuration import RobotConfiguration
# from sensor_msgs.msg import JointState


def palletizerStart(palletizer):
    action = "PalletizerStart"
    palletizerID = palletizer.name.name
    robot = ""
    node = ""
    result = palletizer.rosService(action, palletizerID, robot, node)

def palletizerStop(palletizer):
    action = "PalletizerStop"
    palletizerID = palletizer.name.name
    robot = ""
    node = ""
    result = palletizer.rosService(action, palletizerID, robot, node)


def enterPalletizer(palletizer):
    action = "EnterPalletizer"
    palletizerID = palletizer.name.name
    robot = palletizer.service.robotID.name
    node = str(palletizer.service.node)
    result = palletizer.rosService(action, palletizerID, robot, node)


def exitPalletizer(palletizer):
    action = "ExitPalletizerStart"
    palletizerID = palletizer.name.name
    robot = palletizer.service.robotID.name
    node = str(palletizer.service.node)
    result = palletizer.rosService(action, palletizerID, robot, node)
