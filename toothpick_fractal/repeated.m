% returns 1 if the point is repeated (lines overlap)
function repeated = repeated(step, nA, t1, lines_per_iter, ignoreable, maxx, maxy)

global MainA

repeated = 0;
for n1 = ignoreable:step
    for a1=1:lines_per_iter(n1)*2
        t2=[MainA(a1,1,n1),MainA(a1,2,n1)];
        if ((t1==t2)&((a1~=nA)|(step~=n1))|((abs(t1(1))<maxx)&(abs(t1(2))<maxy)))
            repeated=1;
        end
    end
end
