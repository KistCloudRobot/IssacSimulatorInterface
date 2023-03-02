import math


class Communication:
    HOST = "127.0.0.1"
    # HOST ='192.168.0.152'
    PORT = 30001


class RobotConfiguration:
    DIST_THRESHOLD = 0.15
    ANGLE_THRESHOLD = math.pi / 360.0
    LIFT_VALUE = 0.004
    TWIST_MAX_COUNT = 5


class FileConfiguration:
    MAP_FILE_PATH = "/home/uosai/catkin_ws/utils/map_cloud.txt"
