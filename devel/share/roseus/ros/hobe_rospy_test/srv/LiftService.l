;; Auto-generated. Do not edit!


(when (boundp 'hobe_rospy_test::LiftService)
  (if (not (find-package "HOBE_ROSPY_TEST"))
    (make-package "HOBE_ROSPY_TEST"))
  (shadow 'LiftService (find-package "HOBE_ROSPY_TEST")))
(unless (find-package "HOBE_ROSPY_TEST::LIFTSERVICE")
  (make-package "HOBE_ROSPY_TEST::LIFTSERVICE"))
(unless (find-package "HOBE_ROSPY_TEST::LIFTSERVICEREQUEST")
  (make-package "HOBE_ROSPY_TEST::LIFTSERVICEREQUEST"))
(unless (find-package "HOBE_ROSPY_TEST::LIFTSERVICERESPONSE")
  (make-package "HOBE_ROSPY_TEST::LIFTSERVICERESPONSE"))

(in-package "ROS")





(defclass hobe_rospy_test::LiftServiceRequest
  :super ros::object
  :slots (_robotName _target_value _order ))

(defmethod hobe_rospy_test::LiftServiceRequest
  (:init
   (&key
    ((:robotName __robotName) "")
    ((:target_value __target_value) 0.0)
    ((:order __order) "")
    )
   (send-super :init)
   (setq _robotName (string __robotName))
   (setq _target_value (float __target_value))
   (setq _order (string __order))
   self)
  (:robotName
   (&optional __robotName)
   (if __robotName (setq _robotName __robotName)) _robotName)
  (:target_value
   (&optional __target_value)
   (if __target_value (setq _target_value __target_value)) _target_value)
  (:order
   (&optional __order)
   (if __order (setq _order __order)) _order)
  (:serialization-length
   ()
   (+
    ;; string _robotName
    4 (length _robotName)
    ;; float32 _target_value
    4
    ;; string _order
    4 (length _order)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _robotName
       (write-long (length _robotName) s) (princ _robotName s)
     ;; float32 _target_value
       (sys::poke _target_value (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _order
       (write-long (length _order) s) (princ _order s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _robotName
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robotName (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _target_value
     (setq _target_value (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _order
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _order (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass hobe_rospy_test::LiftServiceResponse
  :super ros::object
  :slots (_success ))

(defmethod hobe_rospy_test::LiftServiceResponse
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

(defclass hobe_rospy_test::LiftService
  :super ros::object
  :slots ())

(setf (get hobe_rospy_test::LiftService :md5sum-) "51f32333f2c561d5ba412282aada3d3f")
(setf (get hobe_rospy_test::LiftService :datatype-) "hobe_rospy_test/LiftService")
(setf (get hobe_rospy_test::LiftService :request) hobe_rospy_test::LiftServiceRequest)
(setf (get hobe_rospy_test::LiftService :response) hobe_rospy_test::LiftServiceResponse)

(defmethod hobe_rospy_test::LiftServiceRequest
  (:response () (instance hobe_rospy_test::LiftServiceResponse :init)))

(setf (get hobe_rospy_test::LiftServiceRequest :md5sum-) "51f32333f2c561d5ba412282aada3d3f")
(setf (get hobe_rospy_test::LiftServiceRequest :datatype-) "hobe_rospy_test/LiftServiceRequest")
(setf (get hobe_rospy_test::LiftServiceRequest :definition-)
      "string robotName
float32 target_value
string order
---
bool success

")

(setf (get hobe_rospy_test::LiftServiceResponse :md5sum-) "51f32333f2c561d5ba412282aada3d3f")
(setf (get hobe_rospy_test::LiftServiceResponse :datatype-) "hobe_rospy_test/LiftServiceResponse")
(setf (get hobe_rospy_test::LiftServiceResponse :definition-)
      "string robotName
float32 target_value
string order
---
bool success

")



(provide :hobe_rospy_test/LiftService "51f32333f2c561d5ba412282aada3d3f")


