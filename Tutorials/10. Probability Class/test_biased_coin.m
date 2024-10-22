clc
clear all

% MAIN FUNCTION
p_heads = 0.25;
n = 10000;
testBiasedCoin(p_heads, n);

% AUXILIARY FUNCTIONS
function face = biased_coin( p_heads )

    if rand < p_heads
        face = 0;
    else
        face = 1;
    end
end

function testBiasedCoin( p_heads, n )
    % Initialize
    A = zeros(n,1);
    for i=1:n
        A(i) = biased_coin(p_heads);
    end
    hist(A);
    title('probHeads = 0.25, 0 = head, 1 = tail');
end

