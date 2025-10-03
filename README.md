# How Long Is the Coast of Britain
AMS 595 — MATLAB Project #2

## Project Description:
This MATLAB project approximates the arc length of the Mandelbrot set boundary using four different tasks. In the tasks there is as follows: 

  - Write a function computing the fractal
  - Use the bisection algorithm to approximate the boundary of the fractal
  - Use polynomial function approximation to find boundary as a function
  - Integrate the boundary curve to find its length

# Tasks Order:
1. **Task 1:** function it = `fractal(c)`
- Takes a complex c and gives the number of iterations until divergence occurs in the Mandelbrot set.
  - Additional script that plots the Mandelbrot set while using `imshow`.
    
2. **Task 2:** function m = `bisection(fn_f, s, e)`
- Used the bisection method with an indicator function to locate boundary points.
  
3. **Task 3:** Create a script that takes in a 15th-degree polynomial to the boundary.
- Takes the fractal boundary points found in previous parts and fits a polynomial of order 15 to them.
  
4. **Task 4:**  function l = `poly_len(p, s, e)`
- Takes a polynomial p, starting and ending points s and e
- Return a curve length numerically via arc-length integration.

## Files and What Their Purposes Are:

- fractal.m - Function that provides the number of iterations after which |z| > 2.0.
- divergence_indicator.m - Function that determines if the point is inside the set or outside the set \
  (Inside = 1, Outside = -1).
- indicator_fn_at_x - Helper function that returns the fn(y) which equates to divergence_indicator(x, y).
- bisection.m - Function that ocates the point on the boundary of the fractal
- poly_len.m - Function that provides the curve length of the polynomial.
- Poly_fitting_length.m - Main script that finds the boundary, then finds and fits the polynomial of order 15. Afterwards it plots the original data points to the polynomial fit. \
  Final code that uses the fitted minimum x and maximum x points as the bounds (s and e) to approximate curve length of the polynomial.
- Mandelbrot_plot.m - Script that uses imshow to visualize the fractal boundary for x ∈ [−2,1] for at least 10^3 (1000) points.

## Instructions:
Download all `.m` files in the same folder, open MATLAB and then run the following:

```matlab
cd('C:/Users/YourUsername/Documents/Projects');
% Opens file path where code is stored.
Poly_fitting_length
% Outputs the range of x, approximate curve length of the polynomial, and the plot.
```

## Command Window Example Output:
```matlab
% Values can be changed depending on what is desired.
fractal(0+0i) % 100 <- In the Manderbrot Set
fractal(1+0i) % 2 <- Not in the Manderbrot Set

divergence_indicator(0, 0i) % ans = -1 <- Is in the set
divergence_indicator(1, 0i) % ans = 1 <- Is not in the set

% Step 1:
fn = indicator_fn_at_x(0.1) % x = 0.1
% Step 2:
fn(0.1) % y = 0.1, ans = -1 <- Is in the set

Mandelbrot_plot % imshow visualization for the Mandelbrot set

% Using the previous indicator_in_at_x function 
% 1) 'fn = indicator_fn_at_x(0.1)' and 2) 'fn(0.1), ans = -1' to confirm it is in the set.
bisection(fn, 0, 1) % ans = 0.6046.

% Step 1: 
x = linspace(-2, 1, 1000) % 1,000 evenly spaced out points between -2, and 1.
% Step 2:
y = linspace(-1.5, 1.5, 1000) % 1,000 evenly spaced out points between -1.5, and 1.5.
% Step 3:
 p = polyfit(x, y, 15) % returns polynomial p of order 15 that is best fit for the data in y.
% Step 4:
poly_len(p, -1, 1) % ans = 2.8284.
```

