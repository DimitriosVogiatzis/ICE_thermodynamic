%% Geometry Input
%
b=0.093;                              % Piston diameter    [m]
l=0.168;                              % Conductor length   [m]
r=0.051;                              % Crank radius       [m]
e=17;                                 % Compression Ratio  [-]
Ahead=8.15*10^-3;                     % Cylinder Head Area [m^2]
Ac=3.1*10^-3;                         % Sleeve Area        [m^2]
Acyl=b^2*pi/4;                        % Cylinder Area      [m^2]
%
%% Valves Input
%
% InOutlet Valve Lift/Flow Coefficient
ivl_coeff=[0 0;1.0005000 0.1266533;2.0010000 0.2521121;
           3.0000004 0.3571422;3.9999990 0.4665935;
           4.9999999 0.5201826;6.0000008 0.5527768;
           6.9999994 0.5700344;8.0000003 0.5897733;
           8.9999989 0.6063746;9.9999998 0.6055807];
% Outlet Valve Lift/Flow Coefficient
evl_coeff=[0 0;0.84 0.103;1.68 0.236;2.52 0.350;3.36 0.439;
           4.2 0.501;5.04 0.533;5.88 0.545;6.72 0.5521254;
           7.56 0.5563595;8.4 0.5588999;9.24 0.5622872];
%
ivl_coeff(:,1)=ivl_coeff(:,1)/1000;
evl_coeff(:,1)=evl_coeff(:,1)/1000;
% Inlet Valve Timing
in_open=6680;
in_close=2100;
% Outlet Valve Timing
ex_open=4580;
ex_close=0;
TDC=3600-(3880-3600);
% Valves Geometry Input
d_in=0.027;                           % Inlet Valve Diameter    [m]
d_ex=0.024;                           % Outlet Valve Diameter   [m]
max_lift=0.008;                       % Max Valve Lift         [m]
%% Boundary Conditions Input
%
Pex_Pin=1.05;                         % Pex/Pi Ratio            [-]
Twall=450;                            % Wall Temperature        [K]
% Combustion Parameters Input
LHV = 43400000;                       % Diesel Lower Cal. Value [J/kg]
m1=1.8;                               % Form Parameter          [-]
m2=0.85;                              % Form Parameter          [-]
df1=55;                               % Combustion duration 1   [o]
df2=450;                              % Combustion duration 2   [o]
x=0.17;                               % Premix Bunt Fuel Ratio  [-]
f_fb=TDC-200;                         % First Injection Angle   [o]
cu_cm=1.7;                            % Inlet Vorticity Coeff.  [-]
REFN=2000;                            % Reference N             [rpm]
REFbmep=6;                            % Reference bmep          [bar]
fbb2_fbb1=20;                         % Ignition difference     [o]
%
C1_ex=6.18+0.417*cu_cm;               % Intake-Exhaust Mass C1  [-]
C1_ce=2.28+0.308*cu_cm;               % Compr.-Expansion C1     [-]
C2=0.00324;                           % Combustion C2           [-]
%
%% Operating Point Choice
%
choice1 = questdlg('Please choose operating point to calculate (N/bmep/Pin/Tin)', ...
    'Operating Point', 'Predefined','New point','Predefined');
switch choice1
    case 'Predefined'
        choice = questdlg('Please choose among the 3 pre-calibrated operating points (N/bmep/Pin/Tin)', ...
            'Operating Point', '2000/5/1.85/345','4000/6/2.08/362','2500/4/1.9/347','2000/5/1.85/345');
        %
        switch choice
            case '2000/5/1.85/345'
                N=2000;                       % Revolutions per minute  [rpm]
                bmep=5;                       % Brake Mean Eff. Pressure[bar]
                Pin=185000;                   % Intake Pressure         [Pa]
                Tin=345;                      % Intake Teperature       [K]
                Uin=246725;                   % Intake Internal Energy  [J/kg]
                lambda=2.1;                   % Calibrated Assumption 1
                P(1)=Pin*0.9409;              % Calibrated Assumption 2  
                T(1)=448.;                    % Calibrated Assumption 3
                Psoc=1.2282*Pin;              % Calibrated Assumption 4
                Tsoc=390.7929;                % Calibrated Assumption 5   
            case '4000/6/2.08/362'
                N=4000;                       % Revolutions per minute  [rpm]
                bmep=6;                       % Brake Mean Eff. Pressure[bar]
                Pin=208000;                   % Intake Pressure         [Pa]
                Tin=362;                      % Intake Teperature       [K]
                Uin=258931;                   % Intake Internal Energy  [J/kg]
                lambda=1.815;                 % Calibrated Assumption 1
                P(1)=Pin*0.82755;             % Calibrated Assumption 2  
                T(1)=476.011;                 % Calibrated Assumption 3
                Psoc=1.2493*Pin;              % Calibrated Assumption 4
                Tsoc=421.9014;                % Calibrated Assumption 5 
            case '2500/4/1.9/347'
                N=2500;                       % Revolutions per minute  [rpm]
                bmep=4;                       % Brake Mean Eff. Pressure[bar]
                Pin=190000;                   % Intake Pressure         [Pa]
                Tin=347;                      % Intake Teperature       [K]
                Uin=248105;                   % Intake Internal Energy  [J/kg]
                lambda=2.542;                 % Calibrated Assumption 1
                P(1)=Pin*0.93;                % Calibrated Assumption 2  
                T(1)=476;                     % Calibrated Assumption 3
                Psoc=1.2365*Pin;              % Calibrated Assumption 4
                Tsoc=397.235;                 % Calibrated Assumption 5        
        end
    case 'New point'
                N=input('give speed(rpm):');                                  % Revolutions per minute  [rpm]
                bmep=input('give bmep(bar):');                                % Brake Mean Eff. Pressure[bar]
                Pin=input('give intake plenum pressure(Pa):');                % Intake Pressure         [Pa]
                Tin=input('give intake plenum temperature(K):');              % Intake Teperature       [K]
                Uin=input('give intake plenum internal energy(J/kg):');       % Intake Internal Energy  [J/kg]
                lambda=input('give an assumption for lambda:');                                      % Calibrated Assumption 1
                P(1)=input('give an assumption for cylinder pressure at starting of loop:');         % Calibrated Assumption 2  
                T(1)=input('give an assumption for cylinder temperature at starting of loop:');      % Calibrated Assumption 3
                Psoc=input('give an assumption for cylinder pressure at start of compression:');     % Calibrated Assumption 4
                Tsoc=input('give an assumption for cylinder temperature at start of compression:');  % Calibrated Assumption 5
end
%
dens_in=Pin/(287*Tin);                % Intake Density          [kg/m^3]
Pex=Pex_Pin*Pin;                      % Pressure in exhaust gas [Pa]
Tex=1100;                             % Exhaust Temperature     [K]
dens_ex=Pex/(287*Tex);                % density in exhaust gas  [kg/m^3]
h_in=Uin+Pin/dens_in;                 % Enthalpy of intake air  [J/kg]
h_ex = 660000 ;                       % Enthalpy of exhaust gas [J/kg]
%
n=N/60;                               % Rotations per second    [rps]
omega=2*pi*n;                         % Angular speed           [rad/s]
cm=2*r*n;                             % Piston mean velocity    [m/s]
%
%% MEPs
%
mfmep=1.2;                            % Friction losses         [bar] *
amep=2.69*((N/1000)^(3/2))*(10^(-2)); % Other losses            [bar]
pmep=(Pex-Pin)*(10^(-5));             % Pumping losses          [bar]
fmep= mfmep+pmep+amep;                % Mechanical losses       [bar]
imep=bmep+fmep;                       % Calculated imep         [bar]
%