% Subroutine to invert a transform. 

function arelb=TINVERT(brela)
    arotb=brela(1:2,1:2);   %arotb is the rotation matrix of brela
    apborg=brela(1:2,3);    %apborg is the position vector of brela

    brota=arotb';   %calculation of arotb transposed (this is arelb rotation matrix)
    bpaorg=-brota*apborg; %calculation of position vector of arelb
    arelb=[brota,bpaorg;0 0 1]; %Construction of my transform
end    


% aRb=UTOI([1 2 30]);bRa=TINVERT(aRb)
% 
% bRa =
% 
%     0.8660    0.5000   -1.8660
%    -0.5000    0.8660   -1.2321
%          0         0    1.0000
