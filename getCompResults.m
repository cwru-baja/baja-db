%This function gives the full results of an input competition.
function compResults = getCompResults(dataIn, comp)

compNumbers = cell2mat(dataIn(:, 2));

compIndex = find(compNumbers == comp);

compResults = dataIn{compIndex, 1};
end