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

% Task 4 - usespoly_len function and script from task 3.
s = min(x_fit); % Lower bound for the fitted range of x
e = max(x_fit); % Upper bound for the fitted range of x
l = poly_len(p, s, e); 
% Approximate fractal boundary length on the range of x 
% over bounds s and e.
fprintf(['Range of x: [%.5f, %.5f] \n' ...
    'Approximate curve length of the polynomial = %.4f\n'], s, e, l);
% Returns the curve length of the polynomial l.