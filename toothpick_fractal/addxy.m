% Adds a line on an existing point
function [a] = addxy(x,y,nA,step)

global MainA
global MACounter

MainA(MACounter,1,step+1) = MainA(nA,1,step)+x;
MainA(MACounter,2,step+1) = MainA(nA,2,step)+y;
MACounter=MACounter+1;

return;