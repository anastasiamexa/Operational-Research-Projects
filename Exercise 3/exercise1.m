clear
clc

e = 0.000001;
i = 0; % Number of loops

% Bisection Search
lb = 0; % Lower bound
ub = 6.5; % Upper bound
x = (lb + ub) / 2; % New x

while abs(lb - ub) >= 2*e
     f = x^(5)-8*x^(4)+x^(3)+1;  % Calculate the value of f
     f1 = 5*x^(4) -32*x^(3) + 3*x^(2); % Calculate the value of f' (1st derivative)
    % Set new boundaries
     if f1 >0
        lb = x;
    elseif f1 < 0
        ub = x;
    end 
    x = (lb + ub) / 2; % Set new x
    i = i + 1;
end

%% Newton - Raphson
% x = 1; % x(n)
% f = x^(5)-8*x^(4)+x^(3)+1;  % Calculate the value of f
% f1 = 5*x^(4) -32*x^(3) + 3*x^(2); % Calculate the value of f' (1st derivative)
% f2 = 20*x^(3) -96*x^(2) + 6*x; % Calculate the value of f'' (2nd derivative)
% newx =  x - (f1/f2); % x(n+1) = x(n) - (f'(x(n)/f''(x(n)))
% 
% while abs(newx - x) >= e
%     x = newx; % Set the new value to x
%     f = x^(5)-8*x^(4)+x^(3)+1;
%     f1 = 5*x^(4) -32*x^(3) + 3*x^(2); 
%     f2 = 20*x^(3) -96*x^(2) + 6*x; 
%     newx =  x - (f1/f2); 
%     i = i + 1;
% end