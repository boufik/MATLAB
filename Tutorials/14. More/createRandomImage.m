clc
clear all

% MAIN FUNCTION
M = 512;
N = 512;
times = 100;
figure(1);
createImage(M, N);
figure(2);
createLayersImage(M, N);


% Function 1 - Create Image
function createImage(M, N)
    for i = 1:M
        for j = 1:N
            red = randi([0 255]);
            green = randi([0 155]);
            blue = randi([0 255]);
            A(i, j, 1) = red;
            A(i, j, 2) = green;
            A(i, j, 3) = blue;
        end
    end
    imshow(A);
end

% Function 2 - Create Layers Image
function createLayersImage(M,N)
    for i = 1:M
        for j = 1:N
            if i < M/4
                red = randi([0 55]);
                green = randi([100 155]);
                blue = randi([200 255]);
                A(i, j, 1) = red;
                A(i, j, 2) = green;
                A(i, j, 3) = blue;
            elseif i < M / 2
                red = randi([100 155]);
                green = randi([0 55]);
                blue = randi([200 255]);
                A(i, j, 1) = red;
                A(i, j, 2) = green;
                A(i, j, 3) = blue;
            elseif i < 3*M / 4
                red = randi([200 255]);
                green = randi([100 155]);
                blue = randi([0 55]);
                A(i, j, 1) = red;
                A(i, j, 2) = green;
                A(i, j, 3) = blue;
            else
                red = randi([0 255]);
                green = randi([0 155]);
                blue = randi([0 255]);
                A(i, j, 1) = red;
                A(i, j, 2) = green;
                A(i, j, 3) = blue;
            end
        end
    end

    imshow(A);
    hold on
end
