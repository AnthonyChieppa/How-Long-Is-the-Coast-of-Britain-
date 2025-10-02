# How Long Is the Coast of Britain
AMS 595 — MATLAB Project 2

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
- 
4. **Task 4:**  function l = `poly_len(p, s, e)`
- Takes a polynomial p, starting and ending points s and e
- Return a curve length numerically via arc-length integration.
