%% Task # 2 - Helper function: indicator function generator.

% This function returns an indicator function along a vertical line at a
% given x.

function fn = indicator_fn_at_x(x)
    fn = @(y) divergence_indicator(x, y); 
    % Create and return a y function that is used in the indicator
    % function.
end % End of the function and return the fn.

% Command Window Example:
% 1) fn = indicator_fn_at_x(0.1)

% 2) fn(0.1), ans = -1.
