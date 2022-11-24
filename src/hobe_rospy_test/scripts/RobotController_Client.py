#!/usr/bin/env python3
import rospy
from hobe_rospy_test.srv import MoveToNodeService, MoveBackService, LiftService,PalletService
import sys, select, termios, tty
from robotInfo import RobotInfo


robotNum = 2

Dummy_scenario = {
    'AMR_LIFT01':[('MoveToNode',[100,101,142,141,151,152,1]),('LiftUp',[0.0002]),('MoveBackwardToNode',[0]),
        ('MoveToNode',[152,1513,1512,1511,151,141,1403,1402,140,139,138,1380,26]),('PutDown',[0.002]),('MoveBackwardToNode',[0]), ('MoveToNode',[138,139,140,1402,1403,141,142]),
        ('MoveToNode',[101,100,143])
                  ],
    'AMR_LIFT02':[('MoveToNode',[120,119,1191,118,117,116,1162,115,1151,20]),('LiftUp',[0.0002]),('MoveBackwardToNode',[0]),
                  ('MoveToNode',[1151,115,1152,114,1142,113,1132,112,1122,111,1112,1113,109,1092,1093,107,1072,106,1062,105,M1052,104,1042,103,1032,102,1021,1022,1023,1024,1025,1026,101,1421,142,146]),
                  ('PutDown',[0.002]),('MoveBackwardToNode',[0]),
                  ('MoveToNode',[1462,142,101,1025,1024,1023,1022,102,1032,103,1042,104,1052,105,1062,106,1072,107,1093,1092,109,1113,1112,111,112,113,1142,114,1152,115,1162,116,117,118,1191,119,120,157])
                  ],
    'Palletizer': [('MoveArmToInitPose', ''), ('MoveArmToAttach', 'Box01'), ('CloseGripper', ''),('MoveArmToDetach', 'Pallet01'), ('OpenGripper', ''),
                   ('MoveArmToInitPose', ''), ('MoveArmToAttach', 'Box02'), ('CloseGripper', ''),('MoveArmToDetach', 'Pallet01'), ('OpenGripper', '')
                   ]
}

robot_info = {}

def init():
    print('init start')
    global robot_info
    current_posX = 0.0
    current_posY = 0.0
    euler_theta = 0.0
    current_lift_joint = 0.0

    for robotIndex in range(robotNum):
        robotName = 'AMR_LIFT{0:0>2}'.format(robotIndex + 1)
        robotObj = RobotInfo(robotName=robotName, pos=[current_posX, current_posY], liftJoint=current_lift_joint,
                             euler_theta=euler_theta)
        robot_info[robotName] = robotObj


def getKey(key_timeout):
    print('START \t Input Any Key \t')
    tty.setraw(sys.stdin.fileno())
    rlist, _, _ = select.select([sys.stdin], [], [], key_timeout)
    if rlist:
        key = sys.stdin.read(1)
    else:
        key = ''
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key

def robotLift_Plan(robotName, target_joint, order):
    status = 'NONE'
    result = False
    print('START {} ROBOT LIFT PLANNING \t Target Lift Joint = {}'.format(robotName, target_joint[0]))
    while not rospy.is_shutdown():

        if result:
            print('LIFT & UNLIFT FINISH')
            break
        response = liftReq(robotName, target_joint[0], order)
        result = response.success
        rospy.sleep(0.2)

def robotMove_Plan(robotName, path_list, action):
    current_node_idx = 0
    status = 'NONE'
    print('START {} ROBOT MOVE PLANNING \t ROOT = {} '.format(robotName, path_list))
    r = rospy.Rate(10)
    while not rospy.is_shutdown():

        if current_node_idx == len(path_list):
            break

        targetNode = path_list[current_node_idx]

        if action == "Forward": 
            response = moveReq(robotName, targetNode, action, 0.0)
        else: 
            response = moveReq(robotName, targetNode, action)
        status = response.status
        result = response.success

        # if status in ['Turn Left', 'Turn Right']:
        #     # rospy.loginfo(f"=== {robotName} Status : {status} ===")

        if result:
            # rospy.loginfo(f"=== {robotName} Status : {status} ===")
            print(robotName)
            current_node_idx += 1
        r.sleep
    return status

def robotMoveBackwardToNode(robotName):
    result = False
    print('START {} ROBOT POST MOVE PLANNING \t ROOT '.format(robotName))
    r = rospy.Rate(10)
    while not rospy.is_shutdown():
        response = postReq(robotName)
        result = response.success
        if result:
            print('{}--> POST_MOVE {} '.format(robotName, result))
            break
        r.sleep
    return result

def robotPalletService(robotName,plan):
    print('START {} ROBOT Pallet PLANNING \t ROOT '.format(robotName))
#        'Palletizer':[('init_Pose',[-1]),('detect_to_item',[-1]),('preattach_to_item',[-1]),('attach_to_item',[-1])] }   


    # while not rospy.is_shutdown():
    current_node_idx = 0
    result = False

    # while not rospy.is_shutdown():

        # if current_node_idx == len(plan):
            # break

        # paln_ = plan[current_node_idx]
        # print('request : ',paln_)

    #
    print(plan) 

    response = palletizerReq(robotName,plan[0], plan[1])
    result = response.result
    print("action result:", result)
   
       

    # for paln_ in plan:
    #     temp_action = 'init_Pose'
    #     response = palletizerReq(robotName,paln_)
    #     print('palletizer Response : ',response)



def temp_demo(robotName):
    for plan in Dummy_scenario[robotName]:
        # Palletizer Robot Action
        if robotName == 'Palletizer':
            robotPalletService(robotName,plan)
            rospy.sleep(1)

        #AMR Robot Action
        if plan[0] == 'wait':
            sec = plan[1][0]
            print('waiting UR10...', sec)
            rospy.sleep(sec)

        if plan[0] == 'moveToNode':
            robotMove_Plan(robotName, plan[1], 'moveToNode')
        if plan[0] == 'Forward':
            robotMove_Plan(robotName, plan[1], 'Forward')
        if plan[0] in ['Lift', 'UnLift']:
            robotLift_Plan(robotName, plan[1], plan[0])
        if plan[0] == 'postMove':
            robotMoveBackwardToNode(robotName)

if __name__ == "__main__":
    init()
    import multiprocessing

    rospy.init_node("kgu_Dummy_TM")
    rospy.loginfo("=== Robot Control Client Started ===")
    rospy.loginfo("=== Robot AMR Control Wait ===")

    rospy.wait_for_service("control_robot_move")
    moveReq = rospy.ServiceProxy('control_robot_move', MoveToNodeService)

    rospy.wait_for_service("control_robot_lift")
    liftReq = rospy.ServiceProxy('control_robot_lift', LiftService)

    rospy.wait_for_service("control_robot_MoveBackwardToNode")
    postReq = rospy.ServiceProxy('control_robot_MoveBackwardToNode', MoveBackService)
    rospy.loginfo("=== Robot AMR Control Ready ===")

    # /control_ur10_paletting
    rospy.loginfo("=== Robot Palettizer Control Wait ===")
    rospy.wait_for_service("control_ur10_paletting")
    palletizerReq = rospy.ServiceProxy('control_ur10_paletting',PalletService)
    rospy.loginfo("=== Robot Palettizer Control Ready ===")

    settings = termios.tcgetattr(sys.stdin)
    key_timeout = rospy.get_param("~key_timeout", 0.0)
    if key_timeout == 0.0:
        key_timeout = None
    key = getKey(key_timeout)
    r = rospy.Rate(10)
    p = multiprocessing.Pool(processes=4)

    # answer = p.map(temp_demo, ['AMR_LIFT01', 'AMR_LIFT02'])
    answer = p.map(temp_demo, ['Palletizer'])
    
    p.close()
    p.join()

    rospy.spin()
