function [fitresult, gof] = polynomial55fitGreaterThan100SignificantParameters(x, y, z)
%CREATEFIT(X,Y,Z)
%  Create a fit.
%
%  Data for 'Polynomial55Outliers' fit:
%      X Input: x
%      Y Input: y
%      Z Output: z
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 05-Dec-2023 20:36:56


%% Fit: 'Polynomial55Outliers'.
[xData, yData, zData] = prepareSurfaceData( x, y, z );

% Set up fittype and options.
ft = fittype( 'poly55' );
excludedManually = excludedata( xData, yData, 'Indices', [23 59 71 73] );
excludedByRule = (xData <= 50) | (xData >= NaN);
excludedPoints = excludedManually | excludedByRule;
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Lower = [-Inf -Inf -Inf 0 -Inf 0 0 0 -Inf -Inf -Inf -Inf 0 -Inf -Inf -Inf -Inf 0 0 -Inf 0];
opts.Normalize = 'on';
opts.Upper = [Inf Inf Inf 0 Inf 0 0 0 Inf Inf Inf Inf 0 Inf Inf Inf Inf 0 0 Inf 0];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );

% Create a figure for the plots.
figure( 'Name', 'Polynomial55Outliers' );

% Plot fit with data.
subplot( 2, 2, 2 );
plot( fitresult, [xData, yData], zData, 'Exclude', excludedPoints );
% Label axes
xlabel( 'RPM', 'Interpreter', 'none' );
ylabel( 'Torque (Nm)', 'Interpreter', 'none' );
zlabel( 'Efficiency (%)', 'Interpreter', 'none' );
grid off
view( -83.4, 68.1 );

% Plot residuals.
subplot( 2, 2, 4 );
plot( fitresult, [xData, yData], zData, 'Style', 'Residual', 'Exclude', excludedPoints );
% Label axes
xlabel( 'RPM', 'Interpreter', 'none' );
ylabel( 'Torque (Nm)', 'Interpreter', 'none' );
zlabel( 'Efficiency (%)', 'Interpreter', 'none' );
grid off
view( -83.4, 68.1 );

% Make contour plot.
subplot( 1, 2, 1 );
xGrid = linspace(min(xData), max(xData), 1000);
yGrid = linspace(min(yData), max(yData), 1000);
[X, Y] = meshgrid(xGrid, yGrid);
Z = feval(fitresult, X, Y);
contourLevels = 0:2:max(zData);

contourf(xGrid, yGrid, Z, 'LevelList', contourLevels, 'ShowText', 'on', 'LabelSpacing', 300);

% Label axes
xlabel( 'RPM', 'Interpreter', 'none' );
ylabel( 'Torque (Nm)', 'Interpreter', 'none' );
grid off


