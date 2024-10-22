% ��� ��� ���� ��� �����������, �� ��� �� ����
% (�����)^2 = 2r^2 * (1 - cos(2*pi/N)) ��� ���� �� ���: ����� <= �/10
% �� ���� �� ���� �� � ��� ���� �� ����� � min ���� ���

clear all
clc

wavelength = 0.1;
chord = 0.1 * wavelength;
r = 0.3 * wavelength;
N = (2*pi) / acos(1 - chord^2 / (2 * r^2))

% �� ���������� ������� 18.7616, ���� ��� ��� ��������� ������� �� ���� 20