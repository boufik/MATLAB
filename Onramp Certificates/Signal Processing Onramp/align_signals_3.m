clear all
close all
clc

% 1. Load the dataset
load processedsignals.mat

% 2. Find Delay Function ---> Positive output means that the first signal is BEFORE the second one 
finddelay(harp,pax) 
finddelay(harp,wanc) 
finddelay(pax,wanc) 

% harp arrived 596 samples after pax
% harp arrived 1167 samples before wanc
% pax arrived 1770 samples before wanc
% So the wanc signal arrived last.

% 3. Align Signals Function ---> More clear visualization of peeks
[harp, wanc] = alignsignals(harp, wanc);
[pax, wanc] = alignsignals(pax, wanc);

% 4. Plot
plot(harp)
hold on
plot(pax)
plot(wanc)
hold off
legend("HARP","PAX","WANC")
ylim([-0.3 0.3])
