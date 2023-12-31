function [fitresult, gof] = shiftedFit(combinedRPM, combinedTorque, combinedEfficiency, combinedWeight, customRPM, customTorque, customEfficiency)
%CREATEFIT(COMBINEDRPM,COMBINEDTORQUE,COMBINEDEFFICIENCY,COMBINEDWEIGHT,CUSTOMRPM,CUSTOMTORQUE,CUSTOMEFFICIENCY)
%  Create a fit.
%
%  Data for 'ShiftedFitV1' fit:
%      X Input: combinedRPM
%      Y Input: combinedTorque
%      Z Output: combinedEfficiency
%      Weights: combinedWeight
%      Validation X: customRPM
%      Validation Y: customTorque
%      Validation Z: customEfficiency
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 13-Dec-2023 04:04:43


%% Fit: 'ShiftedFitV1'.
[xData, yData, zData, weights] = prepareSurfaceData( combinedRPM, combinedTorque, combinedEfficiency, combinedWeight );

% Set up fittype and options.
ft = fittype( 'poly55' );
excludedPoints = excludedata( xData, yData, 'Indices', [17 35 71 205 215 224 225] );
opts = fitoptions( 'Method', 'LinearLeastSquares' );
opts.Lower = [0 -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf];
opts.Robust = 'LAR';
opts.Upper = [0 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf];
opts.Weights = weights;
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );

% Compare against validation data.
[xValidation, yValidation, zValidation] = prepareSurfaceData( customRPM, customTorque, customEfficiency );
residual = zValidation - fitresult( xValidation, yValidation );
nNaN = nnz( isnan( residual ) );
residual(isnan( residual )) = [];
sse = norm( residual )^2;
rmse = sqrt( sse/length( residual ) );
fprintf( 'Goodness-of-validation for ''%s'' fit:\n', 'ShiftedFitV1' );
fprintf( '    SSE : %f\n', sse );
fprintf( '    RMSE : %f\n', rmse );
fprintf( '    %i points outside domain of data.\n', nNaN );

% Create a figure for the plots.
figure( 'Name', 'ShiftedFitV1' );

% Compute limits for axes.
xlim = [min( [xData; xValidation] ), max( [xData; xValidation] )];
ylim = [min( [yData; yValidation] ), max( [yData; yValidation] )];

% Plot fit with data.
subplot( 2, 2, 2 );
plot( fitresult, [xData, yData], zData, 'Exclude', excludedPoints, 'XLim', xlim, 'YLim', ylim );
% Add validation data to plot.
hold on
plot3( xValidation, yValidation, zValidation, 'bo', 'MarkerFaceColor', 'w' );
hold off
% Label axes
xlabel( 'combinedRPM', 'Interpreter', 'none' );
ylabel( 'combinedTorque', 'Interpreter', 'none' );
zlabel( 'combinedEfficiency', 'Interpreter', 'none' );
zlim([0,100])
grid on
view( -60.7, 7.5 );

% Plot residuals.
subplot( 2, 2, 4 );
plot( fitresult, [xData, yData], zData, 'Style', 'Residual', 'Exclude', excludedPoints, 'XLim', xlim, 'YLim', ylim );
% Add validation data to plot.
hold on
plot3( xValidation, yValidation, zValidation - fitresult( xValidation, yValidation ), 'bo', 'MarkerFaceColor', 'w' );
hold off
% Label axes
xlabel( 'combinedRPM', 'Interpreter', 'none' );
ylabel( 'combinedTorque', 'Interpreter', 'none' );
zlabel( 'combinedEfficiency', 'Interpreter', 'none' );
grid on
view( -60.7, 7.5 );

% Make contour plot.
% Make contour plot.
subplot( 1, 2, 1 );

xGrid = linspace(0, 1050, 1050);
yGrid = linspace(0, 210, 210);
[X, Y] = meshgrid(xGrid, yGrid);
Z = feval(fitresult, X, Y);
contourLevels = 0:2:max(zData);

contourf(xGrid, yGrid, Z, 'LevelList', contourLevels, 'ShowText', 'on', 'LabelSpacing', 300);
% Add validation data to plot.
hold on
plot( xValidation, yValidation, 'bo', 'MarkerFaceColor', 'w' );
hold off
% Label axes
xlabel( 'combinedRPM', 'Interpreter', 'none' );
ylabel( 'combinedTorque', 'Interpreter', 'none' );
grid on


