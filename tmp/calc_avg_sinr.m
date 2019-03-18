for n = 1:numBS
    bs = BS{n};
    for m = 1:numMS
        ms = MS{m};
        avgSINR = ((HANDOFF_WINDOW-1) * bs.avgSINR(ms.id) + bs.SINR(ms.id)) / HANDOFF_WINDOW;
        bs.avgSINR(ms.id) = avgSINR;
        ms.avgSINR(bs.id) = avgSINR;
    end
end