; Auto-generated. Do not edit!


(cl:in-package hobe_rospy_test-srv)


;//! \htmlinclude PalletService-request.msg.html

(cl:defclass <PalletService-request> (roslisp-msg-protocol:ros-message)
  ((action
    :reader action
    :initarg :action
    :type cl:string
    :initform "")
   (palletizer
    :reader palletizer
    :initarg :palletizer
    :type cl:string
    :initform "")
   (robot
    :reader robot
    :initarg :robot
    :type cl:string
    :initform "")
   (node
    :reader node
    :initarg :node
    :type cl:string
    :initform ""))
)

(cl:defclass PalletService-request (<PalletService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PalletService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PalletService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hobe_rospy_test-srv:<PalletService-request> is deprecated: use hobe_rospy_test-srv:PalletService-request instead.")))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <PalletService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:action-val is deprecated.  Use hobe_rospy_test-srv:action instead.")
  (action m))

(cl:ensure-generic-function 'palletizer-val :lambda-list '(m))
(cl:defmethod palletizer-val ((m <PalletService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:palletizer-val is deprecated.  Use hobe_rospy_test-srv:palletizer instead.")
  (palletizer m))

(cl:ensure-generic-function 'robot-val :lambda-list '(m))
(cl:defmethod robot-val ((m <PalletService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:robot-val is deprecated.  Use hobe_rospy_test-srv:robot instead.")
  (robot m))

(cl:ensure-generic-function 'node-val :lambda-list '(m))
(cl:defmethod node-val ((m <PalletService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:node-val is deprecated.  Use hobe_rospy_test-srv:node instead.")
  (node m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PalletService-request>) ostream)
  "Serializes a message object of type '<PalletService-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'palletizer))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'palletizer))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'node))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'node))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PalletService-request>) istream)
  "Deserializes a message object of type '<PalletService-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'palletizer) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'palletizer) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robot) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'node) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'node) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PalletService-request>)))
  "Returns string type for a service object of type '<PalletService-request>"
  "hobe_rospy_test/PalletServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PalletService-request)))
  "Returns string type for a service object of type 'PalletService-request"
  "hobe_rospy_test/PalletServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PalletService-request>)))
  "Returns md5sum for a message object of type '<PalletService-request>"
  "1b1aad6e6b75c669e52bd93dbc857957")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PalletService-request)))
  "Returns md5sum for a message object of type 'PalletService-request"
  "1b1aad6e6b75c669e52bd93dbc857957")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PalletService-request>)))
  "Returns full string definition for message of type '<PalletService-request>"
  (cl:format cl:nil "string action~%string palletizer~%string robot~%string node~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PalletService-request)))
  "Returns full string definition for message of type 'PalletService-request"
  (cl:format cl:nil "string action~%string palletizer~%string robot~%string node~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PalletService-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'action))
     4 (cl:length (cl:slot-value msg 'palletizer))
     4 (cl:length (cl:slot-value msg 'robot))
     4 (cl:length (cl:slot-value msg 'node))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PalletService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PalletService-request
    (cl:cons ':action (action msg))
    (cl:cons ':palletizer (palletizer msg))
    (cl:cons ':robot (robot msg))
    (cl:cons ':node (node msg))
))
;//! \htmlinclude PalletService-response.msg.html

(cl:defclass <PalletService-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PalletService-response (<PalletService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PalletService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PalletService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hobe_rospy_test-srv:<PalletService-response> is deprecated: use hobe_rospy_test-srv:PalletService-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <PalletService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:result-val is deprecated.  Use hobe_rospy_test-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PalletService-response>) ostream)
  "Serializes a message object of type '<PalletService-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PalletService-response>) istream)
  "Deserializes a message object of type '<PalletService-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PalletService-response>)))
  "Returns string type for a service object of type '<PalletService-response>"
  "hobe_rospy_test/PalletServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PalletService-response)))
  "Returns string type for a service object of type 'PalletService-response"
  "hobe_rospy_test/PalletServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PalletService-response>)))
  "Returns md5sum for a message object of type '<PalletService-response>"
  "1b1aad6e6b75c669e52bd93dbc857957")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PalletService-response)))
  "Returns md5sum for a message object of type 'PalletService-response"
  "1b1aad6e6b75c669e52bd93dbc857957")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PalletService-response>)))
  "Returns full string definition for message of type '<PalletService-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PalletService-response)))
  "Returns full string definition for message of type 'PalletService-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PalletService-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PalletService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PalletService-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PalletService)))
  'PalletService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PalletService)))
  'PalletService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PalletService)))
  "Returns string type for a service object of type '<PalletService>"
  "hobe_rospy_test/PalletService")