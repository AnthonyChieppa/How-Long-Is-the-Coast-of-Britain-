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