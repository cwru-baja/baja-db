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
    
    title(xDataName + " vs " + yDataName + " at " + dataIn{(cell2mat(dataIn(:, 2)) == compNumber), 3});
end