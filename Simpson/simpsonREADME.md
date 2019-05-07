# simpson.m

*Developed by: Marcus Amrine*

*Created on: April 19th, 2019*

## Function

This algorithm uses Simpson's 1/3 rule to integrate tabulated data, with an even number of intervals. If the data does not have an even number of intervals, the algorithm implements Simpson's 1/3 rule along with a sinlge application of the trapizodial rule over the last interval, to find the integrated value.

**Inputs**
  1. x: An array of equally spaced data points.
  2. y: An array of data points whos length is equal to x.
  
**Outputs**
  1. I: The calculated value of the the integral.
  
### Limitations

Since Simpson's 1/3 rule can not be used on data with an odd number of intervals, this function must use a single application of the trapizodial rule over the last interval to find the integrated value. A possible update to the algorithm could include removing the trapizodial rule and replacing it with Simpson's 3/8 rule. This would allow the alogrithm to check the number of intervals and use the appropriate Simpson's rule.
