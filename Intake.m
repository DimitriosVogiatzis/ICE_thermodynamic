%% Intake
%
if i<=in_close
    %
    A_in(i)=0.25*pi*d_in^2;
    %    
    pin_crit(i) = (2/(k(i)+1))^(k(i)/(k(i)-1)) ;
    pin(i)=P(i)/Pin;
    %
    if pin(i)>1
        Psi_in(i)=sqrt(((2*k(i))/(k(i)-1))*(-pin(i)^(2/k(i))+pin(i)^((k(i)+1)/k(i))));
        m_in(i)=-2*(A_in(i)*sqrt(dens_in*Pin)*Psi_in(i)*in_Cf(i))/omega;
    elseif pin(i)>= pin_crit(i)
        Psi_in(i)=sqrt(((2*k(i))/(k(i)-1))*(pin(i)^(2/k(i))-pin(i)^((k(i)+1)/k(i))));
        m_in(i)=2*(A_in(i)*sqrt(dens_in*Pin)*Psi_in(i)*in_Cf(i))/omega;
    else
        m_in(i)= Pin/(287*Tin)*sqrt(k(i)*R(i)*Tin)*A_in(i)*in_Cf(i)*(2/(k(i)+1))^((k(i)+1)/(2*(k(i)-1))) ;
    end
    %
    dma_dtheta(i)=m_in(i);
    dmt_dtheta(i)=m_in(i);
    %
    m_air(i+1)=m_air(i)+dma_dtheta(i)*deg2rad(0.1);
    m_tot(i+1)=m_tot(i)+dmt_dtheta(i)*deg2rad(0.1);
    %
    if i==in_close
        m_air(i:ex_open)=m_air(i);
        m_tot(i:f_fb)=m_tot(i);
    end
    %
end
%