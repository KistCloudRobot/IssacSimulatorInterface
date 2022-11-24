; Auto-generated. Do not edit!


(cl:in-package hobe_rospy_test-srv)


;//! \htmlinclude MoveBackService-request.msg.html

(cl:defclass <MoveBackService-request> (roslisp-msg-protocol:ros-message)
  ((robotName
    :reader robotName
    :initarg :robotName
    :type cl:string
    :initform "")
   (node_num
    :reader node_num
    :initarg :node_num
    :type cl:string
    :initform ""))
)

(cl:defclass MoveBackService-request (<MoveBackService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveBackService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveBackService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hobe_rospy_test-srv:<MoveBackService-request> is deprecated: use hobe_rospy_test-srv:MoveBackService-request instead.")))

(cl:ensure-generic-function 'robotName-val :lambda-list '(m))
(cl:defmethod robotName-val ((m <MoveBackService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:robotName-val is deprecated.  Use hobe_rospy_test-srv:robotName instead.")
  (robotName m))

(cl:ensure-generic-function 'node_num-val :lambda-list '(m))
(cl:defmethod node_num-val ((m <MoveBackService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:node_num-val is deprecated.  Use hobe_rospy_test-srv:node_num instead.")
  (node_num m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveBackService-request>) ostream)
  "Serializes a message object of type '<MoveBackService-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robotName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robotName))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'node_num))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'node_num))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveBackService-request>) istream)
  "Deserializes a message object of type '<MoveBackService-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robotName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robotName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'node_num) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'node_num) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveBackService-request>)))
  "Returns string type for a service object of type '<MoveBackService-request>"
  "hobe_rospy_test/MoveBackServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveBackService-request)))
  "Returns string type for a service object of type 'MoveBackService-request"
  "hobe_rospy_test/MoveBackServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveBackService-request>)))
  "Returns md5sum for a message object of type '<MoveBackService-request>"
  "e7b883f3f3085a2a026775cc770f647f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveBackService-request)))
  "Returns md5sum for a message object of type 'MoveBackService-request"
  "e7b883f3f3085a2a026775cc770f647f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveBackService-request>)))
  "Returns full string definition for message of type '<MoveBackService-request>"
  (cl:format cl:nil "string robotName~%string node_num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveBackService-request)))
  "Returns full string definition for message of type 'MoveBackService-request"
  (cl:format cl:nil "string robotName~%string node_num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveBackService-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'robotName))
     4 (cl:length (cl:slot-value msg 'node_num))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveBackService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveBackService-request
    (cl:cons ':robotName (robotName msg))
    (cl:cons ':node_num (node_num msg))
))
;//! \htmlinclude MoveBackService-response.msg.html

(cl:defclass <MoveBackService-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MoveBackService-response (<MoveBackService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveBackService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveBackService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hobe_rospy_test-srv:<MoveBackService-response> is deprecated: use hobe_rospy_test-srv:MoveBackService-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MoveBackService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-srv:success-val is deprecated.  Use hobe_rospy_test-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveBackService-response>) ostream)
  "Serializes a message object of type '<MoveBackService-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveBackService-response>) istream)
  "Deserializes a message object of type '<MoveBackService-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveBackService-response>)))
  "Returns string type for a service object of type '<MoveBackService-response>"
  "hobe_rospy_test/MoveBackServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveBackService-response)))
  "Returns string type for a service object of type 'MoveBackService-response"
  "hobe_rospy_test/MoveBackServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveBackService-response>)))
  "Returns md5sum for a message object of type '<MoveBackService-response>"
  "e7b883f3f3085a2a026775cc770f647f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveBackService-response)))
  "Returns md5sum for a message object of type 'MoveBackService-response"
  "e7b883f3f3085a2a026775cc770f647f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveBackService-response>)))
  "Returns full string definition for message of type '<MoveBackService-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveBackService-response)))
  "Returns full string definition for message of type 'MoveBackService-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveBackService-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveBackService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveBackService-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveBackService)))
  'MoveBackService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveBackService)))
  'MoveBackService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveBackService)))
  "Returns string type for a service object of type '<MoveBackService>"
  "hobe_rospy_test/MoveBackService")