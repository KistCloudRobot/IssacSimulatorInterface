from enum import Enum


class RobotID(Enum):
    LOCAL = 0
    AMR_LIFT01 = 1
    AMR_LIFT02 = 2
    AMR_LIFT03 = 3  ## choi- add
    AMR_LIFT04 = 4  ## choi- add
    Palletizer1 = 5  # Bae

# edit 1029
class ObjectID(Enum):
    BOX00 = 0
    BOX01 = 1
    BOX02 = 2
    BOX03 = 3
    BOX04 = 4
    BOX05 = 5
    BOX06 = 6
    BOX07 = 7
    PALLET01 = 8
    PALLET02 = 9
    RACK01 = 10
    RACK02 = 11
    # for dummy?
    PALLET03 = 12
    PALLET04 = 13
    RACK03 = 14
    RACK04 = 15
    RACK05 = 16

class RobotStatus(Enum):
    Login = 0
    Ready = 1
    Move = 2
    Paused = 3
    Loading = 4
    Unloading = 5
    ChargeIn = 6
    ChargeOut = 7
    Charging = 8
    ChargeStopping = 9
    Error = 10
    EmergencyStop = 11
    GuideMove = 12
    PreciseMove = 13
    FlatPreciseMove = 14
    StraightBackMove = 15


class Direction(Enum):
    FORWARD = 0
    BACKWARD = 1


class ServiceType(Enum):
    Login = 0
    Move = 1
    GuideMove = 2
    PreciseMove = 3
    FlatPreciseMove = 4
    StraightBackMove = 5



class ServiceResult(Enum):
    Success = 0
    CannotAssignNewService = 3


class MessageType(Enum):
    RTSR = 0X53469DFD
    PalletizerPackingFinish = 0X5C28AE38

    AckMove = 0X37911A75
    AckEndMove = 0X403A1BC4
    AckCancelMove = 0X4AB1FE2D
    AckEndCancelMove = 0X31F00931
    AckLoad = 0XC7C3BE2C
    AckEndLoad = 0X441C94CE
    AckUnload = 0X868F59B6
    AckEndUnload = 0X85D82ED1
    AckCharge = 0X9A427515
    AckEndCharge = 0X7F34A48F
    AckChargeStop = 0X3412A63E
    AckEndChargeStop = 0X06DE35AC
    AckPause = 0XD96EDE0B
    AckEndPause = 0X57295C2B
    AckResume = 0X1E8509B2
    AckEndResume = 0XBD2D122E
    AckDoorOpen = 0X71B2005B
    AckEndDoorOpen = 0XC9D2476A
    AckDoorClose = 0X70F29DDD
    AckEndDoorClose = 0X98378F4B
    PersonCall = 0XA88DA5FE
    AckLogin = 0X32BFB368
    AckEndLogin = 0X190ADBF8
    AckGuideMove = 0X6649B1A7
    AckEndGuideMove = 0X02655A11
    AckPreciseMove = 0X5E24BC2B
    AckEndPreciseMove = 0XB79B00DF
    AckFlatPreciseMove = 0X42E01FCF
    AckEndFlatPreciseMove = 0X86B12596
    AckStraightBackMove = 0X33446820
    AckEndStraightBackMove = 0X0DD13478
    AckPalletizerStart = 0XB4B00041
    AckEndPalletizerStart = 0XFFCE80B5
    AckPalletizerStop = 0XFC5E956
    AckEndPalletizerStop = 0X8A2D3F66

    ReqMove = 0X559657E8
    ReqCancelMove = 0X83EDC641
    ReqLoad = 0XF8957DC8
    ReqUnload = 0XF03739D3
    ReqCharge = 0X16B960EE
    ReqChargeStop = 0XCBC6486F
    ReqPause = 0X28EC89C1
    ReqResume = 0XE09AF0FB
    ReqDoorOpen = 0X078F486F
    ReqDoorClose = 0X4DDA0F69
    ReqLogin = 0X74A3BD60
    ReqGuideMove = 0XBEB3E9F1
    ReqPreciseMove = 0X168F1D9D
    ReqFlatPreciseMove = 0X71301BCA
    ReqStraightBackMove = 0XACB2276E
    ReqPalletizerStart = 0XD432B77B
    ReqPalletizerStop = 0X662BFDCF
    ReqEnterPalletizer = 0X011A16841
    ReqExitPalletizer = 0XD4255BF6


if __name__ == '__main__':
    print(RobotID["Palletizer1"])
    # print(MessageType.ReqCloseGripper.name)
    # print(MessageType["ReqCloseGripper"])
    # print(MessageType(0xCA2B3C5))
    # print(MessageType(0xCA2B3C5).name)
    # print(hex(MessageType(0xCA2B3C5).value))
    # print(RobotID.Palletizer.name)
