function lines_per_iter = toothpick_iteration(step, lines_per_iter, maxx, maxy, BCC, ignoreable)

global MainA
global MACounter

MACounter = 1;

% Calulate each line
for nA = 1:lines_per_iter(step)*2

    % current line in current iteration
    t1 = [MainA(nA,1,step),MainA(nA,2,step)];

    % Calculate non-repeated lines
    if (repeated(step, nA, t1, lines_per_iter, ignoreable, maxx, maxy) == 0)

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

% Calculate ignorable boxes
if(lines_per_iter(step+1)==4)
    boxClose(BCC)=step+1;
    BCC=BCC+1;
    if size(boxClose,2)>=4
        maxy = round((step-1)/2);
        maxx = round((step-1)/2)+rem((step-1),2);
        ignoreable = boxClose(BCC-1)-1;
    end

end