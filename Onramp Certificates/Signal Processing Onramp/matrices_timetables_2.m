clear all
close all
clc

% 1. Read matrix
harp = readmatrix("harp.csv")
plot(harp)

% 2. Read timetable (use fs)
% Import data into a timetable 
tbl = readtimetable("harp.csv", "SampleRate",50)
plot(tbl,"Var1")
