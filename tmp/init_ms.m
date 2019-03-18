while numel(MS) < numMS
    bsId = randi(numBS);
    [cellVerticesX, cellVerticesY] = BS{bsId}.cell.vertices();
    isIn = false;
    rndX = Inf;
    rndY = Inf;
    while ~isIn
        rndX = 2 * rand() - 1 + BS{bsId}.location(1);
        rndY = 2 * rand() - 1 + BS{bsId}.location(2);
        isIn = inpolygon(rndX, rndY, cellVerticesX, cellVerticesY);
    end
    MS{end+1} = MobileStation(numel(MS)+1, [rndX, rndY], height_MS, txPow_MS, txGain_MS, rxGain_MS, MS_SPEEDRANGE, MS_MOVINGTIMERANGE);
end

run calc_rxpow.m;
run calc_sinr;
run find_max_sinr_bs.m;

for n = 1:numBS
    bs = BS{n};
    for m = 1:numMS
        ms = MS{m};
        SINR = bs.SINR(ms.id);
        bs.avgSINR(ms.id) = SINR;
        ms.avgSINR(bs.id) = SINR;
    end
end


for n = 1:numMS
    ms = MS{n};
    ms.registeredBS = ms.maxSINRBS;
    ms.bsHistory(end+1) = ms.registeredBS.id;
end