# Bisect.m

*Created on:
Developed by: Marcus Amrine*


## Function

This algorithm implements the bisection root finding method. Given a function that has a real root and two guesses that bracket the root, this algorithm will implement multiple iteration of the root finding method until one of two stopping criterions are met.

**Inputs**
  1. func: User defined function.
  2. xl: Lower bracket guess defined by user.
  3. xu: Upper bracket guess defined by user.
  4. es: Stopping criterion. (Initially set to 0.0001%)
  5. maxit: Maximum number of iterations performed. (Initially set to 50)
  
**Outputs**
  1. root: This is the value at which the estimated root is located.
  2. fx: This is the value of the user's function evaluated at the root.
  3. ea: This is the percent relative error that is associated with the calculations preformed to find the root.
  4. iter: This tells the user how many iterations were preformed.
