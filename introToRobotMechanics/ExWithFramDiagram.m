% The following frame definitions are given as known:
% ATU=[x y θ]=[11.0 -1.0  30.0],
% ABT=[x y θ]=[0.0  7.0  45.0], and
% UCT=[x y θ]=[-3.0 -3.0 -30.0],
% These frames are input in the user representation [x, y, θ] (where θ is in degrees). Draw a frame diagram (like Fig. 2.15, only in 2-D) that qualitatively shows their arrangement. Write a program that calls TMULT and TINVERT (defined in programming exercises 3 and 4) as many times as needed to solve (_C^B)T. Then print out (_C^B)T in both internal and user representation.

%Definitions given converted to matrix form
uTa=UTOI([11 -1 30]);
bTa=UTOI([0 7 45]);
cTu=UTOI([-3 -3 -30]);
% Transform all frames to be referenced to Universal Frame
uTb=ITOU_TMULT(uTa,TINVERT(bTa));
uTc=TINVERT(cTu);
%Outputs
bTc=ITOU_TMULT(TINVERT(uTb),uTc)
crelb_uf=ITOI(bTc)
% Plotting frames
quiver(0,0,1,0,0,'k')
hold on
quiver(0,0,0,1,0,'k')
quiver(uTa(1,3),uTa(2,3),uTa(1,1),uTa(2,1),0,'r','MaxHeadSize',0.5)
quiver(uTa(1,3),uTa(2,3),uTa(1,2),uTa(2,2),0,'r','MaxHeadSize',0.5)
quiver(uTb(1,3),uTb(2,3),uTb(1,1),uTb(2,1),0,'b','MaxHeadSize',0.5)
quiver(uTb(1,3),uTb(2,3),uTb(1,2),uTb(2,2),0,'b','MaxHeadSize',0.5)
quiver(uTc(1,3),uTc(2,3),uTc(1,1),uTc(2,1),0,'g','MaxHeadSize',0.5)
quiver(uTc(1,3),uTc(2,3),uTc(1,2),uTc(2,2),0,'g','MaxHeadSize',0.5)
grid
axis([-1 12 -9 6])
text(uTa(1,3)-0.2,uTa(2,3)+1,'A')
text(uTb(1,3)-0.2,uTb(2,3)+1,'B')
text(uTc(1,3)-0.2,uTc(2,3)+1,'C')
quiver(0,0,uTa(1,3),uTa(2,3),0,'m','MaxHeadSize',0.2)
quiver(uTb(1,3),uTb(2,3),uTa(1,3)-uTb(1,3),uTa(2,3)-uTb(2,3),0,'m','MaxHeadSize',0.2)
quiver(uTc(1,3),uTc(2,3),0-uTc(1,3),0-uTc(2,3),0,'m','MaxHeadSize',0.2)
quiver(uTb(1,3),uTb(2,3),uTc(1,3)-uTb(1,3),uTc(2,3)-uTb(2,3),0,'y','MaxHeadSize',0.2)
