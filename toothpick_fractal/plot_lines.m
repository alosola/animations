% Plot lines from this iteration
function plot_lines(step, lines_per_iter, colour)

global MainA

for nA=1:lines_per_iter(step)
    plot([MainA(nA*2-1,1,step),MainA(nA*2,1,step)],[MainA(nA*2-1,2,step),MainA(nA*2,2,step)],'Color',colour(step,:));
end

return;