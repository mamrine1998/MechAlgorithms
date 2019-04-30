function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter,varargin)
% False Postion: Root finding function that utilizes the false postion
% method to estimate zeros
%
% Created by: Marcus Amrine
% For:        Dr. B
%             Mech 105
%
% Inputs:
%   func = function being evaluated
%   xl = lower bound guess
%   ux = upper bound guess
%   es = stopping realtive error criterion (default set at 0.0001%)
%   maxiter = maximum number of itertions wanted (default set at 200)
% Outputs:
%   root = estimated root
%   fx = function evaluated at root
%   ea = approximate relative error (%)
%   iter = number of iterations preformed

%% User Inputs Checked

% Checks number of user inputs (3 <= nargin <= 5)
if nargin < 3
    error('User must give aleast 3 inputs: func, xl, and xu.')
end
if nargin > 5
    error('To many inputs entered.')
end

% Sign Change Test (Does function cross x-axis in given interval?)
SCT = func(xl) * func(xu);
if SCT > 0
    error('Function has no root or has multiple roots over interval, change bounds.')
end

% Defaults es & maxiter if inputs are not given by user
if nargin < 4 || isempty(es)
    es = 0.0001;
end
if nargin < 5 || isempty(maxiter)
    maxiter = 200;
end

%% Set Intial Conditions
iter = 0;
xr = xl; % Lower bound is the intial guess at root
ea = ('Undefined before and at the 1st iteration.');

%% Method Implimentation

% While loop that tests the function given until stopping criterion is met
while (1)
    % Assign last estimate of the root to xr_old
    xr_old = xr;
    % Counter to track number of iterations
    iter = iter + 1;
    % Formula to calculate estimated root (xr)
    xr = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    %
    if xr ~= 0
        ea = abs((xr-xr_old)/xr)*100;
    end
    % Test sign change between xr and xl,xu to find which bound to repalce
    SCT2 = func(xl)*func(xr);
    if SCT2 > 0
        xl = xr;
    elseif SCT2 < 0
        xu = xr;
    else
        ea = 0;
    end    
    
    % Breaks loop if the stopping criterion is met or the max number of
    % iterations is met
    if ea <= es || iter >= maxiter
        break
    end
end

root = xr; fx = func(xr);
end

