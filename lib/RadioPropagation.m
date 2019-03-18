classdef RadioPropagation
properties
    pathLoss;
    shadowing;
    fading;
end

methods
    %% RadioPropagation: constructor
    function [obj] = RadioPropagation(pathLoss, shadowing, fading)
        obj.pathLoss = pathLoss;
        obj.shadowing = shadowing;
        obj.fading = fading;
    end

    %% rxPow: compute receive power
    function [p] = rxPow(obj, plArgs, sdArgs, fdArgs, txPow, txGain, rxGain)
        p = obj.pathLoss.T(plArgs{:}) * obj.shadowing.T(sdArgs{:}) * obj.fading.T(fdArgs{:}) * txPow * txGain * rxGain;
    end

end


end