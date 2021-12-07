function lines_per_iter = toothpick_iteration(step, lines_per_iter)

global MainA
global MACounter

MACounter = 1;

% Calulate each line
for nA = 1:lines_per_iter(step)*2

    % current line in current iteration
    t1 = [MainA(nA,1,step),MainA(nA,2,step)];

    % Calculate non-repeated lines
    if (repeated(step, lines_per_iter, nA, t1) == 0)

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