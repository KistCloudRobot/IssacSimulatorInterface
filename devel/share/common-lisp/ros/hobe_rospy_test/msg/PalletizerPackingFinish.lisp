; Auto-generated. Do not edit!


(cl:in-package hobe_rospy_test-msg)


;//! \htmlinclude PalletizerPackingFinish.msg.html

(cl:defclass <PalletizerPackingFinish> (roslisp-msg-protocol:ros-message)
  ((palletizer
    :reader palletizer
    :initarg :palletizer
    :type cl:string
    :initform "")
   (node
    :reader node
    :initarg :node
    :type cl:string
    :initform ""))
)

(cl:defclass PalletizerPackingFinish (<PalletizerPackingFinish>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PalletizerPackingFinish>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PalletizerPackingFinish)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hobe_rospy_test-msg:<PalletizerPackingFinish> is deprecated: use hobe_rospy_test-msg:PalletizerPackingFinish instead.")))

(cl:ensure-generic-function 'palletizer-val :lambda-list '(m))
(cl:defmethod palletizer-val ((m <PalletizerPackingFinish>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-msg:palletizer-val is deprecated.  Use hobe_rospy_test-msg:palletizer instead.")
  (palletizer m))

(cl:ensure-generic-function 'node-val :lambda-list '(m))
(cl:defmethod node-val ((m <PalletizerPackingFinish>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hobe_rospy_test-msg:node-val is deprecated.  Use hobe_rospy_test-msg:node instead.")
  (node m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PalletizerPackingFinish>) ostream)
  "Serializes a message object of type '<PalletizerPackingFinish>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'palletizer))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'palletizer))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'node))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'node))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PalletizerPackingFinish>) istream)
  "Deserializes a message object of type '<PalletizerPackingFinish>"
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
      (cl:setf (cl:slot-value msg 'node) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'node) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PalletizerPackingFinish>)))
  "Returns string type for a message object of type '<PalletizerPackingFinish>"
  "hobe_rospy_test/PalletizerPackingFinish")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PalletizerPackingFinish)))
  "Returns string type for a message object of type 'PalletizerPackingFinish"
  "hobe_rospy_test/PalletizerPackingFinish")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PalletizerPackingFinish>)))
  "Returns md5sum for a message object of type '<PalletizerPackingFinish>"
  "70cfe6a8687ee2fd71c9e786e3742f96")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PalletizerPackingFinish)))
  "Returns md5sum for a message object of type 'PalletizerPackingFinish"
  "70cfe6a8687ee2fd71c9e786e3742f96")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PalletizerPackingFinish>)))
  "Returns full string definition for message of type '<PalletizerPackingFinish>"
  (cl:format cl:nil "string palletizer~%string node~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PalletizerPackingFinish)))
  "Returns full string definition for message of type 'PalletizerPackingFinish"
  (cl:format cl:nil "string palletizer~%string node~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PalletizerPackingFinish>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'palletizer))
     4 (cl:length (cl:slot-value msg 'node))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PalletizerPackingFinish>))
  "Converts a ROS message object to a list"
  (cl:list 'PalletizerPackingFinish
    (cl:cons ':palletizer (palletizer msg))
    (cl:cons ':node (node msg))
))
