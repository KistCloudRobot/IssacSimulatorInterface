;; Auto-generated. Do not edit!


(when (boundp 'hobe_rospy_test::ServiceResult)
  (if (not (find-package "HOBE_ROSPY_TEST"))
    (make-package "HOBE_ROSPY_TEST"))
  (shadow 'ServiceResult (find-package "HOBE_ROSPY_TEST")))
(unless (find-package "HOBE_ROSPY_TEST::SERVICERESULT")
  (make-package "HOBE_ROSPY_TEST::SERVICERESULT"))

(in-package "ROS")
;;//! \htmlinclude ServiceResult.msg.html


(defclass hobe_rospy_test::ServiceResult
  :super ros::object
  :slots (_actionID _result ))

(defmethod hobe_rospy_test::ServiceResult
  (:init
   (&key
    ((:actionID __actionID) "")
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _actionID (string __actionID))
   (setq _result (round __result))
   self)
  (:actionID
   (&optional __actionID)
   (if __actionID (setq _actionID __actionID)) _actionID)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; string _actionID
    4 (length _actionID)
    ;; int64 _result
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _actionID
       (write-long (length _actionID) s) (princ _actionID s)
     ;; int64 _result
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _result (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _result) (= (length (_result . bv)) 2)) ;; bignum
              (write-long (ash (elt (_result . bv) 0) 0) s)
              (write-long (ash (elt (_result . bv) 1) -1) s))
             ((and (class _result) (= (length (_result . bv)) 1)) ;; big1
              (write-long (elt (_result . bv) 0) s)
              (write-long (if (>= _result 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _result s)(write-long (if (>= _result 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _actionID
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _actionID (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _result
#+(or :alpha :irix6 :x86_64)
      (setf _result (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _result (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get hobe_rospy_test::ServiceResult :md5sum-) "23d42b5d30cbaa2e42e14af29c42ba01")
(setf (get hobe_rospy_test::ServiceResult :datatype-) "hobe_rospy_test/ServiceResult")
(setf (get hobe_rospy_test::ServiceResult :definition-)
      "string actionID
int64 result

")



(provide :hobe_rospy_test/ServiceResult "23d42b5d30cbaa2e42e14af29c42ba01")


