for n = 1:numBS
    bs = BS{n};
    for m = 1:numMS
        ms = MS{m};
        d = ms.dist(bs, r);
        rxPow = rpModel.rxPow({d, height_BS, height_MS}, {mu, sigma}, {}, ms.txPow, ms.txGain, bs.rxGain);
        bs.rxPow(ms.id) = rxPow;
    end
end