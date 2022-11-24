;; Auto-generated. Do not edit!


(when (boundp 'hobe_rospy_test::MoveBackService)
  (if (not (find-package "HOBE_ROSPY_TEST"))
    (make-package "HOBE_ROSPY_TEST"))
  (shadow 'MoveBackService (find-package "HOBE_ROSPY_TEST")))
(unless (find-package "HOBE_ROSPY_TEST::MOVEBACKSERVICE")
  (make-package "HOBE_ROSPY_TEST::MOVEBACKSERVICE"))
(unless (find-package "HOBE_ROSPY_TEST::MOVEBACKSERVICEREQUEST")
  (make-package "HOBE_ROSPY_TEST::MOVEBACKSERVICEREQUEST"))
(unless (find-package "HOBE_ROSPY_TEST::MOVEBACKSERVICERESPONSE")
  (make-package "HOBE_ROSPY_TEST::MOVEBACKSERVICERESPONSE"))

(in-package "ROS")





(defclass hobe_rospy_test::MoveBackServiceRequest
  :super ros::object
  :slots (_robotName _node_num ))

(defmethod hobe_rospy_test::MoveBackServiceRequest
  (:init
   (&key
    ((:robotName __robotName) "")
    ((:node_num __node_num) "")
    )
   (send-super :init)
   (setq _robotName (string __robotName))
   (setq _node_num (string __node_num))
   self)
  (:robotName
   (&optional __robotName)
   (if __robotName (setq _robotName __robotName)) _robotName)
  (:node_num
   (&optional __node_num)
   (if __node_num (setq _node_num __node_num)) _node_num)
  (:serialization-length
   ()
   (+
    ;; string _robotName
    4 (length _robotName)
    ;; string _node_num
    4 (length _node_num)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _robotName
       (write-long (length _robotName) s) (princ _robotName s)
     ;; string _node_num
       (write-long (length _node_num) s) (princ _node_num s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _robotName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robotName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _node_num
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _node_num (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass hobe_rospy_test::MoveBackServiceResponse
  :super ros::object
  :slots (_success ))

(defmethod hobe_rospy_test::MoveBackServiceResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass hobe_rospy_test::MoveBackService
  :super ros::object
  :slots ())

(setf (get hobe_rospy_test::MoveBackService :md5sum-) "e7b883f3f3085a2a026775cc770f647f")
(setf (get hobe_rospy_test::MoveBackService :datatype-) "hobe_rospy_test/MoveBackService")
(setf (get hobe_rospy_test::MoveBackService :request) hobe_rospy_test::MoveBackServiceRequest)
(setf (get hobe_rospy_test::MoveBackService :response) hobe_rospy_test::MoveBackServiceResponse)

(defmethod hobe_rospy_test::MoveBackServiceRequest
  (:response () (instance hobe_rospy_test::MoveBackServiceResponse :init)))

(setf (get hobe_rospy_test::MoveBackServiceRequest :md5sum-) "e7b883f3f3085a2a026775cc770f647f")
(setf (get hobe_rospy_test::MoveBackServiceRequest :datatype-) "hobe_rospy_test/MoveBackServiceRequest")
(setf (get hobe_rospy_test::MoveBackServiceRequest :definition-)
      "string robotName
string node_num
---
bool success

")

(setf (get hobe_rospy_test::MoveBackServiceResponse :md5sum-) "e7b883f3f3085a2a026775cc770f647f")
(setf (get hobe_rospy_test::MoveBackServiceResponse :datatype-) "hobe_rospy_test/MoveBackServiceResponse")
(setf (get hobe_rospy_test::MoveBackServiceResponse :definition-)
      "string robotName
string node_num
---
bool success

")



(provide :hobe_rospy_test/MoveBackService "e7b883f3f3085a2a026775cc770f647f")


