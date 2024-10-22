clear all
clc

lamda = 0.1;
l = 0.5 * lamda;
theta0 = pi/6;
N = 20;
segments = 5;
% Από το ορθογώνιο τρίγωνο που δημιουργείται
r = l * sin(pi/6);
h = l * cos(pi/6);
offsetZ = lamda / 20;
diameter = lamda / 100;
theta = 0: 2*pi / N : 2*pi - 2*pi / N

% 1. Συντεαταγμένες αρχής
xStart = [];
yStart = [];
zStart = [];
for i = 1:N
    xStart(i) = 0;
    yStart(i) = 0;
    zStart(i) = offsetZ;
end

% 2. Συντεταγμένες τέλους
xEnd = [];
yEnd = [];
zEnd = [];
for i = 1:N
    zEnd(i) = offsetZ + h;
    xEnd(i) = r * cos(theta(i));
    yEnd(i) = r * sin(theta(i));
end

xStart
yStart
zStart
xEnd
yEnd
zEnd

% 3. Φτιάξιμο αρχείου - Τα νέα wires θα έχουν αύξοντα από 21 ως 40
coneFile = fopen('coneCoordinates.nec', 'w');
format = 'GW %d %d %f %f %f %f %f %f %f\n';
for i = 1:N
    fprintf(coneFile, format, i+20, segments, xStart(i), yStart(i), zStart(i), xEnd(i), yEnd(i), zEnd(i), diameter/2);
end

fclose(coneFile);