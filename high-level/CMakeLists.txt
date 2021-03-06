# Copyright: (C) 2015 Fondazione Istituto Italiano di Tecnologia
# Authors: Silvio Traversaro
# CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT

project(iDynTree_HighLevel CXX)

set(IDYNTREE_HIGH_LEVEL_HEADERS include/iDynTree/HighLevel/DynamicsComputations.h)

set(IDYNTREE_HIGH_LEVEL_PRIVATE_INCLUDES )

set(IDYNTREE_HIGH_LEVEL_SOURCES src/DynamicsComputations.cpp)

SOURCE_GROUP("Source Files" FILES ${IDYNTREE_HIGH_LEVEL_SOURCES})
SOURCE_GROUP("Header Files" FILES ${IDYNTREE_HIGH_LEVEL_HEADERS})
#SOURCE_GROUP("Header Files\\Private" FILES ${IDYNTREE_HIGH_LEVEL_PRIVATE_INCLUDES})

# share headers with all iDynTree targes
set_property(GLOBAL APPEND PROPERTY IDYNTREE_TREE_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/include")
get_property(IDYNTREE_TREE_INCLUDE_DIRS GLOBAL PROPERTY IDYNTREE_TREE_INCLUDE_DIRS)

include_directories(${IDYNTREE_TREE_INCLUDE_DIRS})

include_directories(SYSTEM ${orocos_kdl_INCLUDE_DIRS}
                           ${EIGEN3_INCLUDE_DIR})

set(libraryname idyntree-high-level)

add_library(${libraryname} ${IDYNTREE_HIGH_LEVEL_SOURCES} ${IDYNTREE_HIGH_LEVEL_HEADERS} ${IDYNTREE_HIGH_LEVEL_PRIVATE_INCLUDES})

target_include_directories(${libraryname} PUBLIC "$<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>"
                                                 "$<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_INCLUDEDIR}>"
                                          PRIVATE ${EIGEN3_INCLUDE_DIR})

target_link_libraries(${libraryname} ${orocos_kdl_LIBRARIES} idyntree-core-exp idyntree-core idyntree-sensors idyntree-modelio-urdf ${TinyXML_LIBRARIES} )


set_property(TARGET ${libraryname} PROPERTY PUBLIC_HEADER ${IDYNTREE_HIGH_LEVEL_HEADERS})

install(TARGETS ${libraryname}
        EXPORT iDynTree
        COMPONENT runtime
        RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}" COMPONENT bin
        LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}" COMPONENT shlib
        ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}" COMPONENT lib
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/iDynTree/HighLevel
        PRIVATE_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/iDynTree/HighLevel/impl)

set_property(GLOBAL APPEND PROPERTY ${VARS_PREFIX}_TARGETS ${libraryname})

if(IDYNTREE_COMPILE_TESTS)
    #add_subdirectory(tests)
endif(IDYNTREE_COMPILE_TESTS)
