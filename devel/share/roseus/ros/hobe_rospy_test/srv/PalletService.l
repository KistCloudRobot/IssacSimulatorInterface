;; Auto-generated. Do not edit!


(when (boundp 'hobe_rospy_test::PalletService)
  (if (not (find-package "HOBE_ROSPY_TEST"))
    (make-package "HOBE_ROSPY_TEST"))
  (shadow 'PalletService (find-package "HOBE_ROSPY_TEST")))
(unless (find-package "HOBE_ROSPY_TEST::PALLETSERVICE")
  (make-package "HOBE_ROSPY_TEST::PALLETSERVICE"))
(unless (find-package "HOBE_ROSPY_TEST::PALLETSERVICEREQUEST")
  (make-package "HOBE_ROSPY_TEST::PALLETSERVICEREQUEST"))
(unless (find-package "HOBE_ROSPY_TEST::PALLETSERVICERESPONSE")
  (make-package "HOBE_ROSPY_TEST::PALLETSERVICERESPONSE"))

(in-package "ROS")





(defclass hobe_rospy_test::PalletServiceRequest
  :super ros::object
  :slots (_action _palletizer _robot _node ))

(defmethod hobe_rospy_test::PalletServiceRequest
  (:init
   (&key
    ((:action __action) "")
    ((:palletizer __palletizer) "")
    ((:robot __robot) "")
    ((:node __node) "")
    )
   (send-super :init)
   (setq _action (string __action))
   (setq _palletizer (string __palletizer))
   (setq _robot (string __robot))
   (setq _node (string __node))
   self)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:palletizer
   (&optional __palletizer)
   (if __palletizer (setq _palletizer __palletizer)) _palletizer)
  (:robot
   (&optional __robot)
   (if __robot (setq _robot __robot)) _robot)
  (:node
   (&optional __node)
   (if __node (setq _node __node)) _node)
  (:serialization-length
   ()
   (+
    ;; string _action
    4 (length _action)
    ;; string _palletizer
    4 (length _palletizer)
    ;; string _robot
    4 (length _robot)
    ;; string _node
    4 (length _node)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _action
       (write-long (length _action) s) (princ _action s)
     ;; string _palletizer
       (write-long (length _palletizer) s) (princ _palletizer s)
     ;; string _robot
       (write-long (length _robot) s) (princ _robot s)
     ;; string _node
       (write-long (length _node) s) (princ _node s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _action
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _palletizer
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _palletizer (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _robot
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _node
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _node (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass hobe_rospy_test::PalletServiceResponse
  :super ros::object
  :slots (_result ))

(defmethod hobe_rospy_test::PalletServiceResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional (__result :null))
   (if (not (eq __result :null)) (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass hobe_rospy_test::PalletService
  :super ros::object
  :slots ())

(setf (get hobe_rospy_test::PalletService :md5sum-) "1b1aad6e6b75c669e52bd93dbc857957")
(setf (get hobe_rospy_test::PalletService :datatype-) "hobe_rospy_test/PalletService")
(setf (get hobe_rospy_test::PalletService :request) hobe_rospy_test::PalletServiceRequest)
(setf (get hobe_rospy_test::PalletService :response) hobe_rospy_test::PalletServiceResponse)

(defmethod hobe_rospy_test::PalletServiceRequest
  (:response () (instance hobe_rospy_test::PalletServiceResponse :init)))

(setf (get hobe_rospy_test::PalletServiceRequest :md5sum-) "1b1aad6e6b75c669e52bd93dbc857957")
(setf (get hobe_rospy_test::PalletServiceRequest :datatype-) "hobe_rospy_test/PalletServiceRequest")
(setf (get hobe_rospy_test::PalletServiceRequest :definition-)
      "string action
string palletizer
string robot
string node
---
bool result

")

(setf (get hobe_rospy_test::PalletServiceResponse :md5sum-) "1b1aad6e6b75c669e52bd93dbc857957")
(setf (get hobe_rospy_test::PalletServiceResponse :datatype-) "hobe_rospy_test/PalletServiceResponse")
(setf (get hobe_rospy_test::PalletServiceResponse :definition-)
      "string action
string palletizer
string robot
string node
---
bool result

")



(provide :hobe_rospy_test/PalletService "1b1aad6e6b75c669e52bd93dbc857957")


