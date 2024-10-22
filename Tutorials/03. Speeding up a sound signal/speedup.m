clc
clear all

% 1. Loading original sound message
[soundOriginal, Fs] = audioread('kanonikosima.mp3');
size1 = size(soundOriginal)
Fs
sound(soundOriginal, Fs);
figure(1);
plot(soundOriginal);
title('soundOriginal');

c = 0;
for i = 1 : 4*10^9
    c = c + 1;
end

% 2. Downsampling
speed = 2;
soundSpeeded = downsample(soundOriginal, speed);
size2 = size(soundSpeeded)
sound(soundSpeeded, Fs);
figure(2);
plot(soundSpeeded);
title('soundSpeeded');

% 3. Alternative downsampling
c = 0;
for i = 1 : 4*10^9
    c = c + 1;
end
sound(soundOriginal, speed * Fs);

% 4. Audiowrite
audiowrite('speededkanonikosima.mp4', soundSpeeded, Fs);
