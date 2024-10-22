clear all
close all
clc

% 1. Load the dataset
load Nutrition.mat 
food

% 2. Create the optimization problem
prob = optimproblem("Description","An Optimal Breakfast");
servings = optimvar("servings",16,"LowerBound",0);
C = food.Price .* servings;
prob.Objective = sum(C);


% 3. Equality constraint
cals = servings .* food.Calories
totalCals = sum(cals)
prob.Constraints.calories = totalCals == 350

% 4. Solve the problem
[sol, optval] = solve(prob)
optServings = sol.servings
check = evaluate(totalCals, sol)

% 5. Visualize the solution and explain
bar(food.Name, optServings)
% Since we are looking for 350 calories, but as cheap as possible, then
% the output solution must have the biggest ratio calories / money
caloriesPerDollar = food.Calories ./ food.Price;
bar(food.Name, caloriesPerDollar)
