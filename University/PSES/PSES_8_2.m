clear all
clc

s = audiorecorder(8000, 16, 1);
display('Say a = "AAAAAAAA"');
recordblocking(s, 5);
aaaa = getaudiodata(s);
plot(aaaa, 'blue');
title("Signals in the time");
hold on
display('"AAAAAAAA" has been recorded!')

sum = 0;
for i = 1 : 4 * 10^9
    sum = sum + 1;
end

display('SAY i = "IIIIIIII"');
recordblocking(s, 5);
iiii = getaudiodata(s);
plot(iiii, 'red');
display('"IIIIIIII" has been recorded!')

A = fft(aaaa);
mA = abs(A);
pA = angle(A);
I = fft(iiii);
mI = abs(I);
pI = angle(I);
figure(2);
plot(mA, 'blue');
title("Signals in Fourier domain");
hold on
plot(mI, 'red');

W1 = mA .* exp(j*pI);
W2 = mI .* exp(j*pA);
w1 = real(ifft(W1));
w2 = real(ifft(W2));
s1 = audioplayer(w1, 8000);
display('You will listen to w1 = IFT{ |A|<I }');
play(s1);

sum = 0;
for i = 1 : 4 * 10^9
    sum = sum + 1;
end

s2 = audioplayer(w2, 8000);
display('You will listen to w2 = IFT{ |I|<A }');
play(s2);
display(' ');
display('If you made a = "AAAAAAAA" and i = "IIIIIIII", you must hear:');
display('The first sound = w1 as "AAAAAAAA" and');
display('The second sound = w2 as "IIIIIIII"');