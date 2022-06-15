# ICE_thermodynamic
A filling-evacuation model of a direct injection diesel engine is solved for different operation points. 

A mathematical model of the thermodynamic cycle of a direct injection diesel internal combustion engine is presented.
The thermodynamic cycle contains the intake phase, the fuel injection, the combustion phase and the exhaust phase 
by taking into consideration the intake and exhaust overlap. 

This models simulates: 
  1. the process of mixture exchange for the cylinder
  2. the energy release during the combustion 
  3. the heat transfer of the cylinder chamber to the cylinder sleeves - walls
while assuming constant steady-state conditions at the intake and exhaust volumes correspondingly - no pressure waves and resonance effects.

Model description:
The models solves with a timestep of 0.1 crank-angle degrees one cycle of 720 ca degrees. 
The calculation starts with the closing of the exhaust valve, where we have clean intake flow and ends up with the end of valve overlap duration.In every point of operation, five assumptions have to be made. 
These are for air-fuel ratio "λ", Cylinder Pressure at start of the loop "P(1)", Cylinder Temperature at start of the loop "T(1)", Cylinder Pressure at start of compression "P(StartofCompression)" and Cylinder Temperature at start of compression "T(StartofCompression)". 
Based on the last two assumptions, the mass of residual gas inside the cylinder is calculated. Moreover, assuming that the fuel mass inside the cylinder at the closing of intake is zero, we know the air mass and combining the assumed λ we know how much fuel we have to inject. 
From all these values, we assume the rest of values:
U(1), Dens(1), H(1), m_air(1), m_fuel(1), m_tot(1), dU/dT(1), Cp(1), Cv(1), k(1) 

How to run the model:
  1. In Data_Input.m set all input data of geometries, coefficients and boundary conditions. 
  2. In Data_Input.m select your operational point out of the 3 predefined points or select a new one [N,bmep,Pin,Tin,Uin], where in=constant steady state intake plenum conditions
  3. In case of a new point selected, make 5 assumptions of initial conditions for: air-fuel ratio "λ", Cylinder Pressure at start of the loop "P(1)", Cylinder Temperature at start of the loop "T(1)", Cylinder Pressure at start of compression "P(StartofCompression)" and Cylinder Temperature at start of compression "T(StartofCompression)"
  4. Run the MAIN.m for solving one full thermodynamic cycle of the point selected. 
  5. Check the residual errors of ΔΤ(Κ) or T(1)-T(7200), Δbmep(bar), ΔP(Pa) or P(1)-P(7200)
  6. Change the 5 assumptions and run again if errors are bigger that 2%.
  7. Run the plotter for in cylinder results visualisation.

