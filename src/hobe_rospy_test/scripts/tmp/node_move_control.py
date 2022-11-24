#!/usr/bin/env python3
import math
import rospy
import numpy as np
import time
from geometry_msgs.msg import Twist
from rospy.topics import Publisher
from hobe_rospy_test.srv import transService, motionService, postMoveService
from robotInfo import RobotInfo
from nav_msgs.msg import Odometry
from math import atan2
from tf.transformations import euler_from_quaternion
from sensor_msgs.msg import JointState
# import asyncio

robot_number = 2
robot_info = {}

def init():
    global robot_info
    x = 0.0
    y = 0.0
    theta = 0.0
    current_lift_joint = 0.0

    for robotIndex in range(robot_number):
        robotName = 'AMR_LIFT{0:0>2}'.format(robotIndex + 1)  ## choi - add(origin: AMR_LIFT{0:0>2})
        robotObj = RobotInfo(robotName=robotName,pos=[x,y],liftJoint=current_lift_joint,euler_theta = theta)
        robot_info[robotName] = robotObj
    

node2pos = {
    #Lift1
    '100' : (4,0),
    '143' : (0,0),
    '1432' : (-0.5,0),
    '1002' : (4,2),
    #turn right
    '1422' : (4,-5),
    '1423' : (4,-8),
    '1424' : (4,-10),
    '141' : (4,-13),
    '140' : (4,-11),
    '149' : (0,-13),
    '150' : (-4,-13),
    '1502' : (-6,-13),
    '2' : (-9,-13),
    #lift
    '1391' : (7,-11),
    '1392' : (9,-11),
    '1393' : (11,-11),
    '1394' : (13,-11),
    '1395' : (15,-11),
    '138' : (21.75,-11),
    '26' : (21.75,-6.3),
    '262' : (21.75,-3),
    #unlift
    '104' : (21.75,0),
    '1042' : (16.75,0),
    '1043' : (11.75,0),
    '1044' : (7.75,0),
    '1012' : (4,0),
    #Lift2
    '119' : (1.24,0),
    '120' : (1.24,3.4),
    '500' : (0,3.4),
    '118' : (3.18,0),
    '115' : (9.45,0),
    '20' : (9.45,3.9),
    '113' : (15.6,1),
    '111' : (19.2,1),
    '107' : (23,1),
    '105' : (27,1),
    '103' : (31,1),
    '102' : (34.4,1),
    '101' : (40.7,1),
    '142' : (40.7,2.8),
    '146' : (43.5,2.8),
    '156' : (0,0),
    #un
    # 	
    #			
    # '10':(-4.37,16.63),
    # '11':(-4.37,18.83),
    # edit hojun
    'z': ('up', 4.0),  # lift
    'x': ('down', 0.0)  # down
}

x = 0.0
y = 0.0
theta = 0.0
threshold = 0.3
current_joint = 0.0
backward_flag = 0
goal_x = 0.0
goal_y = 0.0
prior_flag = 0
theta_flag = 0
prior_x = 0
prior_y = 0
prior_theta = 0

def newOdom(msg):
    global r_1_x
    global r_1_y
    global r_2_x
    global r_2_y
    
    rot_q = msg.pose.pose.orientation
    (roll, pitch, euler_theta) = euler_from_quaternion([rot_q.x, rot_q.y, rot_q.z, rot_q.w])
    robot_name = msg.child_frame_id
    robot = robot_info[msg.child_frame_id]

    robot.setTheta(euler_theta)
    robot.setPos(pos_x=msg.pose.pose.position.x,pos_y=msg.pose.pose.position.y)

def newJoint_1(msg):
    
    joint_name = 'lift_joint'
    # joint_state_msg = rospy.wait_for_message("/joint_states", JointState)
    # print(joint_state_msg)
    # joint_idx = joint_state_msg.name.index(joint_name)
    # joint_pos = joint_state_msg.position[joint_idx]
    joint_idx = msg.name.index(joint_name)
    joint_pos = msg.position[joint_idx]
    robot = robot_info['AMR_LIFT01']
    robot.setJointPos(round(joint_pos * 100, 2))
    # RobotInfo['AMR_LIFT01']['current_lift_joint'] = round(joint_pos * 100, 2)
    # RobotInfo['AMR_LIFT02']['current_lift_joint'] = round(joint_pos * 100, 2)
    # current_lift_joint = round(joint_pos * 100, 2)
    
def newJoint_2(msg):
   
    joint_name = 'lift_joint'
    joint_idx = msg.name.index(joint_name)
    joint_pos = msg.position[joint_idx]
    robot = robot_info['AMR_LIFT02']
    robot.setJointPos(round(joint_pos * 100, 2))
    # RobotInfo['AMR_LIFT02']['current_lift_joint'] = round(joint_pos * 100, 2)
    # current_lift_joint = round(joint_pos * 100, 2)


def newJoint_3(msg):
    joint_name = 'lift_joint'
    joint_idx = msg.name.index(joint_name)
    joint_pos = msg.position[joint_idx]
    robot = robot_info['AMR_LIFT03']
    robot.setJointPos(round(joint_pos * 100, 2))
    # RobotInfo['AMR_LIFT03']['current_lift_joint'] = round(joint_pos * 100, 2)
    # current_lift_joint = round(joint_pos * 100, 2)


def newJoint_4(msg):
    joint_name = 'lift_joint'
    joint_idx = msg.name.index(joint_name)
    joint_pos = msg.position[joint_idx]
    robot = robot_info['AMR_LIFT04']
    robot.setJointPos(round(joint_pos * 100, 2))
    # RobotInfo['AMR_LIFT04']['current_lift_joint'] = round(joint_pos * 100, 2)
    # current_lift_joint = round(joint_pos * 100, 2)



def check_pos(goal_pos,current_pos,threshold):
    pos_x = current_pos[0] #base_pos[0]
    pos_y = current_pos[1] #base_pos[1]
    goal_x = goal_pos[0]
    goal_y = goal_pos[1]
    print('CHECK ==')
    print('pos : {} , {}\n goal :{} , {}'.format(pos_x, pos_y, goal_x, goal_y))
    if abs(pos_x - goal_x) <= threshold and abs(pos_y - goal_y) <= threshold:
        return True
    return False

def handle_postmove_planning(req):
    
    robotName = req.robotName
    robot = robot_info[robotName]
    
    goal_x = robot.post_goal_x
    goal_y = robot.post_goal_y
    result = False
    theta = robot.getTheta()
    current_x,current_y = robot.getPos()
    if not robot.backward_flag:
        if theta > 0.75 and theta < 2.25:
            goal_x = current_x
            goal_y = current_y - robot.backward_degree
        elif theta < -0.75 and theta > -2.25:
            goal_x = current_x
            goal_y = current_y + robot.backward_degree
        if abs(theta) > 2.25:
            goal_x = current_x + robot.backward_degree
            goal_y = current_y
        elif abs(theta) < 0.75:
            goal_x = current_x - robot.backward_degree
            goal_y = current_y

    inc_x = goal_x - x
    inc_y = goal_y - y
    speed = Twist()
    distance_to_goal = np.sqrt(inc_x * inc_x + inc_y * inc_y)
    
    if distance_to_goal >= 0.3:
        speed.linear.x = -0.8
        speed.angular.z = 0.0
    if robot.check_pos(goal_pos=(goal_x, goal_y),current_pos=(current_x,current_y),threshold=0.3):
        rospy.loginfo("=== Robot Arrived at Goal Pos ===")
        speed.linear.x = 0.0
        speed.angular.z = 0.0
        result = True
        # backward_flag = 0
        robot.setBackward_flag(flag=False)
    else:
        # backward_flag = backward_flag + 1
        robot.post_goal_x = goal_x
        robot.post_goal_y = goal_y
        
        robot.setBackward_flag(flag=True)

    # if check_pos(goal_pos=(goal_x, goal_y),current_pos=(current_posX,current_posY)):
    #     rospy.loginfo("=== Robot Arrived at Goal Pos ===")
    #     speed.linear.x = 0.0
    #     speed.angular.z = 0.0
    #     result = True
    #     backward_flag = 0
    # else:
    #     backward_flag = backward_flag + 1

    odom_pub_list[robotName].publish(speed)
    # publisher.publish(speed)
    return result

def handle_lift_planning(req):
#     string robotName
# float32 current_value
# float32 target_value
# ---
# bool success

    joint_command = JointState()
    joint_command.name = ['lift_joint']
    
    robotName = req.robotName
    robot = robot_info[robotName]
    # target_joint = 0.0
    value = req.target_value
    order = req.order #Lift & UnLift
    current_joint = robot.get_lift_joint()
    
    # print('current Joint Type = ',type(current_joint))
    rospy.loginfo(f"Received Current Lift Joint : {current_joint}")
    # rospy.loginfo(f"Received Target Lift Joint: {value}")
    
    if order == 'Lift':
        if current_joint > 0.1:
            return True
        else:
            current_joint += value
            
    elif order == 'UnLift':
        if current_joint < 0:
            return True
        else:
            current_joint -= value

    robot.set_lift_joint(current_joint)
    joint_command.position = np.array([current_joint])
    joint_pub_list[robotName].publish(joint_command)
    # joint_pub.publish(joint_command)
    return False

def handle_move_planning(req):
    
    robotName = req.robotName
    robot = robot_info[robotName]
    threshold = robot.threshold
    rGoal_x = 0
    rGoal_y = 0
    result = False
    robotFoward = robot.forward_flag #req.forward_flag
    action = req.action
    tNumber = req.node #temp value
    
    # theta = req.eulerTheta
    theta = robot.getTheta()
    # robot.setTheta(euler_theta=theta)
    current_posX,current_posY = robot.getPos()
    # current_posY = req.pos_y
    # print('posX {} , posY {}'.format(current_posX,current_posY))
    
    velocity = robot.velocity
    goal_x, goal_y = node2pos[str(tNumber)]

    if action == 'Forward':
        if not robot.prior_flag:
            robot.setStatus(status='READY')
            prior_x = robot.pos_x
            prior_y = robot.pos_y
            robot.setPrior_flag(flag=True)
        else:
            prior_x = robot.prior_x
            prior_y = robot.prior_y
        rGoal_x,rGoal_y = goal_x,goal_y

    elif action == 'moveToNode':
        if not robot.prior_flag:
            robot.setStatus(status='READY')
            prior_x = robot.goal_x
            prior_y = robot.goal_y
            robot.setPrior_flag(flag=True)
        else:
            prior_x = robot.prior_x
            prior_y = robot.prior_y

        rGoal_x,rGoal_y = robot.getNewGoal(goal_x,goal_y,threshold)


    robot.setPrior_goal(prior_x,prior_y)
    robot.setGoalPos(goal_x,goal_y)
    

    speed = Twist()
    inc_x = goal_x - prior_x
    inc_y = goal_y - prior_y
    angle_to_goal = atan2(inc_y, inc_x)

    print('angle_to_goal : ',angle_to_goal)
    print('theta = ',theta)
    # 목표 좌표 방향 까지 회전
    distance_to_goal = np.sqrt(inc_x * inc_x + inc_y * inc_y)
    print('distancetogoal: ', distance_to_goal)
    theta_threshold = 0.008
    theta_threshold1 = 0.15 
    theta_threshold2 = 0.3
    if distance_to_goal >= 0.3:
        speed.linear.x = 9
        speed.angular.z = 0.0
        
        if not robot.theta_flag:
            prior_theta = robot.getTheta()
            robot.setTheta_flag(flag=True)
            robot.setPriorTheta(prior_theta)
            # theta_flag += 1
        if not robotFoward:
            prior_theta = robot.prior_theta
            if abs(angle_to_goal)>1.5 and abs(angle_to_goal)<3 and abs(theta)>abs(angle_to_goal):
                if angle_to_goal > 0 :
                    if angle_to_goal * prior_theta > 0 and angle_to_goal - theta > theta_threshold:
                        speed.linear.x = 0.0
                        # speed.angular.z = 0.3 * velocity #left
                        speed.angular.z = -0.1
                        if angle_to_goal - theta > theta_threshold2 :
                            speed.angular.z = -0.3
                        elif theta_threshold2 > angle_to_goal - theta > theta_threshold1 :
                            speed.angular.z = -0.2
                        else :
                            speed.angular.z = -0.1
                        robot.setForward_flag(flag = False)
                        robot.setStatus(status='Turn Left')
                        # temp_req = False
                    elif angle_to_goal * prior_theta < 0 and abs(angle_to_goal - theta) > theta_threshold:
                        speed.linear.x = 0.0
                        # speed.angular.z = 0.3 * velocity #left
                        speed.angular.z = -0.1
                        if abs(angle_to_goal - theta) > theta_threshold2 :
                            speed.angular.z = -0.3
                        elif theta_threshold2 >abs(angle_to_goal - theta) > theta_threshold1 :
                            speed.angular.z = -0.2
                        else :
                            speed.angular.z = -0.1
                        robot.setForward_flag(flag = False)
                        robot.setStatus(status='Turn Left')
                    else:
                        robot.setForward_flag(flag = True)
                        robot.setStatus(status='Forward')

                elif angle_to_goal < 0 :
                    if angle_to_goal * prior_theta > 0 and angle_to_goal - theta < -theta_threshold:
                        speed.linear.x = 0.0
                        # speed.angular.z = 0.3 * velocity #left
                        speed.angular.z = 0.1
                        if angle_to_goal - theta < -theta_threshold2 :
                            speed.angular.z = 0.3
                        elif -theta_threshold2 < angle_to_goal - theta < -theta_threshold1 :
                            speed.angular.z = 0.2
                        else :
                            speed.angular.z = 0.1
                        
                        robot.setForward_flag(flag=False)
                        robot.setStatus(status='Turn Left')
                    elif angle_to_goal * prior_theta < 0 and angle_to_goal - theta < -theta_threshold:
                        speed.linear.x = 0.0
                        # speed.angular.z = 0.3 * velocity #left
                        speed.angular.z = -0.3
                        if angle_to_goal - theta < -theta_threshold2 :
                            speed.angular.z = -0.3
                        elif -theta_threshold2 < angle_to_goal - theta < -theta_threshold1 :
                            speed.angular.z = -0.2
                        else :
                            speed.angular.z = -0.1
                        robot.setForward_flag(flag=False)
                        robot.setStatus(status='Turn Left')
                    else:
                        robot.setForward_flag(flag=True)   
                        robot.setStatus(status='Forward')                     
            elif angle_to_goal > 3:
                if theta < 0 and angle_to_goal - abs(theta) > theta_threshold:
                    speed.linear.x = 0.0
                    # speed.angular.z = 0.3 * velocity #left
                    speed.angular.z = -0.1
                    if angle_to_goal - abs(theta) > theta_threshold2 :
                            speed.angular.z = -0.3
                    elif theta_threshold2 > angle_to_goal - abs(theta) > theta_threshold1 :
                        speed.angular.z = -0.2
                    else :
                        speed.angular.z = -0.1
                    robot.setForward_flag(flag=False)
                    robot.setStatus(status='Turn Left')
                elif theta > 0 and angle_to_goal - abs(theta) > theta_threshold:
                    speed.linear.x = 0.0
                    # speed.angular.z = -0.3 * velocity #right
                    speed.angular.z = 0.1
                    if angle_to_goal - abs(theta) > theta_threshold2 :
                            speed.angular.z = 0.3
                    elif theta_threshold2 > angle_to_goal - abs(theta) > theta_threshold1 :
                        speed.angular.z = 0.2
                    else :
                        speed.angular.z = 0.1
                    robot.setForward_flag(flag=False)
                    robot.setStatus(status='Turn Right')
                else:
                    robot.setForward_flag(flag=True)
            elif angle_to_goal - theta > theta_threshold:
                speed.linear.x = 0.0
                # speed.angular.z = 0.3 * velocity #left
                speed.angular.z = 0.1
                if angle_to_goal - theta > theta_threshold2 :
                            speed.angular.z = 0.3
                elif theta_threshold2 > angle_to_goal - theta > theta_threshold1 :
                    speed.angular.z = 0.2
                else :
                    speed.angular.z = 0.1
                robot.setForward_flag(flag=False)
                robot.setStatus(status='Turn Left')  
            
            elif angle_to_goal - theta < -theta_threshold:
                speed.linear.x = 0.0
                # speed.angular.z = -0.3 * velocity #right
                speed.angular.z = -0.1
                if angle_to_goal - theta < -theta_threshold2 :
                            speed.angular.z = -0.3
                elif -theta_threshold2 < angle_to_goal - theta < -theta_threshold1 :
                    speed.angular.z = -0.2
                else :
                    speed.angular.z = -0.1
                robot.setForward_flag(flag=False)
                robot.setStatus(status='Turn Right')
            else:
                robot.setForward_flag(flag=True)
                robot.setStatus(status='Forward')

    if robot.check_pos(goal_pos=(rGoal_x, rGoal_y),current_pos=(current_posX,current_posY),threshold=threshold):
        rospy.loginfo("=== Robot Arrived at Goal Pos ===")
        speed.linear.x = 0.0
        speed.angular.z = 0.0
        result = True
        robot.setPrior_flag(flag=False) 
        robot.setBackward_flag(flag=False)
        robot.setTheta_flag(flag=False)
        robot.setForward_flag(flag=False)
        # robot.setPriorTheta_flag(flag=False)
        robot.setStatus(status='STOP')

    odom_pub_list[robotName].publish(speed)
    # publisher.publish(speed)
    # print('zzzzzzzzzzzz')
    # print('::::: ',robot.getStatus())
    return (result,str(robot.getStatus()))


if __name__ == '__main__':
    #robot init
    init()
#     temp = [ rospy.Subscriber("/AMR_LIFT{0:0>2}_odometry_robot".format(i+1),Odometry,newOdom) for i in range(robotNum) ] 

    rospy.init_node("test_rosbridge")
    rospy.loginfo("=== Robot Move Control Started ===")
    # odom_sub = rospy.Subscriber("/odometry_robot", Odometry, newOdom)
    # joint_sub = rospy.Subscriber("/joint_states", JointState, newJoint)
    robot_num = 2
    odom_sub = rospy.Subscriber("/AMR_LIFT01_odometry_robot", Odometry, newOdom)
    odom_sub = rospy.Subscriber("/AMR_LIFT02_odometry_robot", Odometry, newOdom)
    odom_sub = rospy.Subscriber("/AMR_LIFT03_odometry_robot", Odometry, newOdom)  ## choi - add
    odom_sub = rospy.Subscriber("/AMR_LIFT04_odometry_robot", Odometry, newOdom)  ## choi - add

    joint_sub = rospy.Subscriber("/AMR_LIFT01_joint_states", JointState, newJoint_1)
    joint_sub = rospy.Subscriber("/AMR_LIFT02_joint_states", JointState, newJoint_2)
    joint_sub = rospy.Subscriber("/AMR_LIFT03_joint_states", JointState, newJoint_3)  ## choi - add
    joint_sub = rospy.Subscriber("/AMR_LIFT04_joint_states", JointState, newJoint_4)  ## choi - add

    # joint_pub_list = {'AMR_LIFT{0:0>2}'.format(i+1):rospy.Publisher("/AMR_LIFT{0:0>2}_joint_command".format(i+1), JointState, queue_size=1) for i in range(robot_num) }
    # odom_pub_list = {'AMR_LIFT{0:0>2}'.format(i+1):rospy.Publisher("/AMR_LIFT{0:0>2}_cmd_vel".format(i+1), Twist, queue_size=1) for i in range(robot_num) }

    ## choi - add
    joint_pub_list = {'AMR_LIFT{0:0>4}'.format(i+1):rospy.Publisher("/AMR_LIFT{0:0>4}_joint_command".format(i+1), JointState, queue_size=1) for i in range(robot_num) }
    odom_pub_list = {'AMR_LIFT{0:0>4}'.format(i+1):rospy.Publisher("/AMR_LIFT{0:0>4}_cmd_vel".format(i+1), Twist, queue_size=1) for i in range(robot_num) }
    ## end

    # publisher = rospy.Publisher('cmd_vel', Twist, queue_size=1)
    move_server = rospy.Service("/control_robot_move", transService, handle_move_planning)
    motion_server = rospy.Service("/control_robot_lift", motionService, handle_lift_planning)
    move_post_server = rospy.Service("/control_robot_postMove", postMoveService, handle_postmove_planning)

    rospy.spin()
