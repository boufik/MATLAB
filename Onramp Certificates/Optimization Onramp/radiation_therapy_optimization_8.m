clear all
close all
clc

% 1. Basics
prob = optimproblem("Description","Radiation Therapy Optimization")
I = optimvar("I",8,"LowerBound",0)

% 2. Objective - Linear
d = [10 7 3 8 8 5 9 10];
D = d * I
prob.Objective = D;

% 3. Spinal constraint (1 inequality)
A = zeros(1, 8);
A(3) = 2;       A(7) = 2;           % 2I3 + 2I7 <= 5
ineq1 = A * I <= 5;
prob.Constraints.spinal = ineq1;

% 4. Tumor constraints (4 inequalities)
ineqA = 3*I(2) + 3*I(6) >= 7;
ineqB = 3*I(3) + 2*I(6) >= 7;
ineqC = 4*I(3) + 2*I(5) >= 7;
ineqD = 2*I(4) + 1*I(7) >= 7;
prob.Constraints.A = ineqA;
prob.Constraints.B = ineqB;
prob.Constraints.C = ineqC;
prob.Constraints.D = ineqD;


% 5. OSlve the problem: it is linear (both objective and contraints) ---> no initial guess is needed
sol = solve(prob);
bar(sol.I);

% 6. Calculations
check = A * sol.I

% 7. Visualization
verticalBeamTable = [4 4 4 4; 3 3 3 3; 2 2 2 2; 1 1 1 1];
horizontalBeamTable = [4 3 2 1; 4 3 2 1; 4 3 2 1; 4 3 2 1];
verticalIntensity = [0 2.33 0 0];
horizontalIntensity = [0 0 1.75 3.5];

horizontalDose = horizontalBeamTable .* horizontalIntensity';
verticalDose = verticalBeamTable .* verticalIntensity;
Doses = horizontalDose + verticalDose;

imagesc(Doses)
hold on
plot([.5 .5 1.5 1.5 2.5 2.5 3.5 3.5 2.5 2.5 0.5],...
 [3.5 2.5 2.5 1.5 1.5 3.5 3.5 4.5 4.5 3.5 3.5], 'r-', "LineWidth",2)
hold off
colorbar
