#!/usr/bin/env python3

import rospy
import numpy as np
import time
from geometry_msgs.msg import Twist
from rospy.topics import Publisher
from hobe_rospy_test.srv import transService,motionService,postMoveService
from nav_msgs.msg import Odometry
from sensor_msgs.msg import JointState
from math import atan2
import sys, select, termios, tty
from tf.transformations import euler_from_quaternion
import asyncio
from robotInfo import RobotInfo

msg = """
Hello 나는 HOBE야!  hi who are y? na ya na hello hihi reque
---------------------------

CTRL-C to quit
"""

temp_path = [1,2,3,4,5,6,7,8,9]
robotNum = 2

temp_map = {'AMR_LIFT02':[('moveToNode',[119,120,500]),('wait',[5]),('moveToNode',[120,119]),('Forward',[118,115,20]),('Lift',[0.002]),('postMove',[0]),('Forward',[113,111,107,105,103,102,101,142,146]),('UnLift',[0.002]),('postMove',[0]),('Forward',[101,102,103,105,107,111,113,115,118,119,156])],
'AMR_LIFT01':[('moveToNode',[100]),('Forward',[1422,1423,1424,141,149,150]),('wait',[5]),('moveToNode',[1502,2]),('Lift',[0.002]),('postMove',[0]),('Forward',[150,149,141,140,1391,1392]),('wait',[50]),('moveToNode',[1393,1394]),('Forward',[1395,138,26]),('UnLift',[0.002]),('Forward',[262,104,1042,1043]),('moveToNode',[1044,1012]),('wait',[10]),('moveToNode',[1432])]}
# RobotInfo = {'AMR_LIFT{0:0>2}'.format(i+1):{'current_lift_joint':0.0,'current_posX':0.0,'current_posY':0.0,'euler_theta':0.0} for i in range(robotNum) } 
robot_info = {}
r_1_x = 0.0

r_1_y = 0.0
r_2_x = 0.0
r_2_y = 0.0

def init():
    print('init start')
    global robot_info
    current_posX = 0.0
    current_posY = 0.0
    euler_theta = 0.0
    current_lift_joint = 0.0

    for robotIndex in range(robotNum):
        robotName = 'AMR_LIFT{0:0>2}'.format(robotIndex+1)
        robotObj = RobotInfo(robotName=robotName,pos=[current_posX,current_posY],liftJoint=current_lift_joint,euler_theta = euler_theta)
        robot_info[robotName] = robotObj


temp_robot1_name = 'AMR_LIFT01'
temp_robot2_name = 'AMR_LIFT02'

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

def newJoint_2(msg):
   
    joint_name = 'lift_joint'
    joint_idx = msg.name.index(joint_name)
    joint_pos = msg.position[joint_idx]
    robot = robot_info['AMR_LIFT02']
    robot.setJointPos(round(joint_pos * 100, 2))
    # RobotInfo['AMR_LIFT02']['current_lift_joint'] = round(joint_pos * 100, 2)
    # current_lift_joint = round(joint_pos * 100, 2)
    


def getKey(key_timeout):
    print('get_key~~')
    tty.setraw(sys.stdin.fileno())
    rlist, _, _ = select.select([sys.stdin], [], [], key_timeout)
    if rlist:
        key = sys.stdin.read(1)
    else:
        key = ''
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key


def robotLift_Plan(robotName,target_joint,order):
    # print(robot_info)
    #Lift & UnLift
    status = 'NONE'
    result = False
    print('START {} ROBOT LIFT PLANNING \t Target Lift Joint = {}'.format(robotName,target_joint[0]))    
    print('order = ',order)
    while not rospy.is_shutdown():
        
        if result:
            print('LIFT & UNLIFT FINISH')
            break
        response = liftReq(robotName,target_joint[0],order)
        result = response.success
        rospy.loginfo(f"Lift Action : {order}ing ...")
        rospy.sleep(0.4)


def robotMove_Plan(robotName,path_list,action):
    # print(robot_info)

    current_node_idx = 0
    status = 'NONE'
    print('START {} ROBOT MOVE PLANNING \t ROOT = {} '.format(robotName,path_list))
    r = rospy.Rate(10)
    while not rospy.is_shutdown():
        
        if current_node_idx == len(path_list):
            print('== {} : {} : END  =='.format(robotName,status))
            break

        targetNode = path_list[current_node_idx]

        response = moveReq(robotName,targetNode,action)
        
        status = response.status        
        result = response.success
        if result:    
            print('{}--> {} --> {} '.format(robotName,status,result))
            current_node_idx += 1 
        r.sleep
    return status


def robotPostMove_Plan(robotName):
    result = False
    print('START {} ROBOT POST MOVE PLANNING \t ROOT '.format(robotName))
    r = rospy.Rate(10)
    while not rospy.is_shutdown():
        response = postReq(robotName)
        result = response.success
        if result:    
            print('{}--> POST_MOVE {} '.format(robotName,result))
            break
        r.sleep
    return result


def temp_demo(robotName):
    
    for plan in temp_map[robotName]:
        print(plan[0])
        if plan[0] == 'wait':
            # key = getKey(key_timeout)
            sec = plan[1][0]
            print('waiting UR10...',sec)
            rospy.sleep(sec)
            
        if plan[0] == 'moveToNode':
            robotMove_Plan(robotName,plan[1],'moveToNode')
        if plan[0] == 'Forward':
            robotMove_Plan(robotName,plan[1],'Forward')
        if plan[0] in ['Lift','UnLift']:
            robotLift_Plan(robotName,plan[1],plan[0])
        if plan[0] == 'postMove':
            robotPostMove_Plan(robotName)



if __name__=="__main__":
    init()
    import multiprocessing

    
    rospy.init_node("temp_client")
    
    # temp = [ rospy.Subscriber("/AMR_LIFT{0:0>2}_odometry_robot".format(2-i),Odometry,newOdom) for i in range(robotNum) ] 
    


    # joint_sub = rospy.Subscriber("/AMR_LIFT01_joint_states", JointState, newJoint_1)
    # joint_sub = rospy.Subscriber("/AMR_LIFT01_joint_states", JointState, newJoint_1)


    rospy.loginfo("=== Robot Control Client Started ===") 
    rospy.loginfo("=== Robot Control Waiting ===") 
    rospy.wait_for_service("control_robot_move")
    moveReq = rospy.ServiceProxy('control_robot_move',transService)
 
    rospy.wait_for_service("control_robot_lift")
    liftReq = rospy.ServiceProxy('control_robot_lift',motionService)
 
    rospy.wait_for_service("control_robot_postMove")
    postReq = rospy.ServiceProxy('control_robot_postMove',postMoveService)
    


    settings = termios.tcgetattr(sys.stdin)
    key_timeout = rospy.get_param("~key_timeout", 0.0)
    if key_timeout == 0.0:
        key_timeout = None
    key = getKey(key_timeout)
    r = rospy.Rate(10)


    p = multiprocessing.Pool(processes=4)
    
    answer = p.map(temp_demo,['AMR_LIFT01','AMR_LIFT02'])
    p.close()
    p.join()

    # temp_map = {'AMR_LIFT01':[('moveToNode',[1,2,3,4,5,6,7,8,9]),('Lift',[0]),('moveToNode',[10,11,12,13,14]),('UnLift',[-1])]}

    # a = asyncio.run(testHobe('HobMinGe'))
    # b = asyncio.run(testHobe('MinG'))
    
    
    # temp = asyncio.run(robotMove_Plan(temp_robot_name,plan[1]))
    # temp2 = asyncio.run(robotMove_Plan(temp_robot_name,plan[1]))





    rospy.spin()













    # a = asyncio.run(robotMove_Plan(temp_robot_name,temp_path))
    # print(a)
    # while not rospy.is_shutdown():
    #     # key = getKey(key_timeout)
    #     # if key in node2pos.keys():
    #     if key in ['z','x']:
    #         if key == 'z':
    #             rospy.loginfo("=== Load Target ===")
    #         else :
    #             rospy.loginfo("=== Unload Target ===")
    #     else:
    #         rospy.loginfo("=== Target NODE Number has entered ===")
    #         if key in ['q', 'w', 'e', 'r', 't', 'y']:
    #             if key == "q":
    #                 rospy.loginfo("=== Motion Planning to NODE Number 10 ===")
    #             elif key == "w":
    #                 rospy.loginfo("=== Motion Planning to NODE Number 11 ===")
    #             elif key == "e":
    #                 rospy.loginfo("=== Motion Planning to NODE Number 12 ===")
    #             elif key == "r":
    #                 rospy.loginfo("=== Motion Planning to NODE Number  13 ===")
    #             elif key == "t":
    #                 rospy.loginfo("=== Motion Planning to NODE Number 14 ===")
    #             elif key == "y":
    #                 rospy.loginfo("=== Motion Planning to NODE Number 15 ===")
    #             else:
    #                 rospy.loginfo("=== Unknow NODE Number ===")
    #         else:
    #             rospy.loginfo("=== Motion Planning to NODE Number " + key + " ===")
        
    #     r.sleep()




    # while not rospy.is_shutdown():
    #     response = moveReq(temp_robot_name,current_posX,current_posY,current_joint,euler_theta,temp_path)
    #     print(response)
    #     if response:
    #         break

    #     # response_ = req_lift('Hobe',key,backward_flag)
    #     # response = req_post('Hobe',temp_lift_mapping[key])
            
    #     # result = response.success

