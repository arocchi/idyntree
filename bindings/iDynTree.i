
/* File : iDynTree.i */
%module iDynTree
%include "std_string.i"

// Support print to terminal

// Python
#ifdef SWIGPYTHON
%include "./python/python.i"
#endif

// Matlab
#ifdef SWIGMATLAB
%include "./matlab/matlab.i"
#endif

%{
/* Note : always include headers following the inheritance order */

// Basic math classes
#include "iDynTree/Core/IMatrix.h"
#include "iDynTree/Core/IVector.h"
#include "iDynTree/Core/MatrixDynSize.h"
#include "iDynTree/Core/VectorDynSize.h"
#include "iDynTree/Core/VectorFixSize.h"

// Basic Vectors: Point Vectors and Spatial Vectors
#include "iDynTree/Core/PositionRaw.h"
#include "iDynTree/Core/PositionSemantics.h"
#include "iDynTree/Core/Position.h"
#include "iDynTree/Core/SpatialForceVectorRaw.h"
#include "iDynTree/Core/SpatialMotionVectorRaw.h"
#include "iDynTree/Core/Twist.h"
#include "iDynTree/Core/Wrench.h"
#include "iDynTree/Core/SpatialMomentum.h"
#include "iDynTree/Core/SpatialAcc.h"

// Inertias
#include "iDynTree/Core/RotationalInertiaRaw.h"
#include "iDynTree/Core/SpatialInertiaRaw.h"
#include "iDynTree/Core/SpatialInertia.h"

// Transformations: Rotation and Transform
#include "iDynTree/Core/RotationRaw.h"
#include "iDynTree/Core/RotationSemantics.h"
#include "iDynTree/Core/Rotation.h"
#include "iDynTree/Core/TransformSemantics.h"
#include "iDynTree/Core/Transform.h"

// Sensors related data structures
#include "iDynTree/Sensors/Sensors.hpp"
#include "iDynTree/Sensors/SixAxisFTSensor.hpp"

// Sensors loading from external formats
#include "iDynTree/ModelIO/URDFSensorsImport.h"

// Regressors related data structures
#include "iDynTree/Regressors/DynamicsRegressorParameters.h"
#include "iDynTree/Regressors/DynamicsRegressorGenerator.h"

// High level interfaces
#include "iDynTree/HighLevel/DynamicsComputations.h"

%}

/* Note : always include headers following the inheritance order */
// Basic math classes
%include "iDynTree/Core/IMatrix.h"
%include "iDynTree/Core/IVector.h"
%include "iDynTree/Core/MatrixDynSize.h"
%include "iDynTree/Core/MatrixFixSize.h"


%include "iDynTree/Core/VectorDynSize.h"
%include "iDynTree/Core/VectorFixSize.h"

#ifdef SWIGMATLAB
%include "./matlab/matlab_matvec.i"
#endif

%template(Matrix3x3) iDynTree::MatrixFixSize<3,3>;
%template(Matrix4x4) iDynTree::MatrixFixSize<4,4>;
%template(Matrix6x6) iDynTree::MatrixFixSize<6,6>;
%template(Matrix6x10) iDynTree::MatrixFixSize<6,10>;

%template(Vector3) iDynTree::VectorFixSize<3>;
%template(Vector6) iDynTree::VectorFixSize<6>;
%template(Vector10) iDynTree::VectorFixSize<10>;

// Basic Vectors: Point Vectors and Spatial Vectors
%include "iDynTree/Core/PositionRaw.h"
%include "iDynTree/Core/PositionSemantics.h"
%include "iDynTree/Core/Position.h"
%include "iDynTree/Core/SpatialForceVectorRaw.h"
%include "iDynTree/Core/SpatialMotionVectorRaw.h"
%include "iDynTree/Core/Twist.h"
%include "iDynTree/Core/Wrench.h"
%include "iDynTree/Core/SpatialMomentum.h"
%include "iDynTree/Core/SpatialAcc.h"

// Inertias
%include "iDynTree/Core/RotationalInertiaRaw.h"
%include "iDynTree/Core/SpatialInertiaRaw.h"
%include "iDynTree/Core/SpatialInertia.h"

// Transformations: Rotation and Transform
%include "iDynTree/Core/RotationRaw.h"
%include "iDynTree/Core/RotationSemantics.h"
%include "iDynTree/Core/Rotation.h"
%include "iDynTree/Core/TransformSemantics.h"
%include "iDynTree/Core/Transform.h"

// Sensors related data structures
%include "iDynTree/Sensors/Sensors.hpp"
%include "iDynTree/Sensors/SixAxisFTSensor.hpp"

%include "sensors.i"

// Sensors loading from external formats
%include "iDynTree/ModelIO/URDFSensorsImport.h"

// Regressors related data structures
%include "iDynTree/Regressors/DynamicsRegressorParameters.h"
%include "iDynTree/Regressors/DynamicsRegressorGenerator.h"

// High level interfaces
%include "iDynTree/HighLevel/DynamicsComputations.h"

