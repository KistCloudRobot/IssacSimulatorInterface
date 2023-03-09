from value import RobotID, ServiceType, ServiceResult

from typing import Optional


class Service:
    def __init__(self):
        self.result: Optional[ServiceResult] = None

    def setResult(self, result: ServiceResult):
        self.result = result

    def getResult(self):
        return self.result


class LoginService(Service):
    def __init__(self, robotID):
        super().__init__()
        self.robotID = robotID


class RobotService(Service):
    def __init__(self, robotName):
        super().__init__()
        self.robotName = robotName


class MoveService(RobotService):
    def __init__(self, robotName):
        super().__init__(robotName)
        self.path = list()

    def appendPath(self, node: int):
        self.path.append(node)


class CancelMoveService(RobotService):
    def __init__(self, robotName):
        super().__init__(robotName)
        self.path = list()


class GuideMoveService(RobotService):
    def __init__(self, robotName, node, direction):
        super().__init__(robotName)
        self.node = node
        self.direction = direction


class PreciseMoveService(RobotService):
    def __init__(self, robotName, node):
        super().__init__(robotName)
        self.node = node


class FlatPreciseMoveService(RobotService):
    def __init__(self, robotName, node):
        super().__init__(robotName)
        self.node = node


class StraightBackMoveService(RobotService):
    def __init__(self, robotName, node):
        super().__init__(robotName)
        self.node = node


class LoadService(RobotService):
    def __init__(self, robotName, node):
        super().__init__(robotName)
        self.node = node


class UnloadService(RobotService):
    def __init__(self, robotName, node):
        super().__init__(robotName)

        self.node = node


# bae
class PalletizerService(Service):
    def __init__(self, palletizerID):
        super().__init__()
        self.palletizerID = palletizerID


class PalletizerStartService(PalletizerService):
    def __init__(self, palletizerID):
        super().__init__(palletizerID)


class PalletizerStopService(PalletizerService):
    def __init__(self, palletizerID):
        super().__init__(palletizerID)


class EnterPalletizerService(PalletizerService):
    def __init__(self, palletizerID, robotID, node):
        super().__init__(palletizerID)
        self.robotID = robotID
        self.node = node


class ExitPalletizerService(PalletizerService):
    def __init__(self, palletizerID, robotID, node):
        super().__init__(palletizerID)
        self.robotID = robotID
        self.node = node
