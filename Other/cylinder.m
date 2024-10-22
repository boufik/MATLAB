function [A, V] = cylinder(r, h)
A = 2 * pi * r * h + 2 * pi * r^2;
V = pi * r^2 * h;
end
