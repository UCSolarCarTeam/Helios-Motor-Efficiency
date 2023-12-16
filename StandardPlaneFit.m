
%CurveFitter for standard data
x=standard(:,1);
y=standard(:,2);
z=standard(:,3);
%curveFitter(x,y,z)

[fitresult1,gof1] = polynomial55fitGreaterThan100(x,y,z);
[fitresult2,gof2] = polynomial55fitGreaterThan100SignificantParameters(x,y,z);

%CurveFitter for custom data
rpm = custom(:,1);
torque = custom(:,2);
efficiency = custom(:,3);
%curveFitter(rpm,torque,efficiency)

