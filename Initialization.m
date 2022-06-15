%% Initialization
%
F=ones(7200,1)*10^(-10);           % Fuel - Air Ratio         [-]
dF_dtheta=zeros(7200,1);           % Fuel - Air Ratio Change  [1/rad]
%
Cp=zeros(7200,1);                  % Specific Heat at P=const [J/(kg*K)]
Cv=zeros(7200,1);                  % Specific Heat at V=const [J/(kg*K)]
R=zeros(7200,1);                   % Constant of Gas          [J/(kg*K)] %%% changed line %%%
k=zeros(7200,1);                   % Gas Constant ?           [-]
%
dens=zeros(7200,1);                % Density in Cylinder        [Pa]
U=zeros(7200,1);                   % Internal Energy of mix.  [J/kg]
h=zeros(7200,1);                   % Enthalpy of mix.         [J/kg]
DHin = zeros(7200,1);
DHex = zeros(7200,1);
%
dU_dT=zeros(7200,1);               % Int. Energy over T       [J/(kg*K)]
dU_dF=zeros(7200,1);               % Int. Energy over F       [J/kg]
dT_dtheta=zeros(7200,1);           % Temperature change       [K/rad]
dU_dtheta=zeros(7200,1);
%
A_in=zeros(7200,1);                % Intake runner active area  [m^2]
A_ex=zeros(7200,1);                % Exhaust runner active area [m^2]
pin=zeros(7200,1);                 % P(i)/Pin ratio             [-]
pin_crit = zeros(7200,1);          % chocked flow
pex_crit = zeros(7200,1);          % chocked flow
pex=zeros(7200,1);                 % Pex/P(i) ratio             [-]
Psi_in=zeros(7200,1);              % Flow factor of m_in        [-]
Psi_ex=zeros(7200,1);              % Flow factor of m_ex        [-]
m_in=zeros(7200,1);                % Mass alteration in Intake  [kg/rad]
m_ex=zeros(7200,1);                % Mass alteration in Exhaust [kg/rad]
%
m_air=zeros(7200,1);               % Air mass in cylinder       [kg/rad]
m_fuel=zeros(7200,1);              % Fuel mass in cylinder      [kg/rad]
m_tot=zeros(7200,1);               % Total mass in cylinder     [kg/rad]
%
dma_dtheta=zeros(7200,1);          % Air mass alteration        [kg/rad]
dmf_dtheta=zeros(7200,1);          % Fuel mass alteration       [kg/rad]
dmt_dtheta=zeros(7200,1);          % Total mass alteration      [kg/rad]
%
T=zeros(7200,1);                   % Temperature in Cylinder    [K]
P=zeros(7200,1);                   % Pressure in Cylinder       [Pa]

Po=zeros(7200,1);                  % Pressure without Combustion[Pa]
v_dQ=zeros(7200,1);                % Thermal Losses variable    [Pa]
a=zeros(7200,1);                   % Thermal conduction factor  [W/(m^2*K)]
A=zeros(7200,1);                   % Thermal conduction area    [m^2]
dQw_dtheta=zeros(7200,1);          % Thermal Losses             [J/rad]
%
dQb1_dtheta=zeros(7200,1);         % Premix Heat Dissipation    [J/rad]
dQb2_dtheta=zeros(7200,1);         % Main Heat Dissipation      [J/rad]
dQb_dtheta=zeros(7200,1);          % Total Heat Dissipation     [J/rad]
%
%% v_dQ for for Intake, Exhaust, Compression and Expansion
%
for i=1:7200
    if i>in_close && i<ex_open
        v_dQ(i)=C1_ce*cm;
    else
        v_dQ(i)=C1_ex*cm;
    end
end
%