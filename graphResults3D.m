function compGraph = graphResults3D(dataIn, compNumber, xDataName, yDataName, zDataName)
    results = getCompResults(dataIn, compNumber);
    
    xData = results.(xDataName)
    yData = results.(yDataName)
    zData = results.(zDataName)
    teamNames = results.universityName;
    
    %plot(xData, yData)
    bajaPlot3D(xData, yData, zData, xDataName, yDataName, zDataName, teamNames, 'b*')
    
    xlabel(xDataName);
    ylabel(yDataName);
    zlabel(zDataName);
    
    title(xDataName + " vs " + yDataName + " vs " + zDataName + " at " + dataIn{(cell2mat(dataIn(:, 2)) == compNumber), 3})
    
    compGraph = [xData, yData, zData];
end