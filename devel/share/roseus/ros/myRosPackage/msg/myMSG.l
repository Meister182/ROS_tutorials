;; Auto-generated. Do not edit!


(when (boundp 'myRosPackage::myMSG)
  (if (not (find-package "MYROSPACKAGE"))
    (make-package "MYROSPACKAGE"))
  (shadow 'myMSG (find-package "MYROSPACKAGE")))
(unless (find-package "MYROSPACKAGE::MYMSG")
  (make-package "MYROSPACKAGE::MYMSG"))

(in-package "ROS")
;;//! \htmlinclude myMSG.msg.html


(defclass myRosPackage::myMSG
  :super ros::object
  :slots ())

(defmethod myRosPackage::myMSG
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(setf (get myRosPackage::myMSG :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get myRosPackage::myMSG :datatype-) "myRosPackage/myMSG")
(setf (get myRosPackage::myMSG :definition-)
      "
")



(provide :myRosPackage/myMSG "d41d8cd98f00b204e9800998ecf8427e")


