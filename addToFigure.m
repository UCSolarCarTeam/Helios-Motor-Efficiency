function handle = addToFigure(data,title,color)
    rpm = data(:,1);
    torque = data(:,2);
    efficiency = data(:,3);
    handle = scatter3(rpm, torque,efficiency, 'filled', 'DisplayName', title, 'MarkerFaceColor',color);
end
