for n = 1:numMS
    ms = MS{n};
    if ~isa(ms.registeredBS, 'BaseStation')
        if ~ms.duringHandoff
            bsId = keys(ms.SINR);
            SINR = values(ms.SINR, bsId);
            [m, idx] = max(cell2mat(SINR));
            ms.startHandoff(ms.lastBs, BS{bsId{idx}}, HANDOFF_TIME);
        end
    end
end