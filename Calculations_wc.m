%
for i=1:720
    %% Intake-Exhaust Mass Exchange
    %
    if i~=1
        T(i)=T(i-1)+dT_dtheta(i-1)*deg2rad(1);
        P(i)=(m_tot(i))*R(i)*T(i)/V(i);
        dens(i)=P(i)/(R(i)*T(i));
        dU_dT(i)=(T(i)^2)*(-0.0000210248*(F(i)^0.75)-0.0000422662)+T(i)*(0.0114858*(F(i)^0.75)+0.097104*(F(i)^0.8)+0.247585)+67.048*(F(i)^0.93)-1.56868*(F(i)^0.75)-26.524*(F(i)^0.8)+642.998;
        Cv(i)=dU_dT(i);
        Cp(i)=Cv(i)+R(i);
        k(i)=Cp(i)/Cv(i);
    end
    %
    Intake
    %
    Fuel_Injection
    %
    Exhaust
    %
    Overlap
    %
    %% Main Variables Calculation
    %
    if i~=1
        U(i)=144.5*(1356.8+(489.6+46.4*(F(i)^0.93))*(T(i)-273.15)*(10^(-2))+(7.768+3.36*(F(i)^0.8))*((T(i)-273.15)^2)*(10^(-4))-(0.0975+0.0485*(F(i)^0.75))*((T(i)-273.15)^3)*(10^(-6)));
        h(i)=U(i)+P(i)/dens(i);
    end
    %% dQw_dtheta (Losses)
    %
    a(i)=127.93*(b^(-0.2))*((P(i)/100000)^(0.8))*(v_dQ(i)^(0.8))*(T(i)^(-0.53));
    A(i)=2*Acyl+Ahead+Ac+b*pi*s(i);
    dQw_dtheta(i)=(a(i)*A(i)*(Twall-T(i)))/omega;
    %
    %% Energy Equilibrium (dT_dtheta)
    %
    dU_dF(i)=(T(i)-273.15)*(0.0388416*(T(i)-273.15)*(F(i)^(-0.2))-5.25619*(10^(-6))*((T(i)-273.15)^2)*(F(i)^(-0.25))+62.3546*(F(i)^(-0.07)));
    %
    dU_dtheta(i)=dQw_dtheta(i)+dQb_dtheta(i)+m_in(i)*h_in+m_ex(i)*h(i)-U(i)*dmt_dtheta(i);
    dT_dtheta(i)=(-R(i)*T(i)*dV_dtheta(i)/V(i)+dU_dtheta(i)/m_tot(i)-dU_dF(i)*dF_dtheta(i))/dU_dT(i);
    %
end