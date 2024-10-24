%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: C:\Users\User\Documents\MATLAB\Tutorials\Tutorials Thomas\PRN, TXT\output_PRN_to_TXT.TXT
%
% Auto-generated by MATLAB on 13-Nov-2021 15:49:12

%% Setup the Import Options
clear all
clc
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = [4, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["FreqMHz", "Deg", "Var3", "Var4", "Var5"];
opts.SelectedVariableNames = ["FreqMHz", "Deg"];
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
tbl = readtable("C:\Users\User\Documents\MATLAB\Tutorials\Tutorials Thomas\PRN, TXT\output_PRN_to_TXT.TXT", opts);

%% Convert to output type
FreqMHz = tbl.FreqMHz;
Deg = tbl.Deg;

%% Clear temporary variables
clear opts tbl
plot(FreqMHz, Deg);