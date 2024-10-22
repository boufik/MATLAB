clear all
clc

lamda = 0.1;
r = 0.3 * lamda;
N = 20;
theta = 0: pi/10 : 2 * pi - pi/10
diameter = lamda / 100;
segments = 5;
% 0. ���� segment �� ���� �����
segmentLength = r / segments;
if segmentLength < lamda / 10
    display('5 segments is an acceptable choice');
end

% 1. ������������� ����� ���� ��� ������ ��� ������ (0,0,0) ��� ��� �� 20
% ������ ��� ������
xStart = [];
yStart = [];
zStart = [];
for i = 1:20
    xStart(i) = 0;
    yStart(i) = 0;
    zStart(i) = 0;
end


% 2. ������������� ������ ���� ��� ������ ��� ������ (0,0,0) ��� ��� �� 20
% ������ ��� ������
xEnd = [];
yEnd = [];
zEnd = [];
for i = 1:20
    zEnd(i) = 0;
    xEnd(i) = r * cos(theta(i));
    yEnd(i) = r * sin(theta(i));
end

xStart
yStart
zStart
xEnd
yEnd
zEnd

% 3. ����� ��� ������������� ����� ��� ������ ��� disc wires �� ��� .nec
discFile = fopen("discCoordinates.nec", 'w');
format = 'GW %d %d %f %f %f %f %f %f %f\n';
for i = 1:20
    fprintf(discFile, format, i, segments, xStart(i), yStart(i), zStart(i), xEnd(i), yEnd(i), zEnd(i), diameter/2);
end
fclose(discFile);