function rSqrs = getCorrelationData(event, dataIn)

names = {'compName', 'rSqu', 'rSquAdj', 'points'};
types = {'string', 'int8', 'int8', 'double'};

corrs = table('Size', [size(dataIn, 1), 4], 'VariableNames', names, 'VariableTypes', types);

rSqrs = zeros([size(dataIn, 1) 1]);
for i = 22:size(dataIn, 1) + 21
    try
        tempModel = findResultCorrelation(dataIn, i, event);
        
        corrs.rSquAdj(i) = tempModel.Rsquared.Adjusted;
        corrs.rSqu(i) = tempModel.Rsquared.Standard;
        
        corrs.compName(i) = dataIn{i - 22, 2}
    catch
        rSqrs(i) = NaN;
    end
end

rSqrs = nonzeros(rSqrs)

