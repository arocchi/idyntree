/*
 * Copyright (C) 2015 Fondazione Istituto Italiano di Tecnologia
 * Authors: Silvio Traversaro
 * CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT
 *
 */

#ifndef IDYNTREE_ROTATION_SEMANTICS_H
#define IDYNTREE_ROTATION_SEMANTICS_H

#include <string>

namespace iDynTree
{
    class PositionSemantics;

    /**
     * Class providing the semantics for iDynTree::Rotation class.
     *
     * \ingroup iDynTreeCore
     */
    class RotationSemantics
    {
    protected:
        int orientationFrame;
        int refOrientationFrame;
        int coordinateFrame;

        /**
         * @name Semantics checkers
         * Check if a given operation is possible or not, given the semantics of the operators.
         */
        ///@{
        bool check_changeOrientFrame(const RotationSemantics & newOrientFrame);
        bool check_changeRefOrientFrame(const RotationSemantics & newRefOrientFrame);
        bool check_changeCoordFrameOf(const PositionSemantics & op) const;
        static bool check_compose(const RotationSemantics & op1, const RotationSemantics & op2);
        static bool check_inverse2(const RotationSemantics & op);
        ///@}
        
    public:
        /**
         * Default constructor: initialize all semantics to unknown;
         */
        RotationSemantics();

        /**
         * Constructor: initialize semantics from individual parameters
         *
         */
        RotationSemantics(int _orientationFrame, int _refOrientationFrame);

        /**
         * Copy constructor: create a RotationSemantics from another RotationSemantics
         */
        RotationSemantics(const RotationSemantics & other);

        /**
         * Denstructor
         */
        ~RotationSemantics();
        
        /**
         * @name Semantics setters and getters.
         *  Semantics setters and getters.
         */
        ///@{
        int getOrientationFrame() const;
        int getReferenceOrientationFrame() const;
        int getCoordinateFrame() const;
        void setOrientationFrame(int _orientationFrame);
        void setReferenceOrientationFrame(int _refOrientationFrame);
        void setCoordinateFrame(int _coordinateFrame);
    ///@}
        
        /**
         * @name Semantics operations
         * Compute the semantics of the result given the semantics of the operands.
         */
        ///@{
        bool changeOrientFrame(const RotationSemantics & newOrientFrame);
        bool changeRefOrientFrame(const RotationSemantics & newRefOrientFrame);
        bool changeCoordFrameOf(const PositionSemantics & other, PositionSemantics & result) const;
        static bool compose(const RotationSemantics & op1, const RotationSemantics & op2, RotationSemantics & result);
        static bool inverse2(const RotationSemantics & op, RotationSemantics & result);
        ///@}



        /** @name Output helpers.
         *  Output helpers.
         */
        ///@{
        std::string toString() const;

        std::string reservedToString() const;
        ///@}

    };
}

#endif /* IDYNTREE_POSITION_SEMANTICS_H */