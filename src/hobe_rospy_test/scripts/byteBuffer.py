from typing import Optional
from enum import Enum


class ByteOrder(Enum):
    LITTLE_ENDIAN = "little"
    BIG_ENDIAN = "big"


class ByteBuffer:
    def __init__(self, b: Optional[bytes] = None, byteOrder: ByteOrder = ByteOrder.LITTLE_ENDIAN):
        if b is None:
            self.byteArray: bytearray = bytearray()
        else:
            self.byteArray: bytearray = bytearray(b)
        self.byteOrder = byteOrder

    def __len__(self):
        return len(self.byteArray)

    def __str__(self):
        return str(self.byteArray)

    def getInt(self, signed=True):
        result = int.from_bytes(self.byteArray[:4], byteorder=self.byteOrder.value, signed=signed)
        del self.byteArray[:4]
        return result

    def appendInt(self, num: int, signed=True):
        b = bytearray(num.to_bytes(length=4, byteorder=self.byteOrder.value, signed=signed))
        self.byteArray.extend(b)

    def getBool(self, signed=True):
        result = bool.from_bytes(self.byteArray[:1], byteorder=self.byteOrder.value, signed=signed)
        del self.byteArray[:1]
        return result

    def appendBool(self, b: bool, signed=True):
        b = bytearray(b.to_bytes(length=1, byteorder=self.byteOrder.value, signed=signed))
        self.byteArray.extend(b)

    def toBytes(self):
        return bytes(self.byteArray)


if __name__ == '__main__':
    byteBuffer = ByteBuffer()
    byteBuffer.appendInt(0XACB2276E)

    print(byteBuffer)
    print(len(byteBuffer))
    i = byteBuffer.getInt()
    print(hex(i))
    print(byteBuffer)
    print(len(byteBuffer))
