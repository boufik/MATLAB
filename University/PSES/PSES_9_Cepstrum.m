clc
clear all

s = audiorecorder(8000, 16, 1);
% 1o
recordblocking(s, 3);
% play(s);
a = getaudiodata(s);
% 2o
recordblocking(s, 3);
% play(s);
i = getaudiodata(s);

% FOURIER
A = abs(fft(a));        % Vriskomai sto |V(ù)|
LA = log10(A);
ca = ifft(LA);          % To cepstrum
plot(ca);

% Thelw na ftiaksw ta p(n), m(n)
mouthca = zeros(40000, 1)       % vlepw apo workspace deigmata
% Stoxos: shma me mhdenika ektos tis arxis pou tha exw to cepstrum mouth
% kai ta symmetrika tou sto telos
mouthca(1:60) = ca(1:60);                                    % 60 prwta
mouthca(40000: -1: 40000-58) = ca(40000: -1: 40000 - 58)     % 59 last (to last olwn einai to 1o tou next)
% mouthca(40000: -1: 40000-59) = ca(2:60);    % katoptrismos
plot(mouthca);

% Pitch
pitchca = ca - mouthca;
plot(pitchca);

% Cepstrum pitch
CpA = fft(pitchca);         % Complex
estimatedPA = 10 .^ CpA;
estimatedpitcha = ifft(estimatedPA);
plot(estimatedpitcha);

% Stoma, tha vrw kai to mouth kai me synelixi tha brw tin fwni mou
CmA = fft(mouthca);
eMA = 10 .^ CmA;
ema = ifft(eMA);
% Kroustiki apokrisi
% plot(ema);
emreal = ema(1:100);        % Meta einai 0
epreal = estimatedpitcha(200:20000);            % 20000 ta misa pou me noiazoun
% To a na dw an einai idio me fwni mou
aq = conv(emreal, epreal);
s = audiorecorder(aq, 8000);
play(s);                                        % Pio syntomos hxos twra
