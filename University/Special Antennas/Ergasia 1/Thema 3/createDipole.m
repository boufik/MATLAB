clear all
clc

% 1. Δεδομένα
N = 21;
dipoleLength = 8.36 * 0.01;
diameter = 2.6 * 0.001;
% Θέλω να χωρίσω το επόμενο διάστημα σε 21 μέρη ή αλλιώς να πάρω
% 22 διαφορετικές τιμές χρησιμοποιώντας την linspace
zList = linspace(-dipoleLength/2, dipoleLength/2, N+1)

% 2. Παραγωγή συντεταγμένων
xStart = [];
xEnd = [];
yStart = [];
yEnd = [];
zStart = [];
zEnd = [];
for i = 1:21
    xStart(i) = 0;
    xEnd(i) = 0;
    yStart(i) = 0;
    yEnd(i) = 0;
    zStart(i) = zList(i);
    zEnd(i) = zList(i+1);
end

zStart
zEnd

% 3. fprintf
geometryFile = fopen('dipole.nec', 'w');
format = 'GW %d %d %.6f %.6f %.6f %.6f %.6f %.6f %.6f\n';
fprintf(geometryFile, 'CM Wire-grid dipole-antenna\n\n');
for i = 1:N
    fprintf(geometryFile, format, i, 1, xStart(i), yStart(i), zStart(i), xEnd(i), yEnd(i), zEnd(i), diameter/2);
end

fclose(geometryFile);
