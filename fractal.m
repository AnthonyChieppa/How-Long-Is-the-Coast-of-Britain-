% Task 1 - Mandelbrot Fractal it = fractal(c)

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

