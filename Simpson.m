function [I] = Simpson(x,y,varargin)
% Simpson function integrates tabulated data, with an even number of intervals, using Simpson's 1/3 rule
% and the trapizodial rule if the number of intervals is odd.
% Written By: Marcus W. Amrine
% Date: April 19th, 2019
% For: Dr. B, Mech 105, HW 19
%   Inputs
%       x: An array of equally spaced data point
%       y: An array with data points equaling the length of x
%   Output
%       I: The calculated value of the the integral using Simpson's 1/3
%       Rule

%% Checks User's Inputs

% Checks for only two inputs
if nargin < 2 
    error('Function needs two input arrays.')
elseif nargin > 2
    error('Only two input arrays accepted.')
end

% Finds Length of x & y inputs arrays
Lx = length(x);
Ly = length(y);

% Checks if Lengths of x and y are equal
if Lx ~= Ly
    error('Length of X and Y vectors must be equal.')
end

% Checks if spacing of x array is equal
if diff(x) ~= diff(linspace(x(1,1),x(1,end),Lx))
    error('Elements in x array must be equally spaced.')
end

%Claculates number of intervals
n = Lx-1;

%Bounds of integration
h = x(end) - x(1);

% Checks if intervals are odd or even 
oddcheck = rem(n,2);

%% If Even Number of Intervals: Use Simpson's 1/3 Rule

% Iff there are an even number of intervals, there will be no remainder and
% therefore 1/3 rule is only used
if oddcheck == 0
    % Intializes middle even/odd y values
    oddterms = 0;
    eventerms = 0;
% Uses a for loop to add the values of the middle even/odd terms to be
% multiplied
    for i = 2:2:n
        oddterms = oddterms + y(i);
    end
    for i = 3:2:n-1
        eventerms = eventerms + y(i);
    end
    % Simpsons 1/3 rule equation
    I = (h)*((y(1)+(4*oddterms)+(2*eventerms)+y(end))/(3*n));
end

%%  If Odd Number of Intervals: Simp & 1/3 Rule

% If there is an odd number of intervals, the remainder will be one and
% therefore we must implement trap rule and 1/3 Rule
if oddcheck == 1
    % Warning to users to inform them that the trap rule will be used over
    % last interval
    warning('Odd number of intervals. Implements Trapezodial Rule over last interval.');
% Initialize step sizes and even/odd terms to multiply in 1//3 Rule
    oddterms = 0;
    eventerms = 0;
    h_simp = (x(end-1)-x(1));
    h_trap = (x(end)-x(end-1));
%Uses a for loop to add the values of the middle even/odd terms to be
% multiplied
    for i = 2:2:n-1
        oddterms = oddterms + y(i);
    end
    for i = 3:2:n-2
        eventerms = eventerms + y(i);
    end
% Intergated Value for even intervals using Simpson's 1/3 Rule
    Isimp = (h_simp)*((y(1)+(4*oddterms)+(2*eventerms)+y(end-1))/(3*(n-1)));
% Integrates value under curve, over the last inteval using trap rule
    Itrap = (h_trap)*((y(end-1)+y(end))/2);
% Adds the above two values to find the total estimate at the integrated
% value
    I = Isimp + Itrap;
end

end

