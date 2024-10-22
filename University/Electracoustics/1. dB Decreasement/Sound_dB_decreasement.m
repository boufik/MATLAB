clc
clear all

% dB data
dB = 3;
dB_range = 30;
increase = 10^(dB/10);
steps = floor(dB_range / dB);
display([num2str(steps) ' steps of audio, decreasement by ' num2str(dB) ' dB.']);
display(' ');

% Sound data
[d, Fs] = audioread('ena.mp3');
center = floor(steps/2) + 1;            % Center means the center step, where
                                    % the amplitude of d is the original
for step = 1:steps
    display(['Step ' num2str(step)]);
    d_new = d * increase^(center-step);
    sound(d_new, Fs);
    delay();
end

function delay()
    counter = 0;
    for i = 1 : 0.6 * 10^9
        counter = counter + 1;
    end
end