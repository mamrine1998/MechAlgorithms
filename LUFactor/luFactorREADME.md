# luFactor.m

*Developed by: Marcus Amrine*

*Created on: April 1st, 2019*

---

## Function

This algorithm preforms gaussian elimination to decompose some square matrix [A] into a lower [L] and upper [U] triangular matrix while tracking and recording any pivoting in a matrix [P]. By multiply the matrices [L][U][P], the resulting matrix will give the user back the original matrix [A].

**Inputs**
  1. A: A square. (# of rows = # of columns)

**Outputs**
  1. L: This is the lower triangular matrix that records the values used to eliminate a pivot.
  2. U: This is the upper triangular matrix that records the changes to [A] after pivitoing and elimination occur.
  3. P: This is an identity matrix, equal to the size of [A], that moves the 1 values on the diagonal to match pivioting.
  
---
  
### Limitations
