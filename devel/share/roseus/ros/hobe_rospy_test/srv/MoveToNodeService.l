;; Auto-generated. Do not edit!


(when (boundp 'hobe_rospy_test::MoveToNodeService)
  (if (not (find-package "HOBE_ROSPY_TEST"))
    (make-package "HOBE_ROSPY_TEST"))
  (shadow 'MoveToNodeService (find-package "HOBE_ROSPY_TEST")))
(unless (find-package "HOBE_ROSPY_TEST::MOVETONODESERVICE")
  (make-package "HOBE_ROSPY_TEST::MOVETONODESERVICE"))
(unless (find-package "HOBE_ROSPY_TEST::MOVETONODESERVICEREQUEST")
  (make-package "HOBE_ROSPY_TEST::MOVETONODESERVICEREQUEST"))
(unless (find-package "HOBE_ROSPY_TEST::MOVETONODESERVICERESPONSE")
  (make-package "HOBE_ROSPY_TEST::MOVETONODESERVICERESPONSE"))

(in-package "ROS")





(defclass hobe_rospy_test::MoveToNodeServiceRequest
  :super ros::object
  :slots (_robotName _node _action _velocity ))

(defmethod hobe_rospy_test::MoveToNodeServiceRequest
  (:init
   (&key
    ((:robotName __robotName) "")
    ((:node __node) 0)
    ((:action __action) "")
    ((:velocity __velocity) 0.0)
    )
   (send-super :init)
   (setq _robotName (string __robotName))
   (setq _node (round __node))
   (setq _action (string __action))
   (setq _velocity (float __velocity))
   self)
  (:robotName
   (&optional __robotName)
   (if __robotName (setq _robotName __robotName)) _robotName)
  (:node
   (&optional __node)
   (if __node (setq _node __node)) _node)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:serialization-length
   ()
   (+
    ;; string _robotName
    4 (length _robotName)
    ;; int32 _node
    4
    ;; string _action
    4 (length _action)
    ;; float64 _velocity
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _robotName
       (write-long (length _robotName) s) (princ _robotName s)
     ;; int32 _node
       (write-long _node s)
     ;; string _action
       (write-long (length _action) s) (princ _action s)
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _robotName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robotName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _node
     (setq _node (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _action
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass hobe_rospy_test::MoveToNodeServiceResponse
  :super ros::object
  :slots (_success _status ))

(defmethod hobe_rospy_test::MoveToNodeServiceResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:status __status) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _status (string __status))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _status
    4 (length _status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _status
       (write-long (length _status) s) (princ _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass hobe_rospy_test::MoveToNodeService
  :super ros::object
  :slots ())

(setf (get hobe_rospy_test::MoveToNodeService :md5sum-) "a6ad41fdec29b72af81f7f2cff62510b")
(setf (get hobe_rospy_test::MoveToNodeService :datatype-) "hobe_rospy_test/MoveToNodeService")
(setf (get hobe_rospy_test::MoveToNodeService :request) hobe_rospy_test::MoveToNodeServiceRequest)
(setf (get hobe_rospy_test::MoveToNodeService :response) hobe_rospy_test::MoveToNodeServiceResponse)

(defmethod hobe_rospy_test::MoveToNodeServiceRequest
  (:response () (instance hobe_rospy_test::MoveToNodeServiceResponse :init)))

(setf (get hobe_rospy_test::MoveToNodeServiceRequest :md5sum-) "a6ad41fdec29b72af81f7f2cff62510b")
(setf (get hobe_rospy_test::MoveToNodeServiceRequest :datatype-) "hobe_rospy_test/MoveToNodeServiceRequest")
(setf (get hobe_rospy_test::MoveToNodeServiceRequest :definition-)
      "string robotName
int32 node
string action
float64 velocity
---
bool success
string status

")

(setf (get hobe_rospy_test::MoveToNodeServiceResponse :md5sum-) "a6ad41fdec29b72af81f7f2cff62510b")
(setf (get hobe_rospy_test::MoveToNodeServiceResponse :datatype-) "hobe_rospy_test/MoveToNodeServiceResponse")
(setf (get hobe_rospy_test::MoveToNodeServiceResponse :definition-)
      "string robotName
int32 node
string action
float64 velocity
---
bool success
string status

")



(provide :hobe_rospy_test/MoveToNodeService "a6ad41fdec29b72af81f7f2cff62510b")


