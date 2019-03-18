for n = 1:numMS
    ms = MS{n};
    bsId = keys(ms.SINR);
    SINR = values(ms.SINR, bsId);
    [m, idx] = max(cell2mat(SINR));
    ms.maxSINRBS = BS{bsId{idx}};
end