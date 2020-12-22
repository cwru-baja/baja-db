function rSqrs = getCorrelationData(event, dataIn)
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

