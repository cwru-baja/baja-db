function rSqrs = getCorrelationData(event, dataIn)

names = {'compName', 'rSqu', 'rSquAdj', 'points'};
types = {'string', 'int8', 'int8', 'double'};

corrs = table('Size', [1, 5], 'VariableNames', names, 'VariableTypes', types);

rSqrs = zeros([size(dataIn, 1) 1]);
for i = 22:size(dataIn, 1) + 21
    try
        tempModel = findResultCorrelation(dataIn, i, event);
        
        tempR = tempModel.Rsquared.Adjusted;
        
        i
        
        rSqrs(i) = tempR;
    catch
        rSqrs(i) = NaN;
    end
end

rSqrs = nonzeros(rSqrs)

