# days.m


*Developed by: Marcus Amrine*


## Function

This algorithm calculates the number of days that have elapsed in a year up to a specified date, in that year, given by the user.

**Inputs**
  1. mo: A number, 1 - 12, that corresponds to the month, starting with January, that the user defines.
  2. da: The day within the month.
  3. leap (0): User indicates that it is not a leap year.
          (1): User indicates that it is a leap year.

**Outputs**
  1. nd: This is the number of elapsed days.
  
**Limitations**

This function includes the day of the date that the user gives. The user would just need to subtract one from the calculated value to know the number of days that have elapsed before the date given. Also, this function is not capable of finding the number of days that have elapsed over multiple years. A possible update to the algorithm could include this feature.
