clear all
close all
clc

% 1. Create an empth optimization problem
prob = optimproblem("Description","Factory Location")
show(prob)

% 2. Create optimization variables
x = optimvar("x")
y = optimvar("y")
