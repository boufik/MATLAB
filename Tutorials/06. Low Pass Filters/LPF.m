clc
clear all

% 1. Beep of a sine wave
x = linspace(0, 200*pi, 10001);
Fs_usual = 44100;
y = sin(x);
play(y, Fs_usual);
play(y, Fs_usual / 2);
play(y, Fs_usual/4);
display(' ');

% 2. Data is the sound
[data, Fs] = audioread('helloworld.mp3');
play2(data, Fs);

% 3. Filter data with a LPF
b = ones(40, 1) / 40;         % Initialize conditions
data_LPF = filter(b, 1, data);
play2(data_LPF, Fs);

% 4. Plots
[sizeOfData, dimensions] = size(data);      % pe: 84480 x 2 (stereo sound)
xaxis = 1:sizeOfData;
figure(1);
plot(xaxis, data, 'red', xaxis, data_LPF, 'blue');
title('Red = data, Blue = filtered data');
figure(2);
subplot(2,1,1);
plot(real(fft(data)), 'red');
title('Red = fft(data)');
subplot(2,1,2);
plot(real(fft(data_LPF)), 'blue');
title('Blue = fft(data_LPF)');




% Auxiliary Functions
function play(y, Fs)
    display(strcat('Listening to sinx with Fs=', num2str(Fs)));
    sound(y, Fs);
    counter = 0;
    for i = 1:2*10^9
        counter = counter + 1;
    end
end

function play2(y, Fs)
    display(strcat('Listening to hello world with Fs=', num2str(Fs)));
    sound(y, Fs);
    counter = 0;
    for i = 1:6*10^9
        counter = counter + 1;
    end
end