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
% ������
rDisc = 0.3 * lamda;
% �����
l = 0.5 * lamda;
theta0 = pi/6;
rCone = l * sin(pi/6);
h = l * cos(pi/6);
% ������ segment �����������
offsetZ = lamda / 20;


% ========================================================================
% ============================== Coordinates =============================
% ========================================================================
% 1. ������������� ����� ������
xDiscStart = [];
yDiscStart = [];
zDiscStart = [];
for i = 1:N
    xDiscStart(i) = 0;
    yDiscStart(i) = 0;
    zDiscStart(i) = 0;
end
 
 
% 2. ������������� ������ ������
xDiscEnd = [];
yDiscEnd = [];
zDiscEnd = [];
for i = 1:N
    zDiscEnd(i) = 0;
    xDiscEnd(i) = rDisc * cos(theta(i));
    yDiscEnd(i) = rDisc * sin(theta(i));
end
display('Disc coordinates done');

% 3. �������������� ����� �����
xConeStart = [];
yConeStart = [];
zConeStart = [];
for i = 1:N
    xConeStart(i) = 0;
    yConeStart(i) = 0;
    zConeStart(i) = offsetZ;
end

% 4. ������������� ������ �����
xConeEnd = [];
yConeEnd = [];
zConeEnd = [];
for i = 1:N
    zConeEnd(i) = offsetZ + h;
    xConeEnd(i) = rCone * cos(theta(i));
    yConeEnd(i) = rCone * sin(theta(i));
end
display('Cone coordinates done');

% ========================================================================
% ================================ fprintf ===============================
% ========================================================================
geometryFile = fopen('MyErgasia.nec', 'w');
% ���� .nec �������
fprintf(geometryFile, 'CM Disc-cone antenna: 8 wires for disc and 8 more for cone\n');
fprintf(geometryFile, 'CM Boufikos Thomas 9360\nCE\n\n');
% ������
format = 'GW %d %d %f %f %f %f %f %f %f\n';
% fprintf(geometryFile, 'CM Disc Data\n');
for i = 1:N
    fprintf(geometryFile, format, i, segments, xDiscStart(i), yDiscStart(i), zDiscStart(i), xDiscEnd(i), yDiscEnd(i), zDiscEnd(i), diameter/2);
end
% �����
format = 'GW %d %d %f %f %f %f %f %f %f\n';
% fprintf(geometryFile, '\nCM Cone Data\n');
for i = 1:N
    fprintf(geometryFile, format, i+N, segments, xConeStart(i), yConeStart(i), zConeStart(i), xConeEnd(i), yConeEnd(i), zConeEnd(i), diameter/2);
end
% ������ segment �����������
% fprintf(geometryFile, '\nCM Feed Segment\n');
xFeedStart = 0;
yFeedStart = 0;
zFeedStart = 0;
xFeedEnd = 0;
yFeedEnd = 0;
zFeedEnd = lamda/20;
format = 'GW %d %d %f %f %f %f %f %f %f\n';
segmentsFeed = 1;
fprintf(geometryFile, format, N+N+1, segmentsFeed, xFeedStart, yFeedStart, zFeedStart, xFeedEnd, yFeedEnd, zFeedEnd, diameter/2);

% ������ ������������
isThereGround = 0;
fprintf(geometryFile, '\n\nGE %d\n', isThereGround);
fprintf(geometryFile, 'EX 0 %d %d 0 1 0\n', N+N+1, segmentsFeed);
fprintf(geometryFile, 'FR 0 1 0 0 %d 0\n\n', f);
fprintf(geometryFile, 'EN');
display('All data transfered');

fclose(geometryFile);
