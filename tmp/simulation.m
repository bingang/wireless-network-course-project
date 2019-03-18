for t = 1:SIMULATION_TIME
    disp(sprintf('t: %d\n', t));

    run ms_move.m;
    run calc_rxpow.m;
    run calc_sinr.m;
    run calc_avg_sinr.m;
    run find_max_sinr_bs.m;

    run handoff.m;
    run dropout.m;
    run tic.m;
end