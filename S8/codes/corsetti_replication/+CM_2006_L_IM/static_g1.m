function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = CM_2006_L_IM.static_g1_tt(T, y, x, params);
end
g1 = zeros(43, 43);
g1(1,1)=1;
g1(1,3)=(-(params(4)*(1-params(11))));
g1(1,4)=(-((1-params(11))*(1-params(4))));
g1(1,7)=(-params(11));
g1(2,2)=1;
g1(2,5)=(-((1-params(11))*(1-params(4))));
g1(2,6)=(-(params(4)*(1-params(11))));
g1(2,8)=(-params(11));
g1(3,15)=1-params(11);
g1(3,17)=(-params(13));
g1(3,19)=(-params(12));
g1(4,16)=1-params(11);
g1(4,18)=(-params(13));
g1(4,20)=(-params(12));
g1(5,1)=1;
g1(5,9)=(-1);
g1(5,11)=(-params(2));
g1(5,13)=(-(1-params(2)));
g1(6,2)=1;
g1(6,10)=(-1);
g1(6,12)=(-params(2));
g1(6,14)=(-(1-params(2)));
g1(7,3)=(-params(4));
g1(7,5)=(-(1-params(4)));
g1(7,15)=1;
g1(8,4)=(-(1-params(4)));
g1(8,6)=(-params(4));
g1(8,16)=1;
g1(9,3)=1;
g1(9,15)=(-1);
g1(9,21)=params(3);
g1(10,5)=1;
g1(10,15)=(-1);
g1(10,22)=params(3);
g1(11,6)=1;
g1(11,16)=(-1);
g1(11,24)=params(3);
g1(12,4)=1;
g1(12,16)=(-1);
g1(12,23)=params(3);
g1(13,13)=(-T(1));
g1(13,17)=(-((-params(5))*(1-params(1))));
g1(13,25)=1;
g1(14,14)=(-T(1));
g1(14,18)=(-((-params(5))*(1-params(1))));
g1(14,26)=1;
g1(15,13)=T(2);
g1(15,17)=(-(params(5)*(1-params(6))-1));
g1(15,27)=1;
g1(16,14)=T(2);
g1(16,18)=(-(params(5)*(1-params(6))-1));
g1(16,28)=1;
g1(17,13)=(-T(3));
g1(17,17)=(-(params(5)*(1-params(6))));
g1(17,21)=1;
g1(17,27)=1;
g1(17,29)=(-(params(15)/(1-params(15))));
g1(17,31)=1;
g1(18,14)=(-T(3));
g1(18,18)=(-(params(5)*(1-params(6))));
g1(18,24)=1;
g1(18,28)=1;
g1(18,30)=(-(params(15)/(1-params(15))));
g1(18,32)=1;
g1(19,21)=(-(1-params(1)*(1-params(7))));
g1(19,25)=(-1);
g1(19,29)=(-((1-params(1)*(1-params(7)))*(-(params(15)/(1-params(15))))));
g1(19,33)=(-(1-params(1)*(1-params(7))));
g1(20,24)=(-(1-params(1)*(1-params(7))));
g1(20,26)=(-1);
g1(20,30)=(-((1-params(1)*(1-params(7)))*(-(params(15)/(1-params(15))))));
g1(20,34)=(-(1-params(1)*(1-params(7))));
g1(21,1)=(-1);
g1(21,11)=1;
g1(21,33)=1;
g1(22,2)=(-1);
g1(22,12)=1;
g1(22,34)=1;
g1(23,1)=(-1);
g1(23,13)=1;
g1(23,31)=1;
g1(24,2)=(-1);
g1(24,14)=1;
g1(24,32)=1;
g1(25,11)=1-(1-params(7));
g1(25,19)=(-params(7));
g1(26,12)=1-(1-params(7));
g1(26,20)=(-params(7));
g1(27,25)=1;
g1(27,35)=(-1);
g1(28,23)=1;
g1(28,24)=(-1);
g1(28,26)=1;
g1(28,35)=(-1);
g1(29,11)=(1-params(15))*params(18)*params(20);
g1(29,13)=T(4);
g1(29,17)=(-params(13));
g1(29,19)=(-params(12));
g1(29,21)=1-params(15);
g1(29,29)=(-params(15));
g1(29,31)=T(4);
g1(29,33)=(1-params(15))*params(18)*params(20);
g1(29,36)=1-params(1);
g1(29,38)=params(14);
g1(30,36)=1;
g1(30,37)=(-1);
g1(31,22)=(-1);
g1(31,24)=1;
g1(31,40)=1;
g1(32,21)=(-1);
g1(32,23)=1;
g1(32,40)=1;
g1(33,1)=(-params(15));
g1(33,7)=params(11);
g1(33,29)=(-params(15));
g1(33,38)=params(14);
g1(34,2)=(-params(15));
g1(34,8)=params(11);
g1(34,30)=(-params(15));
g1(34,39)=params(14);
g1(35,21)=1;
g1(35,22)=(-1);
g1(35,41)=1;
g1(36,4)=(-((1-params(11))*(1-params(4))));
g1(36,5)=(1-params(11))*(1-params(4));
g1(36,41)=(1-params(11))*(1-params(4));
g1(36,42)=1;
g1(37,19)=(-1);
g1(37,20)=1;
g1(37,43)=1;
g1(38,9)=1-params(8);
g1(39,10)=1-params(8);
g1(40,7)=1-params(9);
g1(41,8)=1-params(9);
g1(42,29)=1-params(10);
g1(43,30)=1-params(10);

end
