import rospy
from tf2_msgs.msg import TFMessage
from tf.transformations import euler_from_quaternion
from hobe_rospy_test.msg import PalletizerPackingFinish
from value import RobotID, ObjectID
#hwan
from sensor_msgs.msg import JointState

class Observer:
    def __init__(self, robotController):
        self.robotController = robotController
        rospy.Subscriber("/AMR_LIFT01_pose", TFMessage, self.newLift1Pos)
        rospy.Subscriber("/AMR_LIFT02_pose", TFMessage, self.newLift2Pos)
        ## choi- add
        rospy.Subscriber("/AMR_LIFT03_pose", TFMessage, self.newLift3Pos)
        rospy.Subscriber("/AMR_LIFT04_pose", TFMessage, self.newLift4Pos)
        rospy.Subscriber("/packingFinish", PalletizerPackingFinish, self.newPalletizerPackingFinish)
        ##hwan
        # rospy.Subscriber("/Palletizer_joint_states",JointState, self.newPalletizerJoint)
        # edit 1029
        # rospy.Subscriber("/Object_pose",TFMessage, self.newBoxPos)
        # rospy.Subscriber("/RackPallet_pose",TFMessage, self.newRackPalletPos)

    def newLift1Pos(self, msg):
        transform = msg.transforms[0].transform
        rot_q = transform.rotation
        (roll, pitch, euler_theta) = euler_from_quaternion([rot_q.x, rot_q.y, rot_q.z, rot_q.w])
        robot_name = RobotID.AMR_LIFT01
        self.robotController.changeRobotStatus(robot_name, transform.translation.x, transform.translation.y, euler_theta)

    def newLift2Pos(self, msg):
        transform = msg.transforms[0].transform
        rot_q = transform.rotation
        (roll, pitch, euler_theta) = euler_from_quaternion([rot_q.x, rot_q.y, rot_q.z, rot_q.w])
        robot_name = RobotID.AMR_LIFT02
        self.robotController.changeRobotStatus(robot_name, transform.translation.x, transform.translation.y, euler_theta)

    ## choi - add
    def newLift3Pos(self, msg):
        transform = msg.transforms[0].transform
        rot_q = transform.rotation
        (roll, pitch, euler_theta) = euler_from_quaternion([rot_q.x, rot_q.y, rot_q.z, rot_q.w])
        robot_name = RobotID.AMR_LIFT03
        # print(robot_name)
        self.robotController.changeRobotStatus(robot_name, transform.translation.x, transform.translation.y, euler_theta)

    def newLift4Pos(self, msg):
        transform = msg.transforms[0].transform
        rot_q = transform.rotation
        (roll, pitch, euler_theta) = euler_from_quaternion([rot_q.x, rot_q.y, rot_q.z, rot_q.w])
        robot_name = RobotID.AMR_LIFT04
        self.robotController.changeRobotStatus(robot_name, transform.translation.x, transform.translation.y, euler_theta)

    def newPalletizerPackingFinish(self, msg):
        palletizerID = RobotID[str(msg.palletizer)]
        node = int(msg.node)
        self.robotController.palletizerPackingFinish(palletizerID, node)


    # ##hwan
    # def newPalletizerJoint(self, msg):
    #     robot_name = RobotID.Palletizer
    #     position = msg.position
    #     # print(robot_name,position)
    #     # self.robotController.changePalletizerJoint(robot_name, joint)
    # ## end
    #
    # # edit 1029
    # # each BOX01 ~ 07 information was published
    # def newBoxPos(self, msg):
    #     # print("object info: ", msg.transforms[0].child_frame_id)
    #     transform = msg.transforms[0].transform
    #     objectName = msg.transforms[0].child_frame_id
    #     if objectName == "Box00":
    #         object_name = ObjectID.BOX00
    #     elif objectName == "Box01":
    #         object_name = ObjectID.BOX01
    #     elif objectName == "Box02":
    #         object_name = ObjectID.BOX02
    #     elif objectName == "Box03":
    #         object_name = ObjectID.BOX03
    #     elif objectName == "Box04":
    #         object_name = ObjectID.BOX04
    #     elif objectName == "Box05":
    #         object_name = ObjectID.BOX05
    #     elif objectName == "Box06":
    #         object_name = ObjectID.BOX06
    #     elif objectName == "Box07":
    #         object_name = ObjectID.BOX07
    #     else:
    #         raise Exception("undefined name")
    #     self.robotController.changeObjectStatus(object_name, transform.translation.x, transform.translation.y, transform.translation.z)
    #
    # def newRackPalletPos(self, msg):
    #     for obj in msg.transforms:
    #         # print(obj.child_frame_id)
    #         transform = obj.transform
    #         x, y, z = transform.translation.x, transform.translation.y, transform.translation.z
    #         self._changeObjectStatus(obj.child_frame_id, x, y, z)
    #
    # def _changeObjectStatus(self, objectName, x, y, z):
    #     # print("objectName", objectName)
    #
    #     if objectName == "Pallet01":
    #         object_name = ObjectID.PALLET01
    #     elif objectName == "Pallet02":
    #         object_name = ObjectID.PALLET02
    #     elif objectName == "Pallet03":
    #         object_name = ObjectID.PALLET03
    #     elif objectName == "Pallet04":
    #         object_name = ObjectID.PALLET04
    #     elif objectName == "Rack01":
    #         object_name = ObjectID.RACK01
    #     elif objectName == "Rack02":
    #         object_name = ObjectID.RACK02
    #     elif objectName == "Rack03":
    #         object_name = ObjectID.RACK03
    #     elif objectName == "Rack04":
    #         object_name = ObjectID.RACK04
    #     elif objectName == "Rack05":
    #         object_name = ObjectID.RACK05
    #     else:
    #         raise Exception("undefined name")
    #
    #     self.robotController.changeObjectStatus(object_name, x, y, z)