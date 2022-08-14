%% Plot animation

figure_fractal_single = figure(1);

loops = size(MainA,3);

title('Toothpick fractal')
duration = 4; % duration of gif in seconds
looped_gif = 1; % 1 for looped gif
imsize = 5;
hold on
box on
xlim([-imsize,imsize])
ylim([-imsize,imsize])
for step=1:loops
    % plot fractal
    plot_lines(step, lines_per_iter, colour)

    if (mod(step,10)==0)
        imsize = imsize+5;
        xlim([-imsize,imsize])
        ylim([-imsize,imsize])
    end

    xlabel(sprintf('Iteration %i', step));
    frame = getframe(figure_fractal_single);
    im{step} = frame2im(frame);

end