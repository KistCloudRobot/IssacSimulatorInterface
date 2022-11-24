from service.service import *
from robotBehavior import *
from mapManager import MapManager
from geometry_msgs.msg import Twist
from sensor_msgs.msg import JointState
from value import ServiceResult, Direction, RobotStatus
import rospy

class RobotProxy:
    def __init__(self, name):
        self.name = name
        self.status = RobotStatus.Ready
        self.pos = [0, 0, 0]
        self.theta = 0.0
        self.speed = Twist()
        self.loading = False
        self.goal = None
        self.velocity = 1.0
        self.joint = JointState()
        self.joint.position = np.array([0])
        self.service = None
        self.forward = False
        self.twistCount = 0
        self.battery = 100
        self.speedPublisher = rospy.Publisher("/" + self.name.name + "_cmd_vel", Twist, queue_size=1)
        self.jointPublisher = rospy.Publisher("/" + self.name.name + "_joint_command", JointState, queue_size=1)

        self.tmpCount = 0

    def setService(self, service):
        if self.service is None:  # 로봇에 서비스가 할당되어있지 않을 때
            self.service = service

            if service is not None:  # 로봇의 서비스에 따라 추가작업
                if isinstance(service, MoveService):
                    self.status = RobotStatus.Move
                    print("[" + str(self.name.name) + "] " + str(self.status.name) + " " + str(self.service.path))
                    self.service.path = MapManager.instance().optimizePath(service.path)
                    print("[" + str(self.name.name) + "] optimized path : " + str(self.service.path))
                elif isinstance(service, GuideMoveService):
                    self.status = RobotStatus.GuideMove
                    print("[" + str(self.name.name) + "] " + str(self.status.name) + " " + str(self.service.node))
                elif isinstance(service, PreciseMoveService):
                    self.status = RobotStatus.PreciseMove
                    print("[" + str(self.name.name) + "] " + str(self.status.name) + " " + str(self.service.node))
                elif isinstance(service, FlatPreciseMoveService):
                    self.status = RobotStatus.FlatPreciseMove
                    print("[" + str(self.name.name) + "] " + str(self.status.name) + " " + str(self.service.node))
                elif isinstance(service, StraightBackMoveService):
                    self.status = RobotStatus.StraightBackMove
                    print("[" + str(self.name.name) + "] " + str(self.status.name) + " " + str(self.service.node))
                elif isinstance(service, LoadService):
                    self.status = RobotStatus.Loading
                    print("[" + str(self.name.name) + "] " + str(self.status.name) + " " + str(self.service.node))
                elif isinstance(service, UnloadService):
                    self.status = RobotStatus.Unloading
                    print("[" + str(self.name.name) + "] " + str(self.status.name) + " " + str(self.service.node))
        else:  # 로봇에 이미 서비스가 할당되어 있을 때
            if service is None:
                self.service = service
                self.status = RobotStatus.Ready
                print("[" + str(self.name.name) + "] " + str(self.status.name))
            else:
                service.result = ServiceResult.CannotAssignNewService

    def execute(self):
        serviceResult = False
        if self.service is not None:
            if isinstance(self.service, MoveService):
                self.handleMoveService()
            elif isinstance(self.service, GuideMoveService):
                self.handleMoveGuideService()
            elif isinstance(self.service, PreciseMoveService):
                self.handlePreciseMoveService()
            elif isinstance(self.service, FlatPreciseMoveService):
                self.handleFlatPreciseMoveService()
            elif isinstance(self.service, StraightBackMoveService):
                self.handleStraightBackMoveService()
            elif isinstance(self.service, LoadService):
                self.handleLoadService()
            elif isinstance(self.service, UnloadService):
                self.handleUnloadService()
            else:
                raise Exception("undefined service type")

            if self.service.result is not None:
                serviceResult = True

        return serviceResult

    def handleMoveService(self):
        if len(self.service.path) > 0:
            self.goal = MapManager.instance().vertexToPos(self.service.path[0])
            moveFinished = moveToNode(self)
            if moveFinished:
                self.service.path.pop(0)
        else:
            self.service.result = ServiceResult.Success

    def handleMoveGuideService(self):
        self.goal = MapManager.instance().vertexToPos(self.service.node)
        if self.service.direction is Direction.FORWARD:
            moveFinished = moveToNode(self)
        elif self.service.direction is Direction.BACKWARD:
            moveFinished = moveBackToNode(self)
        else:
            raise Exception()

        if moveFinished:
            self.service.result = ServiceResult.Success

    def handlePreciseMoveService(self):
        self.goal = MapManager.instance().vertexToPos(self.service.node)
        moveFinished = moveToNode(self)

        if moveFinished:
            self.service.result = ServiceResult.Success

    def handleFlatPreciseMoveService(self):
        self.goal = MapManager.instance().vertexToPos(self.service.node)
        moveFinished = moveToNode(self)

        if moveFinished:
            self.service.result = ServiceResult.Success

    def handleStraightBackMoveService(self):
        self.goal = MapManager.instance().vertexToPos(self.service.node)
        moveFinished = moveBackToNode(self)

        if moveFinished:
            self.service.result = ServiceResult.Success

    def handleLoadService(self):
        result = handleLoad(self)

        if result:
            self.loading = True
            self.service.result = ServiceResult.Success

    def handleUnloadService(self):
        result = handleLoad(self)

        if result:
            self.loading = False
            self.service.result = ServiceResult.Success


# edit 1029
class ObjectProxy:
    def __init__(self, name):
        self.name = name
        self.pos = [0, 0, 0]
        # self.joint = JointState()
        # self.joint.position = np.array([0])
