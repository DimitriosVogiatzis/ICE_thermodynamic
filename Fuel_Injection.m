%% Fuel Injection
%
if i==f_fb
    %
    F(i+dur_inj)=1/lambda;
    F(i:(i+dur_inj))=interp1([i;(i+dur_inj)],[F(i);F(i+dur_inj)],i:(i+dur_inj));
    F(i+dur_inj:in_open)=1/lambda;
    F(in_open:(7200))=interp1([in_open;(7200)],[F(in_open);F(7200)],in_open:(7200));
    %
    for j=i:(i+dur_inj)
        dF_dtheta(j)=(F(j+1)-F(j))/deg2rad(0.1);
    end
end
%
%% Mass alteration from fuel injection
%
if i>=f_fb && i<=f_fb+dur_inj
    %
    dmf_dtheta(i)=(((m_air(i+1)*F(i+1))/14.7)-m_fuel(i))/deg2rad(0.1);
    dmt_dtheta(i)=dmt_dtheta(i)+dmf_dtheta(i);
    %
    m_fuel(i+1)=m_fuel(i)+dmf_dtheta(i)*deg2rad(0.1);
    m_tot(i+1)=m_tot(i)+dmt_dtheta(i)*deg2rad(0.1);
end
%
if i==f_fb+dur_inj
    m_fuel(i:ex_open)=m_fuel(i);
    m_tot(i:ex_open)=m_tot(i);
end
%