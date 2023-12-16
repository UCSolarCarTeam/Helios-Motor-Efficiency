efficiencyStandard = zeros(7,1);

for i = 1:length(efficiencyStandard)
    rpm = comparableConditions(i,1);
    torque = comparableConditions(i,2);
    efficiencyStandard(i,1) = fitresult1(rpm,torque);
end

efficiencyStandard;

differences = efficiencyCustom - efficiencyStandard;
meanDiff = mean(differences)
stdDiff = std(differences)
lowerBound = meanDiff - stdDiff;
upperBound = meanDiff + stdDiff;

% Plot fit with data.
figure;


residualsNoShift = custom(:,3) - EfficiencyEquation(custom(:,1),custom(:,2),0);
residualsMeanShift = custom(:,3) - EfficiencyEquation(custom(:,1),custom(:,2),meanDiff);
residualsLowerShift = custom(:,3) - EfficiencyEquation(custom(:,1),custom(:,2),lowerBound);

subplot(2,3,1)
handle = addPlaneToFigure(0,"Standard Motor Plane Motors Data", 'green');
hold on;
handle = addToFigure(custom,"Custom Motors Data", 'blue');
xlabel( 'RPM', 'Interpreter', 'none' );
ylabel( 'Torque (Nm)', 'Interpreter', 'none' );
zlabel( 'Efficiency (%)', 'Interpreter', 'none' );
xlim([0, 1050]);
ylim([0, 210]);
zlim([0, 100]);
title('Standard Motor Plane');
subplot(2,3,2)
handle = addPlaneToFigure(meanDiff,"Custom Motors Mean Shift", 'green');
hold on;
handle = addToFigure(custom,"Custom Motors Data", 'blue');
xlabel( 'RPM', 'Interpreter', 'none' );
ylabel( 'Torque (Nm)', 'Interpreter', 'none' );
zlabel( 'Efficiency (%)', 'Interpreter', 'none' );
xlim([0, 1050]);
ylim([0, 210]);
zlim([0, 100]);
title('Custom Motor Plane Mean Shift');
subplot(2,3,3)
handle = addPlaneToFigure(lowerBound,"Custom Motors Lower Bound Shift", 'green');
hold on;
handle = addToFigure(custom,"Custom Motors Data", 'blue');
xlabel( 'RPM', 'Interpreter', 'none' );
ylabel( 'Torque (Nm)', 'Interpreter', 'none' );
zlabel( 'Efficiency (%)', 'Interpreter', 'none' );
xlim([0, 1050]);
ylim([0, 210]);
zlim([0, 100]);
title('Custom Motor Plane Lower Bound Shift');

outputMatrix = custom;

subplot(2,3,4)
outputMatrix(:,3) = residualsNoShift;
handle = addToFigure(outputMatrix,"Residuals", 'blue');
xlabel( 'RPM', 'Interpreter', 'none' );
ylabel( 'Torque (Nm)', 'Interpreter', 'none' );
zlabel( 'Efficiency (%)', 'Interpreter', 'none' );
xlim([0, 1050]);
ylim([0, 210]);
zlim([-30, 30]);
title('Residuals');
subplot(2,3,5)
outputMatrix(:,3) = residualsMeanShift;
handle = addToFigure(outputMatrix,"Residuals", 'blue');
xlabel( 'RPM', 'Interpreter', 'none' );
ylabel( 'Torque (Nm)', 'Interpreter', 'none' );
zlabel( 'Efficiency (%)', 'Interpreter', 'none' );
xlim([0, 1050]);
ylim([0, 210]);
zlim([-30, 30]);
title('Residuals');
subplot(2,3,6)
outputMatrix(:,3) = residualsLowerShift;
handle = addToFigure(outputMatrix,"Residuals", 'blue');
xlabel( 'RPM', 'Interpreter', 'none' );
ylabel( 'Torque (Nm)', 'Interpreter', 'none' );
zlabel( 'Efficiency (%)', 'Interpreter', 'none' );
xlim([0, 1050]);
ylim([0, 210]);
zlim([-30, 30]);
title('Residuals');



