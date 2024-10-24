%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: C:\Users\User\Documents\MATLAB\Tutorials\Tutorials Thomas\PRN, TXT\output_python.txt
%
% Auto-generated by MATLAB on 13-Nov-2021 15:45:24

%% Setup the Import Options
clear all
clc
opts = delimitedTextImportOptions("NumVariables", 5);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = " ";

% Specify column names and types
opts.VariableNames = ["FREQ", "DEG", "Var3", "Var4", "Var5"];
opts.SelectedVariableNames = ["FREQ", "DEG"];
opts.VariableTypes = ["double", "double", "char", "char", "char"];
opts = setvaropts(opts, [3, 4, 5], "WhitespaceRule", "preserve");
opts = setvaropts(opts, 1, "TrimNonNumeric", true);
opts = setvaropts(opts, 1, "ThousandsSeparator", ",");
opts = setvaropts(opts, [3, 4, 5], "EmptyFieldRule", "auto");
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";

% Import the data
tbl = readtable("C:\Users\User\Documents\MATLAB\Tutorials\Tutorials Thomas\PRN, TXT\output_python.txt", opts);

%% Convert to output type
FREQ = tbl.FREQ;
DEG = tbl.DEG;


%% Clear temporary variables
clear opts tbl
plot(FREQ, DEG);