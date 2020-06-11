# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "myRosPackage: 1 messages, 1 services")

set(MSG_I_FLAGS "-ImyRosPackage:/home/alex/Desktop/ROS_tutorials/src/myRosPackage/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(myRosPackage_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/srv/AddTwoIntsCopy.srv" NAME_WE)
add_custom_target(_myRosPackage_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "myRosPackage" "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/srv/AddTwoIntsCopy.srv" ""
)

get_filename_component(_filename "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/msg/myMSG.msg" NAME_WE)
add_custom_target(_myRosPackage_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "myRosPackage" "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/msg/myMSG.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(myRosPackage
  "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/msg/myMSG.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/myRosPackage
)

### Generating Services
_generate_srv_cpp(myRosPackage
  "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/srv/AddTwoIntsCopy.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/myRosPackage
)

### Generating Module File
_generate_module_cpp(myRosPackage
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/myRosPackage
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(myRosPackage_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(myRosPackage_generate_messages myRosPackage_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/srv/AddTwoIntsCopy.srv" NAME_WE)
add_dependencies(myRosPackage_generate_messages_cpp _myRosPackage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/msg/myMSG.msg" NAME_WE)
add_dependencies(myRosPackage_generate_messages_cpp _myRosPackage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(myRosPackage_gencpp)
add_dependencies(myRosPackage_gencpp myRosPackage_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS myRosPackage_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(myRosPackage
  "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/msg/myMSG.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/myRosPackage
)

### Generating Services
_generate_srv_eus(myRosPackage
  "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/srv/AddTwoIntsCopy.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/myRosPackage
)

### Generating Module File
_generate_module_eus(myRosPackage
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/myRosPackage
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(myRosPackage_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(myRosPackage_generate_messages myRosPackage_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/srv/AddTwoIntsCopy.srv" NAME_WE)
add_dependencies(myRosPackage_generate_messages_eus _myRosPackage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/msg/myMSG.msg" NAME_WE)
add_dependencies(myRosPackage_generate_messages_eus _myRosPackage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(myRosPackage_geneus)
add_dependencies(myRosPackage_geneus myRosPackage_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS myRosPackage_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(myRosPackage
  "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/msg/myMSG.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/myRosPackage
)

### Generating Services
_generate_srv_lisp(myRosPackage
  "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/srv/AddTwoIntsCopy.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/myRosPackage
)

### Generating Module File
_generate_module_lisp(myRosPackage
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/myRosPackage
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(myRosPackage_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(myRosPackage_generate_messages myRosPackage_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/srv/AddTwoIntsCopy.srv" NAME_WE)
add_dependencies(myRosPackage_generate_messages_lisp _myRosPackage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/msg/myMSG.msg" NAME_WE)
add_dependencies(myRosPackage_generate_messages_lisp _myRosPackage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(myRosPackage_genlisp)
add_dependencies(myRosPackage_genlisp myRosPackage_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS myRosPackage_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(myRosPackage
  "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/msg/myMSG.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/myRosPackage
)

### Generating Services
_generate_srv_nodejs(myRosPackage
  "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/srv/AddTwoIntsCopy.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/myRosPackage
)

### Generating Module File
_generate_module_nodejs(myRosPackage
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/myRosPackage
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(myRosPackage_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(myRosPackage_generate_messages myRosPackage_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/srv/AddTwoIntsCopy.srv" NAME_WE)
add_dependencies(myRosPackage_generate_messages_nodejs _myRosPackage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/msg/myMSG.msg" NAME_WE)
add_dependencies(myRosPackage_generate_messages_nodejs _myRosPackage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(myRosPackage_gennodejs)
add_dependencies(myRosPackage_gennodejs myRosPackage_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS myRosPackage_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(myRosPackage
  "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/msg/myMSG.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/myRosPackage
)

### Generating Services
_generate_srv_py(myRosPackage
  "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/srv/AddTwoIntsCopy.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/myRosPackage
)

### Generating Module File
_generate_module_py(myRosPackage
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/myRosPackage
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(myRosPackage_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(myRosPackage_generate_messages myRosPackage_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/srv/AddTwoIntsCopy.srv" NAME_WE)
add_dependencies(myRosPackage_generate_messages_py _myRosPackage_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/alex/Desktop/ROS_tutorials/src/myRosPackage/msg/myMSG.msg" NAME_WE)
add_dependencies(myRosPackage_generate_messages_py _myRosPackage_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(myRosPackage_genpy)
add_dependencies(myRosPackage_genpy myRosPackage_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS myRosPackage_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/myRosPackage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/myRosPackage
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(myRosPackage_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/myRosPackage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/myRosPackage
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(myRosPackage_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/myRosPackage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/myRosPackage
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(myRosPackage_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/myRosPackage)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/myRosPackage
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(myRosPackage_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/myRosPackage)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/myRosPackage\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/myRosPackage
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(myRosPackage_generate_messages_py std_msgs_generate_messages_py)
endif()
