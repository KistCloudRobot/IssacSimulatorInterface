;; Auto-generated. Do not edit!


(when (boundp 'hobe_rospy_test::PalletizerPackingFinish)
  (if (not (find-package "HOBE_ROSPY_TEST"))
    (make-package "HOBE_ROSPY_TEST"))
  (shadow 'PalletizerPackingFinish (find-package "HOBE_ROSPY_TEST")))
(unless (find-package "HOBE_ROSPY_TEST::PALLETIZERPACKINGFINISH")
  (make-package "HOBE_ROSPY_TEST::PALLETIZERPACKINGFINISH"))

(in-package "ROS")
;;//! \htmlinclude PalletizerPackingFinish.msg.html


(defclass hobe_rospy_test::PalletizerPackingFinish
  :super ros::object
  :slots (_palletizer _node ))

(defmethod hobe_rospy_test::PalletizerPackingFinish
  (:init
   (&key
    ((:palletizer __palletizer) "")
    ((:node __node) "")
    )
   (send-super :init)
   (setq _palletizer (string __palletizer))
   (setq _node (string __node))
   self)
  (:palletizer
   (&optional __palletizer)
   (if __palletizer (setq _palletizer __palletizer)) _palletizer)
  (:node
   (&optional __node)
   (if __node (setq _node __node)) _node)
  (:serialization-length
   ()
   (+
    ;; string _palletizer
    4 (length _palletizer)
    ;; string _node
    4 (length _node)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _palletizer
       (write-long (length _palletizer) s) (princ _palletizer s)
     ;; string _node
       (write-long (length _node) s) (princ _node s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _palletizer
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _palletizer (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _node
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _node (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get hobe_rospy_test::PalletizerPackingFinish :md5sum-) "70cfe6a8687ee2fd71c9e786e3742f96")
(setf (get hobe_rospy_test::PalletizerPackingFinish :datatype-) "hobe_rospy_test/PalletizerPackingFinish")
(setf (get hobe_rospy_test::PalletizerPackingFinish :definition-)
      "string palletizer
string node

")



(provide :hobe_rospy_test/PalletizerPackingFinish "70cfe6a8687ee2fd71c9e786e3742f96")


