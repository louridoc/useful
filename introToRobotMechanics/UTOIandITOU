% We wish to describe orientation in the planar world by a single angle θ, instead of by a 2 x 2 rotation matrix. 
% The user will always communicate in terms of angle θ, but internally we will need the rotation-matrix form. 
% For the position-vector part of a frame, the user will specify an x and a y value. So, we want to allow the user to specify a 
%frame as a 3-tuple: (x, y, θ). Internally, we wish to use a 2 x 1 position vector and a 2 x 2 rotation matrix, so we need conversion 
%routines. 

% Where “UTOI” stands for “User form TO Internal form.” The first argument is the 3-tuple (x, y, θ), and the second argument is of 
% type “frame.” Consists of a (2x1) position vector and a (2x2) rotation matrix. 

% If you wish, you may represent the frame with a (3x3) homogeneous transform in which the third row is [0 0 1]. 
% The inverse routine will also be necessary.

function iform=UTOI(uform)
    x=uform(1); y=uform(2); theta=deg2rad(uform(3));     
    r=[cos(theta),-sin(theta);sin(theta),cos(theta)]; %Rotation matrix in 2D
    t=[x,y]'; %position vector
    iform=[r,t;[0 0],1]; %Transform
end

function uform=ITOU(iform)
    theta=rad2deg(atan2(iform(2,1),iform(1,1))); %calculation of theta using atan2 (sin(theta),cos(theta)), in degrees
    x=iform(1,3); %get x element from position vector
    y=iform(2,3); %get y element from position vector
    uform=[x,y,theta]; %print matrix as a user-form vector
end    

 
% UTOI([2,3,50])
% 
% ans =
% 
%     0.6428   -0.7660    2.0000
%     0.7660    0.6428    3.0000
%          0         0    1.0000
%          
%  ITOU(ans)
% 
% ans =
% 
%     2.0000    3.0000   50.0000
