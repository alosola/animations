function [im, imsize] = plot_iteration(step, lines_per_iter, imsize, im, colour, figure_toothpick)

global MainA

plot_lines(step, lines_per_iter, colour)

if (mod(step,10)==0)
    imsize = max((imsize + 5),max(MainA,[],'all'));
    xlim([-imsize,imsize])
    ylim([-imsize,imsize])
end

xlabel(sprintf('Iteration %i', step));
frame = getframe(figure_toothpick);
im{step} = frame2im(frame);