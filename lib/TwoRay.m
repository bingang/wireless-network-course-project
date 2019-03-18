classdef TwoRay < PathLoss
properties
end

methods
    %% TwoRay: constructor
    function [obj] = TwoRay()
        obj@PathLoss();
    end

    %% T: response
    function [t] = T(obj, d, h_t, h_r)
        t = (h_t * h_r)^2 / d^4;
    end
end

end