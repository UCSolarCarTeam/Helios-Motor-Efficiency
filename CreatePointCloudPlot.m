figure;

xlabel('RPM');  % Set X-axis label
ylabel('Torque (Nm)');  % Set Y-axis label
zlabel('Efficiency (%)');  % Set Z-axis label



handle = addToFigure(custom,'Calgary GEM 2.6 Motors','red');
hold on;
handle = addToFigure(solaride,'Solaride GEM 2.6 Motors','green');
handle = addToFigure(solarideRegen,'Solaride GEM 2.6 Motors','#77AC30');
handle = addToFigure(standard,'General GEM 2.6 Motors','black');
handle = addToFigure(standardMatching,'General GEM 2.6 Motors Interpolated','blue');

plot3(ASC_rpm * ones(size(efficiency_range)), ASC_crusing_torque * ones(size(efficiency_range)),efficiency_range, 'c-', 'LineWidth', 2, 'DisplayName', 'ASC Crusing Conditions');
plot3(FSGP_rpm * ones(size(efficiency_range)), FSGP_crusing_torque * ones(size(efficiency_range)),efficiency_range, 'b-', 'LineWidth', 2, 'DisplayName', 'FSGP Crusing Conditions');

x=standard(:,1);
y=standard(:,2);
z=standard(:,3);

%Performs a linear interpolated gridfit
gx=0:50:1000;
gy=0:20:200;
g=gridfit(x,y,z,gx,gy);
surf(gx,gy,g);

title('Motor Efficiency Data Comparison');
grid on;  % Show grid

% Enable interactive legend
h = legend('show');

% Set the 'ItemHitFcn' callback to toggle the visibility
h.ItemHitFcn = @(src, event) toggleVisibility(src, event);

hold off;  % Release the current plot hold

function toggleVisibility(src, event)
    % Get the display name of the clicked legend item
    layerName = event.Peer.DisplayName;

    % Find the corresponding plot object based on the display name
    plotObject = findobj('DisplayName', layerName);

    % Toggle the visibility of the plot object
    if strcmpi(plotObject.Visible, 'on')
        plotObject.Visible = 'off';
    else
        plotObject.Visible = 'on';
    end
end
