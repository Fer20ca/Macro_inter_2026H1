function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = CM_2006_L_IM.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(43, 1);
    residual(1) = (y(10)) - (params(4)*(1-params(11))*y(12)+(1-params(11))*(1-params(4))*y(13)+params(11)*y(16));
    residual(2) = (y(11)) - (params(4)*(1-params(11))*y(15)+(1-params(11))*(1-params(4))*y(14)+params(11)*y(17));
    residual(3) = ((1-params(11))*y(24)) - (params(13)*y(26)+params(12)*y(28));
    residual(4) = ((1-params(11))*y(25)) - (params(13)*y(27)+params(12)*y(29));
    residual(5) = (y(10)) - (y(18)+params(2)*y(20)+(1-params(2))*y(22));
    residual(6) = (y(11)) - (y(19)+params(2)*y(21)+(1-params(2))*y(23));
    residual(7) = (y(24)) - (params(4)*y(12)+(1-params(4))*y(14));
    residual(8) = (y(25)) - (params(4)*y(15)+(1-params(4))*y(13));
    residual(9) = (y(12)) - (y(24)+(-params(3))*y(30));
    residual(10) = (y(14)) - (y(24)+(-params(3))*y(31));
    residual(11) = (y(15)) - (y(25)+(-params(3))*y(33));
    residual(12) = (y(13)) - (y(25)+(-params(3))*y(32));
    residual(13) = (y(34)) - (y(26)*(-params(5))*(1-params(1))+y(22)*T(1));
    residual(14) = (y(35)) - (y(27)*(-params(5))*(1-params(1))+y(23)*T(1));
    residual(15) = (y(36)) - (y(26)*(params(5)*(1-params(6))-1)-y(22)*T(2));
    residual(16) = (y(37)) - (y(27)*(params(5)*(1-params(6))-1)-y(23)*T(2));
    residual(17) = (y(30)+y(36)-T(3)*y(38)+y(40)) - (y(26)*params(5)*(1-params(6))+y(22)*T(4));
    residual(18) = (y(33)+y(37)-T(3)*y(39)+y(41)) - (y(27)*params(5)*(1-params(6))+y(23)*T(4));
    residual(19) = (y(36)-y(34)) - ((1-params(1)*(1-params(7)))*(y(53)-T(3)*y(58)+y(60))+y(56));
    residual(20) = (y(37)-y(35)) - ((1-params(1)*(1-params(7)))*(y(55)-T(3)*y(59)+y(61))+y(57));
    residual(21) = (y(42)) - (y(10)-y(20));
    residual(22) = (y(43)) - (y(11)-y(21));
    residual(23) = (y(40)) - (y(10)-y(22));
    residual(24) = (y(41)) - (y(11)-y(23));
    residual(25) = (y(20)) - ((1-params(7))*y(5)+y(28)*params(7));
    residual(26) = (y(21)) - ((1-params(7))*y(6)+y(29)*params(7));
    residual(27) = (y(56)-y(36)) - (y(30)+y(44)-y(53)-y(34));
    residual(28) = (y(57)-y(37)) - (y(33)+y(44)-y(54)-y(35));
    residual(29) = (y(30)*(1-params(15))+T(5)*(y(22)+y(40))+(1-params(15))*params(18)*params(20)*(y(20)+y(42))-params(15)*y(38)+y(9)+params(14)*y(47)) - (params(13)*y(26)+params(12)*y(28)+params(1)*y(45));
    residual(30) = (y(45)) - (y(46));
    residual(31) = (y(49)) - (y(31)-y(33));
    residual(32) = (y(49)) - (y(30)-y(32));
    residual(33) = (params(11)*y(16)) - (params(15)*y(38)+y(10)*params(15)-params(14)*y(47));
    residual(34) = (params(11)*y(17)) - (params(15)*y(39)+y(11)*params(15)-params(14)*y(48));
    residual(35) = (y(50)) - (y(31)-y(30));
    residual(36) = (y(51)) - ((1-params(11))*(1-params(4))*(y(13)-y(14)-y(50)));
    residual(37) = (y(52)) - (y(28)-y(29));
    residual(38) = (y(18)) - (params(8)*y(3)+x(it_, 1));
    residual(39) = (y(19)) - (params(8)*y(4)+x(it_, 2));
    residual(40) = (y(16)) - (params(9)*y(1)+x(it_, 3));
    residual(41) = (y(17)) - (params(9)*y(2)+x(it_, 4));
    residual(42) = (y(38)) - (params(10)*y(7)+x(it_, 5));
    residual(43) = (y(39)) - (params(10)*y(8)+x(it_, 6));

end
