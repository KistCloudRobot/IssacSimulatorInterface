#!/usr/bin/env python
# Copyright (c) 2020-2021, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.

import rospy
from sensor_msgs.msg import JointState
import numpy as np
import time

rospy.init_node("test_rosbridge", anonymous=True)

pub = rospy.Publisher("/joint_command_ur10", JointState, queue_size=10)
joint_state = JointState()
# print('zzzz')

joint_state.name = [
    "shoulder_pan_joint",
    "shoulder_lift_joint",
    "elbow_joint",
    "wrist_1_joint",
    "wrist_2_joint",
    "wrist_3_joint"
]

num_joints = len(joint_state.name)


# make sure kit's editor is playing for receiving messages ##

joint_state.position = np.array([0.0] * num_joints)
# default_joints = [0.5, -1.16, -0.0, -2.3, -0.0, 1.6]
default_joints = [-4, -1, -1, 1.0, 0.0, 0.0]
# limiting the movements to a smaller range (this is not the range of the robot, just the range of the movement
max_joints = np.array(default_joints) + 0.5
min_joints = np.array(default_joints) - 0.5

# position control the robot to wiggle around each joint
time_start = time.time()
rate = rospy.Rate(20)
while not rospy.is_shutdown():
    temp_x = joint_state.header.seq
    #default_joints = [10, temp_x, -0.1+(temp_x % 4), temp_x, -temp_x, 1.2+temp_x]
    joint_state.position = default_joints
    joint_state.effort = [0.0,10,32,1,2,4]
    joint_state.velocity = [-20,-4,3,4,5,2]
    print(joint_state.header.seq,"...",joint_state.position)
    pub.publish(joint_state)
    rate.sleep()
