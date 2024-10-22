clear all
clc

a = 2i+5
normA = abs(a)
angleA = angle(a)
angleAinDegrees = atand(2/5)
aConj = conj(a)
normAConj = abs(aConj)
angleAConj = angle(a)
angleAinDegreesConj = atand(imag(aConj)/real(aConj))
C = complex(5,10)
D = complex([1 2; 3 4], [5 6; 7 8])