function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 5
    T = [T; NaN(5 - size(T, 1), 1)];
end
T(1) = (1-params(1))*(1-params(5))*params(16)/(1-params(16));
T(2) = (1-params(6))*(1-params(5))*params(16)/(1-params(16));
T(3) = params(15)/(1-params(15));
T(4) = params(16)/(1-params(16))*(params(5)+(1-params(5))*params(6));
T(5) = (1-params(15))*params(17)*params(16)/params(19);
end
