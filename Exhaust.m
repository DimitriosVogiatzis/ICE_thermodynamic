%% Exhaust
%
if (i>=ex_open && i<=in_open)
    %
    A_ex(i)=0.25*pi*d_ex^2;
    %   
    pex_crit(i) = (2/(k(i)+1))^(k(i)/(k(i)-1)) ;
    pex(i)=Pex/P(i);
    %
    if pex(i)>1
        Psi_ex(i)=sqrt((2*k(i)/(k(i)-1))*(-pex(i)^(2/k(i))+pex(i)^((k(i)+1)/k(i))));
        m_ex(i)=2*(A_ex(i)*sqrt(dens(i)*P(i))*Psi_ex(i)*ex_Cf(i))/omega;
    else
        Psi_ex(i)=sqrt((2*k(i)/(k(i)-1))*(pex(i)^(2/k(i))-pex(i)^((k(i)+1)/k(i))));
        m_ex(i)=-2*(A_ex(i)*sqrt(dens(i)*P(i))*Psi_ex(i)*ex_Cf(i))/omega;
   % else
      %  m_ex(i)=-P(i)/(R(i)*T(i))*sqrt(k(i)*R(i)*T(i))*A_ex(i)*ex_Cf(i)*(2/(k(i)+1))^((k(i)+1)/(2*(k(i)-1))) ;
    end
    %
    dmt_dtheta(i)=m_ex(i);
    %
    m_tot(i+1)=m_tot(i)+dmt_dtheta(i)*deg2rad(0.1);
    m_air(i+1)=14.7*(m_tot(i+1)-m_rg_tot)/(14.7+F(i+1));
    m_fuel(i+1)=(m_air(i+1)*F(i+1))/14.7;
    %
    dma_dtheta(i)=(m_air(i+1)-m_air(i))/deg2rad(0.1);
    dmf_dtheta(i)=(m_fuel(i+1)-m_fuel(i))/deg2rad(0.1);
    %
end
%