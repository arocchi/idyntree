
get_property(IDYNTREE_TREE_INCLUDE_DIRS GLOBAL PROPERTY IDYNTREE_TREE_INCLUDE_DIRS)

include_directories(${IDYNTREE_TREE_INCLUDE_DIRS})
include_directories(SYSTEM ${EIGEN3_INCLUDE_DIR} ${orocos_kdl_INCLUDE_DIRS} ${orocos_kdl_INCLUDE_DIRS})

add_executable(inverse_inertia_test inverse_inertia.cpp)
add_executable(regressor_utils_test regressor_utils_test.cpp)
add_executable(subtree_regressor_test subtree_regressor_test.cpp testhumanoid.cpp)
add_executable(inversedynamics_regressor_test inversedynamics_regressor_test.cpp testhumanoid.cpp)
add_executable(inversedynamics_crba_test inversedynamics_crba_test.cpp testhumanoid.cpp testsinglelink.cpp testsinglejoint.cpp testkukalwr.cpp)
add_executable(comjacobian_test comjacobian_test.cpp testhumanoid.cpp)
add_executable(inversedynamics_different_loops_test inversedynamics_different_loops_test.cpp testhumanoid.cpp)

#set_source_files_properties(sparse_numerical_subspace_test.cpp PROPERTIES COMPILE_FLAGS -std=c++11)
#add_executable(sparse_numerical_subspace_test sparse_numerical_subspace_test.cpp testhumanoid.cpp testdoublejoint.cpp testsinglelink.cpp testsinglejoint.cpp testkukalwr.cpp)

target_link_libraries(inverse_inertia_test                  idyntree-core idyntree-regressors idyntree-modelio-urdf   ${orocos_kdl_LIBRARIES} )
target_link_libraries(regressor_utils_test                  idyntree-core idyntree-regressors idyntree-modelio-urdf    ${orocos_kdl_LIBRARIES} )
target_link_libraries(subtree_regressor_test                idyntree-core idyntree-regressors idyntree-modelio-urdf   ${orocos_kdl_LIBRARIES} )
target_link_libraries(inversedynamics_regressor_test        idyntree-core idyntree-regressors  idyntree-modelio-urdf  ${orocos_kdl_LIBRARIES} )
target_link_libraries(inversedynamics_crba_test             idyntree-core idyntree-regressors idyntree-modelio-urdf  ${orocos_kdl_LIBRARIES} )
target_link_libraries(comjacobian_test                      idyntree-core idyntree-regressors idyntree-modelio-urdf  ${orocos_kdl_LIBRARIES} )
target_link_libraries(inversedynamics_different_loops_test  idyntree-core idyntree-regressors idyntree-modelio-urdf  ${orocos_kdl_LIBRARIES} )
#target_link_libraries(sparse_numerical_subspace_test ${orocos_kdl_LIBRARIES} idyntree-core  )
target_link_libraries(inversedynamics_different_loops_test  idyntree-core idyntree-regressors idyntree-modelio-urdf ${YARP_LIBRARIES} iKin ${orocos_kdl_LIBRARIES} )


add_test(NAME test_inverse_inertia    COMMAND inverse_inertia_test)
add_test(NAME test_regressor_utils    COMMAND regressor_utils_test)
add_test(NAME test_subtree_regressor  COMMAND subtree_regressor_test)
add_test(NAME test_inversedynamics_regressor COMMAND inversedynamics_regressor_test)
add_test(NAME test_inversedynamics_crba COMMAND inversedynamics_crba_test)
add_test(NAME test_comjacobian COMMAND comjacobian_test)
#add_test(test_sparse_numerical_subspace sparse_numerical_subspace_test)
add_test(NAME test_inversedynamics_different_loops COMMAND inversedynamics_different_loops_test)

if(IDYNTREE_USES_ICUB_MAIN)
  find_package(YARP)
  find_package(ICUB)
  add_executable(urdf2dh_test urdf2dh_tests.cpp)
  target_include_directories(urdf2dh_test PUBLIC ${ICUB_INCLUDE_DIRS} ${YARP_INCLUDE_DIRS})
  target_link_libraries(urdf2dh_test iKin idyntree-core idyntree-regressors  idyntree-modelio-urdf idyntree-modelio-ikin)
  # \todo reenable this test
  #add_test(NAME test_urdf2dh COMMAND urdf2dh_test urdf_icub_test.urdf)
endif()

#dirl related test
#add_executable(dirl_dataset_test dirl_dataset_test.cpp)

#target_link_libraries(dirl_dataset_test ${orocos_kdl_LIBRARIES} idyntree-core idyntree-regressors idyntree-model-io)
#configure_file(${CMAKE_CURRENT_SOURCE_DIR}/dirl_dataset_examples/hrp2_100samples.csv ${CMAKE_CURRENT_BINARY_DIR}/hrp2_100samples.csv)
#First argument of the test: dataset example, second argument: number of expected samples
#add_test(NAME test_dirl_dataset_hrp2 COMMAND dirl_dataset_test hrp2_100samples.csv 100)


add_executable(urdf_forward_kinematics urdf_forward_kinematics.cpp)
target_link_libraries(urdf_forward_kinematics idyntree-core idyntree-modelio-urdf ${orocos_kdl_LIBRARIES})

#add_test(NAME test_urdf_forward_kinematics  COMMAND urdf_forward_kinematics black_icub.urdf root_link r_hip_3)

