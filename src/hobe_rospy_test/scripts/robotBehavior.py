import numpy as np
import math

from service.service import LoadService, UnloadService
from configuration import RobotConfiguration
# from sensor_msgs.msg import JointState


def checkPos(goal, pos, threshold):
    dist = math.sqrt((goal[0] - pos[0]) ** 2 + (goal[2] - pos[2]) ** 2)
    if dist <= threshold:
        return True
    else:
        return False


def moveToNode(robot):
    isFinished = False

    if not checkPos(robot.goal, robot.pos, RobotConfiguration.DIST_THRESHOLD):
        diff_x = robot.goal[0] - robot.pos[0]
        diff_y = robot.goal[2] - robot.pos[2]
        angle_to_goal = math.atan2(diff_y, diff_x)
        angle_diff = robot.theta - angle_to_goal
        if angle_diff > math.pi:
            angle_diff = angle_diff - 2.0 * math.pi
        elif angle_diff < -math.pi:
            angle_diff = angle_diff + 2.0 * math.pi

        if robot.forward:
            dist_to_goal = math.sqrt(diff_x ** 2.0 + diff_y ** 2.0)
            dist_diff = dist_to_goal * math.sin(angle_diff / 2.0)

            # if robot.tmpCount < 5:
            #     robot.tmpCount += 1
            # else:
            #     print("[" + str(robot.name.name) + "] dist_to_goal : " + str(dist_to_goal) + ", angle_diff : " + str(angle_diff) + ", dist_diff" + str(dist_diff))
            #     robot.tmpCount = 0

            if dist_diff > RobotConfiguration.DIST_THRESHOLD or abs(angle_diff) > math.pi / 2.0:  # 주행 도중 일정 이상 틀어지면 정지 후 재조정
                robot.speed.linear.x = 0.0
                robot.speed.angular.z = 0.0
                robot.forward = False
            else:
                robot.speed.linear.x = robot.velocity
                robot.speed.angular.z = 0.0

        else:  # 회전
            if angle_diff > RobotConfiguration.ANGLE_THRESHOLD:
                robot.speed.linear.x = 0.0
                robot.speed.angular.z = - np.min([1.0, abs(angle_diff) * 5])
                robot.twistCount = 0
            elif angle_diff < - RobotConfiguration.ANGLE_THRESHOLD:
                robot.speed.linear.x = 0.0
                robot.speed.angular.z = np.min([1.0, abs(angle_diff) * 5])
                robot.twistCount = 0
            elif robot.twistCount < RobotConfiguration.TWIST_MAX_COUNT:
                robot.speed.linear.x = 0.0
                robot.speed.angular.z = 0.0
                robot.twistCount = robot.twistCount + 1
            else:
                robot.forward = True
    else:
        robot.speed.linear.x = 0.0
        robot.speed.angular.z = 0.0
        robot.forward = False
        isFinished = True

    robot.speedPublisher.publish(robot.speed)

    return isFinished


def moveBackToNode(robot):
    isFinished = False
    goal = robot.goal

    if not checkPos(robot.goal, robot.pos, RobotConfiguration.DIST_THRESHOLD):
        diff_x = robot.goal[0] - robot.pos[0]
        diff_y = robot.goal[2] - robot.pos[2]
        angle_to_goal = math.atan2(diff_y, diff_x)
        if angle_to_goal > 0:
            angle_to_goal = angle_to_goal - math.pi
        else:
            angle_to_goal = angle_to_goal + math.pi

        angle_diff = robot.theta - angle_to_goal
        if angle_diff > math.pi:
            angle_diff = angle_diff - 2.0 * math.pi
        elif angle_diff < -math.pi:
            angle_diff = angle_diff + 2.0 * math.pi

        if robot.forward:
            dist_to_goal = math.sqrt(diff_x ** 2.0 + diff_y ** 2.0)
            dist_diff = dist_to_goal * math.sin(angle_diff / 2.0)
            if dist_diff > RobotConfiguration.DIST_THRESHOLD or angle_diff > math.pi / 2.0:  # 주행 도중 일정 이상 틀어지면 정지 후 재조정
                robot.speed.linear.x = 0.0
                robot.speed.angular.z = 0.0
                robot.forward = False
            else:
                robot.speed.linear.x = -robot.velocity
                robot.speed.angular.z = 0.0

        else:  # 회전
            if angle_diff > RobotConfiguration.ANGLE_THRESHOLD:
                robot.speed.linear.x = 0.0
                robot.speed.angular.z = - np.min([1.0, abs(angle_diff) * 5])
                robot.twistCount = 0
            elif angle_diff < - RobotConfiguration.ANGLE_THRESHOLD:
                robot.speed.linear.x = 0.0
                robot.speed.angular.z = np.min([1.0, abs(angle_diff) * 5])
                robot.twistCount = 0
            elif robot.twistCount < RobotConfiguration.TWIST_MAX_COUNT:
                robot.speed.linear.x = 0.0
                robot.speed.angular.z = - angle_diff * 5
                robot.twistCount = robot.twistCount + 1
            else:
                robot.forward = True
    else:
        robot.speed.linear.x = 0.0
        robot.speed.angular.z = 0.0
        robot.forward = False
        isFinished = True

    robot.speedPublisher.publish(robot.speed)

    return isFinished


def stopMove(robot):
    robot.speed.linear.x = 0.0
    robot.speed.angular.z = 0.0
    robot.forward = False
    robot.speedPublisher.publish(robot.speed)


def handleLoad(robot):
    robot.joint.name = ['lift_joint']
    jointValue = robot.joint.position[0]

    if isinstance(robot.service, LoadService):
        if jointValue > 0.2:
            return True
        else:
            jointValue += RobotConfiguration.LIFT_VALUE
    elif isinstance(robot.service, UnloadService):
        if jointValue < 0:
            return True
        else:
            jointValue -= RobotConfiguration.LIFT_VALUE
    else:
        raise Exception("unexpected service in handleLoad")

    robot.joint.position = np.array([jointValue])
    robot.jointPublisher.publish(robot.joint)
    return False
