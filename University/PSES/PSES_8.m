% 1o orisma = syxnothta deigmatolhpsias >= 40kHz (fwni ws ta 20kHz),
% usually 44kHz px mp3
% H fwni paei synithws ws 5kHz, mporw sta 10kHz
% O OTE kratage 3.5kHz ---> epilegw 8kHz
% 16 deigmata apo to kanali 1

s = audiorecorder(8000, 16, 1);
recordblocking(s, 5);   % Deyterolepta
play(s);
f1 = getaudiodata(s);
plot(f1);
F1 = fft(f1);

recordblocking(s, 5);
f2 = getaudiodata(s);
play(s);
plot(f2);
F2 = fft(f2);
mF1 = abs(F1);
pF1 = angle(F1);
mF2 = abs(F2);
pF2 = angle(F2);

Z1 = mF1 .* exp(j*pF2);
Z2 = mF2 .* exp(j*pF1);
z1 = ifft(Z1);              % Ta bgazei complex, prepei real (to imaginary taxis 10^(-17))
z2 = ifft(Z2);
% plot(real(z1));
% plot(imag(z1));
% plot(real(z2));
% plot(real(z2));
z1 = real(z1);
z2 = real(z2);

% Thelw na akousw z1, z2
s = audioplayer(z1, 8000);
play(s);
s = aydioplayer(z2, 8000);
play(s);s