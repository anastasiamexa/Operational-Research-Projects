%% Generate Sudoku
% https://www.mathworks.com/help/optim/ug/solve-sudoku-puzzles-via-integer-programming-solver-based.html#SolveSudokuExample-2


clear
clc

  load('sudoku_example.mat')

% Draw the Sudoku board and Perform Check for Unique Values in Rows,Columns and Sub-Arrays (3*3)
drawSudoku(sudpuzzle);
hold on

% First Change Randomly the Duplicate Values (if any) and then Solve the Sudoku !!!
 Sudoku_Sol = sudokuEngine(sudpuzzle);

% Draw the Sudoku board
drawSudoku(Sudoku_Sol);
hold off
