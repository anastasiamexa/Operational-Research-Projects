clear
clc

no_vars=12;     % Number of variables
% Objective Function 
f=ones(1,no_vars); % Default of 'intlinprog' is Minimization

intcon = [1:no_vars]; % All Variables should be Integers

% Left side of constrains
A = [0,-1,0,0,0,-1,0,-1,-1,-1,0,-1;-1,0,-1,0,0,-1,0,0,0,0,0,-1;0,0,0,-1,0,0,-1,0,-1,-1,0,0;0,0,0,0,0,-1,0,0,0,0,-1,0;0,0,0,-1,0,0,-1,0,0,0,-1,0;
    -1,-1,0,0,0,0,0,0,-1,0,0,0;0,-1,-1,-1,0,0,0,0,-1,0,-1,0;-1,0,-1,0,0,0,0,0,-1,0,-1,0;0,-1,0,0,0,0,0,0,0,0,-1,0;0,0,-1,-1,0,0,0,-1,-1,0,0,0;
    -1,0,0,0,0,-1,0,0,0,0,0,-1;-1,-1,0,-1,-1,0,0,0,0,-1,-1,0];

% Right side of constrains
b = [-1;-1;-1;-1;-1;-1;-1;-1;-1;-1;-1;-1];

lb = zeros(1,no_vars); % Lower Bound of variables, zero since the Variables should be Binary
ub = ones(1,no_vars); % Upper Bound of variables, one since the Variables should be Binary
options = optimoptions('intlinprog','BranchRule','maxpscost'); % Specify the Parameters of Branch and Bound algorithm
% Call intlinprog to solve the Integer Programmig problem
[optimal_solution,fval,exitflag,output] = intlinprog(f,intcon,A,b,[],[],lb,ub,[],options);