classdef BaseStation < Station 
properties
    cell;
    register;
end

methods
    %% BaseStation: constructor
    function [obj] = BaseStation(id, cell, height, txPow, txGain, rxGain)
        obj@Station(id, cell.location, height, txPow, txGain, rxGain);
        obj.cell = cell;
        obj.register = containers.Map('KeyType', 'int32', 'ValueType', 'logical');
    end

    %% showLoc: show location
    function [obj] = showLoc(obj, r)
        hold on;
        scatter(r*obj.location(1), r*obj.location(2), [], 'g', 'filled', 'diamond');
        hold off;
    end



    

end

end