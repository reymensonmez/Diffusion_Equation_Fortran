# Steady-State 2D Diffusion Solver in Fortran 90

This project implements a numerical solution to the steady-state 2D diffusion equation (with zero source term) using the **Gauss-Seidel iterative method** in Fortran 90.

## Equation Solved

We solve the steady-state 2D diffusion equation:

\[
\frac{\partial^2 T}{\partial x^2} + \frac{\partial^2 T}{\partial y^2} = 0
\]

This is mathematically equivalent to Laplace's equation for cases with constant diffusivity and no internal source.

## Method

The code uses:
- A finite difference discretization , central difference.
- A uniform Cartesian grid
- The Gauss-Seidel method for faster convergence 

## Grid and Boundary Conditions

- Grid size: 51 × 51 points
- Domain: [0, 1] × [0, 1]
- Spacing: uniform in both `x` and `y`
- Boundary conditions:
  - Bottom boundary (y = 0): \( T = 1 \)
  - Other boundaries: \( T = 0 \)

##  Files

| File Name           | Description                                  |
|---------------------|----------------------------------------------|
| `diff_2d.f90` | Main Fortran code solving the equation     |
| `solution.dat`    | Output data file with `(x, y, T)` values    |
| `README.md`          | This documentation file                     |
| `post_process.py`          | Plotting the Solution                  |


##  How to Run

1. Compile the code:
   
   ifort -r8 diff_2d.f90
2. You can also use gfortran to compile. gfortran diff_2d.f90 -o diff_2d and execute ./diff_2d
