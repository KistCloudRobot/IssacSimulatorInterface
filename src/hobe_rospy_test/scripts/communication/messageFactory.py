from service.service import *
from value import MessageType
from byteBuffer import ByteBuffer


class MessageFactory:
    @staticmethod
    def newRTSRMessage(robotName, robotStatus, x, y, theta, speed, battery, loading):
        byteBuffer = ByteBuffer()
        byteBuffer.appendInt(40000)
        byteBuffer.appendInt(MessageType.RTSR.value, signed=False)
        byteBuffer.appendInt(41)
        byteBuffer.appendInt(robotName.value)
        byteBuffer.appendInt(robotStatus.value)
        byteBuffer.appendInt(int(x * 1000))
        byteBuffer.appendInt(int(y * 1000))
        byteBuffer.appendInt(int(theta))
        byteBuffer.appendInt(int(speed * 1000))
        byteBuffer.appendInt(int(battery))
        byteBuffer.appendBool(loading)
        return byteBuffer.toBytes()

    @staticmethod
    def newPalletizerPackingFinish(palletizerID, node):
        byteBuffer = ByteBuffer()
        byteBuffer.appendInt(40000)
        byteBuffer.appendInt(MessageType.PalletizerPackingFinish.value, signed=False)
        byteBuffer.appendInt(20)
        byteBuffer.appendInt(palletizerID.value)
        byteBuffer.appendInt(node)
        return byteBuffer.toBytes()

    @staticmethod
    def newAckMessage(service):
        byteBuffer: ByteBuffer = ByteBuffer()
        # print("newAckMessage", service)
        byteBuffer.appendInt(40000)
        if isinstance(service, LoginService):
            byteBuffer = MessageFactory.newAckLoginMessage(service, byteBuffer)
        elif isinstance(service, MoveService):
            byteBuffer = MessageFactory.newAckMoveMessage(service, byteBuffer)
        elif isinstance(service, GuideMoveService):
            byteBuffer = MessageFactory.newAckGuideMoveMessage(service, byteBuffer)
        elif isinstance(service, PreciseMoveService):
            byteBuffer = MessageFactory.newAckPreciseMoveMessage(service, byteBuffer)
        elif isinstance(service, StraightBackMoveService):
            byteBuffer = MessageFactory.newAckStraightBackMoveMessage(service, byteBuffer)
        elif isinstance(service, LoadService):
            byteBuffer = MessageFactory.newAckLoadMessage(service, byteBuffer)
        elif isinstance(service, UnloadService):
            byteBuffer = MessageFactory.newAckUnloadMessage(service, byteBuffer)
        elif isinstance(service, PalletizerStartService):
            byteBuffer = MessageFactory.newAckPalletizerStartMessage(service, byteBuffer)
        elif isinstance(service, PalletizerStopService):
            byteBuffer = MessageFactory.newAckPalletizerStopMessage(service, byteBuffer)
        else:
            raise Exception("undefined service")

        return byteBuffer.toBytes()

    @staticmethod
    def newAckEndMessage(service):
        byteBuffer: ByteBuffer = ByteBuffer()
        byteBuffer.appendInt(40000)
        # print("end service", service)
        if isinstance(service, LoginService):
            byteBuffer = MessageFactory.newAckEndLoginMessage(service, byteBuffer)
        elif isinstance(service, MoveService):
            byteBuffer = MessageFactory.newAckEndMoveMessage(service, byteBuffer)
        elif isinstance(service, GuideMoveService):
            byteBuffer = MessageFactory.newAckEndGuideMoveMessage(service, byteBuffer)
        elif isinstance(service, PreciseMoveService):
            byteBuffer = MessageFactory.newAckEndPreciseMoveMessage(service, byteBuffer)
        elif isinstance(service, StraightBackMoveService):
            byteBuffer = MessageFactory.newAckEndStraightBackMoveMessage(service, byteBuffer)
        elif isinstance(service, LoadService):
            byteBuffer = MessageFactory.newAckEndLoadMessage(service, byteBuffer)
        elif isinstance(service, UnloadService):
            byteBuffer = MessageFactory.newAckEndUnloadMessage(service, byteBuffer)
            #bae
        elif isinstance(service, PalletizerStartService):
            byteBuffer = MessageFactory.newAckEndPalletizerStartMessage(service, byteBuffer)
        elif isinstance(service, PalletizerStopService):
            byteBuffer = MessageFactory.newAckEndPalletizerStopMessage(service, byteBuffer)
        else:
            raise Exception("undefined service")

        return byteBuffer.toBytes()

    @staticmethod
    def newAckLoginMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckLogin.value, signed=False)
        byteBuffer.appendInt(16)
        byteBuffer.appendInt(service.robotID.value)
        return byteBuffer

    @staticmethod
    def newAckEndLoginMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckEndLogin.value, signed=False)
        byteBuffer.appendInt(20)
        byteBuffer.appendInt(service.robotID.value)
        byteBuffer.appendInt(service.result.value)
        return byteBuffer

    @staticmethod
    def newAckMoveMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckMove.value, signed=False)
        byteBuffer.appendInt(16)
        byteBuffer.appendInt(service.robotName.value)
        return byteBuffer

    @staticmethod
    def newAckEndMoveMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckEndMove.value, signed=False)
        byteBuffer.appendInt(20)
        byteBuffer.appendInt(service.robotName.value)
        byteBuffer.appendInt(service.result.value)
        return byteBuffer

    @staticmethod
    def newAckGuideMoveMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckGuideMove.value, signed=False)
        byteBuffer.appendInt(16)
        byteBuffer.appendInt(service.robotName.value)
        return byteBuffer

    @staticmethod
    def newAckEndGuideMoveMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckEndGuideMove.value, signed=False)
        byteBuffer.appendInt(20)
        byteBuffer.appendInt(service.robotName.value)
        byteBuffer.appendInt(service.result.value)
        return byteBuffer

    @staticmethod
    def newAckPreciseMoveMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckPreciseMove.value, signed=False)
        byteBuffer.appendInt(16)
        byteBuffer.appendInt(service.robotName.value)
        return byteBuffer

    @staticmethod
    def newAckEndPreciseMoveMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckEndPreciseMove.value, signed=False)
        byteBuffer.appendInt(20)
        byteBuffer.appendInt(service.robotName.value)
        byteBuffer.appendInt(service.result.value)
        return byteBuffer

    @staticmethod
    def newAckStraightBackMoveMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckStraightBackMove.value, signed=False)
        byteBuffer.appendInt(16)
        byteBuffer.appendInt(service.robotName.value)
        return byteBuffer

    @staticmethod
    def newAckEndStraightBackMoveMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckEndStraightBackMove.value, signed=False)
        byteBuffer.appendInt(20)
        byteBuffer.appendInt(service.robotName.value)
        byteBuffer.appendInt(service.result.value)
        return byteBuffer

    @staticmethod
    def newAckLoadMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckLoad.value, signed=False)
        byteBuffer.appendInt(16)
        byteBuffer.appendInt(service.robotName.value)
        return byteBuffer

    @staticmethod
    def newAckEndLoadMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckEndLoad.value, signed=False)
        byteBuffer.appendInt(20)
        byteBuffer.appendInt(service.robotName.value)
        byteBuffer.appendInt(service.result.value)
        return byteBuffer

    @staticmethod
    def newAckUnloadMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckUnload.value, signed=False)
        byteBuffer.appendInt(16)
        byteBuffer.appendInt(service.robotName.value)
        return byteBuffer

    @staticmethod
    def newAckEndUnloadMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckEndUnload.value, signed=False)
        byteBuffer.appendInt(20)
        byteBuffer.appendInt(service.robotName.value)
        byteBuffer.appendInt(service.result.value)
        return byteBuffer

    @staticmethod
    def newAckPalletizerStartMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckPalletizerStart.value, signed=False)
        byteBuffer.appendInt(16)
        byteBuffer.appendInt(service.palletizerID.value)
        return byteBuffer

    @staticmethod
    def newAckEndPalletizerStartMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckEndPalletizerStart.value, signed=False)
        byteBuffer.appendInt(20)
        byteBuffer.appendInt(service.palletizerID.value)
        byteBuffer.appendInt(service.result.value)
        return byteBuffer

    @staticmethod
    def newAckPalletizerStopMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckPalletizerStop.value, signed=False)
        byteBuffer.appendInt(16)
        byteBuffer.appendInt(service.palletizerID.value)
        return byteBuffer

    @staticmethod
    def newAckEndPalletizerStopMessage(service, byteBuffer):
        byteBuffer.appendInt(MessageType.AckEndPalletizerStop.value, signed=False)
        byteBuffer.appendInt(20)
        byteBuffer.appendInt(service.palletizerID.value)
        byteBuffer.appendInt(service.result.value)
        return byteBuffer

