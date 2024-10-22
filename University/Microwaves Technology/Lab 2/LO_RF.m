clear all
clc

RF = 600;
LO = 800;
RF_half = RF / 2;
startpoint = 0;
endpoint = 2000;
step = 10;
LEN = (endpoint - startpoint)/step + 1;
value1 = -20;
value2 = -30;
value3 = -35;
value3 = -50;
value4 = -60;
value5 = -65;
noise = -100;
counter = 0;
fList = zeros(1, LEN);
dBList = zeros(1, LEN);
for f = startpoint : step : endpoint
    counter = counter + 1;
    fList(counter) = f;
    if f == abs(LO-RF) || f == abs(LO+RF)
        dbList(counter) = value1;
    elseif f == RF || f == LO
        dBList(counter) = value2;
    elseif f == RF_half
        dBList(counter) = value3;
    elseif f == abs(2*RF-LO) || f == abs(3*RF-2*LO) || f == abs(4*RF-3*LO) || f == abs(2*LO-RF) || f == abs(3*LO-2*RF) || f == abs(4*LO-3*RF) || f == abs(2*RF+LO) || f == abs(2*LO+RF) || f == abs(3*RF+2*LO) || f == abs(3*LO+2*RF)
        dBList(counter) = value4;
    elseif f == abs(LO-RF_half) || f == LO+RF_half || f == abs(2*LO+RF_half) || f == abs(3*LO-2*RF_half)
        dBList(counter) = value5;
    else
        dBList(counter) = randi([noise-3, noise+3]);  
    end
end

plot(fList, dBList);
title('Mixer: RF=600MHz and LO=800MHz');
xlabel('f (MHz)');
ylabel('dBm Level')