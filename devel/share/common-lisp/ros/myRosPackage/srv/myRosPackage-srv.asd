
(cl:in-package :asdf)

(defsystem "myRosPackage-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "AddTwoIntsCopy" :depends-on ("_package_AddTwoIntsCopy"))
    (:file "_package_AddTwoIntsCopy" :depends-on ("_package"))
  ))