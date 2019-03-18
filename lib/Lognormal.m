classdef Lognormal < Shadowing

methods
  %% Lognormal: constructor
  function [obj] = Lognormal()
    obj@Shadowing();
  end
  
  %% T: response
  function [t] = T(obj, mu, sigma)
    t = lognrnd(mu, sigma);
  end
  
end

end