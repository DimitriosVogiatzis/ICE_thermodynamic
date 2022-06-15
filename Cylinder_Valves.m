%% V(theta) Calculation
%
for i=1:7200
    s(i,1)=r+l-sqrt(l^2-r^2*(sin(degtorad(0.1*i)))^2)-r*cos(degtorad(0.1*i));
    ds_dtheta(i,1)=r*(sin(degtorad(0.1*i))+r/(l*2)*sin(2*degtorad(0.1*i))/sqrt(1-(r/l)^2*sin(degtorad(0.1*i))^2));
    dV_dtheta(i,1)=Acyl*ds_dtheta(i);
end
%
s_max=max(s)-min(s);
Vd=Acyl*s_max;
Vc=Vd/(e-1);
V1=Vd+Vc;
%
for i=1:7200
    V(i,1)=Vc+s(i)*Acyl;
end
%
start=7200-ex_close-3880+3600 ;
endd=ex_close+3880-3600+1 ;
%
V=[V(endd:7200);V(1:endd-1,1)];
s=[s(endd:7200);s(1:endd-1,1)];
dV_dtheta=[dV_dtheta(endd:7200);dV_dtheta(1:endd-1)];
ds_dtheta=[ds_dtheta(endd:7200);ds_dtheta(1:endd-1)];
%
%% Valves' Lift and Cd Calculation
%
duration_in=(in_close+7200)-in_open;
duration_ex=(ex_close+7200)-ex_open;
%
Lift_in1=zeros(duration_in,1);                 % Lift of Valve in duration [m]
Lift_ex1=zeros(duration_ex,1);                 % Lift of Valve in duration [m]
%
space_in=2*pi/duration_in;
for i=1:(duration_in)
    if i<= (7200-in_open)
        a_in=in_open + i;
    else
        a_in=i-(7200-in_open);
    end
    xx=i*space_in;
    Lift_in1(i,1)=0.5*max_lift*(1-cos(xx));
    Lift_in(a_in,1)=Lift_in1(i);
end
space_ex=2*pi/duration_ex;
for i=1:(duration_ex)
    a_ex=ex_open + i;
    yy=i*space_ex;
    Lift_ex1(i,1)=0.5*max_lift*(1-cos(yy));
    Lift_ex(a_ex,1)=Lift_ex1(i);
end
%
in_Cf=interp1(ivl_coeff(:,1),ivl_coeff(:,2),Lift_in);
ex_Cf=interp1(evl_coeff(:,1),evl_coeff(:,2),Lift_ex);
%
%% Active Area during Intake and Exhaust
%
for i=1:7200
    %
if Lift_in(i)<0.25*d_in
        A_in(i)=pi*d_in*Lift_in(i);
    else
        A_in(i)=0.25*pi*d_in^2;
end
    %
    if Lift_ex(i)<0.25*d_ex
        A_ex(i)=pi*d_ex*Lift_ex(i);
    else
        A_ex(i)=0.25*pi*d_ex^2;
    end
end
%