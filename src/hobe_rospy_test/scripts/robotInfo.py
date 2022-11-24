
class RobotInfo():
    # I'm Transport Robot

    def __init__(self,robotName,pos,liftJoint,euler_theta):
        self.robotName = robotName
        self.pos_x = pos[0]
        self.pos_y = pos[1] 
        self.jointPos = liftJoint
        self.theta = euler_theta
        self.prior_theta = 0.0
        self.prior_x = 0.0
        self.prior_y = 0.0
        self.goal_x = 0.0
        self.goal_y = 0.0
        self.post_goal_x = 0.0
        self.post_goal_y = 0.0
        self.threshold = 0.3
        self.velocity = 6        
        self.forward_flag = False
        self.prior_flag = False
        self.theta_flag = False
        self.backward_flag = False
        self.status = 'NONE'
        self.backward_degree = 3
        self.prior_theta_flag = False
    def setStatus(self,status):
        self.status = status
    def setPriorTheta(self,prior_theta):
        self.prior_theta = prior_theta
    def setPriorTheta_flag(self,flag):
        self.prior_theta_flag = flag
    def getStatus(self):
        return self.status
    def getInfo(self):
        return (self.robotName,self.pos,self.jointPos,self.theta)

    def getNewGoal(self,goal_x,goal_y,threshold):
        print('self.prior_x :',self.prior_x)
        print('self.prior_y :',self.prior_y)
        print('self.goal_x :',self.goal_x)
        print('self.goal_y :',self.goal_y)
            # global backward_flag
        rGoal_x = 0.0
        rGoal_y = 0.0
        if goal_x > self.prior_x:
            rGoal_x = goal_x + threshold
            rGoal_y = goal_y
        elif goal_x < self.prior_x :
            rGoal_x = goal_x - threshold
            rGoal_y = goal_y

        if goal_y > self.prior_y :
            rGoal_x = goal_x
            rGoal_y = goal_y + threshold
        elif goal_y < self.prior_y :
            rGoal_x = goal_x
            rGoal_y = goal_y - threshold

        return (rGoal_x,rGoal_y)

    def check_pos(self,goal_pos,current_pos,threshold):
        pos_x = current_pos[0] #base_pos[0]
        pos_y = current_pos[1] #base_pos[1]
        goal_x = goal_pos[0]
        goal_y = goal_pos[1]
        print('CHECK ==')
        print('pos : {} , {}\n goal :{} , {}'.format(pos_x, pos_y, goal_x, goal_y))
        if abs(pos_x - goal_x) <= threshold and abs(pos_y - goal_y) <= threshold:
            return True
        return False

    def test():
        return "zzzz"
    
    def setPos(self,pos_x,pos_y):
        self.pos_x = pos_x
        self.pos_y = pos_y
        
    
    def getPos(self):

        return (self.pos_x,self.pos_y)

    def setGoalPos(self,pos_x,pos_y):
        self.goal_x = pos_x
        self.goal_y = pos_y

    def setJointPos(self,pos):
        self.jointPos = pos

    def getJointPos(self):
        return self.jointPos

    def setTheta(self,euler_theta):
        self.theta = euler_theta

    def getTheta(self):
        return self.theta

    def setPrior_flag(self,flag):
        self.prior_flag = flag

    def setPrior_goal(self,x,y):
        #prior_robot_goalPos
        self.prior_x = x
        self.prior_y = y
    
    def setForward_flag(self,flag):
        self.forward_flag = flag
    def setBackward_flag(self,flag):
        self.backward_flag = flag

    def setTheta_flag(self,flag):
        self.theta_flag = flag
