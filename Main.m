%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Turbo Diesel Direct Injection Modelling %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Dimitrios Vogiatzis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
clc
clear
%
Data_Input;
%
Cylinder_Valves;
%
Initialization;
%
Assumption;
%
%% Main Loop
%
Calculations
%
Pm=mean(P(f_fb:f_fb+5));
Tm=mean(T(f_fb:f_fb+5));
Rm=mean(R(f_fb:f_fb+5));
%
Df_zv=6*N*(10^(-3))*(0.1+0.135*(1.0197*(Pm^(-0.97)))*exp(7800/(6.9167*Rm*Tm))+4.8*(1.0197*(Pm^(-1.8)))*exp(7800/(6.9167*Rm*Tm)));
%
%Calculations
%
%% Overall Work
%
work_imp=4*sum(P.*(dV_dtheta*deg2rad(0.1)));
ti = bmep*Vd/pi; %N*m
imep_imp=work_imp/(4*Vd)*10^(-5);
bmep_imp=imep_imp-fmep;
P_i=(imep_imp*10^5)*4*Vd*N/(2*60)/1000;
P_hp=P_i*1.38;
eff=100*work_imp/(4*Qb);
ev = m_air_tot/(dens_in*Vd) ; 
bsfc=3600/(eff/100*LHV)*10^6;
%
r1=(T(7200)+dT_dtheta(7200)*deg2rad(0.1))-T(1);
r2=(bmep_imp-bmep);
r3=P(7200)-P(1);
disp(num2str([r1 r2 r3]));

