% returns 1 if the point is repeated (lines overlap)
function repeated = repeated(step, Lines, nA, t1)

global MainA

repeated = 0;
for n1 = 1:step
    for a1=1:Lines(1);%lines_per_iter(n1)
        t2=[MainA(a1,1,n1),MainA(a1,2,n1)];
        if ((t1==t2)&((a1~=nA)|(step~=n1)))
            repeated=1;
        end
    end
end