/*
 * Copyright (C) 2015 Fondazione Istituto Italiano di Tecnologia
 * Authors: Silvio Traversaro
 * CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT
 *
 */

#include <Eigen/Dense>

namespace iDynTree
{

/**
 * Maps a 3d vector to the square of the cross product matrix:
 * v --> (v\times)^2
 * or, if you prefer another notation:
 * v --> S^2(v)
 */
Eigen::Matrix3d squareCrossProductMatrix(const Eigen::Vector3d & v);


}