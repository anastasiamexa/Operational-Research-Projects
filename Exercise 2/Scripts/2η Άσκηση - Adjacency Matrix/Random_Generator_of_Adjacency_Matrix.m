%% Generate Random Data for Adjacency (Neighbor) Matrix
clear
clc


no_vars=12;

% Flag to check the feasibility of the problem given the random data
exitflag=0; 

while (exitflag~=1) % Stop if a Feasible solution is found for the given Data, otherwise Generate new Data

% Objective Function 
f=ones(1,no_vars); % Default of 'intlinprog' is Minimization

intcon = [1:no_vars]; % All Variables should be Integers

% Generate Data for the Left Hand Side (LHS) of the constraints
A= zeros(no_vars, no_vars);
A(randperm(numel(A), no_vars*4)) = -1;
A = A - diag(diag(A)); % Default type of Inequalities in 'intlinprog' is '<='

b = [-ones(1,no_vars)]; %Data of Right Hand Side (RHS) of the constraints

lb = zeros(1,no_vars); % Lower Bound of variables, zero since the Variables should be Binary
ub = ones(1,no_vars); % Upper Bound of variables, one since the Variables should be Binary
options = optimoptions('intlinprog','BranchRule','maxpscost'); % Specify the Parameters of Branch and Bound algorithm

% Call intlinprog to solve the Integer Programmig problem
[optimal_solution,fval,exitflag,output] = intlinprog(f,intcon,A,b,[],[],lb,ub,[],options);

end

