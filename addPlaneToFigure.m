function handle = addPlaneToFigure(shift,name,color)
    xGrid = linspace(0, 1050, 1050);
    yGrid = linspace(0, 210, 1000);
    [X, Y] = meshgrid(xGrid, yGrid);
    Z = EfficiencyEquation(X,Y,shift);

    handle = surf(X, Y, Z, 'EdgeColor', 'none','DisplayName',name);
end