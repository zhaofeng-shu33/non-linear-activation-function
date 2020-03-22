function f = matlab_integration(n, k)
% Usage: matlab_integration(8, 4) = 1
% numerical integration for multivaraite Beta function
C0 = gamma(n/2) * gamma((n-1)/2) / (gamma(0.5) * gamma(k/2) * gamma((k-1)/2) * gamma((n-k)/2) * gamma((n-k-1)/2));
f =  2 * C0 * integral3(@(x,y,z) (x.*y-z.^2).^((k-3)/2) .* (1-x-y+x.*y-z.^2).^((n-k-3)/2), 0,1,0,1,0,@(x,y) min(sqrt(x.*y), sqrt(1-x-y+x.*y)));
end