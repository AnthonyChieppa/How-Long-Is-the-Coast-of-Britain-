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