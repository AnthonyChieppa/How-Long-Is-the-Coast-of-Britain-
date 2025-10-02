% Task # 4 - Boundary Length function l = poly_len(p, s, e) 
% This function takes the polynomial p, starting and ending points s, e and returns
% the curve length of the polynomial l.

function l = poly_len(p, s, e)
% p - fitted plynomial coefficients
% s - left bound on x
% e - right bound on x

f = polyder(p); % df/dx
% returns the derivative of the polynomial represented by the coefficients in p.
ds = @(x) sqrt(1 + (polyval(f, x)).^2); % ds = sqrt(1+(df/dx)^2)
% Curve length derivative with only x as its arguments.
l = integral(ds, s, e, 'RelTol',1e-8,'AbsTol',1e-13); 
% Calculates the curve length by integrating ds from s to e.

end % Ends function and returns the curve length of the polynomial.


% Command Window Example (# steps):
% 1) x = linspace(-2, 1, 1000)
% 2) y = linspace(-1.5, 1.5, 1000)
% 3) p = polyfit(x, y, 15)

% 4) Then poly_len(p, -1, 1), ans = 2.8284.
