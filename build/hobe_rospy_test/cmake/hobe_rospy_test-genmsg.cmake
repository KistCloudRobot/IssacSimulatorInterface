# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "hobe_rospy_test: 3 messages, 4 services")

set(MSG_I_FLAGS "-Ihobe_rospy_test:/home/uosai/catkin_ws/src/hobe_rospy_test/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Inav_msgs:/opt/ros/noetic/share/nav_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Itf2_msgs:/opt/ros/noetic/share/tf2_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(hobe_rospy_test_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/ServiceResult.msg" NAME_WE)
add_custom_target(_hobe_rospy_test_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hobe_rospy_test" "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/ServiceResult.msg" ""
)

get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/PalletizerPackingFinish.msg" NAME_WE)
add_custom_target(_hobe_rospy_test_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hobe_rospy_test" "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/PalletizerPackingFinish.msg" ""
)

get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/Gripper.msg" NAME_WE)
add_custom_target(_hobe_rospy_test_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hobe_rospy_test" "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/Gripper.msg" ""
)

get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/LiftService.srv" NAME_WE)
add_custom_target(_hobe_rospy_test_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hobe_rospy_test" "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/LiftService.srv" ""
)

get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveBackService.srv" NAME_WE)
add_custom_target(_hobe_rospy_test_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hobe_rospy_test" "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveBackService.srv" ""
)

get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveToNodeService.srv" NAME_WE)
add_custom_target(_hobe_rospy_test_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hobe_rospy_test" "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveToNodeService.srv" ""
)

get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/PalletService.srv" NAME_WE)
add_custom_target(_hobe_rospy_test_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hobe_rospy_test" "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/PalletService.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/ServiceResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hobe_rospy_test
)
_generate_msg_cpp(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/PalletizerPackingFinish.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hobe_rospy_test
)
_generate_msg_cpp(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/Gripper.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hobe_rospy_test
)

### Generating Services
_generate_srv_cpp(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/LiftService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_cpp(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveBackService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_cpp(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveToNodeService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_cpp(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/PalletService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hobe_rospy_test
)

### Generating Module File
_generate_module_cpp(hobe_rospy_test
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hobe_rospy_test
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(hobe_rospy_test_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(hobe_rospy_test_generate_messages hobe_rospy_test_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/ServiceResult.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_cpp _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/PalletizerPackingFinish.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_cpp _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/Gripper.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_cpp _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/LiftService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_cpp _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveBackService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_cpp _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveToNodeService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_cpp _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/PalletService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_cpp _hobe_rospy_test_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hobe_rospy_test_gencpp)
add_dependencies(hobe_rospy_test_gencpp hobe_rospy_test_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hobe_rospy_test_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/ServiceResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hobe_rospy_test
)
_generate_msg_eus(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/PalletizerPackingFinish.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hobe_rospy_test
)
_generate_msg_eus(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/Gripper.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hobe_rospy_test
)

### Generating Services
_generate_srv_eus(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/LiftService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_eus(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveBackService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_eus(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveToNodeService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_eus(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/PalletService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hobe_rospy_test
)

### Generating Module File
_generate_module_eus(hobe_rospy_test
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hobe_rospy_test
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(hobe_rospy_test_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(hobe_rospy_test_generate_messages hobe_rospy_test_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/ServiceResult.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_eus _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/PalletizerPackingFinish.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_eus _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/Gripper.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_eus _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/LiftService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_eus _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveBackService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_eus _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveToNodeService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_eus _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/PalletService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_eus _hobe_rospy_test_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hobe_rospy_test_geneus)
add_dependencies(hobe_rospy_test_geneus hobe_rospy_test_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hobe_rospy_test_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/ServiceResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hobe_rospy_test
)
_generate_msg_lisp(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/PalletizerPackingFinish.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hobe_rospy_test
)
_generate_msg_lisp(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/Gripper.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hobe_rospy_test
)

### Generating Services
_generate_srv_lisp(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/LiftService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_lisp(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveBackService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_lisp(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveToNodeService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_lisp(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/PalletService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hobe_rospy_test
)

### Generating Module File
_generate_module_lisp(hobe_rospy_test
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hobe_rospy_test
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(hobe_rospy_test_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(hobe_rospy_test_generate_messages hobe_rospy_test_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/ServiceResult.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_lisp _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/PalletizerPackingFinish.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_lisp _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/Gripper.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_lisp _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/LiftService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_lisp _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveBackService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_lisp _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveToNodeService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_lisp _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/PalletService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_lisp _hobe_rospy_test_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hobe_rospy_test_genlisp)
add_dependencies(hobe_rospy_test_genlisp hobe_rospy_test_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hobe_rospy_test_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/ServiceResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hobe_rospy_test
)
_generate_msg_nodejs(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/PalletizerPackingFinish.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hobe_rospy_test
)
_generate_msg_nodejs(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/Gripper.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hobe_rospy_test
)

### Generating Services
_generate_srv_nodejs(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/LiftService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_nodejs(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveBackService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_nodejs(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveToNodeService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_nodejs(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/PalletService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hobe_rospy_test
)

### Generating Module File
_generate_module_nodejs(hobe_rospy_test
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hobe_rospy_test
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(hobe_rospy_test_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(hobe_rospy_test_generate_messages hobe_rospy_test_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/ServiceResult.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_nodejs _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/PalletizerPackingFinish.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_nodejs _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/Gripper.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_nodejs _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/LiftService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_nodejs _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveBackService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_nodejs _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveToNodeService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_nodejs _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/PalletService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_nodejs _hobe_rospy_test_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hobe_rospy_test_gennodejs)
add_dependencies(hobe_rospy_test_gennodejs hobe_rospy_test_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hobe_rospy_test_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/ServiceResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hobe_rospy_test
)
_generate_msg_py(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/PalletizerPackingFinish.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hobe_rospy_test
)
_generate_msg_py(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/Gripper.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hobe_rospy_test
)

### Generating Services
_generate_srv_py(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/LiftService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_py(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveBackService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_py(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveToNodeService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hobe_rospy_test
)
_generate_srv_py(hobe_rospy_test
  "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/PalletService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hobe_rospy_test
)

### Generating Module File
_generate_module_py(hobe_rospy_test
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hobe_rospy_test
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(hobe_rospy_test_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(hobe_rospy_test_generate_messages hobe_rospy_test_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/ServiceResult.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_py _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/PalletizerPackingFinish.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_py _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/msg/Gripper.msg" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_py _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/LiftService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_py _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveBackService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_py _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/MoveToNodeService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_py _hobe_rospy_test_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/uosai/catkin_ws/src/hobe_rospy_test/srv/PalletService.srv" NAME_WE)
add_dependencies(hobe_rospy_test_generate_messages_py _hobe_rospy_test_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hobe_rospy_test_genpy)
add_dependencies(hobe_rospy_test_genpy hobe_rospy_test_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hobe_rospy_test_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hobe_rospy_test)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hobe_rospy_test
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(hobe_rospy_test_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(hobe_rospy_test_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(hobe_rospy_test_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(hobe_rospy_test_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET tf2_msgs_generate_messages_cpp)
  add_dependencies(hobe_rospy_test_generate_messages_cpp tf2_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(hobe_rospy_test_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hobe_rospy_test)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hobe_rospy_test
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(hobe_rospy_test_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(hobe_rospy_test_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(hobe_rospy_test_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(hobe_rospy_test_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET tf2_msgs_generate_messages_eus)
  add_dependencies(hobe_rospy_test_generate_messages_eus tf2_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(hobe_rospy_test_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hobe_rospy_test)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hobe_rospy_test
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(hobe_rospy_test_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(hobe_rospy_test_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(hobe_rospy_test_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(hobe_rospy_test_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET tf2_msgs_generate_messages_lisp)
  add_dependencies(hobe_rospy_test_generate_messages_lisp tf2_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(hobe_rospy_test_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hobe_rospy_test)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hobe_rospy_test
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(hobe_rospy_test_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(hobe_rospy_test_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(hobe_rospy_test_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(hobe_rospy_test_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET tf2_msgs_generate_messages_nodejs)
  add_dependencies(hobe_rospy_test_generate_messages_nodejs tf2_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(hobe_rospy_test_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hobe_rospy_test)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hobe_rospy_test\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hobe_rospy_test
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(hobe_rospy_test_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(hobe_rospy_test_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(hobe_rospy_test_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(hobe_rospy_test_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET tf2_msgs_generate_messages_py)
  add_dependencies(hobe_rospy_test_generate_messages_py tf2_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(hobe_rospy_test_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
