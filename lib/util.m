%% util: export function
function [f] = util()
  f.dB_to_dBm = @dB_to_dBm;
  f.dBm_to_dB = @dBm_to_dB;
  f.w_to_dB = @w_to_dB;
  f.w_to_dBm = @w_to_dBm;
  f.dB_to_w = @dB_to_w;
  f.dBm_to_w = @dBm_to_w;
  f.C_to_K = @C_to_K;
  f.thermalNoise = @thermalNoise;
  f.SINR = @SINR;
  f.geoDist = @geoDist;
  f.shannonCapacity = @shannonCapacity;
end

%% dB_to_dBm: function description
function [dBm] = dB_to_dBm(dB)
  dBm = dB + 30;
end

%% dBm_to_dB: function description
function [dB] = dBm_to_dB(dBm)
  dB = dBm - 30;
end

%% w_to_dB: function description
function [dB] = w_to_dB(w)
  dB = 10 * log10(w);
end

%% w_to_dBm: function description
function [dBm] = w_to_dBm(w)
  dBm = dB_to_dBm(w_to_dB(w));
end

%% dB_to_w: function description
function [w] = dB_to_w(dB)
  w = 10^(dB / 10);
end

%% dBm_to_w: function description
function [w] = dBm_to_w(dBm)
  w = dB_to_w(dBm_to_dB(dBm));
end

%% C_to_K: function description
function [K] = C_to_K(C)
  K = C + 273.15;
end

%% thermalNoise: function description
function [n] = thermalNoise(T, B)
  n = physconst('Boltzmann') * T * B;
end

%% SINR: function description
function [R] = SINR(S, I, N)
  R = S / (I + N);
end

%% geo: function description
function [d] = geoDist(loc1, loc2)
  d = pdist([loc1; loc2]);
end

%% shannonCapacity: function description
function [c] = shannonCapacity(B, S, I, N)
  c = B * log2(1+SINR(S, I, N));
end
