% Subroutine to multiply two transforms together. 

function crela=ITOU_TMULT(brela,crelb)
  arotb=brela(1:2,1:2); %construction of rotation matrix aRb
  brotc=crelb(1:2,1:2); %construction of rotation matrix bRc
  apborg=brela(1:2,3); %construction of position vector apborg
  bpcorg=crelb(1:2,3); %construction of position vector bpcorg
  arotc=arotb*brotc; %multiplication of 3x3 matrices
  apcorg=(arotb*bpcorg)+apborg; %Calculation of apcorg
  crela=[arotc,apcorg;0 0 1]; %print aRc
end    

% brela=UTOI([1,2,30]); crelb=UTOI([3 4 10])
% crela=ITOU_TMULT(brela,crelb)

% crela =
% 
%     0.7660   -0.6428    1.5981
%     0.6428    0.7660    6.9641
%          0         0    1.0000
