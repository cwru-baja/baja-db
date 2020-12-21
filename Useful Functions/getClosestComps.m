function closestComps = getClosestComps(dataIn, years, numResults)

if ~exist('years','var')
    %minValues not input, default it to 0
    years = num2str([2007:2019]);
end

if ~exist('numResults','var')
    %minValues not input, default it to 0
    numResults = 10;
end

yearResults = cell(3, 3);

index = 1;

for i = 1:3:size(dataIn, 1)
    for j = 1:size(years, 2)
        if contains(dataIn{i, 3}, years(j))
            yearResults(index, :) = dataIn(i, :);
            yearResults(index + 1, :) = dataIn(i+1, :);
            yearResults(index + 2, :) = dataIn(i+2, :);
            
            index = index + 3;
            break;
        end
    end
end

closestComps = cell(numResults, 4);

closestComps(:, 4) = {0};

for i = 1:size(yearResults, 1)
    winnerDiff = yearResults{i, 1}.overallScore(1) - yearResults{i, 1}.overallScore(2);
    relWinnerDiff = winnerDiff / yearResults{i, 1}.overallScore(1);
    
    closestComps(i, 4) = {relWinnerDiff};
    
    
    closestComps{i, 3} = yearResults{i, 1}.overallScore(1);
    closestComps{i, 2} = yearResults{i, 1}.universityName(1);
    closestComps{i, 1} = yearResults{i, 3};
end

sortingColumn = cell2mat(closestComps(:,4));
    
[sortedValues, sortOrder] = sort(sortingColumn, 'ascend');
    
closestComps = closestComps(sortOrder, :);

closestComps = closestComps(1:numResults, :);
end