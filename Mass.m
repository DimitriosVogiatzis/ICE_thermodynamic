function Mass(YMatrix1)
%CREATEFIGURE(YMATRIX1)
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 27-Nov-2017 23:19:27

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(YMatrix1,'Parent',axes1);
set(plot1(1),'DisplayName','m total');
set(plot1(2),'DisplayName','m_ air');
set(plot1(3),'DisplayName','m fuel');

% Create xlabel
xlabel({'Crank angle [0.1*degrees]'});

% Create title
title({'Mass of mixture, air and fuel'});

% Create ylabel
ylabel({'mass [kg]'});

box(axes1,'on');
% Create legend
legend(axes1,'show');

