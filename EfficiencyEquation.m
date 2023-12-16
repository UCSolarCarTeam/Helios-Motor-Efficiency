function efficiency = EfficiencyEquation(rpm, torque, shift)

    x_mean = 505;
    x_std = 278.9;
    y_mean = 71.61;
    y_std = 39.64;

    x = (rpm - x_mean) ./ x_std;
    y = (torque - y_mean) ./ y_std;

    p00 = 81.87;
    p10 = 1.741;
    p01 = -2.263;
    p20 = 1.487;
    p11 = 0.5345;
    p02 = 0.8011; 
    p30 = -0.7242; 
    p21 = 1.043;
    p12 = 2.987;
    p03 = 2.715;
    p40 = -1.898; 
    p31 = 0.3652;
    p22 = -0.8953;
    p13 = 0.7273;
    p04 = -1.821;
    p50 = 0.4862; 
    p41 = -1.059; 
    p32 = -0.7945;
    p23 = -0.5799;
    p14 = -1.532; 
    p05 = -0.05958;
    
    term1 = p00;
    term2 = p10 .* x;
    term3 = p01 .* y;
    term4 = p20 .* x.^2;
    term5 = p11 .* x .* y;
    term6 = p02 .* y.^2;
    term7 = p30 .* x.^3;
    term8 = p21 .* x.^2 .* y;
    term9 = p12 .* x .* y.^2;
    term10 = p03 .* y.^3;
    term11 = p40 .* x.^4;
    term12 = p31 .* x.^3 .* y;
    term13 = p22 .* x.^2 .* y.^2;
    term14 = p13 .* x .* y.^3;
    term15 = p04 .* y.^4;
    term16 = p50 .* x.^5;
    term17 = p41 .* x.^4 .* y;
    term18 = p32 .* x.^3 .* y.^2;
    term19 = p23 .* x.^2 .* y.^3;
    term20 = p14 .* x .* y.^4;
    term21 = p05 .* y.^5;
    
    efficiency = shift + term1 + term2 + term3 + term4 + term5 + term6 + term7 + term8 + term9 + term10 + term11 + term12 + term13 + term14 + term15 + term16 + term17 + term18 + term19 + term20 + term21;
end
