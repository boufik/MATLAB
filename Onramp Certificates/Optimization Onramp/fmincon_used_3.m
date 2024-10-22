clear all
close all
clc
 
% 1. Basics
prob = optimproblem("Description","Factory Location");
x = optimvar("x");
y = optimvar("y");
X = [5 40 70];
Y = [20 50 15];
 
% 2. Optimization problem
d = sqrt((x-X).^2 + (y-Y).^2);
dTotal = sum(d);
prob.Objective = dTotal;
show(prob)
initialGuess.x = 100;
initialGuess.y = 200;
 
% 3. Solve the problem (MATLAB automatically decides the solver - here it is 'fminunc')
[sol, optval] = solve(prob, initialGuess)
xOpt = sol.x
yOpt = sol.y
optval2 = evaluate(dTotal, sol)
vectors = evaluate(d, sol)
flag = optval == optval2
 
% 4. Display
plotStores
hold on
scatter(xOpt, yOpt, 'redX')
hold off
 
 
 
function plotStores()
    
    X = [5 40 70];
    Y = [20 50 15];
    pgon1 = nsidedpoly(5,"Center",[X(1) Y(1)],"sidelength",3);
    pgon2 = nsidedpoly(5,"Center",[X(2) Y(2)],"sidelength",3);
    pgon3 = nsidedpoly(5,"Center",[X(3) Y(3)],"sidelength",3);
    plot([pgon1 pgon2 pgon3])
    axis equal
 
end
