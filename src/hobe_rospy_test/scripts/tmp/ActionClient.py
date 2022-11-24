#! /usr/bin/env python

import rospy

# Brings in the SimpleActionClient
import actionlib

# Brings in the messages used by the fibonacci action, including the
# goal message and the result message.
# import actionlib_tutorials.msg
from hobe_rospy_test.msg import HobeAction,HobeGoal

def HobeAction_client():
    # Creates the SimpleActionClient, passing the type of the action
    # (FibonacciAction) to the constructor.
    client = actionlib.SimpleActionClient('HobeAction',HobeAction)

    print('Wait..')
    # Waits until the action server has started up and started
    # listening for goals.
    client.wait_for_server()

    # Creates a goal to send to the action server.
    print('GOGO')
    goal = HobeGoal()
    goal.robotName = 'AMR_LIFT01'
    goal.nodePath = [0,1,2,3]
    goal.order = 'moveToNode'
    # Sends the goal to the action server.
    client.send_goal(goal)
    print('send GOL!')
    # Waits for the server to finish performing the action.
    client.wait_for_result()

    # Prints out the result of executing the action
    return client.get_result()  # A FibonacciResult

if __name__ == '__main__':
    try:
        # Initializes a rospy node so that the SimpleActionClient can
        # publish and subscribe over ROS.
        rospy.init_node('HobeClient_Node')
        result = HobeAction_client()
        print('Result : ',result)
    except rospy.ROSInterruptException:
        print("program interrupted before completion", file=sys.stderr)