%% Combustion
%
if i==f_fb+Df_zv
    Pbc=P(i-1);
    Vbc=V(i-1);
    fbb1=f_fb+Df_zv;
    fbb2=fbb1+fbb2_fbb1;
end
%
if i>=f_fb+Df_zv
    %
    if i>=fbb1 && i<(fbb2+df2)
        Po(i)=Pbc*(Vbc/V(i))^1.36;
        v_dQ(i)=C1_ce*cm+ C2*((Vd*Tsoc)/(Psoc*Vsoc))*(P(i)-Po(i));
    end
    %
    if i>=f_fb+Df_zv
        if i>=fbb1 && i<(fbb1+df1)
            dQb1_dtheta(i)=Qb1*4.605*(m1+1)*(((i-fbb1)/df1)^m1)*exp(-4.605*(((i-fbb1)/df1)^(m1+1)));
        end
        if i>=fbb2 && i<(fbb2+df2)
            dQb2_dtheta(i)=Qb2*4.605*(m2+1)*(((i-fbb2)/df2)^m2)*exp(-4.605*(((i-fbb2)/df2)^(m2+1)));
        end
        dQb_dtheta(i)=(dQb1_dtheta(i)+dQb2_dtheta(i));
        sdQb_dtheta(i) = sum(dQb_dtheta)*degtorad(1);
    end
end
%