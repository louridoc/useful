% Write a subroutine that calculates where the tool is, relative to the station frame. The input to the routine is a vector 
% of joint angles:
% 
% Procedure WHERE (VAR theta: vec3; VAR trels: frame);
% 
% Obviously, WHERE must make use of descriptions of the tool frame and the robot base frame in order to compute the 
% location of the tool relative to the station frame. The values of  (_T^W)T and  (_B^S)T should be stored in global
% memory (or, as a second choice, you may pass them as arguments in WHERE).

function sTt=WHERE(theta,wTt,sTb)
  %The input is the a vector containing q1,q2,q3. We calculate wrelb with
  %this angles using the KIN function.
  bTw=KIN(theta);
  %Calculate Tool relative to Station (trels): sTt=sTb*bTw*wTt
  sTw=ITOU_TMULT(sTb,bTw); %Calculate Wrist relative to Station (wrels)
  sTt=ITOU_TMULT(sTw,wTt); %Calculate tool relative to station (trels) (Output)
end 

% trelw=UTOI([0.1 0.2 30])
% 
% trelw =
% 
%     0.8660   -0.5000    0.1000
%     0.5000    0.8660    0.2000
%          0         0    1.0000
% 
% srelb=UTOI([-0.1 0.3 0])
% 
% srelb =
% 
%     1.0000         0   -0.1000
%          0    1.0000    0.3000
%          0         0    1.0000
% 
% WHERE([0 90 -90],trelw,srelb)
% 
% ans =
% 
%     0.8660   -0.5000    0.7500
%     0.5000    0.8660    1.0000
%          0         0    1.0000
