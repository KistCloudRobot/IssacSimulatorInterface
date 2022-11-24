
(cl:in-package :asdf)

(defsystem "hobe_rospy_test-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "LiftService" :depends-on ("_package_LiftService"))
    (:file "_package_LiftService" :depends-on ("_package"))
    (:file "MoveBackService" :depends-on ("_package_MoveBackService"))
    (:file "_package_MoveBackService" :depends-on ("_package"))
    (:file "MoveToNodeService" :depends-on ("_package_MoveToNodeService"))
    (:file "_package_MoveToNodeService" :depends-on ("_package"))
    (:file "PalletService" :depends-on ("_package_PalletService"))
    (:file "_package_PalletService" :depends-on ("_package"))
    (:file "PalletService_old" :depends-on ("_package_PalletService_old"))
    (:file "_package_PalletService_old" :depends-on ("_package"))
  ))