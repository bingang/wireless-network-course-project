classdef Clock < handle
properties
    time;
end

methods
    %% Clock: constructor
    function [obj] = Clock(time)
        obj.time = time;
    end

    %% tic: time--
    function [obj] = tic(obj)
        obj.time = obj.time - 1;
    end

    %% setTime: setter
    function [obj] = setTime(obj, time)
        obj.time = time;
    end

    %% timeup: time == 0
    function [bool] = timeup(obj)
        bool = obj.time == 0;
    end

    %% getTime: function description
    function [t] = getTime(obj)
        t = obj.time;
    end
        

end


end