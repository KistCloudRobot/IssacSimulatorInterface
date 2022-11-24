; Auto-generated. Do not edit!


(cl:in-package hobe_rospy_test-msg)


;//! \htmlinclude ServiceResult.msg.html

(cl:defclass <ServiceResult> (roslisp-msg-protocol:ros-message)
  ((actionID
    :reader actionID
    :initarg :actionID
    :type cl:string
    :initform "")
   (result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass ServiceResult (<ServiceResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ServiceResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ServiceResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hobe_rospy_test-msg:<ServiceResult> is deprecated: use hobe_rospy_test-msg:ServiceResult instead.")))

(cl:ensure-generic-function 'actionID-val :lambda-list '(m))
(cl:defmethod actionID-val ((m <ServiceResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-msg:actionID-val is deprecated.  Use hobe_rospy_test-msg:actionID instead.")
  (actionID m))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <ServiceResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-msg:result-val is deprecated.  Use hobe_rospy_test-msg:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ServiceResult>) ostream)
  "Serializes a message object of type '<ServiceResult>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'actionID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'actionID))
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ServiceResult>) istream)
  "Deserializes a message object of type '<ServiceResult>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'actionID) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'actionID) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ServiceResult>)))
  "Returns string type for a message object of type '<ServiceResult>"
  "hobe_rospy_test/ServiceResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ServiceResult)))
  "Returns string type for a message object of type 'ServiceResult"
  "hobe_rospy_test/ServiceResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ServiceResult>)))
  "Returns md5sum for a message object of type '<ServiceResult>"
  "23d42b5d30cbaa2e42e14af29c42ba01")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ServiceResult)))
  "Returns md5sum for a message object of type 'ServiceResult"
  "23d42b5d30cbaa2e42e14af29c42ba01")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ServiceResult>)))
  "Returns full string definition for message of type '<ServiceResult>"
  (cl:format cl:nil "string actionID~%int64 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ServiceResult)))
  "Returns full string definition for message of type 'ServiceResult"
  (cl:format cl:nil "string actionID~%int64 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ServiceResult>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'actionID))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ServiceResult>))
  "Converts a ROS message object to a list"
  (cl:list 'ServiceResult
    (cl:cons ':actionID (actionID msg))
    (cl:cons ':result (result msg))
))
