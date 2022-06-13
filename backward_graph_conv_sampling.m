function [dLdW, dLdX] = backward_graph_conv_sampling(A, X, W, p, dLdZ)

p = p(:);
n = length(p);
[r,h]=size(dLdZ);
TempA=ones(1,h);
p=p*TempA;

A_dLdZ_p = ((A' * dLdZ) ./ p) / n;
dLdW = X' * A_dLdZ_p;

if nargout == 1
  return;
end

dLdX = A_dLdZ_p * W';
