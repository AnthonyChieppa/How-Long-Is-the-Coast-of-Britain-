%% Task 3 - function m = bisection(fn_f, s, e)

% This function takes a function fn_f, bounds s and e on the initial guess 
% and returns a point where the point sign of f changes.

function m = bisection(fn_f, s, e)
% Inputs: fn_f - indicator function, s - lower bound, e - upper bound
% Output: m - boundary point

    boundary_limit = 1e-6; % Boundary limit

    while (e - s) > boundary_limit
        % This function continues to loop while the statement holds true.
        
        if abs(e - s) < boundary_limit
            % If statment that if true it ends the while loop.
            warning('Limit reached before final boundary point was found.'); % Notify issue
            break; % Exit loop due to issue
        end % End the check
        m = (s + e) / 2; % average of lower and upper bound

        if fn_f(s) * fn_f(m) < 0
            e = m; % Boundary point is in lower bound
        else
            s = m; % Boundary point is in upper bound
        end
    end % While loop ends once the upper and lower bounds 
        % are no longer greater than the limit.
    m = (s + e) / 2; 
    % Final average of lower and upper bound that is returned
end

% Command Window Example:
% Using the previous indicator_in_at_x function 
% 'fn = indicator_fn_at_x(0.1)' and 'fn(0.1), ans = -1' 
% to confirm it is in the set.
% Then bisection(fn, 0, 1), ans = 0.6046.