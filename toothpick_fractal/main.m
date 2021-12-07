close all
clear all

%% Initialize variables
global MainA
global MACounter

MainA = [1 0; -1 0];

iter = 50; % number of fractal iterations
loops = iter-1; % number of loops calculated
lines_per_iter = zeros(1,iter);
lines_per_iter(1) = 1;

%% Initialize graph
colour = hsv(iter); % colourmap for the fractal image
imsize = 5;
figure_toothpick = figure(1);
title('Toothpick fractal')
im = cell(1,loops);
xlim([-imsize,imsize])
ylim([-imsize,imsize])
hold on


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

    %% Plot lines from this iteration
    for nA=1:lines_per_iter(step)
        plot([MainA(nA*2-1,1,step),MainA(nA*2,1,step)],[MainA(nA*2-1,2,step),MainA(nA*2,2,step)],'Color',colour(step,:));
    end

    if (mod(step,5)==0)
        imsize = imsize + 2;
        xlim([-imsize,imsize])
        ylim([-imsize,imsize])
    end
    xlabel(sprintf('Iteration %i', step));
    frame = getframe(figure_toothpick);
    im{step} = frame2im(frame);

    %%
end

%% Save image frames to gif

delay = 2/loops; % gif will be 2 seconds long
writegif('toothpick.gif',im,loops,delay);
hold off


%% Plot the number of lines per iteration

figure(2);
hold on
title('Number of lines added per iteration')
plot(1+linspace(0,iter,iter),lines_per_iter,'.-')
xlabel('iteration')
ylabel('new lines')
xlim([1,iter])
