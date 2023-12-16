custom = readmatrix("/MATLAB Drive/GEMMotorEfficiencyPlaneFitting-main/data/GEM 2.6 Custom Efficiency.csv");
standard = readmatrix("/MATLAB Drive/GEMMotorEfficiencyPlaneFitting-main/data/GEM 2.6 General Efficiency.csv");
standardMatching = readmatrix("/MATLAB Drive/GEMMotorEfficiencyPlaneFitting-main/data/GEM 2.6 General Interpolated Efficiency.csv");
solaride = readmatrix("/MATLAB Drive/GEMMotorEfficiencyPlaneFitting-main/data/GEM 1.3 Solaride Efficiency.csv");
solarideRegen = readmatrix("/MATLAB Drive/GEMMotorEfficiencyPlaneFitting-main//data/GEM 1.3 Solaride Regen Efficiency.csv");

efficiency_range = 0:100;
ASC_rpm = 588.37;
FSGP_rpm = 504.16;
ASC_crusing_torque = 34.93;
FSGP_crusing_torque = 31.70;

comparableConditions = [405.6857737,137.8156213;
    506.6361155,107.9595508;
    604.4562142,89.34797444;
    705.0152756,76.94025684;
    808.7045802,67.63446864;
    908.8723612,57.94093926;
    1002.388376,50.57385694];

efficiencyCustom = [85.62151458;
    87.51021891;
    86.34895114;
    86.70293599;
    86.18554516;
    84.83216794;
    80.62427816];