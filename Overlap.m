%% Overlap
%
%% Intake - Exhaust during Overlap 
%
if i>=in_open
    % Exhaust
    A_ex(i)=0.25*pi*d_ex^2;
    %
    pex_crit(i) = (2/(k(i)+1))^(k(i)/(k(i)-1)) ;
    pex(i)=Pex/P(i);
    %
    if pex(i)>1
        Psi_ex(i)=sqrt((2*k(i)/(k(i)-1))*(-pex(i)^(2/k(i))+pex(i)^((k(i)+1)/k(i))));
        m_ex(i)=2*(A_ex(i)*sqrt(dens(i)*P(i))*Psi_ex(i)*ex_Cf(i))/omega;
    elseif pex(i)>=pex_crit(i)
        Psi_ex(i)=sqrt((2*k(i)/(k(i)-1))*(pex(i)^(2/k(i))-pex(i)^((k(i)+1)/k(i))));
        m_ex(i)=-2*(A_ex(i)*sqrt(dens(i)*P(i))*Psi_ex(i)*ex_Cf(i))/omega;
    else
        m_ex(i)= -P(i)/(R(i)*T(i))*sqrt(k(i)*R(i)*T(i))*A_ex(i)*ex_Cf(i)*(2/(k(i)+1))^((k(i)+1)/(2*(k(i)-1))) ;
    end
    
    % Intake
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
    %% Calculations
   
    dmt_dtheta(i)=m_ex(i)+m_in(i);
    dma_dtheta(i)=m_in(i)+m_ex(i)*(1/(1+F(i)/14.7)) ;
    dmf_dtheta(i) = dma_dtheta(i)*F(i)/14.7 ;
    %
    if i~=7200
        m_tot(i+1)=m_tot(i)+dmt_dtheta(i)*deg2rad(0.1);
        m_air(i+1)=m_air(i)+dma_dtheta(i)*deg2rad(0.1);
        if  m_air(i+1)<0
             m_air(i+1)=10^(-10);
        end
        m_fuel(i+1)=m_fuel(i)+dmf_dtheta(i)*degtorad(0.1);
         if  m_fuel(i+1)<0
             m_fuel(i+1)=10^(-10);
        end
        %F(i+1)=(14.7*m_fuel(i+1))/m_air(i+1);
        dF_dtheta(i)=(F(i+1)-F(i))/deg2rad(0.1);
    end
end
            
          
