from service.service import *

from byteBuffer import ByteBuffer
from value import RobotID, MessageType, Direction

from typing import Optional


class ServiceFactory:
    @staticmethod
    def newServiceFromBytes(b):
        byteBuffer = ByteBuffer(b)
        protocolID = byteBuffer.getInt()
        messageType = MessageType(byteBuffer.getInt(signed=False))
        print("messageType", messageType)
        packetSize = byteBuffer.getInt()
        if messageType == MessageType.ReqLogin:
            return ServiceFactory.newLoginService(byteBuffer)
        elif messageType == MessageType.ReqMove:
            return ServiceFactory.newMoveService(byteBuffer)
        elif messageType == MessageType.ReqGuideMove:
            return ServiceFactory.newGuideMoveService(byteBuffer)
        elif messageType == MessageType.ReqPreciseMove:
            return ServiceFactory.newPreciseMoveService(byteBuffer)
        elif messageType == MessageType.ReqFlatPreciseMove:
            return ServiceFactory.newFlatPreciseMoveService(byteBuffer)
        elif messageType == MessageType.ReqStraightBackMove:
            return ServiceFactory.newStraightBackMoveService(byteBuffer)
        elif messageType == MessageType.ReqLoad:
            return ServiceFactory.newLoadService(byteBuffer)
        elif messageType == MessageType.ReqUnload:
            return ServiceFactory.newUnloadService(byteBuffer)
        elif messageType == MessageType.ReqPalletizerStart:
            return ServiceFactory.newPalletizerStartService(byteBuffer)
        elif messageType == MessageType.ReqPalletizerStop:
            return ServiceFactory.newPalletizerStopService(byteBuffer)
        elif messageType == MessageType.ReqEnterPalletizer:
            return ServiceFactory.newEnterPalletizerService(byteBuffer)
        elif messageType == MessageType.ReqExitPalletizer:
            return ServiceFactory.newExitPalletizerService(byteBuffer)
        else:
            raise Exception("undefined service")

    @staticmethod
    def newLoginService(byteBuffer):
        robotName = RobotID(byteBuffer.getInt())

        return LoginService(robotName)

    @staticmethod
    def newMoveService(byteBuffer):

        robotName = RobotID(byteBuffer.getInt())
        service = MoveService(robotName)

        pathSize = byteBuffer.getInt()
        for _ in range(pathSize):
            node = byteBuffer.getInt()
            service.path.append(node)

        return service

    @staticmethod
    def newGuideMoveService(byteBuffer):

        robotName = RobotID(byteBuffer.getInt())
        node = byteBuffer.getInt()
        direction = Direction(byteBuffer.getInt())

        return GuideMoveService(robotName, node, direction)

    @staticmethod
    def newPreciseMoveService(byteBuffer):

        robotName = RobotID(byteBuffer.getInt())
        node = byteBuffer.getInt()

        return PreciseMoveService(robotName, node)

    @staticmethod
    def newFlatPreciseMoveService(byteBuffer):

        robotName = RobotID(byteBuffer.getInt())
        node = byteBuffer.getInt()

        return FlatPreciseMoveService(robotName, node)

    @staticmethod
    def newStraightBackMoveService(byteBuffer):

        robotName = RobotID(byteBuffer.getInt())
        node = byteBuffer.getInt()

        return StraightBackMoveService(robotName, node)

    @staticmethod
    def newLoadService(byteBuffer):

        robotName = RobotID(byteBuffer.getInt())
        node = byteBuffer.getInt()

        return LoadService(robotName, node)

    @staticmethod
    def newUnloadService(byteBuffer):

        robotName = RobotID(byteBuffer.getInt())
        node = byteBuffer.getInt()

        return UnloadService(robotName, node)

    @staticmethod
    def newPalletizerStartService(byteBuffer):
        palletizerID = RobotID(byteBuffer.getInt())

        return PalletizerStartService(palletizerID)

    @staticmethod
    def newPalletizerStopService(byteBuffer):
        palletizerID = RobotID(byteBuffer.getInt())

        return PalletizerStopService(palletizerID)

    @staticmethod
    def newEnterPalletizerService(byteBuffer):
        palletizerID = RobotID(byteBuffer.getInt())
        robotID = RobotID(byteBuffer.getInt())
        node = byteBuffer.getInt()

        return EnterPalletizerService(palletizerID, robotID, node)

    @staticmethod
    def newExitPalletizerService(byteBuffer):
        palletizerID = RobotID(byteBuffer.getInt())
        robotID = RobotID(byteBuffer.getInt())
        node = byteBuffer.getInt()

        return ExitPalletizerService(palletizerID, robotID, node)
