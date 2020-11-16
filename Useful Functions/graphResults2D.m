function compGraph = graphResults2D(dataIn, compNumber, xDataName, yDataName)
    results = getCompResults(dataIn, compNumber);
    
    xData = results.(xDataName)
    yData = results.(yDataName)
    teamNames = results.universityName;
    
    %plot(xData, yData)
    bajaPlot2D(xData, yData, xDataName, yDataName, teamNames, 'b*')
    
    xlabel(xDataName);
    ylabel(yDataName);
    
    title(xDataName + " vs " + yDataName + " at " + dataIn{(cell2mat(dataIn(:, 2)) == compNumber), 3})
    
    compGraph = [xData, yData];
end