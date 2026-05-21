function [y, T, residual, g1] = dynamic_5(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  residual(1)=(y(64)*(1-params(15))+(1-params(15))*params(17)*params(16)/params(19)*(y(56)+y(74))+(1-params(15))*params(18)*params(20)*(y(54)+y(76))-params(15)*y(72)+y(36)+params(14)*y(81))-(params(13)*y(60)+params(12)*y(62)+params(1)*y(79));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=(-params(1));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
