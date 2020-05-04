% A tool is attached to link 3 of the manipulator. This tool is described by (_T^W)T, the tool frame relative to the 
% wrist frame. Also, a user has described his work area, the station frame relative to the base of the robot, 
% as (_S^B)T. Write the subroutine Procedure SOLVE (VAR trels: frame; VAR current, near, far: vec3; VAR sol: boolean);
% Where “trels” is the {T} frame specified relative to the {S} frame. Other parameters are exactly as in the INVKIN subroutine.
% The definitions of {T} and {S} should be globally defined variables or constants. SOLVE should use calls to TMULT, 
% TINVERT, and INVKIN.
function [near,far,sol]=SOLVE(trels,trelw,srelb,current)
  tTw=TINVERT(trelw); %Calculation of Wrist frame relative to Tool wrelb (inverting trelw)
  bTt=ITOU_TMULT(srelb,trels); %Calculation of Tool relative to Base (bTs*sTt)
  bTw=ITOU_TMULT(bTt,tTw); %Calculation of wrist relative to base

  %with the information available to give the angles q1,q2,q3 using INVKIN
  %function
   [near,far,sol]=INVKIN(bTw,current);

end
