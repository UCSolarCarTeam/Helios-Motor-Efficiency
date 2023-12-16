standardLength = height(standard);
customLength = height(custom);
totalLength = customLength + standardLength;

combinedRPM = zeros(totalLength,1);
combinedTorque = zeros(totalLength,1);
combinedEfficiency = zeros(totalLength,1);
combinedWeight = zeros(totalLength,1);

for i = 1:totalLength
    if (i <= customLength)
        combinedRPM(i,1) = custom(i,1);
        combinedTorque(i,1) = custom(i,2);
        combinedEfficiency(i,1) = custom(i,3);
        combinedWeight(i,1) = 10;
    else
        k = i - customLength;
        combinedRPM(i,1) = standard(k,1);
        combinedTorque(i,1) = standard(k,2);
        combinedEfficiency(i,1) = standard(k,3) + meanDiff;
        combinedWeight(i,1) = 1;
    end
end

[shiftedFit,shiftedGof] = shiftedFit(combinedRPM, combinedTorque, combinedEfficiency, combinedWeight, customRPM, customTorque, customEfficiency);
%curveFitter(combinedRPM,combinedTorque,combinedEfficiency,combinedWeight);
coeffieientsBounded(:,1) = transpose(coeffvalues(shiftedFit));
coeffieientsBounded(:,2:3) = transpose(confint(shiftedFit));
coeffieientsBounded(:,4) = (coeffieientsBounded(:,3)-coeffieientsBounded(:,1))./1.96;
CoefficientTable = array2table(coeffieientsBounded,...
    'VariableNames',{'Value','Lower Bound','Upper Bound','Standard Deviation'});
CoefficientTable.coefficient = coeffnames(shiftedFit);

writetable(CoefficientTable,'ShiftedFitPlane.txt','Delimiter',',')  
type 'ShiftedFitPlane.txt'