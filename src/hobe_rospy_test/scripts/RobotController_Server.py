#!/usr/bin/env python3


import rospy
import numpy as np
from geometry_msgs.msg import Twist
from hobe_rospy_test.srv import MoveToNodeService, LiftService, MoveBackService
from nav_msgs.msg import Odometry
from tf2_msgs.msg import TFMessage
from math import atan2
from tf.transformations import euler_from_quaternion
from sensor_msgs.msg import JointState
from hobe_rospy_test.msg import *
import json
import threading
import time
import math
from enum import Enum
from typing import Dict, Optional
from robotController import RobotController

from mapManager import MapManager
import threadHandler

if __name__ == '__main__':
    rospy.init_node("test_rosbridge",  anonymous=True)
    rospy.loginfo("=== Robot Control Server Started ===")
    si = RobotController()
    si.start()
    rospy.spin()
    for thread in threadHandler.threads:
        thread.join()
