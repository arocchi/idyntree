classdef SpatialInertiaRaw < SwigRef
  methods
    function self = SpatialInertiaRaw(varargin)
      if nargin~=1 || ~ischar(varargin{1}) || ~strcmp(varargin{1},'_swigCreate')
        % How to get working on C side? Commented out, replaed by hack below
        %self.swigCPtr = iDynTreeMATLAB_wrap(210,'new_SpatialInertiaRaw',varargin{:});
        %self.swigOwn = true;
        tmp = iDynTreeMATLAB_wrap(210,'new_SpatialInertiaRaw',varargin{:}); % FIXME
        self.swigCPtr = tmp.swigCPtr;
        self.swigOwn = tmp.swigOwn;
        self.swigType = tmp.swigType;
        tmp.swigOwn = false;
      end
    end
    function delete(self)
      if self.swigOwn
        iDynTreeMATLAB_wrap(211,'delete_SpatialInertiaRaw',self);
        self.swigOwn=false;
      end
    end
    function varargout = getMass(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(212,'SpatialInertiaRaw_getMass',self,varargin{:});
    end
    function varargout = getCenterOfMass(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(213,'SpatialInertiaRaw_getCenterOfMass',self,varargin{:});
    end
    function varargout = getRotationalInertiaWrtFrameOrigin(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(214,'SpatialInertiaRaw_getRotationalInertiaWrtFrameOrigin',self,varargin{:});
    end
    function varargout = getRotationalInertiaWrtCenterOfMass(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(215,'SpatialInertiaRaw_getRotationalInertiaWrtCenterOfMass',self,varargin{:});
    end
    function varargout = multiply(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(217,'SpatialInertiaRaw_multiply',self,varargin{:});
    end
    function varargout = zero(self,varargin)
      [varargout{1:nargout}] = iDynTreeMATLAB_wrap(218,'SpatialInertiaRaw_zero',self,varargin{:});
    end
    function [v,ok] = swig_fieldsref(self,i)
      v = [];
      ok = false;
      switch i
      end
    end
    function [self,ok] = swig_fieldasgn(self,i,v)
      switch i
      end
    end
  end
  methods(Static)
    function varargout = combine(varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(216,'SpatialInertiaRaw_combine',varargin{:});
    end
  end
end
