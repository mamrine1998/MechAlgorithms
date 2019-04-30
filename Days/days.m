function [nd] = days(mo, da, leap)
% days: calculates the number of days that have elapsed so far in a year
% Inputs:
% mo = the month (1-12)
% da = the day of the current month (1-31)
% leap = (0):non-leap year
%        (1):leap year

% Array containing the number of days each month has for a non-leap year
% starting with January and ending with December
month = [31,28,31,30,31,30,31,31,30,31,30,31];

% Prompts users to select if it is a leap year
if (leap > 1) || (leap < 0)
    error('Must enter (0) to specify a non-leap year or (1) to specfiy a leap year.')
end

% Error if the user does not enter a correct number of days
if (da < 1) || (da > 31)
    error('The day of the month must be between 1 and 31 days.')
end

if leap == 1
    month(2) = 29; % Reassigns the number of days in Feb. in the month array if it is a leap year
    
    if mo == 1
        nd = da;
    else
        nd = sum(month(1:(mo-1)))+da;
    end
    
elseif leap == 0
    
    if mo == 1
        nd = da;
    else
        nd = sum(month(1:(mo-1)))+da;
    end
    
end

end

