function [y, T, residual, g1] = static_10(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  residual(1)=(y(21)*(1-params(15))+(1-params(15))*params(17)*params(16)/params(19)*(y(13)+y(31))+(1-params(15))*params(18)*params(20)*(y(11)+y(33))-params(15)*y(29)+y(36)+params(14)*y(38))-(params(13)*y(17)+params(12)*y(19)+params(1)*y(36));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=1-params(1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
