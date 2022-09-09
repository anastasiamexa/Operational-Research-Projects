%% EGDI Index 

 clear
 clc

data = xlsread('EGDI_Data_2020','Data','A2:D183');
[n,m] = size(data);

epsilon = 10^-6;    % Close to zero

%% Model M6 
minmax = zeros(n,1);

% Set lower bounds for weights
lb = [ epsilon * ones(1,m)  0];    % u >= ε and δ >= 0

% Using LPsolve
% Defaut of LPsolve is maximization
f = [zeros(1,m)  -1];   % Objective function
a = [data(:,1:m)  ones(n,1);  data(:,1:m)  zeros(n,1)];  % Left side of constraints
b = [ones(1,n)  ones(1,n)];    % Right side of constraints
e = [ones(1,n)  -ones(1,n)];   % More or equal and less or equal
[obj,x,exitflag] = lp_solve(f,a,b,e,lb);
for i = 1:n
    minmax(i,1) = data(i, 1:m) * x(1:m);    % The index of each country is saved on minmax
end