#!/usr/bin/env python3
import rospy
from hobe_rospy_test.srv import MoveToNodeService, MoveBackService, LiftService,PalletService
import sys, select, termios, tty
from robotInfo import RobotInfo


robotNum = 2

Dummy_scenario = {
    'AMR_LIFT02':[('Forward',[119,120,500]),('wait',[5]),('Forward',[120,119]),('Forward',[118,117,116,115,20]),('Lift',[0.002]),('postMove',[0]),('Forward',[113,112,111,107,105,103,102,101,142,146]),('UnLift',[0.002]),('postMove',[0]),('Forward',[101,102,103]),('Forward',[105]),('Forward',[107,111,112,113,114,1142,1143]),('Forward',[116]),('Forward',[117,118,119,156,157]),('wait',[60])],
    'AMR_LIFT01':[('Forward',[100]),('Forward',[1422,1423,1424,141,149,150]),('wait',[5]),('Forward',[1502,2]),('Lift',[0.002]),('postMove',[0]),('Forward',[150,1492,149,1412,141,140,1391,1392]),('Forward',[1393,1394]),('Forward',[1395,138,1382,26]),('UnLift',[0.002]),('Forward',[262,104,1042]),('Forward',[1043,1044,1012]),('wait',[10]),('Forward',[1432])],
    'Palletizer':[('MoveArmToInitPose', ''),('MoveArmToAttach','Box01'),('CloseGripper', ''),('MoveArmToDetach','Pallet01'),('OpenGripper',''), 
    ('MoveArmToInitPose', ''),('MoveArmToAttach','Box01'),('CloseGripper', ''),('MoveArmToDetach','Pallet01'),('OpenGripper','')]
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
        #Palletizer Robot Action
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
    # rospy.wait_for_service("control_ur10_paletting")
    palletizerReq = rospy.ServiceProxy('control_ur10_paletting',PalletService)
    rospy.loginfo("=== Robot Palettizer Control Ready ===")

    settings = termios.tcgetattr(sys.stdin)
    key_timeout = rospy.get_param("~key_timeout", 0.0)
    if key_timeout == 0.0:
        key_timeout = None
    key = getKey(key_timeout)
    r = rospy.Rate(10)
    p = multiprocessing.Pool(processes=4)

    answer = p.map(temp_demo, ['AMR_LIFT01', 'AMR_LIFT02','Palletizer'])
    p.close()
    p.join()

    rospy.spin()
