# luFactor.m

*Developed by: Marcus Amrine*
*Created on: April 1st, 2019*

## Function

This algorithm preforms gaussian elimination to decompose some nxn matrix [A] into a lower [L] and upper [U] triangular matrix while tracking and recording any pivoting in a matrix [P]. By multiply the matrices [L][U][P], the resulting matrix will give the user back the original matrix [A].

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
  
**Limitations**

This function is not capable of finding the true root of a function as each iterartion only finds an improved guess based on the last estimation.
