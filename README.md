## ICE_thermodynamic
A filling-evacuation model of a direct injection diesel engine is solved for different operation points. 
![image](https://user-images.githubusercontent.com/65401171/174573308-39ff2a84-bfaf-4225-8cd9-351800f274b7.png)

| requirements         | os        |
| -------------------- | --------- |
| matlab2018 or greater | W8 or greater |

A simulation model of the thermodynamic cycle of a direct injection diesel internal combustion engine is presented.
The thermodynamic cycle contains the intake phase, the fuel injection, the combustion phase and the exhaust phase 
by taking into consideration the intake and exhaust overlap. 

This models simulates: 
  1. the process of mixture exchange for the cylinder
  2. the energy release during the combustion 
  3. the heat transfer of the cylinder chamber to the cylinder sleeves - walls
while assuming constant steady-state conditions at the intake and exhaust volumes correspondingly - no pressure waves and resonance effects.

The model calculates all in-cylinder values vs crank-angle but also the thermodynamic efficiency, the volumetric efficiency, the indicated efficiency and pressure and the brake specific fuel consumption.

## How to run the model:
  1. In Data_Input.m set all input data of geometries, coefficients and boundary conditions. 
  2. In Data_Input.m select your operational point out of the 3 predefined points or select a new one [N,bmep,Pin,Tin,Uin], where in=constant steady state intake plenum conditions
  3. In case of a new point selected, make 5 assumptions of initial conditions for: air-fuel ratio "λ", Cylinder Pressure at start of the loop "P(1)", Cylinder Temperature at start of the loop "T(1)", Cylinder Pressure at start of compression "P(StartofCompression)" and Cylinder Temperature at start of compression "T(StartofCompression)"
  4. Run the MAIN.m for solving one full thermodynamic cycle of the point selected. 
  5. Check the residual errors of ΔΤ(Κ) or T(1)-T(7200), Δbmep(bar), ΔP(Pa) or P(1)-P(7200)
  6. Change the 5 assumptions and run again if errors are bigger that 2%.
  7. Run the plotter for in-cylinder result visualisation.
