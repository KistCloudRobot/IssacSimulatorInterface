# Install script for directory: /home/ailab/BAE_WS/Python/catkin_ws/src/hobe_rospy_test

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ailab/BAE_WS/Python/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hobe_rospy_test/msg" TYPE FILE FILES
    "/home/ailab/BAE_WS/Python/catkin_ws/src/hobe_rospy_test/msg/ServiceResult.msg"
    "/home/ailab/BAE_WS/Python/catkin_ws/src/hobe_rospy_test/msg/PalletizerPackingFinish.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hobe_rospy_test/srv" TYPE FILE FILES
    "/home/ailab/BAE_WS/Python/catkin_ws/src/hobe_rospy_test/srv/LiftService.srv"
    "/home/ailab/BAE_WS/Python/catkin_ws/src/hobe_rospy_test/srv/MoveBackService.srv"
    "/home/ailab/BAE_WS/Python/catkin_ws/src/hobe_rospy_test/srv/MoveToNodeService.srv"
    "/home/ailab/BAE_WS/Python/catkin_ws/src/hobe_rospy_test/srv/PalletService.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hobe_rospy_test/cmake" TYPE FILE FILES "/home/ailab/BAE_WS/Python/catkin_ws/build/hobe_rospy_test/catkin_generated/installspace/hobe_rospy_test-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/ailab/BAE_WS/Python/catkin_ws/devel/include/hobe_rospy_test")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/ailab/BAE_WS/Python/catkin_ws/devel/share/roseus/ros/hobe_rospy_test")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/ailab/BAE_WS/Python/catkin_ws/devel/share/common-lisp/ros/hobe_rospy_test")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/ailab/BAE_WS/Python/catkin_ws/devel/share/gennodejs/ros/hobe_rospy_test")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/home/ailab/anaconda3/bin/python3" -m compileall "/home/ailab/BAE_WS/Python/catkin_ws/devel/lib/python3/dist-packages/hobe_rospy_test")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/ailab/BAE_WS/Python/catkin_ws/devel/lib/python3/dist-packages/hobe_rospy_test")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ailab/BAE_WS/Python/catkin_ws/build/hobe_rospy_test/catkin_generated/installspace/hobe_rospy_test.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hobe_rospy_test/cmake" TYPE FILE FILES "/home/ailab/BAE_WS/Python/catkin_ws/build/hobe_rospy_test/catkin_generated/installspace/hobe_rospy_test-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hobe_rospy_test/cmake" TYPE FILE FILES
    "/home/ailab/BAE_WS/Python/catkin_ws/build/hobe_rospy_test/catkin_generated/installspace/hobe_rospy_testConfig.cmake"
    "/home/ailab/BAE_WS/Python/catkin_ws/build/hobe_rospy_test/catkin_generated/installspace/hobe_rospy_testConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hobe_rospy_test" TYPE FILE FILES "/home/ailab/BAE_WS/Python/catkin_ws/src/hobe_rospy_test/package.xml")
endif()

