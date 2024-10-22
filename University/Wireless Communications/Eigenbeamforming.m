clc
clear all

% Data
M = 2;
N = 3;
limit1 = 100;
limit2 = 400;
paronomastis = 1000;
H = createH(M, N, limit1, limit2, paronomastis)
if M <= N
    A = H * H';
else
    A = H' * H;
end

% SVD process
[U, L, V] = svd(A);
bitstream = createMessage(M, N)        % Bitstream contains 0's and 1's
% BPSK Modulation
x = 2 * bitstream - 1

% Confirmation
% 1. Precoding (*V)
x_send = V * x
% 2. Channel
y_receive = A * x_send
% 3. Premultiplication(*U')
y = U' * y_receive
% 4. MLD in modulation
x_guess = zeros(length(y), 1);
for k = 1:length(x_guess)
    if real(y(k)) > 0
        x_guess(k) = 1;
    elseif real(y(k)) < 0
        x_guess(k) = -1;
    else
        x_guess(k) = (-1) ^ randi([0 1]);
    end
end
x_guess
bitstream_guess = 0.5 * (x_guess + 1)
errors = sum(abs(bitstream - bitstream_guess))


% Auxiliary functions
function H = createH(M, N, limit1, limit2, paronomastis)
    H = zeros(M, N);
    for k = 1:M
        for j =1:N
            x = unifrnd(limit1, limit2) / paronomastis;
            y = unifrnd(limit1, limit2) / paronomastis;
            H(k, j) = x + y*i;
        end
    end
end

function message = createMessage(M, N)
    message = zeros(min(M, N), 1);
    for k = 1:length(message)
        message(k) = randi([0 1]);
    end
end