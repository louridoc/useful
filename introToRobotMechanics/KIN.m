% Write a subroutine to compute the kinematics of the planar 3R robot in Example 3.3 – that is, a routine with the joint angles’ 
% values as input, and a frame (the wrist frame relative to the base frame) as output. 
% 	
% The type “frame” consists of a 2 x 2 rotation matrix and a 2x1 position vector. If desired, you may represent the frame with a 
% 3x3 homogeneous transform in which the third row is [0 0 1]. 
% (The manipulator data are l1=l2=0.5 meters).
function wrelb=KIN(theta)
  q1=deg2rad(theta(1)); %get the first element of vector theta (q1) and convert to degrees.
  q2=deg2rad(theta(2)); %get the second element of vector theta (q2) and convert to degrees.
  q3=deg2rad(theta(3)); %get the third element of vector theta (q3) and convert to degrees.
  l1=0.5; %Given by the problem
  l2=0.5; %Given by the problem
  l3=0.25; %Given by the user 
  %Direct kinematics for 3R manipulator (0T3) in 4x4 homegeneous
  %transformation matrix
  wrelb4by4=[cos(q1+q2+q3), -sin(q1+q2+q3), 0, l3*cos(q1+q2+q3)+l2*cos(q1+q2)+l1*cos(q1); ...
      sin(q1+q2+q3), cos(q1+q2+q3), 0, l3*sin(q1+q2+q3)+l2*sin(q1+q2)+l1*sin(q1); ...
      0,0,1,0; ...
      0,0,0,1];
  % construction of 3x3 matrix
  wrelb=[[wrelb4by4(1:2,1:2),wrelb4by4(1:2,4)];0 0 1];
end    

% KIN([10,20,30])
% 
% ans =
% 
%     0.5000   -0.8660    1.0504
%     0.8660    0.5000    0.5533
%          0         0    1.0000
