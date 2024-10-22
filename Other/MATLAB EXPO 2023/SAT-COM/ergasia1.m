clear all
close all
clc

startTime = datetime(2020,8,19,20,55,0); % 19 August 2020 8:55 PM UTC, value-only argument
stopTime = startTime + days(1);          % 20 August 2020 8:55 PM UTC, value-only argument
sampleTime = 60;                         % seconds, value-only argument
sc = satelliteScenario(startTime,stopTime,sampleTime);
v = satelliteScenarioViewer(sc);