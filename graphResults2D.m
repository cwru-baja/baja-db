function compGraph = graphResults2D(dataIn, compNumber, xDataName, yDataName)
    % getting results table from selected competition
    results = getCompResults(dataIn, compNumber);
    
    % split data in to x and y, also get team names
    xData = results.(xDataName);
    yData = results.(yDataName);
    teamNames = results.universityName;
    
    % initial plotting of points
    fig = bajaPlot2D(xData, yData, xDataName, yDataName, teamNames, 'b*');
    
    figure(fig);
    
    % storing points in array for output
    compGraph = [xData, yData];
    
    % marking data points with at least one value of 0
    outliers = ~sum(compGraph' == 0)';
    
    % erasing these 0 points because they mess up regression
    compGraphClean = compGraph(outliers(:), :);
    
    % splitting up clean data
    xDataClean = compGraphClean(:, 1);
    yDataClean = compGraphClean(:, 2);
    
    % generating and plotting linear regression to clean data
    fit_line = fitlm(xDataClean, yDataClean)
    plot(fit_line);
    
    % naming
    xlabel(xDataName);
    ylabel(yDataName);
    
    title(xDataName + " vs " + yDataName + " at " + dataIn{(cell2mat(dataIn(:, 2)) == compNumber), 3});
end