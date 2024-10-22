clear all
close all
clc

% 1. Sampling and signal frequency (fs, f)
fs = 100;
t = 0 : 1/fs : 1;
f = 5;

% 2. Create a non-noisy and a noisy signal
sig = sin(2*pi*f*t);
plot(t, sig);
noise = 0.1 * randn(size(sig));
sigNoisy = sig + noise;
plot(t, sigNoisy);

% 3. Square wave and sawtooth
sq = square(2*pi*f*t);
plot(t, sq);
saw = sawtooth(2*pi*f*t);
plot(t, saw);
sqNoisy = sq + 0.1 * randn(size(sq));
plot(t, sqNoisy);
sawNoisy = saw + 0.1 * randn(size(sq));
plot(t, sawNoisy);
