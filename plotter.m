P_V(V,P);
Pressure(P);
Tempe(T);
Mass([m_tot,m_air,m_fuel]);
dmdth(dmt_dtheta);
adiag(a);
dQb_dthetaDiag([3100:3660],dQb_dtheta(3100:3660)*degtorad(0.1));
sumdQb(sdQb_dtheta)