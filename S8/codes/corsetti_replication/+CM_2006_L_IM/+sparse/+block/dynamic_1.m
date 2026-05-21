function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(52)=params(8)*y(9)+x(1);
  y(53)=params(8)*y(10)+x(2);
  y(50)=params(9)*y(7)+x(3);
  y(51)=params(9)*y(8)+x(4);
  y(72)=params(10)*y(29)+x(5);
  y(73)=params(10)*y(30)+x(6);
end
