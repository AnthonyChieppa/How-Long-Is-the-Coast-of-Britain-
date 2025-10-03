%%% AMS 595 - Project 2 - How Long Is the Coast Of Britian
clear; clc; % Clear workspace and command window

%% Task 1 - Mandelbrot Fractal it = fractal(c)

% This function takes a complex c and returns the number of iterations till
% divergence.

function it = fractal(c)
    z = 0; % Initalize varaible complex z
    it = 0; % Variable to count the total number of iterations

    % Can manually change '100' to any n.
    while abs(z) < 2 && it < 100 
    % Continuously loops if |z| > 2 
    % and from each iterations until it reaches 100 (the max) 
        z = z^2 + c;
        % Mandelbrot formula that updates if the point belongs in the set. 
        it = it + 1; 
        % Increase the iteration count each time it goes through the loop.
        % If it = 100, then you can assume that c is in the Mandelbrot Set
    end % While loop ends when conditions are met

    if it == 100
    % if the itteration is 100 then it did not diverge.
    % This also means that it is in the Mandelbrot Set.
    end
    
end % End of the function that returns how many iterations till divergence.

% Command Window Example:
% fractal(0+0i) <- In the Manderbrot Set
% fractal(1+0i) <- Not in the Manderbrot Set

%% This function that produces a value of 1 for divergence and -1 for no divergence.

function indicator = divergence_indicator(x, y)
    c = (x + 1i * y);
    % complex c from Re(x) and imag(y)
    it = fractal(c);
    % Calling the fractal function to get iteration count until divergence
    if it == 100 % Can manually change '100' to any n.
    % If statement that produces signifies if the indicator value 
    % is divergent or not based on if it matches the case.
        indicator = -1; % Divergence detected and is in the set
    else
        indicator = 1; % No divergence and is not in the set
    end % End of if statement
end % End of the function that returns if the inputed x and y are in the set.

% Command Window Example:
% divergence_indicator(0, 0i)
% ans = -1 <- is in the set

%% Helper function: indicator function generator

% This function returns an indicator function along a vertical line at a
% given x.

function fn = indicator_fn_at_x(x)
    fn = @(y) divergence_indicator(x, y); 
    % Create and return a y function that is used in the indicator
    % function.
end % End of the function and return the fn.

% Command Window Example:
% 1) fn = indicator_fn_at_x(0.1)
% 2) Then fn(0.1), ans = -1.

%% Mandelbrot Plot with imshow
% Find the fractal boundary for x ∈ [−2,1] for at least 10^3 (1000) points.

% Can manually change the value '1000' to any number of points desired.
x = linspace(-2, 1, 1000); % 1000 x points  in the space of -2 to 1
y = linspace(-1.5, 1.5, 1000); % 1000 y points in the space of -1.5 to 1.5
indicator = zeros(numel(x), numel(y)); % Prellocated array of length x and y
m_matrix = false(numel(x), numel(y)); % Prellocated matrix for speed

for i = 1:numel(x) % Loop over all x values
    for j = 1:numel(y) % Loop over all y values
        indicator(i, j) = divergence_indicator(x(i), y(j)); % Label indicator as divergent depending on thecomplex point
        m_matrix(i, j) = (indicator(i, j) >= 0); % Update boolean matrix based on boundary condition
    end 
end % Ends once it goes through all 1000 points of x and y.

imshow(m_matrix, 'XData', [x(1) x(end)], 'YData', [y(1) y(end)]);
% For binary images, imshow displays pixels with the value 0 (zero) as black and 1 as white.
axis on; % Show the x-axis and y-axis on plot.
hold on; % Keep the axis as the given values.
set(gca, 'YDir', 'normal'); % Sets the y-axis direction to -1.5 on the bottom for the plot (normal).
colormap(gray); % Set color to black and white depending on where the y values are in the set.
xlabel('x'); 
ylabel('y');
title('Mandelbrot set', 'FontSize', 12, 'FontWeight', 'bold'); 
subtitle('White is inside the set, Black is outside', 'FontSize', 10, 'FontWeight', 'normal');

%% Task 2 - function m = bisection(fn_f, s, e)

% This function takes a function fn_f, bounds s and e on the initial guess 
% and returns a point where the point sign of f changes.

function m = bisection(fn_f, s, e)
% fn_f - indicator function
% s - lower bound
% e - upper bound

    boundary_limit = 1e-6; % Manually inputed boundary limit
    fs = fn_f(s); % Evaluate the function at the lower bound
    fe = fn_f(e); % Evaluate the function at the upper bound

    while (e - s) > boundary_limit
        % This function continues to loop while the statement holds true.
        
        if abs(e - s) < boundary_limit
            % If statment that if true it ends the while loop.
            m = (s + e) / 2; 
            % Final midpoint of lower and upper bound that is returned
            warning('Limit reached before final boundary point was found.'); % Notify issue
            break; % Exit loop due to issue
        end % End the check
        m = (s + e) / 2; % Midpoint of lower and upper bound
        fm = fn_f(m); % Evaluate the function at the midpoint

        if fm == 0 % Precautionary if statement that should not happen
            break; % Exit the function as the root is found
        end

        if fs * fm < 0
            % If the midpoint is outside then...
            e = m; % Boundary point is in upper bound, push it down to m
            fe = fm; % Update fe to the new upper bound evaluation
        else
            % Otherwise, the midpoint is inside then...
            s = m; % Boundary point is in lower bound, push it up to m
            fs = fm; % Update fs to the new lower bound evaluation
        end

    end % While loop ends once the upper and lower bounds 
        % are no longer greater than the limit.
    m = (s + e) / 2; 
    % Final midpoint of lower and upper bound that is returned
end % Return the function and give the midpoint of the lower and upper bound.

% Command Window Example:
% Using the previous indicator_in_at_x function 
% 1) 'fn = indicator_fn_at_x(0.1)' and 'fn(0.1), ans = -1' 
% to confirm it is in the set.
% 2) Then bisection(fn, 0, 1), ans = 0.6046.

%% Task # 4 - Boundary Length function l = poly_len(p, s, e) 
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


%% Task # 3 - Find the boundary, find the polynomial approximating the boundary
% Fit a polynomial of order 15 to your fractal boundary data points
% The upper bound has to be chosen above the fractal. 
% The lower bound has to be chosen within the fractal, y = 0 would do fine.
% Find the fractal boundary for x ∈ [−2,1] for at least 10^3 (1000) points.

% Can manually change the value '1000' to any number of points desired.
% Can manually change the interval of [-2, 1].
x_data = linspace(-2, 1, 1000); % 1000 x points  in the space of -2 to 1
y_data = zeros(size(x_data)); % % Initialize y_data of size x
x_min = -1; % Can manually change the range of x min.
x_max = 0.75; % Can manually change the range of x max.

% Calculate the fractal boundary points for the specified range
for i = 1:numel(x_data)
    % Loops over all x values 
    fn = indicator_fn_at_x(x_data(i)); % Indicator function of fn at x
    y_data(i) = bisection(fn, 0, 1); % Bisection function to find the y values
    % Can manually change the s and e numbers.
end % Function ends when it loops through all 1000 x points

% Boundary region for x and y
region = (x_data >= x_min) & (x_data <= x_max); 
% Select x values with x's min and max
x_fit = x_data(region); % Extract x values within the region
y_fit = y_data(region); % Extract y values for fitting

% Can manually change '15' to any polynomial degree.
p = polyfit(x_fit, y_fit, 15); 
% Fit a polynomial of order 15 to the selected data points

x2 = linspace(min(x_fit), max(x_fit), 1000); % X values for the polynomial
y_poly = polyval(p, x2); % Evaluate the polynomial at the new x values

% Plot the original data points and the polynomial fit
figure;
plot(x_fit, y_fit, 'o', 'DisplayName', 'Data Points'); % Original data points
hold on;
plot(x2, y_poly, '--', 'DisplayName', 'Polynomial Fit'); % Polynomial fit
xlabel('x');
ylabel('y');
title('Polynomial Fit to Fractal Boundary');
legend show; % Legend for the plot
grid on;

% Task 4 - uses poly_len function and script from task 3.
s = min(x_fit); % Lower bound for the fitted range of x
e = max(x_fit); % Upper bound for the fitted range of x
l = poly_len(p, s, e); 
% Approximate fractal boundary length on the range of x 
% over bounds s and e.
fprintf(['Range of x: [%.5f, %.5f] \n' ...
    'Approximate curve length of the polynomial = %.4f\n'], s, e, l);
% Returns the curve length of the polynomial l.