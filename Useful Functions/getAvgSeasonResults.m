function seasRanks = getAvgSeasonResults(dataIn, wrongNames, year)
yearResults = cell(3, 3);

for i = 1:size(dataIn, 1)
    if contains(dataIn{i, 3}, year)
        yearResults(1, :) = dataIn(i, :);
        yearResults(2, :) = dataIn(i+1, :);
        yearResults(3, :) = dataIn(i+2, :);
        
        break;
    end
end

uniNames = getParticipatingUnis(yearResults, wrongNames);

uniNumbers = sort(str2double(unique(uniNames(2, :))));

seasRanks = cell(1, 2);

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
    
    
    newRow = cell(1, 2);
    newRow(1, 1) = {convertStringsToChars(names(1))};
    newRow(1, 2) = {num2str(pointsTotal(1)/compCounter)};
    
    seasRanks = [seasRanks; newRow];
end

seasRanks = seasRanks(2:size(seasRanks, 1), :);

sortingColumn = str2double(seasRanks(:,2));

[sortedValues, sortOrder] = sort(sortingColumn, 'descend');

seasRanks = seasRanks(sortOrder, :);
end