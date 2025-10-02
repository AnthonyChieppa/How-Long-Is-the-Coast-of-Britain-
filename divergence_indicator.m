% This function that produces a value of 1 for divergence and -1 for no divergence.

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