function Pressure(Y1)
%CREATEFIGURE1(Y1)
%  Y1:  vector of y data

%  Auto-generated by MATLAB on 27-Nov-2017 23:00:20

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(Y1);

% Create xlabel
xlabel({'Crank angle [0.1*degrees]'});

% Create title
title({'Pressure Diagram'});

% Create ylabel
ylabel({'Pressure [Pa]'});

box(axes1,'on');