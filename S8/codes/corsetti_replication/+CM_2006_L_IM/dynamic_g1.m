function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = CM_2006_L_IM.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(43, 67);
g1(1,10)=1;
g1(1,12)=(-(params(4)*(1-params(11))));
g1(1,13)=(-((1-params(11))*(1-params(4))));
g1(1,16)=(-params(11));
g1(2,11)=1;
g1(2,14)=(-((1-params(11))*(1-params(4))));
g1(2,15)=(-(params(4)*(1-params(11))));
g1(2,17)=(-params(11));
g1(3,24)=1-params(11);
g1(3,26)=(-params(13));
g1(3,28)=(-params(12));
g1(4,25)=1-params(11);
g1(4,27)=(-params(13));
g1(4,29)=(-params(12));
g1(5,10)=1;
g1(5,18)=(-1);
g1(5,20)=(-params(2));
g1(5,22)=(-(1-params(2)));
g1(6,11)=1;
g1(6,19)=(-1);
g1(6,21)=(-params(2));
g1(6,23)=(-(1-params(2)));
g1(7,12)=(-params(4));
g1(7,14)=(-(1-params(4)));
g1(7,24)=1;
g1(8,13)=(-(1-params(4)));
g1(8,15)=(-params(4));
g1(8,25)=1;
g1(9,12)=1;
g1(9,24)=(-1);
g1(9,30)=params(3);
g1(10,14)=1;
g1(10,24)=(-1);
g1(10,31)=params(3);
g1(11,15)=1;
g1(11,25)=(-1);
g1(11,33)=params(3);
g1(12,13)=1;
g1(12,25)=(-1);
g1(12,32)=params(3);
g1(13,22)=(-T(1));
g1(13,26)=(-((-params(5))*(1-params(1))));
g1(13,34)=1;
g1(14,23)=(-T(1));
g1(14,27)=(-((-params(5))*(1-params(1))));
g1(14,35)=1;
g1(15,22)=T(2);
g1(15,26)=(-(params(5)*(1-params(6))-1));
g1(15,36)=1;
g1(16,23)=T(2);
g1(16,27)=(-(params(5)*(1-params(6))-1));
g1(16,37)=1;
g1(17,22)=(-T(4));
g1(17,26)=(-(params(5)*(1-params(6))));
g1(17,30)=1;
g1(17,36)=1;
g1(17,38)=(-T(3));
g1(17,40)=1;
g1(18,23)=(-T(4));
g1(18,27)=(-(params(5)*(1-params(6))));
g1(18,33)=1;
g1(18,37)=1;
g1(18,39)=(-T(3));
g1(18,41)=1;
g1(19,53)=(-(1-params(1)*(1-params(7))));
g1(19,34)=(-1);
g1(19,36)=1;
g1(19,56)=(-1);
g1(19,58)=(-((1-params(1)*(1-params(7)))*(-T(3))));
g1(19,60)=(-(1-params(1)*(1-params(7))));
g1(20,55)=(-(1-params(1)*(1-params(7))));
g1(20,35)=(-1);
g1(20,37)=1;
g1(20,57)=(-1);
g1(20,59)=(-((1-params(1)*(1-params(7)))*(-T(3))));
g1(20,61)=(-(1-params(1)*(1-params(7))));
g1(21,10)=(-1);
g1(21,20)=1;
g1(21,42)=1;
g1(22,11)=(-1);
g1(22,21)=1;
g1(22,43)=1;
g1(23,10)=(-1);
g1(23,22)=1;
g1(23,40)=1;
g1(24,11)=(-1);
g1(24,23)=1;
g1(24,41)=1;
g1(25,5)=(-(1-params(7)));
g1(25,20)=1;
g1(25,28)=(-params(7));
g1(26,6)=(-(1-params(7)));
g1(26,21)=1;
g1(26,29)=(-params(7));
g1(27,30)=(-1);
g1(27,53)=1;
g1(27,34)=1;
g1(27,36)=(-1);
g1(27,56)=1;
g1(27,44)=(-1);
g1(28,54)=1;
g1(28,33)=(-1);
g1(28,35)=1;
g1(28,37)=(-1);
g1(28,57)=1;
g1(28,44)=(-1);
g1(29,20)=(1-params(15))*params(18)*params(20);
g1(29,22)=T(5);
g1(29,26)=(-params(13));
g1(29,28)=(-params(12));
g1(29,30)=1-params(15);
g1(29,38)=(-params(15));
g1(29,40)=T(5);
g1(29,42)=(1-params(15))*params(18)*params(20);
g1(29,9)=1;
g1(29,45)=(-params(1));
g1(29,47)=params(14);
g1(30,45)=1;
g1(30,46)=(-1);
g1(31,31)=(-1);
g1(31,33)=1;
g1(31,49)=1;
g1(32,30)=(-1);
g1(32,32)=1;
g1(32,49)=1;
g1(33,10)=(-params(15));
g1(33,16)=params(11);
g1(33,38)=(-params(15));
g1(33,47)=params(14);
g1(34,11)=(-params(15));
g1(34,17)=params(11);
g1(34,39)=(-params(15));
g1(34,48)=params(14);
g1(35,30)=1;
g1(35,31)=(-1);
g1(35,50)=1;
g1(36,13)=(-((1-params(11))*(1-params(4))));
g1(36,14)=(1-params(11))*(1-params(4));
g1(36,50)=(1-params(11))*(1-params(4));
g1(36,51)=1;
g1(37,28)=(-1);
g1(37,29)=1;
g1(37,52)=1;
g1(38,3)=(-params(8));
g1(38,18)=1;
g1(38,62)=(-1);
g1(39,4)=(-params(8));
g1(39,19)=1;
g1(39,63)=(-1);
g1(40,1)=(-params(9));
g1(40,16)=1;
g1(40,64)=(-1);
g1(41,2)=(-params(9));
g1(41,17)=1;
g1(41,65)=(-1);
g1(42,7)=(-params(10));
g1(42,38)=1;
g1(42,66)=(-1);
g1(43,8)=(-params(10));
g1(43,39)=1;
g1(43,67)=(-1);

end
