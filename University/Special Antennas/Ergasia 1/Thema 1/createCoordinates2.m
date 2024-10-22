clear all
clc
 
% ========================================================================
% ================================= Data =================================
% ========================================================================
lamda = 0.1;
f = 3000;        % Mhz, due to 0.1m wavelength
N = 8;
theta = 0 : 2*pi/N : 2*pi - 2*pi / N;
diameter = lamda / 100;
segments = 5;
% Δίσκος
rDisc = 0.3 * lamda;
% Κώνος
l = 0.5 * lamda;
theta0 = pi/6;
rCone = l * sin(pi/6);
h = l * cos(pi/6);
% Μεσαίο segment τροφοδοσίας
offsetZ = lamda / 20;
 
 
% ========================================================================
% ============================== Coordinates =============================
% ========================================================================
% 1. Συντεταγμένες αρχής δίσκου
xDiscStart = [];
yDiscStart = [];
zDiscStart = [];
for i = 1:N
    xDiscStart(i) = 0;
    yDiscStart(i) = 0;
    zDiscStart(i) = 0;
end
 
 
% 2. Συντεταγμένες τέλους δίσκου
xDiscEnd = [];
yDiscEnd = [];
zDiscEnd = [];
for i = 1:N
    zDiscEnd(i) = 0;
    xDiscEnd(i) = rDisc * cos(theta(i));
    yDiscEnd(i) = rDisc * sin(theta(i));
end

% 3. Συντεαταγμένες αρχής κώνου
xConeStart = [];
yConeStart = [];
zConeStart = [];
for i = 1:N
    xConeStart(i) = 0;
    yConeStart(i) = 0;
    zConeStart(i) = offsetZ;
end

% 4. Συντεταγμένες τέλους κώνου
xConeEnd = [];
yConeEnd = [];
zConeEnd = [];
a = (pi / 6) / (N-1);
for i = 1:N
    xConeEnd(i) = 0;
end
for i = 1:2:N-1               % i = 1,3,5,7
    zConeEnd(i) = l * cos(a/2 + (i-1)*a);
    zConeEnd(i+1) = l * cos(a/2 + (i-1)*a);
    yConeEnd(i) = l * sin(a/2 + (i-1)*a);
    yConeEnd(i+1) = - l * sin(a/2 + (i-1)*a);
end

xConeEnd
yConeEnd
zConeEnd
 
 
% ========================================================================
% ================================ fprintf ===============================
% ========================================================================
geometryFile = fopen('ErgasiaFlat.nec', 'w');
% Αρχή .nec αρχείου
fprintf(geometryFile, 'CM Disc-cone antenna Question D: 8 wires for disc and 8 more for cone\n');
fprintf(geometryFile, 'CM Boufikos Thomas 9360\nCE\n\n');
% Δίσκος
format = 'GW %d %d %f %f %f %f %f %f %f\n';
for i = 1:N
    fprintf(geometryFile, format, i, segments, xDiscStart(i), yDiscStart(i), zDiscStart(i), xDiscEnd(i), yDiscEnd(i), zDiscEnd(i), diameter/2);
end
% Κώνος
format = 'GW %d %d %f %f %f %f %f %f %f\n';
for i = 1:N
    fprintf(geometryFile, format, i+N, segments, xConeStart(i), yConeStart(i), zConeStart(i), xConeEnd(i), yConeEnd(i), zConeEnd(i), diameter/2);
end
% Μεσαίο segment τροφοδοσίας
xFeedStart = 0;
yFeedStart = 0;
zFeedStart = 0;
xFeedEnd = 0;
yFeedEnd = 0;
zFeedEnd = lamda/20;
format = 'GW %d %d %f %f %f %f %f %f %f\n';
segmentsFeed = 1;
fprintf(geometryFile, format, N+N+1, segmentsFeed, xFeedStart, yFeedStart, zFeedStart, xFeedEnd, yFeedEnd, zFeedEnd, diameter/2);
 
% Λοιπές λεπτομέρειες
isThereGround = 0;
fprintf(geometryFile, '\n\nGE %d\n', isThereGround);
fprintf(geometryFile, 'EX 0 %d %d 0 1 0\n', N+N+1, segmentsFeed);
fprintf(geometryFile, 'FR 0 1 0 0 %d 0\n\n', f);
fprintf(geometryFile, 'EN');

fclose(geometryFile);