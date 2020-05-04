function [near,far,sol]=INVKIN(wrelb,current)
l1=0.5; %Given by the problem
l2=0.5; %Given by the problem
l3=0.25; %Given by the USER
 
phi=atan2(wrelb(2,1),wrelb(1,1)); %total phi calculated
 
%Calculation of Cosine q2
C2=((wrelb(1,3)-l3*cos(phi))^2 + (wrelb(2,3)-l3*sin(phi))^2 - l1^2 - l2^2) / (2*l1*l2); %Solving for C2
 
%Validation if the point is out of reach 
if C2>1
    error='There is no solution'
    near=current;
    far=[0 0 0];
    sol='FALSE';
    return
end
 
%If soultion is not out of reach, we calculate 2 possible solutions for Sine q2.
S21=sqrt(1-C2^2); %2 solutions for S2. Solution 1 + 
S22=-sqrt(1-C2^2); %Solution 2 -
 %Solution 1 (with the value of q21)
q21= atan2(S21,C2); % Solution 1, S2 positive (S21)
q11=atan2((wrelb(2,3)-l3*sin(phi)),(wrelb(1,3)-l3*cos(phi)))-atan2(l2*S21,l1 + l2*C2);
q31=phi-q21-q11;
sol1=[rad2deg(q11) rad2deg(q21) rad2deg(q31)];
 
%Solution 2(with the value of q22)
q22= atan2(S22,C2); % Solution 2, S2 negative (S22)
q12=atan2((wrelb(2,3)-l3*sin(phi)),(wrelb(1,3)-l3*cos(phi)))-atan2(l2*S22,l1 + l2*C2);
q32=phi-q22-q12;
sol2=[rad2deg(q12) rad2deg(q22) rad2deg(q32)];
 
%Validate angles range (-170<=angle<=170)
chk1=1; %variables with initial value of 1, updated to zero if angles are out of range.
chk2=1;
%finish evaluation of solution 1 if it is out of range.
for i=1:1:3
    if sol1(i)>170 || sol1(i)<-170
        error='Solution 1 out of range -170<x<170'
        sol1
        chk1=0;
        break
    end   
end
%finish evaluation of solution 2 if it is out of range.
for i=1:1:3
    if sol2(i)>170 || sol2(i)<-170
        error='Solution 2 out of range -170<x<170'
        sol2
        chk2=0;
        break
    end   
end
%finish evaluation the 2 solutions if both are out of range.
if (chk1==0 && chk2==0)
    sol = 'No solutions found';
    near=current;
    far=[0 0 0];
    return
end
 
%Estimation of near and far solution
if (norm(sol1)>0 && chk1==1) && (norm(sol2)>0 && chk2==1)
    % Criteria to define nearest solution
    % distance traveled =(abs(final q1- initial q1)*l1)+ abs((final q2- initial q2)*l2)+abs((final q3- initial q3)*l3)
    %Solution 1
    dqs1=(abs(q11-deg2rad(current(1)))*l1)+(abs(q21-deg2rad(current(2)))*l2)+(abs(q31-deg2rad(current(3)))*l3);
    %Solution 2
    dqs2=(abs(q12-deg2rad(current(1)))*l1)+(abs(q22-deg2rad(current(2)))*l2)+(abs(q32-deg2rad(current(3)))*l3);
    if dqs1<dqs2
        near=sol1;
        far=sol2;
        sol='TRUE';
        return
    else
        near=sol2;
        far=sol1;
        sol='TRUE';
        return
    end
else
    if (norm(sol1)>0 && chk1==1)
        sol='TRUE (just 1 solution)';
        near=sol1;
        far=sol1;
        return
    end
   if (norm(sol2)>0 && chk2==1)
        sol='TRUE (just 1 solution)';
        near=sol2;
        far=sol2;
        return
   end
end
 end
