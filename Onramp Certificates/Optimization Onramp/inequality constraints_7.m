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
cals = food.Calories .* servings;
prob.Constraints.calories = sum(cals) == 350;
show(prob)

% 3a. Inequality - carbs
carbs = food.Carbs .* servings;
totalCarbs = sum(carbs);
prob.Constraints.carbs = totalCarbs >= 45;
show(prob)
[sol, optval] = solve(prob)
bar(food.Name, sol.servings);
optCarbs = evaluate(totalCarbs, sol)

% 3b. Inequality - protein
protein = food.Protein .* servings;
totalProtein = sum(protein)
prob.Constraints.protein = totalProtein >= 15
sol2 = solve(prob) 
bar(food.Name,sol2.servings)
optProtein = evaluate(totalProtein,sol2)

% 3c. Inequality - vitaminC
vitaminC = food.VitaminC .* servings;
totalVitaminC = sum(vitaminC)
prob.Constraints.vitaminC = totalVitaminC >= 60
sol3 = solve(prob)
bar(food.Name,sol3.servings)
optVitaminC = evaluate(totalVitaminC,sol3)

% 4. New inequality constraints

carbs = food.Carbs .* servings;
totalCarbs = sum(carbs);
prob.Constraints.carbs = totalCarbs <= 30;

protein = food.Protein .* servings;
totalProtein = sum(protein)
prob.Constraints.protein = totalProtein >= 60;

vitaminC = food.VitaminC .* servings;
totalVitaminC = sum(vitaminC)
prob.Constraints.vitaminC = totalVitaminC >= 60;

show(prob);
[sol4, optval] = solve(prob)
