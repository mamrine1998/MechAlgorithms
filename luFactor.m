function [L,U,P] = luFactor(A,varagin)
% luFactor preforms LU Decomposition on a square coefficient matrix where
% the number of rows and columns is equal
%
% Written by Marcus W. Amrine
% Date: April 1st, 2019
% For: Dr. B, Mech 105, Hw 16
%
%   Inputs:
%       A = Coefficient matrix where the rows and columns equal A
%   Outputs:
%       L = Lower Triangular Matrix
%       U = Upper Triangular Matrix
%       P = Piviot Matrix

%% Input Checks
% Checks for only one input
if nargin ~= 1
    error('Only one input argument accepted.')
end

% Checks to see if the input is a matrix
if ismatrix(A) == 0
    error('Input must be a matrix.')
end

% Checks to make sure input is a square matrix
[m,n] = size(A);
if m ~= n
    error('Input must be a square matrix.')
end

%% Initalize L, U,& P

U = A;
L = eye(m,n);
P = eye(m,n);

%% Pivoting and Elimination
for col = 1:n
    MAX = max(abs(U(col:n,col))); % Finds the element with greatest absolute vaule in a column
    for pivotrow = col:n
        rowmax = abs(U(pivotrow,col)); % Finds the pivot element for each iteration
        if MAX == 0 % Checks to see if all the values in the column are zero which would cause a division by 0 issue
            error('Division by zero.')
        elseif MAX == rowmax            
            Upivot = U(col,:); % Row that needs to be moved from pivot point
            Uswitch = U(pivotrow,:); % Row that needs to move to pivot point
            Ppivot = P(col,:);
            Pswitch = P(pivotrow,:);
            U(pivotrow,:) = Upivot;
            U(col,:) = Uswitch;
            P(pivotrow,:) = Ppivot;
            P(col,:) = Pswitch;
            if col > 1
                Lswitchp = L(col,1:col-1);
                Lswitchs = L(pivotrow,1:col-1);
                L(col,1:col-1) = Lswitchs;
                L(pivotrow,1:col-1) = Lswitchp;
            end
        end
    end
    % Preforms forward elimination on A each iteration after pivoting to convert to U
    for elimrow = col+1:n
        % Stores values used to in forward elimination to L matrix
        L(elimrow,col) = U(elimrow,col)/U(col,col);
        % Preforms the forward elimination by subtracting the first row
        % times the consatnt from the corresponding row and stores in U
        % matrix
        U(elimrow,:) = U(elimrow,:) - L(elimrow,col) * U(col,:);
    end
end
            
end

