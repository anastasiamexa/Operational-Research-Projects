clc
clear

% Number of variables
no_vars=6;
M = 100000;

f = [-3;-2;-4;0;0;0]; % Default of 'intlinprog' is Minimization

intcon = [1:no_vars]; % All Variables should be Integers

% Generate Data for the Left Hand Side (LHS) of the constraints
% Default type of Inequalities in 'intlinprog' is '<='
A = [1.5,2.5,3.5,0,0,0;
    32,40,27,0,0,0;
    1,0,0,-M,0,0;
    0,1,0,0,-M,0;
    0,0,1,0,0,-M;
    -1,0,0,M,0,0;
     0,-1,0,0,M,0;
     0,0,-1,0,0,M;];
 
 %Data of Right Hand Side (RHS) of the constraints 
b = [6500;
    65000;
    0;
    0;
    0;
    -1000 + M;
    -1000 + M;
    -1000 + M;];

lb = zeros(1,no_vars); % Lower Bound of variables, zero since the Variables should be non-negative
ub = [Inf;Inf;Inf;1;1;1]; % enforces y1, y2, y3 is binary
options = optimoptions('intlinprog','BranchRule','maxpscost'); % Specify the Parameters of Branch and Bound algorithm

% Call intlinprog to solve the Integer Programmig problem
[optimal_solution,fval,exitflag,output] = intlinprog(f,intcon,A,b,[],[],lb,ub,[],options);