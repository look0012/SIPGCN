function dLdP = backward_cross_entropy(P, Y)

n = size(Y,1);
dLdP = - Y ./ P / n;
