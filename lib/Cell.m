classdef Cell < handle
properties
    coordinate;
    location;
end

methods
    %% Cell: constructor
    function [obj] = Cell(coordinate, location)
        obj.coordinate = coordinate;
        obj.location = location;
    end

    %% vertices: return hexagon vertices
    function [x, y] = vertices(obj)
        phase = linspace(0, 5*pi/3, 6);
        x = cos(phase) + obj.location(1);
        y = sin(phase) + obj.location(2);
    end

    %% showBoundary: show boundary
    function [obj] = showBoundary(obj, r)
        [x, y] = obj.vertices();
        hold on;
        plot(r*[x, x(1)], r*[y, y(1)], 'r');
        hold off;
    end

    %% showId: show id
    function [obj] = showId(obj, id, r)
        hold on;
        text(r*obj.location(1), r*obj.location(2), sprintf('%d', id), 'Color', 'black');
        hold off;
    end

end

end