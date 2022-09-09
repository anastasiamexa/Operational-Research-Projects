%% EGDI Index 

 clear
 clc

data = xlsread('EGDI_Data_2020','Data','A2:D183');
[n,m] = size(data);

epsilon = 10^-6;    % Close to zero

%% Model M4 
common = zeros(n,1);

% Set lower bounds for weights
lb = [ epsilon * ones(1,m)  zeros(1,n)];    % u >= ε and dj >= 0

% Using LPsolve
% Defaut of LPsolve is maximization
f = [zeros(1,m)  -ones(1,n)];   % Objective function
a = [data(:,1:m)  eye(n)];  % Left side of constraints
b = [ones(1,n)];    % Right side of constraints
e = [zeros(1,n)];   % Equals
[obj,x,exitflag] = lp_solve(f,a,b,e,lb);
for i = 1:n
    common(i,1) = data(i, 1:m) * x(1:m);    % The index of each country is saved on common
end