# Copyright: (C) 2015 Fondazione Istituto Italiano di Tecnologia
# Authors: Silvio Traversaro
# CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT

project(iDynTree_YARP CXX)

SET(iDynTree_YARP_source src/DynTree.cpp
                         src/yarp_kdl.cpp
                         src/yarp_iDynTree.cpp)

SET(iDynTree_YARP_header include/iCub/iDynTree/DynTree.h
                  include/iCub/iDynTree/yarp_kdl.h
                  include/iCub/iDynTree/yarp_iDynTree.h)

SOURCE_GROUP("Source Files" FILES ${iDynTree_YARP_source})
SOURCE_GROUP("Header Files" FILES ${iDynTree_YARP_header})

# share headers with all iDynTree targes
set_property(GLOBAL APPEND PROPERTY IDYNTREE_TREE_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/include")
get_property(IDYNTREE_TREE_INCLUDE_DIRS GLOBAL PROPERTY IDYNTREE_TREE_INCLUDE_DIRS)

include_directories(${IDYNTREE_TREE_INCLUDE_DIRS})
include_directories(${orocos_kdl_INCLUDE_DIRS})

include(AddInstallRPATHSupport)
add_install_rpath_support(BIN_DIRS "${CMAKE_INSTALL_PREFIX}/bin"
                          LIB_DIRS "${CMAKE_INSTALL_PREFIX}/lib"
                          DEPENDS IDYNTREE_ENABLE_RPATH
                          USE_LINK_PATH)


add_library(idyntree-yarp ${iDynTree_YARP_source} ${iDynTree_YARP_header})

set_target_properties(idyntree-yarp PROPERTIES VERSION ${${VARS_PREFIX}_VERSION}
                                           SOVERSION ${${VARS_PREFIX}_VERSION}
                                           PUBLIC_HEADER "${iDynTree_YARP_header}")


target_include_directories(idyntree-yarp PUBLIC "$<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>"
                                           "$<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/${${VARS_PREFIX}_INSTALL_INCLUDEDIR}>"
                                            ${skinDynLib_INCLUDE_DIRS}
                                            ${iDyn_INCLUDE_DIRS}
                                            ${GSL_INCLUDE_DIRS}
                                            ${YARP_INCLUDE_DIRS}
                                            ${kdl_codyco_INCLUDE_DIRS}
                                            ${EIGEN3_INCLUDE_DIR}
                                            ${kdl_format_io_INCLUDE_DIRS})


target_link_libraries(idyntree-yarp LINK_PUBLIC  skinDynLib iKin iDyn
                                            ${GSL_LIBRARIES}
                                            ${YARP_LIBRARIES}
                                            idyntree-core
                                            idyntree-sensors
                                            idyntree-modelio-urdf
                                            idyntree-regressors
                                            ${Boost_LIBRARIES}
                                            ${TinyXML_LIBRARIES})


install(TARGETS idyntree-yarp
        EXPORT iDynTree
        RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}" COMPONENT bin
        LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}" COMPONENT shlib
        ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}" COMPONENT lib
        PUBLIC_HEADER DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/iCub/iDynTree" COMPONENT dev)

set_property(GLOBAL APPEND PROPERTY ${VARS_PREFIX}_TARGETS idyntree-yarp)
