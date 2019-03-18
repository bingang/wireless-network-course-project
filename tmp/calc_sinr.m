for n = 1:numBS
    bs = BS{n};
    totalPow = sum(cell2mat(values(bs.rxPow)));
    for m = 1:numMS
        ms = MS{m};
        rxPow = bs.rxPow(ms.id);
        SINR = ut.SINR(rxPow, totalPow-rxPow, thermalNoise);
        bs.SINR(ms.id) = SINR;
        ms.SINR(bs.id) = SINR;
    end
end