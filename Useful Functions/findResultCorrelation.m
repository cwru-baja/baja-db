function compGraph = findResultCorrelation(dataIn, compNumber, dataName)
    results = getCompResults(dataIn, compNumber);
    
    yData = results.(dataName);
    xData = results.overallScore - yData;
    teamNames = results.universityName;
    
    %plot(xData, yData)
    bajaPlot2D(xData, yData, "Adjusted Overall", dataName, teamNames, 'b*');
    
    xlabel("Adjusted Overall");
    ylabel(dataName);
    
    title("Adjusted Overall" + " vs " + dataName + " at " + dataIn{(cell2mat(dataIn(:, 2)) == compNumber), 3});
    
    compGraph = [xData, yData];
end