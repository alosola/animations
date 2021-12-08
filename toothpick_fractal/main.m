close all
clear all

%% Initialize variables
global MainA
global MACounter

iter = 30; % number of fractal iterations
loops = iter-1; % number of loops calculated

MainA = zeros(400,2,iter);
MainA = [1 0; -1 0];

lines_per_iter = zeros(1,iter);
lines_per_iter(1) = 1;

times_per_iter = zeros(1,iter);

% ignorable after a box is closed
boxClose = zeros(1,20);
boxClose = 1;
BCC = 1;
ignoreable=1;
maxx=-1;
maxy=-1;

%% Initialize graph and animation

% set to 1 for animated gif, set to 0 for static graph of fractal
animation = 1;

% select colour scheme for the fractal image
% select a number between 1 and 19
colour = select_color(5,iter);

figure_toothpick = figure(1);
figure_toothpick.WindowState = 'maximized';

if animation
    duration = 4; % duration of gif in seconds
    looped_gif = 1; % 1 for looped gif
    imsize = 5;

    % fractal
    subplot(2,2,[1,3]);
    title('Toothpick fractal')
    hold on
    box on
    xlim([-imsize,imsize])
    ylim([-imsize,imsize])

    % lines
    subplot(2,2,2);
    hold on
    title('Number of lines added per iteration')
    xlabel('iteration')
    ylabel('new lines')
%     xlim([1,iter])
    box on

    % initialize the frame collection
    im = cell(1,loops);


    % time
    subplot(2,2,4);
    hold on
    title('Time per iteration')
    xlabel('iteration')
    ylabel('time spent ms')
%     xlim([1,iter])
    box on

    % initialize the frame collection
    im = cell(1,loops);
end

% start timer
tic

%% Calculate each iteration
for step=1:loops

    % Calculate lines for this iteration
    lines_per_iter = toothpick_iteration(step, lines_per_iter, maxx, maxy, BCC, ignoreable);
    times_per_iter(step) = toc;

    if animation
        [im, imsize] = plot_iteration(step, lines_per_iter, times_per_iter, imsize, im, colour, figure_toothpick);
    else
        disp(step)
    end
end



%% Save image frames to gif, or plot static image

if animation
    delay = duration/loops; % gif will be 2 seconds long
    writegif('result_gif.gif',im,loops,delay);
    hold off
else
    for step=1:loops
        plot_lines(step, lines_per_iter, colour)
    end
end


%% Plot the number of lines per iteration

% if plot_lines_per_iteration
%     figure(2);
%     hold on
%     title('Number of lines added per iteration')
%     plot(1+linspace(0,iter,iter),lines_per_iter,'.-','LineWidth',2)
%     xlabel('iteration')
%     ylabel('new lines')
%     xlim([1,iter])
% end

%% Save run

% save the result variables
save('result_variables.mat')

% save the final image
saveas(figure_toothpick, "result_image.png", 'png')
