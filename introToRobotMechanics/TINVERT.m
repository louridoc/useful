% Subroutine to invert a transform. 

function arelb=TINVERT(brela)
    arotb=brela(1:2,1:2);   %arotb is the rotation matrix of brela
    apborg=brela(1:2,3);    %apborg is the position vector of brela

    brota=arotb';   %calculation of arotb transposed (this is arelb rotation matrix)
    bpaorg=-brota*apborg; %calculation of position vector of arelb
    arelb=[brota,bpaorg;0 0 1]; %Construction of my transform
end    
