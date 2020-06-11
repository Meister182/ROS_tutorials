; Auto-generated. Do not edit!


(cl:in-package myRosPackage-msg)


;//! \htmlinclude myMSG.msg.html

(cl:defclass <myMSG> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass myMSG (<myMSG>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <myMSG>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'myMSG)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myRosPackage-msg:<myMSG> is deprecated: use myRosPackage-msg:myMSG instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <myMSG>) ostream)
  "Serializes a message object of type '<myMSG>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <myMSG>) istream)
  "Deserializes a message object of type '<myMSG>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<myMSG>)))
  "Returns string type for a message object of type '<myMSG>"
  "myRosPackage/myMSG")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'myMSG)))
  "Returns string type for a message object of type 'myMSG"
  "myRosPackage/myMSG")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<myMSG>)))
  "Returns md5sum for a message object of type '<myMSG>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'myMSG)))
  "Returns md5sum for a message object of type 'myMSG"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<myMSG>)))
  "Returns full string definition for message of type '<myMSG>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'myMSG)))
  "Returns full string definition for message of type 'myMSG"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <myMSG>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <myMSG>))
  "Converts a ROS message object to a list"
  (cl:list 'myMSG
))
