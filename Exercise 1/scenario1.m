%% EGDI Index 

 clear
 clc

data = xlsread('EGDI_Data_2020','Data','A2:D183');
[n,m] = size(data);

epsilon = 10^-6;    % Close to zero

%% Model M1 
egdi = zeros(n,1);

% Set lower bounds for weights
lb = [ epsilon * ones(1,m) ];

% Using LPsolve
for i = 1:n
    % Max the weighted sum of indicators
    f = [ data(i,1:m) ];    % Defaut of LPsolve is maximization
    a = [ data(:,1:m) ];    % Left side of constraints
    b = [ ones(1,n) ];  % Right side of constraints
    e = [ -ones(1,n) ]; % Less or equal
   [egdi(i,1),x,~] = lp_solve(f,a,b,e,lb); % The index of each country is saved on egdi
end