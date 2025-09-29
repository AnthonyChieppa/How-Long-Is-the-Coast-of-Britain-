%% Task # 2 - Helper function: indicator function generator 

% This function returns an indicator function along a vertical line at a
% given x.

function fn = indicator_fn_at_x(x)
    fn = @(y) divergence_indicator(x, y); 
    % Create and return a y function that is used in the indicator
    % function.
end

% This function that produces a value of 1 for divergence and -1 for no divergence.

function indicator = divergence_indicator(x, y)
    c = (x + 1i * y);
    % complex c from Re(x) and imag(y)
    it = fractal(c);
    % Calling the fractal function to get iteration count until divergence
    if it == 100
    % If statement that produces signifies if the indicator value 
    % is divergent or not based on if it matches the case.
        indicator = -1; % Divergence detected and is in the set
    else
        indicator = 1; % No divergence and is not in the set
    end % End of if statement
end 

% Command Window Example:
% 1) fn = indicator_fn_at_x(0.1)
% 2) fn(0.1), ans = -1.