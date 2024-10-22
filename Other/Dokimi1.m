clear all
clc

syms x
f = x^2;
df = jacobian(f, [x]);
a1 = -1;
b1 = 5;
akro1 = a1;
akro2 = b1;
kentro = -1000;

apotelesma = -1000;
l = 1/10000;


while akro2 - akro1 > l
    kentro = 0.5 * (akro1 + akro2);
    display(akro1);
    display(akro2);
    display(kentro);
    paragwgos = subs(df, {x}, kentro);
    if paragwgos > 0
        akro2 = kentro;
    elseif paragwgos < 0
       akro1 = kentro ;
    elseif paragwgos == 0
        apotelesma = kentro
    end   
end

display(apotelesma)
display(kentro)
