#!/usr/bin/env python3

# Isaac 환경 내 RosPoseTree로 설정한 Object의 translation, rotation 정보를 ros topic : /object_list_to_CM 으로 보냄
# (나중에 Context Listener에서 해당 topic 받기) 
import rospy
import tf2_msgs.msg
from geometry_msgs.msg import TransformStamped
import numpy as np
import time
from hobe_rospy_test.msg import Object,Objects

object_list = ['postBox','pallet']
# testPub = rospy.Publisher('object_to_CM', Object, queue_size=10)
testPub2 = rospy.Publisher('object_list_to_CM', Objects, queue_size=10)

def callback_Hobe(msgs):
    # print(args)
    object_total_num = len(msgs.transforms)
    object_list_ = Objects()
    object_list_.start_time = rospy.Time.now()

    data_s = list()
    for object_idx in range(object_total_num):
        o = Object()
        o.start_time = rospy.Time.now()
        
        object_info = msgs.transforms[object_idx]
        if object_info.child_frame_id.split('_')[0] in object_list:
            
            x = object_info.transform.translation.x
            y = object_info.transform.translation.y
            z = object_info.transform.translation.z
            r_x = object_info.transform.rotation.x
            r_y = object_info.transform.rotation.y
            r_z = object_info.transform.rotation.z

            o.name = object_info.child_frame_id
            o.data = [x,y,z,r_x,r_y,r_z]
            data_s.append(o)

    object_list_.objects = data_s
    # testPub.publish(o)
    testPub2.publish(object_list_)

if __name__=="__main__":
    print('start')
    rospy.init_node("test_rosbridge")
    print(Object)
    rospy.Subscriber("/object_info",tf2_msgs.msg.TFMessage, callback_Hobe)
    
    
    rospy.spin()
