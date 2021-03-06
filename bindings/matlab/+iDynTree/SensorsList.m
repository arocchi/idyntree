classdef SensorsList < SwigRef
  methods
    function self = SensorsList(varargin)
      if nargin~=1 || ~ischar(varargin{1}) || ~strcmp(varargin{1},'_swigCreate')
        % How to get working on C side? Commented out, replaed by hack below
        %self.swigCPtr = iDynTreeMATLAB_wrap(303,'new_SensorsList',varargin{:});
        %self.swigOwn = true;
        tmp = iDynTreeMATLAB_wrap(303,'new_SensorsList',varargin{:}); % FIXME
        self.swigCPtr = tmp.swigCPtr;
        self.swigOwn = tmp.swigOwn;
        self.swigType = tmp.swigType;
        tmp.swigOwn = false;
      end
    end
    function delete(self)
      if self.swigOwn
        iDynTreeMATLAB_wrap(304,'delete_SensorsList',self);
        self.swigOwn=false;
      end
    end
    function varargout = addSensor(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(305,'SensorsList_addSensor',self,varargin{:});
    end
    function varargout = getNrOfSensors(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(306,'SensorsList_getNrOfSensors',self,varargin{:});
    end
    function varargout = getSensorIndex(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(307,'SensorsList_getSensorIndex',self,varargin{:});
    end
    function varargout = getSensor(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(308,'SensorsList_getSensor',self,varargin{:});
    end
    function varargout = getSixAxisForceTorqueSensor(self,varargin)
      [varargout{1:max(1,nargout)}] = iDynTreeMATLAB_wrap(309,'SensorsList_getSixAxisForceTorqueSensor',self,varargin{:});
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
  end
end
