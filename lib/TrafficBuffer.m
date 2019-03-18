classdef TrafficBuffer < handle
properties
    maxSize;
    usedAmount;
end


methods
    %% TrafficBuffer: constructor
    function [obj] = TrafficBuffer(maxSize)
        obj.maxSize = maxSize;
        obj.usedAmount = 0;
    end

    %% dataIn: receive data into buffer
    function [overFlow] = dataIn(obj, inAmount)
        obj.usedAmount = obj.usedAmount + inAmount;
    end
    
    %% dataOut: reduce data in buffer
    function [obj] = dataOut(obj, outAmount)
        obj.usedAmount = max([obj.usedAmount-outAmount, 0]);
    end

    %% isOverflow: true if overflow
    function [bool] = isOverflow(obj)
        bool = obj.usedAmount > obj.maxSize;
    end

    %% drop: drop overflow data 
    function [dropped] = drop(obj)
        dropped = max([obj.usedAmount-obj.maxSize, 0]);
        obj.usedAmount = obj.usedAmount - dropped;
    end

    %% clear: clean buffer
    function [obj] = clear(obj)
        obj.usedAmount = 0;
    end

end

end