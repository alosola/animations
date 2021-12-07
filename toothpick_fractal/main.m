close all
clear all

%% Initialize variables
global MainA
global MACounter

MainA = [1 0; -1 0];

iter = 48; % number of fractal iterations
loops = iter-1; % number of loops calculated
lines_per_iter = zeros(1,iter);
lines_per_iter(1) = 1;

%% Calculate each iteration
for step=1:loops

    Lines = (size(MainA)); % number of lines in the iteration
    MACounter = 1;

    % Calulate each line
    for nA = 1:Lines(1)

        % current line in current iteration
        t1 = [MainA(nA,1,step),MainA(nA,2,step)];

        % Calculate non-repeated lines
        if (repeated(step, Lines, nA, t1) == 0)

            if rem(step, 2) == 0
                % for horizontal lines
                addxy(1,0,nA,step);
                addxy(-1,0,nA,step);
            else
                % for vertical lines
                addxy(0,1,nA,step);
                addxy(0,-1,nA,step);
            end
        end
    end

    % Register lines added in this iteration
    lines_per_iter(step+1) = (MACounter - 1) / 2;
end


%% Plot the number of lines per iteration

figure(1);
hold on
title('Number of lines added per iteration')
plot(1+linspace(0,iter,iter),lines_per_iter,'.-')
xlabel('iteration')
ylabel('new lines')

%% Plot the toothpick fractal

figure(2);
title('Toothpick fractal')
hold on

N=size(MainA,1)/2;
colour = parula(iter);

for j=1:iter
    for i=1:lines_per_iter(j)
        plot([MainA(i*2-1,1,j),MainA(i*2,1,j)],[MainA(i*2-1,2,j),MainA(i*2,2,j)],'Color',colour(j,:));
    end
end