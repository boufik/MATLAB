clc
clear all

% 1. Sound the original sound message "Kanoniko Sima"
[soundOriginal, Fs] = audioread('kanonikosima.mp3');
size1 =   size(soundOriginal)
sound(soundOriginal, Fs);
figure(1);
plot(soundOriginal);
title("Original sound message");

c = 0;
for i = 1 : 4*10^9
    c = c + 1;
end

% 2. Sound the reverse sound message "amiS okinonaK"
soundReversed = flipud(soundOriginal);
size2 = size(soundReversed)
sound(soundReversed, Fs);
figure(2);
plot(soundReversed);
title("Reversed sound message");

% 3. Audiowrite - About reversed sound message
audiowrite("reversekanonikosima.mp4", soundReversed ,Fs);
