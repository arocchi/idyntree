/*
 * Copyright (C) 2015 Fondazione Istituto Italiano di Tecnologia
 * Authors: Silvio Traversaro
 * CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT
 *
 */

#include <iDynTree/Core/SpatialMotionVectorRaw.h>
#include <iDynTree/Core/SpatialForceVectorRaw.h>
#include <iDynTree/Core/PositionRaw.h>
#include <iDynTree/Core/RotationRaw.h>
#include <iDynTree/Core/Utils.h>

#include <Eigen/Dense>

#include <sstream>


namespace iDynTree
{

typedef Eigen::Matrix<double,6,1> Vector6d;
typedef Eigen::Matrix<double,3,3,Eigen::RowMajor> Matrix3dRowMajor;

SpatialMotionVectorRaw::SpatialMotionVectorRaw()
{
    // Vector6() will be implicitly called
}


SpatialMotionVectorRaw::SpatialMotionVectorRaw(const double* in_data,
                                               const unsigned int in_size):
                                               Vector6(in_data, in_size)
{
}

SpatialMotionVectorRaw::SpatialMotionVectorRaw(const SpatialMotionVectorRaw& other):
                                               Vector6(other.data(),6)
{

}


SpatialMotionVectorRaw::~SpatialMotionVectorRaw()
{

}

const SpatialMotionVectorRaw& SpatialMotionVectorRaw::changePoint(const PositionRaw& newPoint)
{
    Eigen::Map<Vector6d> thisData(this->data());
    Eigen::Map<const Eigen::Vector3d> pointData(newPoint.data());

    thisData.segment<3>(0) = thisData.segment<3>(0) + pointData.cross(thisData.segment<3>(3));

    return *this;
}

const SpatialMotionVectorRaw& SpatialMotionVectorRaw::changeCoordFrame(const RotationRaw& newCoordFrame)
{
    Eigen::Map<Vector6d> thisData(this->data());
    Eigen::Map<const Matrix3dRowMajor> rotData(newCoordFrame.data());

    thisData.segment<3>(0) = rotData*thisData.segment<3>(0);
    thisData.segment<3>(3) = rotData*thisData.segment<3>(3);

    return *this;
}

SpatialMotionVectorRaw SpatialMotionVectorRaw::compose(const SpatialMotionVectorRaw& op1, const SpatialMotionVectorRaw& op2)
{
    SpatialMotionVectorRaw result;

    Eigen::Map<const Vector6d> op1Data(op1.data());
    Eigen::Map<const Vector6d> op2Data(op2.data());
    Eigen::Map<Vector6d> resultData(result.data());

    resultData = op1Data + op2Data;

    return result;
}

SpatialMotionVectorRaw SpatialMotionVectorRaw::inverse(const SpatialMotionVectorRaw& op)
{
    SpatialMotionVectorRaw result;

    Eigen::Map<const Vector6d> opData(op.data());
    Eigen::Map<Vector6d> resultData(result.data());

    resultData = -opData;

    return result;
}

double SpatialMotionVectorRaw::dot(const SpatialForceVectorRaw& other) const
{
    Eigen::Map<const Vector6d> otherData(other.data());
    Eigen::Map<const Vector6d> thisData(this->data());

    return thisData.dot(otherData);
}

SpatialMotionVectorRaw SpatialMotionVectorRaw::cross(const SpatialMotionVectorRaw& other) const
{
    SpatialMotionVectorRaw res;
    Eigen::Map<const Eigen::Vector3d> op1Linear(this->data());
    Eigen::Map<const Eigen::Vector3d> op1Angular(this->data()+3);
    Eigen::Map<const Eigen::Vector3d> op2Linear(other.data());
    Eigen::Map<const Eigen::Vector3d> op2Angular(other.data()+3);
    Eigen::Map<Eigen::Vector3d> resLinear(res.data());
    Eigen::Map<Eigen::Vector3d> resAngular(res.data()+3);

    resLinear   =  op1Angular.cross(op2Linear) +  op1Linear.cross(op2Angular);
    resAngular =                                  op1Angular.cross(op2Angular);

    return res;
}

SpatialForceVectorRaw SpatialMotionVectorRaw::cross(const SpatialForceVectorRaw& other) const
{
    SpatialForceVectorRaw resForce;
    Eigen::Map<const Eigen::Vector3d> op1VelLinear(this->data());
    Eigen::Map<const Eigen::Vector3d> op1VelAngular(this->data()+3);
    Eigen::Map<const Eigen::Vector3d> op2ForceLinear(other.data());
    Eigen::Map<const Eigen::Vector3d> op2ForceAngular(other.data()+3);
    Eigen::Map<Eigen::Vector3d> resForceLinear(resForce.data());
    Eigen::Map<Eigen::Vector3d> resForceAngular(resForce.data()+3);

    resForceLinear  = op1VelAngular.cross(op2ForceLinear);
    resForceAngular = op1VelLinear.cross(op2ForceLinear) + op1VelAngular.cross(op2ForceAngular);

    return resForce;
}

SpatialMotionVectorRaw SpatialMotionVectorRaw::Zero()
{
    return SpatialMotionVectorRaw();
}


}