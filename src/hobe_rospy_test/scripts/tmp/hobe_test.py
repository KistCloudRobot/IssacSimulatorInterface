#!/usr/bin/env python3
import rospy
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import Point, Twist
from math import atan2
from sensor_msgs.msg import JointState

x = 0.0
y = 0.0 
theta = 0.0

def newOdom(msg):
    print('msg == ',msg)
    print('===============')

def newJoint(msg):
    
    print('msg == ',msg)
    print('===============')


rospy.init_node("speed_controller")
robotNum = 2
# temp1 = [ rospy.Subscriber("/AMR_LIFT{0:0>2}_odometry_robot".format(i+1),Odometry,newOdom) for i in range(robotNum) ] 
temp2 = [ rospy.Subscriber("/AMR_LIFT{0:0>2}_joint_states".format(i+1),JointState,newJoint) for i in range(robotNum) ] 


rospy.spin()