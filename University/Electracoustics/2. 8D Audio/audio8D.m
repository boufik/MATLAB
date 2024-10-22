clc
clear all

[d, Fs] = audioread('message.mp3');
BOOST = 5;

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
display('1. Original Audio: ');
display(' ');
sound(d, Fs);
delay(12);
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
display('2. Left boosted Audio: ');
display(' ');
left = d;
left(:, 1) = left(:, 1) * BOOST;
sound(left, Fs);
delay(12);
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
display('3. Right boosted Audio: ');
display(' ');
right = d;
right(:, 2) = right(:, 2) * BOOST;
sound(right, Fs);
delay(12);
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
display('4. 8D Audio changes during one sound message: ');
display(' ');
left = d(:, 1);
right = d(:, 2);
SIZE = size(left);
trito = floor(SIZE / 3);

for i = 1 : trito
    left(i) = left(i) * BOOST;
end
for i = 2*trito+1 : SIZE
    right(i) = right(i) * BOOST;
end
new(:, 1) = left;
new(:, 2) = right;
sound(new, Fs);
delay(12);
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% 8D Audio - Normal transition
display('5. 8D Audio - Normal transition (right ----> left): ');
display(' ');
left = d(:, 1);
right = d(:, 2);
mysize = size(left);
SIZE = mysize(1);
% First, I will create the 2 ranges
low1 = 1;
high1= BOOST;
range1 = linspace(low1, high1, SIZE);
range2 = fliplr(range1);
% Now, I will create left and right
for i = 1:SIZE
    left(i) = left(i) * range1(i);
    right(i) = right(i) * range2(i);
end
% Sound
new(:, 1) = left;
new(:, 2) = right;
sound(new, Fs);
delay(12);
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Auxiliary Function
function delay(seconds)
    counter = 0;
    for i = 1 : seconds * 10^9
        counter = counter + 1;
    end
end
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~