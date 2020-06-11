
(cl:in-package :asdf)

(defsystem "myRosPackage-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "myMSG" :depends-on ("_package_myMSG"))
    (:file "_package_myMSG" :depends-on ("_package"))
  ))