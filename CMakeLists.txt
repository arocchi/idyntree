cmake_minimum_required(VERSION 2.8.11)
project(iDynTree CXX)

set(VARS_PREFIX "iDynTree")

set(${VARS_PREFIX}_MAJOR_VERSION 0)
set(${VARS_PREFIX}_MINOR_VERSION 3)
set(${VARS_PREFIX}_PATCH_VERSION 6)
set(${VARS_PREFIX}_VERSION ${${VARS_PREFIX}_MAJOR_VERSION}.${${VARS_PREFIX}_MINOR_VERSION}.${${VARS_PREFIX}_PATCH_VERSION})

# Pick up our CMake scripts - they are all in the cmake subdirectory.
set(IDYNTREE_MODULE_DIR ${PROJECT_SOURCE_DIR}/cmake)
set(IDYNTREE_MODULE_PATH ${IDYNTREE_MODULE_DIR})
list(APPEND CMAKE_MODULE_PATH ${IDYNTREE_MODULE_PATH})

include(GNUInstallDirs)
if (CMAKE_VERSION LESS 3.0)
    # workaround for http://public.kitware.com/pipermail/cmake-developers/2014-January/009435.html
    set(CMAKE_INSTALL_LIBDIR lib)
endif()

#Use options specified in iDynTreeOptions.cmake file
include(iDynTreeOptions)

# Find dependecies
find_package(YARP REQUIRED)

if(IDYNTREE_USES_ICUB_MAIN)
    find_package(ICUB REQUIRED)
endif()

include(OrocosKDLFindLogic)
find_package(orocos_kdl REQUIRED)
find_package(Eigen3 REQUIRED)

if (YARP_HAS_MATH_LIB)
    message(STATUS "found libYARP_math")
else(YARP_HAS_MATH_LIB)
    message(FATAL_ERROR "YARP was found, but no libYARP_math was detected, please recompile yarp")
endif(YARP_HAS_MATH_LIB)

find_package(TinyXML REQUIRED)

include(AddInstallRPATHSupport)
add_install_rpath_support(BIN_DIRS "${CMAKE_INSTALL_PREFIX}/bin"
                          LIB_DIRS "${CMAKE_INSTALL_PREFIX}/lib"
                          DEPENDS IDYNTREE_ENABLE_RPATH
                          USE_LINK_PATH)

add_subdirectory(core-experimental)
add_subdirectory(core)
add_subdirectory(sensors)
add_subdirectory(model_io)
add_subdirectory(high-level)
add_subdirectory(regressors)
add_subdirectory(yarp)
if(IDYNTREE_USES_ICUB_MAIN)
    add_subdirectory(icub)
endif()

# compile simple command line tools
add_subdirectory(tools)

include(InstallBasicPackageFiles)
install_basic_package_files(iDynTree VARS_PREFIX ${VARS_PREFIX}
                                     VERSION ${${VARS_PREFIX}_VERSION}
                                     COMPATIBILITY SameMajorVersion
                                     TARGETS_PROPERTY ${VARS_PREFIX}_TARGETS
                                     NO_CHECK_REQUIRED_COMPONENTS_MACRO)

include(AddUninstallTarget)

if(IDYNTREE_COMPILE_TESTS)
    add_subdirectory(tests)
endif(IDYNTREE_COMPILE_TESTS)

add_subdirectory(bindings)