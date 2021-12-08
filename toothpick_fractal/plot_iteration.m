function [im, imsize] = plot_iteration(step, lines_per_iter, times_per_iter, imsize, im, colour, figure_toothpick)

global MainA

% plot fractal
subplot(2,2,[1,3]);
plot_lines(step, lines_per_iter, colour)

if (mod(step,10)==0)
    imsize = max([(imsize + 5),(imsize + step/10),max(MainA,[],'all')]);
    xlim([-imsize,imsize])
    ylim([-imsize,imsize])
end

xlabel(sprintf('Iteration %i', step));
frame = getframe(figure_toothpick);
im{step} = frame2im(frame);



if (step ~= 1)
    % plot lines per iteration
    subplot(2,2,2);
    if ((lines_per_iter(step-1) == 4) && (step > 5))
        xline(step,':')
    end
    plot([step,step+1],[lines_per_iter(step-1),lines_per_iter(step)],'.-','LineWidth',1.5,'MarkerSize',10,'Color',colour(step,:))

    % plot time per iteration
    subplot(2,2,4);
    if ((lines_per_iter(step-1) == 4) && (step > 5))
        xline(step,':')
    end
    plot([step,step+1],[times_per_iter(step-1),times_per_iter(step)],'b.-','LineWidth',1.5,'MarkerSize',10,'Color',colour(step,:))
end