%% Generate Random Data for Integer Programming Problems and Solve them using intlinprog
clc
clear

% Sum of A.M. of each Student
AM_SUM=11; 

% Number of variables
no_vars=2;

% Flag to check the feasibility of the problem given the random data
exitflag=0; 
while (exitflag~=1) % Stop if a Feasible solution is found for the given Data, otherwise Generate new Data

% Generate Data for the Coefficients of the 2 Variables in the Objective Function 
f=1*randi([1,8],no_vars,1)'; % Default of 'intlinprog' is Minimization

intcon = [1:no_vars]; % All Variables should be Integers

% Generate Data for the Left Hand Side (LHS) of the constraints
A = [-1*randi([1,2],1,2); -4.5,-1; randi([1,2],1,2)]; % Default type of Inequalities in 'intlinprog' is '<='
b = [randi([8,AM_SUM],1,1); -1*randi([8,AM_SUM*2],1,1); randi([10,14],1,1)]; %Data of Right Hand Side (RHS) of the constraints

lb = zeros(1,no_vars); % Lower Bound of variables, zero since the Variables should be non-negative
options = optimoptions('intlinprog','BranchRule','maxpscost'); % Specify the Parameters of Branch and Bound algorithm

% Call intlinprog to solve the Integer Programmig problem
[optimal_solution,fval,exitflag,output] = intlinprog(f,intcon,A,b,[],[],lb,[],[],options);

end
