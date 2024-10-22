clear all
close all
clc

% 1. Load the dataset
load Nutrition.mat 
food

% 2. Create the optimization problem
prob = optimproblem("Description","An Optimal Breakfast");
servings = optimvar("servings", 16, "LowerBound", 0)
price = food.Price
C = servings .* price
prob.Objective = sum(C);
show(prob)
[sol, optval] = solve(prob)
sol.servings
