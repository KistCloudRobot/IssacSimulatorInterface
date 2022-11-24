#! /usr/bin/env python

import rospy
import actionlib
from hobe_rospy_test.msg import HobeAction,HobeFeedback,HobeGoal,HobeResult

class HobeAction(object):
    # create messages that are used to publish feedback/result
    _feedback = HobeFeedback()
    _result = HobeResult()

    def __init__(self,name):
        print(name)
        print(type(name))
        self._action_name = name
        print(self._action_name)

        print(HobeResult)
        self._as = actionlib.SimpleActionServer(name=self._action_name,ActionSpec=HobeAction, execute_cb=self.execute_cb, auto_start = False)
        self._as.start()
      
    def execute_cb(self, goal):
        # helper variables
        r = rospy.Rate(1)
        success = True
        print('goal ::: ',goal)
        # append the seeds for the fibonacci sequence
        self._feedback.state = 'What?'
        # start executing the action
        while True:
            print('While GOGO')
            # check that preempt has not been requested by the client
            if self._as.is_preempt_requested():
                rospy.loginfo('%s: Preempted' % self._action_name)
                self._as.set_preempted()
                success = False
                break
            self._as.publish_feedback(self._feedback)
            # this step is not necessary, the sequence is computed at 1 Hz for demonstration purposes
            r.sleep()
          
        if success:
            self._result.sequence = self._feedback.sequence
            self._result.planningTime = 0.1234123
            self._result.bool = True
            rospy.loginfo('%s: Succeeded' % self._action_name)
            self._as.set_succeeded(self._result)
        
if __name__ == '__main__':
    rospy.init_node('HobeAction')
    server = HobeAction(rospy.get_name())
    rospy.spin()