% % Integer Programming
clc
clear
% Default of LP solve is maximization
f = [-8;-2];    % Coefficients of variables x1, x2
intcon = [1,2];    % Which variables are integers (here both x1 and x2)
A = [-1,-1; -4.5,-1;1,2];   % Coefficients a11,a12,...   
b = [10;-16;10];    % Right side of constrains

% Using LP solve
 [obj,x] = lp_solve(f,A,b,[-1,-1,-1],[],[],intcon);