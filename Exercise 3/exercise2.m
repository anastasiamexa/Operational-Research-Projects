clear
clc

syms x y
H  = hessian(x-y-x^2+x*y-y^2,[x,y]); % Function that provides the 2nd order derivative
eqn1 = 1 - 2*x + y == 0;
eqn2 = -1 + x -2*y == 0;
[A,B] = equationsToMatrix([eqn1, eqn2], [x, y]);
K = linsolve(A,B);

disp("Point");
disp(K);
disp("Hessian table")
disp(H);
disp("Eigenvalues");
disp(eig(H));
disp("Determinant");
disp(det(H));