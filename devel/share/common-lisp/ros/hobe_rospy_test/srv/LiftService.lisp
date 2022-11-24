; Auto-generated. Do not edit!


(cl:in-package hobe_rospy_test-srv)


;//! \htmlinclude LiftService-request.msg.html

(cl:defclass <LiftService-request> (roslisp-msg-protocol:ros-message)
  ((robotName
    :reader robotName
    :initarg :robotName
    :type cl:string
    :initform "")
   (target_value
    :reader target_value
    :initarg :target_value
    :type cl:float
    :initform 0.0)
   (order
    :reader order
    :initarg :order
    :type cl:string
    :initform ""))
)

(cl:defclass LiftService-request (<LiftService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LiftService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LiftService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hobe_rospy_test-srv:<LiftService-request> is deprecated: use hobe_rospy_test-srv:LiftService-request instead.")))

(cl:ensure-generic-function 'robotName-val :lambda-list '(m))
(cl:defmethod robotName-val ((m <LiftService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:robotName-val is deprecated.  Use hobe_rospy_test-srv:robotName instead.")
  (robotName m))

(cl:ensure-generic-function 'target_value-val :lambda-list '(m))
(cl:defmethod target_value-val ((m <LiftService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:target_value-val is deprecated.  Use hobe_rospy_test-srv:target_value instead.")
  (target_value m))

(cl:ensure-generic-function 'order-val :lambda-list '(m))
(cl:defmethod order-val ((m <LiftService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:order-val is deprecated.  Use hobe_rospy_test-srv:order instead.")
  (order m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LiftService-request>) ostream)
  "Serializes a message object of type '<LiftService-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robotName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robotName))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'target_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'order))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'order))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LiftService-request>) istream)
  "Deserializes a message object of type '<LiftService-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robotName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robotName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_value) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'order) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'order) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LiftService-request>)))
  "Returns string type for a service object of type '<LiftService-request>"
  "hobe_rospy_test/LiftServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LiftService-request)))
  "Returns string type for a service object of type 'LiftService-request"
  "hobe_rospy_test/LiftServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LiftService-request>)))
  "Returns md5sum for a message object of type '<LiftService-request>"
  "51f32333f2c561d5ba412282aada3d3f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LiftService-request)))
  "Returns md5sum for a message object of type 'LiftService-request"
  "51f32333f2c561d5ba412282aada3d3f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LiftService-request>)))
  "Returns full string definition for message of type '<LiftService-request>"
  (cl:format cl:nil "string robotName~%float32 target_value~%string order~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LiftService-request)))
  "Returns full string definition for message of type 'LiftService-request"
  (cl:format cl:nil "string robotName~%float32 target_value~%string order~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LiftService-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'robotName))
     4
     4 (cl:length (cl:slot-value msg 'order))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LiftService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LiftService-request
    (cl:cons ':robotName (robotName msg))
    (cl:cons ':target_value (target_value msg))
    (cl:cons ':order (order msg))
))
;//! \htmlinclude LiftService-response.msg.html

(cl:defclass <LiftService-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LiftService-response (<LiftService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LiftService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LiftService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hobe_rospy_test-srv:<LiftService-response> is deprecated: use hobe_rospy_test-srv:LiftService-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <LiftService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:success-val is deprecated.  Use hobe_rospy_test-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LiftService-response>) ostream)
  "Serializes a message object of type '<LiftService-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LiftService-response>) istream)
  "Deserializes a message object of type '<LiftService-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LiftService-response>)))
  "Returns string type for a service object of type '<LiftService-response>"
  "hobe_rospy_test/LiftServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LiftService-response)))
  "Returns string type for a service object of type 'LiftService-response"
  "hobe_rospy_test/LiftServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LiftService-response>)))
  "Returns md5sum for a message object of type '<LiftService-response>"
  "51f32333f2c561d5ba412282aada3d3f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LiftService-response)))
  "Returns md5sum for a message object of type 'LiftService-response"
  "51f32333f2c561d5ba412282aada3d3f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LiftService-response>)))
  "Returns full string definition for message of type '<LiftService-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LiftService-response)))
  "Returns full string definition for message of type 'LiftService-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LiftService-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LiftService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LiftService-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LiftService)))
  'LiftService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LiftService)))
  'LiftService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LiftService)))
  "Returns string type for a service object of type '<LiftService>"
  "hobe_rospy_test/LiftService")