function avgRanks = getAvgResults(dataIn, wrongNames, years, minComps)

if ~exist('minComps','var')
    %minValues not input, default it to 0
    minComps = 0;
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

uniNames = getParticipatingUnis(yearResults, wrongNames);

uniNumbers = sort(str2double(unique(uniNames(2, :))));

avgRanks = cell(1, 3);

for i = 1:size(uniNumbers, 2)
    indicies = str2double(uniNames(2,:)) == uniNumbers(i);
    
    names = uniNames(1, indicies);
    
    compCounter = 0;
    pointsTotal = 0;
    
    for j = 1:size(yearResults, 1)
        kkb = intersect(names, yearResults{j, 1}.universityName);
        
        if kkb ~= ""
            if size(kkb, 1) == 1
                for k = 1:size(kkb, 1)
                    pointsTotal = pointsTotal + yearResults{j, 1}.overallScore(yearResults{j, 1}.universityName == kkb(k));
                    compCounter = compCounter + 1;
                end
            end
        end
    end
    
    if compCounter >= minComps
        newRow = cell(1, 3);
        newRow(1, 1) = {convertStringsToChars(names(1))};
        newRow(1, 2) = {num2str(pointsTotal(1)/compCounter)};
        newRow(1, 3) = {compCounter};
        
        avgRanks = [avgRanks; newRow];
    end
end

avgRanks = avgRanks(2:size(avgRanks, 1), :);

sortingColumn = str2double(avgRanks(:,2));

[sortedValues, sortOrder] = sort(sortingColumn, 'descend');

avgRanks = avgRanks(sortOrder, :);
end