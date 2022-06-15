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

How to run the model:
1. Open Data_Input.m and set all input data of geometries, coefficients, boundary conditions. 
2. In Data_Input.m set your operational point [N,bmep,Pin,Tin,Uin] or select one of the 3 predefined points.
3. Run the MAIN.m for solving one full thermodynamic cycle of the point selected. 
4. 
5. Run the plotter for results visualisation.

The models solves with a timestep of 0.1 crank-angle degrees one cycle of 720 ca degrees. 

