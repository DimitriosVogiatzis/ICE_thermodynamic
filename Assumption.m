%% ASSUMPTION
%
f=0.05;                              % Residual gas fraction               [-]
lambda=2.542;                        % Lambda Assumption                   [-]
dur_inj=200;                         % Duration of Injection               [o]
Df_zv=15;                            % Combustion delay after injection    [o]
%
%% Heat Losses dQw/dtheta
%
Psoc=1.2365*Pin;                    % Presure at Start of Compression     [Pa] P(in_close)/Pin
Tsoc=397.235;                       % Temperature at Start of Compression [K]  T(in_close)
Vsoc=V(in_close);                   % Volume at Start of Compression      [m^3]
%
%% Lambda - F
%
R_tot=(1-f)*(287-20*F(1))+f*(287-20/lambda); % Gas Constant after intake
m_mix_tot=(Psoc*Vsoc)/(R_tot*Tsoc);      % Total mass after Intake        [kg]
m_rg_tot=f*m_mix_tot;                   % Mass of residual Constantly     [kg]

m_air_tot=(1-f)*m_mix_tot;              % Air mass after Intake           [kg]
m_fuel_tot=m_air_tot/(lambda*14.7);     % Fuel mass after Injection       [kg]

%% Main Variables Initialization

R(1)=282.6 ;                       
P(1)=Pin*0.93;                      % Pressure at Close of Exhaust        [Pa]
T(1)=476.;                          % Temperature at Close of Exhaust     [K]
dens(1)=P(1)/(R(1)*T(1));           % Density at Close of Exhaust         [kg/m^3]
U(1)=144.5*(1356.8+(489.6+46.4*(F(1)^0.93))*(T(1)-273.15)*(10^(-2))+(7.768+3.36*(F(1)^0.8))*((T(1)-273.15)^2)*(10^(-4))-(0.0975+0.0485*(F(1)^0.75))*((T(1)-273.15)^3)*(10^(-6)));
h(1)=U(1)+P(1)/dens(1);             % Enthalpy at Close of Exhaust        [J/kg]
%
m_tot(1)=dens(1)*V(1);              % Total mass inside the cylinder      [kg]
m_air(1)=m_tot(1)-m_rg_tot;         % Air mass in side the cylinder       [kg]    
%
dU_dT(1)=(T(1)^2)*(-0.0000210248*(F(1)^0.75)-0.0000422662)+T(1)*(0.0114858*(F(1)^0.75)+0.097104*(F(1)^0.8)+0.247585)+67.048*(F(1)^0.93)-1.56868*(F(1)^0.75)-26.524*(F(1)^0.8)+642.998;
Cv(1)=dU_dT(1);                     % Specific Heat at const. Volume      [J/(kg*K)]
Cp(1)=Cv(1)+R(1);                   % Specific Heat at const Pressure     [J/(kg*K)]
k(1)=Cp(1)/Cv(1);                   % Specific Heat Ratio ?               [-]
%
%% Enegry dissipated during combustion
%
Qb=LHV*m_fuel_tot;                  % Total heat dissipation              [J]
Qb1=x*Qb;                           % Premix heat dissipation             [J]
Qb2=(1-x)*Qb;                       % Main heat dissipation               [J]
%