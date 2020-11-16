function compGraph = graphResults2D(dataIn, compNumber, xDataName, yDataName)
    % getting results table from selected competition
    results = getCompResults(dataIn, compNumber);
    
    xData = results.(xDataName);
    yData = results.(yDataName);
    teamNames = results.universityName;
    
    fig = bajaPlot2D(xData, yData, xDataName, yDataName, teamNames, 'b*');
    
    figure(fig);
    
    compGraph = [xData, yData];
    outliers = ~sum(compGraph' == 0)';
    
    compGraphClean = compGraph(outliers(:), :);
    
    xDataClean = compGraphClean(:, 1);
    yDataClean = compGraphClean(:, 2);
    
    fit_line = fitlm(xDataClean, yDataClean)
    plot(fit_line);
    
    xlabel(xDataName);
    ylabel(yDataName);
    
    title(xDataName + " vs " + yDataName + " at " + dataIn{(cell2mat(dataIn(:, 2)) == compNumber), 3});
end