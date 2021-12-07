close all
clear all

%% Initialize variables
global MainA
global MACounter

MainA = [1 0; -1 0];

iter = 60; % number of fractal iterations
loops = iter-1; % number of loops calculated
lines_per_iter = zeros(1,iter);
lines_per_iter(1) = 1;

%% Initialize graph and animation

% set to 1 for animated gif, set to 0 for static graph of fractal
animation = 1;

% set to 1 for plot of lines per iteration
plot_lines_per_iteration = 0;

% select colour scheme for the fractal image
% select a number between 1 and 19
colour = select_color(3,iter);

figure_toothpick = figure(1);
title('Toothpick fractal')
hold on
box on

if animation
    duration = 4; % duration of gif in seconds
    looped_gif = 1; % 1 for looped gif
    imsize = 5;
    xlim([-imsize,imsize])
    ylim([-imsize,imsize])

    % initialize the frame collection
    im = cell(1,loops);
end


%% Calculate each iteration
for step=1:loops

    % Calculate lines for this iteration
    lines_per_iter = toothpick_iteration(step, lines_per_iter);

    if animation
        [im, imsize] = plot_iteration(step, lines_per_iter, imsize, im, colour, figure_toothpick);
    end

end



%% Save image frames to gif, or plot static image

if animation
    delay = duration/loops; % gif will be 2 seconds long
    writegif('toothpick.gif',im,loops,delay);
    hold off
else
    for step=1:loops
        plot_lines(step, lines_per_iter, colour)
    end
end


%% Plot the number of lines per iteration

if plot_lines_per_iteration
    figure(2);
    hold on
    title('Number of lines added per iteration')
    plot(1+linspace(0,iter,iter),lines_per_iter,'.-','LineWidth',2)
    xlabel('iteration')
    ylabel('new lines')
    xlim([1,iter])
end
