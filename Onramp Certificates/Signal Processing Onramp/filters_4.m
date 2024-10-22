clear all
close all
clc


% 1. Compute spectrogram
timeLimits = [0 902.12]; % seconds
frequencyLimits = [0 25]; % Hz
overlapPercent = 50;

% 2. Index into signal time region of interest
wanc_bandpass_ROI = wanc_bandpass(:);
sampleRate = 50; % Hz
startTime = 0; % seconds
timeValues = startTime + (0:length(wanc_bandpass_ROI)-1).'/sampleRate;
minIdx = timeValues >= timeLimits(1);
maxIdx = timeValues <= timeLimits(2);
wanc_bandpass_ROI = wanc_bandpass_ROI(minIdx&maxIdx);
timeValues = timeValues(minIdx&maxIdx);

% 3. Compute spectral estimate
[P,F,T] = pspectrum(wanc_bandpass_ROI, timeValues, 'spectrogram', ...
    'FrequencyLimits',frequencyLimits, 'OverlapPercent',overlapPercent);


% 4. Auxiliary Function
function y = preprocess(x,tx)

    %    This function expects an input vector x and a vector of time values
    %    tx. tx is a numeric vector in units of seconds.
    Fs = 1/mean(diff(tx)); % Average sample rate
    y = bandpass(x,[2 10],Fs,'Steepness',0.85,'StopbandAttenuation',60);

end
