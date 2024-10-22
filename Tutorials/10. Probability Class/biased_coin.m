clc
clear all

% MAIN FUNCTION
p_heads = 0.25;
N = 100;
counter = 0;
for i = 1:N
    face = biasedCoin(p_heads);
    if face == 'heads'
        counter = counter + 1;
    end
end
p_heads
probHeads = counter / N

% AUXILIARY FUNCTION
function face = biasedCoin( p_heads )

    if rand < p_heads
        face = 'heads';
    else
        face = 'tails';
    end
end

