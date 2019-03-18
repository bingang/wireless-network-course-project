for n = 1:numMS
    ms = MS{n};
    newLoc = ms.nextMove() + ms.location;
    while ~inpolygon(newLoc(1), newLoc(2), hGrid.bndX, hGrid.bndY)
        ms.changeAng();
        newLoc = ms.nextMove() + ms.location;
    end
    ms.location = newLoc;
end