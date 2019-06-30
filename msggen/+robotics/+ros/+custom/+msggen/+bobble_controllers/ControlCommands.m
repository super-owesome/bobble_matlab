classdef ControlCommands < robotics.ros.Message
    %ControlCommands MATLAB implementation of bobble_controllers/ControlCommands
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2019 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'bobble_controllers/ControlCommands' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = '94d686c1501c58970b95b53d2dba06f1' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Dependent)
        StartupCmd
        IdleCmd
        DiagnosticCmd
    end
    
    properties (Constant, Hidden)
        PropertyList = {'DiagnosticCmd', 'IdleCmd', 'StartupCmd'} % List of non-constant message properties
        ROSPropertyList = {'DiagnosticCmd', 'IdleCmd', 'StartupCmd'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = ControlCommands(msg)
            %ControlCommands Construct the message object ControlCommands
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function startupcmd = get.StartupCmd(obj)
            %get.StartupCmd Get the value for property StartupCmd
            startupcmd = logical(obj.JavaMessage.getStartupCmd);
        end
        
        function set.StartupCmd(obj, startupcmd)
            %set.StartupCmd Set the value for property StartupCmd
            validateattributes(startupcmd, {'logical', 'numeric'}, {'nonempty', 'scalar'}, 'ControlCommands', 'StartupCmd');
            
            obj.JavaMessage.setStartupCmd(startupcmd);
        end
        
        function idlecmd = get.IdleCmd(obj)
            %get.IdleCmd Get the value for property IdleCmd
            idlecmd = logical(obj.JavaMessage.getIdleCmd);
        end
        
        function set.IdleCmd(obj, idlecmd)
            %set.IdleCmd Set the value for property IdleCmd
            validateattributes(idlecmd, {'logical', 'numeric'}, {'nonempty', 'scalar'}, 'ControlCommands', 'IdleCmd');
            
            obj.JavaMessage.setIdleCmd(idlecmd);
        end
        
        function diagnosticcmd = get.DiagnosticCmd(obj)
            %get.DiagnosticCmd Get the value for property DiagnosticCmd
            diagnosticcmd = logical(obj.JavaMessage.getDiagnosticCmd);
        end
        
        function set.DiagnosticCmd(obj, diagnosticcmd)
            %set.DiagnosticCmd Set the value for property DiagnosticCmd
            validateattributes(diagnosticcmd, {'logical', 'numeric'}, {'nonempty', 'scalar'}, 'ControlCommands', 'DiagnosticCmd');
            
            obj.JavaMessage.setDiagnosticCmd(diagnosticcmd);
        end
    end
    
    methods (Access = protected)
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Iterate over all primitive properties
            cpObj.StartupCmd = obj.StartupCmd;
            cpObj.IdleCmd = obj.IdleCmd;
            cpObj.DiagnosticCmd = obj.DiagnosticCmd;
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.StartupCmd = strObj.StartupCmd;
            obj.IdleCmd = strObj.IdleCmd;
            obj.DiagnosticCmd = strObj.DiagnosticCmd;
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.StartupCmd = obj.StartupCmd;
            strObj.IdleCmd = obj.IdleCmd;
            strObj.DiagnosticCmd = obj.DiagnosticCmd;
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.bobble_controllers.ControlCommands.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.bobble_controllers.ControlCommands;
            obj.reload(strObj);
        end
    end
end
