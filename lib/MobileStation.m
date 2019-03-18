classdef MobileStation < Station 
properties
    speedRange;
    movingTimeRange;
    ang;
    speed;
    bsHistory;
    handoffTime;
    registerBsId;
    lastBs;
    newBs;
    timeCount;

    currentBS;
    registeredBS;
    maxSINRBS;
    handoffClock;
    mobileClock;
end

methods
    %% MobileStation: constructor
    %function [obj] = MobileStation(id, location, height, txPow, txGain, rxGain, mobility, handoffClockm, mobileClock)
    function [obj] = MobileStation(id, location, height, txPow, txGain, rxGain, speedRange, movingTimeRange)
        obj@Station(id, location, height, txPow, txGain, rxGain);
        obj.timeCount = 0;
        obj.ang = 0;
        obj.speed = 0;
        obj.bsHistory = [];
        obj.handoffTime = -1;
        obj.registerBsId = 0;
        obj.speedRange = speedRange;
        obj.movingTimeRange = movingTimeRange;
        %obj.handoffClock = handoffClock;
        %obj.mobileClock = mobileClock;
    end

    %% showLoc: show location
    function [obj] = showLoc(obj, r)
        hold on;
        scatter(r*obj.location(1), r*obj.location(2), [], 'b', 'filled', 'o');
        hold off;
    end

    %% nextMove: random walk
    function [newLoc] = nextMove(obj)
        if obj.timeCount == 0
            obj.changeAng();
            obj.speed = (obj.speedRange(2)-obj.speedRange(1)) * rand() + obj.speedRange(1);
            obj.timeCount = randsample(obj.movingTimeRange(2), 1);
        end
        obj.clock();
        newLoc = obj.speed * [cos(obj.ang), sin(obj.ang)];
    end
    
    %% startHandoff: start handoff
    function [obj] = startHandoff(obj, lastBs, newBs, handoffTime)
        obj.handoffTime = handoffTime;
        obj.lastBs = lastBs;
        obj.newBs = newBs;
    end

    %% clock: clock++
    function [obj] = clock(obj)
        obj.handoffTime = obj.handoffTime - 1;
        obj.timeCount = obj.timeCount - 1;
        obj.bsHistory(end+1) = obj.registerBsId;
        if obj.handoffTime == 0
            if isKey(obj.lastBs.register, obj.id)
                remove(obj.lastBs.register, obj.id);
            end
            obj.newBs.register(obj.id) = true;
            obj.registerBsId = obj.newBs.id;
            obj.lastBs = obj.newBs;
            obj.newBs = [];
        end
    end

    %% changeAng: chage ang
    function [obj] = changeAng(obj)
        obj.ang = 2 * pi * rand();
    end

    %% tic: tic
    function [obj] = tic(obj)
        obj.clock.tic();
        if obj.clock.timeup

        end
    end

    %% duringHandoff: function description
    function [bool] = duringHandoff(obj)
        bool = obj.handoffClock.getTime() > 0;
    end
    


end

end