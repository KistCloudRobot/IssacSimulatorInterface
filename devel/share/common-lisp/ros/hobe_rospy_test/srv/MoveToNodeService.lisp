; Auto-generated. Do not edit!


(cl:in-package hobe_rospy_test-srv)


;//! \htmlinclude MoveToNodeService-request.msg.html

(cl:defclass <MoveToNodeService-request> (roslisp-msg-protocol:ros-message)
  ((robotName
    :reader robotName
    :initarg :robotName
    :type cl:string
    :initform "")
   (node
    :reader node
    :initarg :node
    :type cl:integer
    :initform 0)
   (action
    :reader action
    :initarg :action
    :type cl:string
    :initform "")
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:float
    :initform 0.0))
)

(cl:defclass MoveToNodeService-request (<MoveToNodeService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToNodeService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToNodeService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hobe_rospy_test-srv:<MoveToNodeService-request> is deprecated: use hobe_rospy_test-srv:MoveToNodeService-request instead.")))

(cl:ensure-generic-function 'robotName-val :lambda-list '(m))
(cl:defmethod robotName-val ((m <MoveToNodeService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:robotName-val is deprecated.  Use hobe_rospy_test-srv:robotName instead.")
  (robotName m))

(cl:ensure-generic-function 'node-val :lambda-list '(m))
(cl:defmethod node-val ((m <MoveToNodeService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:node-val is deprecated.  Use hobe_rospy_test-srv:node instead.")
  (node m))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <MoveToNodeService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:action-val is deprecated.  Use hobe_rospy_test-srv:action instead.")
  (action m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <MoveToNodeService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:velocity-val is deprecated.  Use hobe_rospy_test-srv:velocity instead.")
  (velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToNodeService-request>) ostream)
  "Serializes a message object of type '<MoveToNodeService-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robotName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robotName))
  (cl:let* ((signed (cl:slot-value msg 'node)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToNodeService-request>) istream)
  "Deserializes a message object of type '<MoveToNodeService-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robotName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robotName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'node) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToNodeService-request>)))
  "Returns string type for a service object of type '<MoveToNodeService-request>"
  "hobe_rospy_test/MoveToNodeServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToNodeService-request)))
  "Returns string type for a service object of type 'MoveToNodeService-request"
  "hobe_rospy_test/MoveToNodeServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToNodeService-request>)))
  "Returns md5sum for a message object of type '<MoveToNodeService-request>"
  "a6ad41fdec29b72af81f7f2cff62510b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToNodeService-request)))
  "Returns md5sum for a message object of type 'MoveToNodeService-request"
  "a6ad41fdec29b72af81f7f2cff62510b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToNodeService-request>)))
  "Returns full string definition for message of type '<MoveToNodeService-request>"
  (cl:format cl:nil "string robotName~%int32 node~%string action~%float64 velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToNodeService-request)))
  "Returns full string definition for message of type 'MoveToNodeService-request"
  (cl:format cl:nil "string robotName~%int32 node~%string action~%float64 velocity~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToNodeService-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'robotName))
     4
     4 (cl:length (cl:slot-value msg 'action))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToNodeService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToNodeService-request
    (cl:cons ':robotName (robotName msg))
    (cl:cons ':node (node msg))
    (cl:cons ':action (action msg))
    (cl:cons ':velocity (velocity msg))
))
;//! \htmlinclude MoveToNodeService-response.msg.html

(cl:defclass <MoveToNodeService-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (status
    :reader status
    :initarg :status
    :type cl:string
    :initform ""))
)

(cl:defclass MoveToNodeService-response (<MoveToNodeService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToNodeService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToNodeService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hobe_rospy_test-srv:<MoveToNodeService-response> is deprecated: use hobe_rospy_test-srv:MoveToNodeService-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MoveToNodeService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:success-val is deprecated.  Use hobe_rospy_test-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <MoveToNodeService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:status-val is deprecated.  Use hobe_rospy_test-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToNodeService-response>) ostream)
  "Serializes a message object of type '<MoveToNodeService-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToNodeService-response>) istream)
  "Deserializes a message object of type '<MoveToNodeService-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToNodeService-response>)))
  "Returns string type for a service object of type '<MoveToNodeService-response>"
  "hobe_rospy_test/MoveToNodeServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToNodeService-response)))
  "Returns string type for a service object of type 'MoveToNodeService-response"
  "hobe_rospy_test/MoveToNodeServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToNodeService-response>)))
  "Returns md5sum for a message object of type '<MoveToNodeService-response>"
  "a6ad41fdec29b72af81f7f2cff62510b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToNodeService-response)))
  "Returns md5sum for a message object of type 'MoveToNodeService-response"
  "a6ad41fdec29b72af81f7f2cff62510b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToNodeService-response>)))
  "Returns full string definition for message of type '<MoveToNodeService-response>"
  (cl:format cl:nil "bool success~%string status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToNodeService-response)))
  "Returns full string definition for message of type 'MoveToNodeService-response"
  (cl:format cl:nil "bool success~%string status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToNodeService-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToNodeService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToNodeService-response
    (cl:cons ':success (success msg))
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveToNodeService)))
  'MoveToNodeService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveToNodeService)))
  'MoveToNodeService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToNodeService)))
  "Returns string type for a service object of type '<MoveToNodeService>"
  "hobe_rospy_test/MoveToNodeService")