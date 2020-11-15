%loading results from .mat file
allResults = struct2cell(load('Results_Tables_Updated.mat'))

%fixing results in one table
VarName17 = zeros(120, 1)
allResults{8} = [allResults{8}(:, 1:16), array2table(VarName17), allResults{8}(:, 17:18)]

%arrays for storing which events occured at which competitions
sledPull = [23 25 27 29 30 32 34 35 38 41 44 50 53 56 58]
salesPres = [22 26 28 31 36 37 40 43:60]
techEvent = [28 29 30]
techPen = [25 26 27]
techPenEnd = [22 23 24]
waterManeu = [23 27 33 35]
rockCrawl = [22 26 28 31 36 37 40 45 46 54 57] %comes after hill climb in dataset, regular s&t comes before
mudBog = [23 29 38]



%filling row with number associated with each comp(first comp of 2000 is 1)
for i = 1:size(allResults, 1)
    allResults{i, 2} = 21 + i
end

%array storing names of each comp
compNames = ["SDSM 2007", "UCF 2007", "RIT 2007", "Montreal 2008", "Illinois 2008", "Tennessee 2008", "Oregon 2009", "Wisconsin 2009",  "Alabama 2009", "Washington 2010", "Carolina 2010", "Rochester 2010", "Kansas 2011", "Birmingham 2011", "Illinois 2011", "Oregon 2012", "Wisconsin 2012", "Auburn 2012", "Washington 2013", "Tennessee 2013", "Rochester 2013", "UTEP 2014", "Kansas 2014","Illinois 2014", "Oregon 2015", "Auburn 2015", "Maryland 2015", "California 2016", "Tennessee 2016", "Rochester 2016", "California 2017", "Kansas 2017", "Illinois 2017", "Maryland 2018", "Kansas 2018", "Oregon 2018", "Tennessee 2019", "California 2019", "Rochester 2019"]

%adding competition names to cell array
for i = 1:size(compNames, 2)
    allResults{i, 3} = compNames(i)
end

%for loops for naming columns. fills based on how SAE seems to fill the
%tables. competition 23 doesn't follow the pattern though
for i = 1:size(allResults, 1)
    if allResults{i, 2} ~= 23
        offset = 0;
        
        allResults{i, 1}.Properties.VariableNames([1:9]) = {'overallRank' 'carNumber' 'universityName' 'teamName' 'overallScore' 'overallDynamic' 'overallStatic' 'costScore' 'designScore'};
        
        if ismember(allResults{i, 2}, salesPres)
            allResults{i, 1}.Properties.VariableNames(10 + offset) = {'salesScore'}
            offset = offset + 1;
        end
        
        if ismember(allResults{i, 2}, techPen)
            allResults{i, 1}.Properties.VariableNames(10 + offset) = {'techPenalty'}
            offset = offset + 1
        end
        
        if ismember(allResults{i, 2}, techEvent)
            allResults{i, 1}.Properties.VariableNames(10 + offset) = {'techScore'}
            offset = offset + 1;
        end
        
        allResults{i, 1}.Properties.VariableNames([10 + offset, 11 + offset]) = {'accelScore', 'landManeuScore'}
        
        if ismember(allResults{i, 2}, mudBog)
            allResults{i, 1}.Properties.VariableNames(12 + offset) = {'mudBogScore'}
            offset = offset + 1;
        end
        
        if ismember(allResults{i, 2}, rockCrawl)
            allResults{i, 1}.Properties.VariableNames(12 + offset) = {'rockCrawlScore'}
            offset = offset + 1;
        end
        
        if ismember(allResults{i, 2}, sledPull)
            allResults{i, 1}.Properties.VariableNames(12 + offset) = {'sledPullScore'}
        else
            allResults{i, 1}.Properties.VariableNames(12 + offset) = {'hillClimbScore'}
        end
        
        if ~ismember(allResults{i, 2}, rockCrawl)
            allResults{i, 1}.Properties.VariableNames(13 + offset) = {'susTracScore'}
            offset = offset + 1
        end
        
        if ismember(allResults{i, 2}, waterManeu)
            allResults{i, 1}.Properties.VariableNames(13 + offset) = {'waterManeuScore'}
            offset = offset + 1
        end
        
        width(allResults{i, 1})
        i
        offset
        
        allResults{i, 1}.Properties.VariableNames(13 + offset) = {'enduroScore'}
        
        if ismember(allResults{i, 2}, techPenEnd)
            allResults{i, 1}.Properties.VariableNames(14 + offset) = {'techPenalty'}
            offset = offset + 1
        end
        
        offset
        i
        
        allResults{i, 1}.Properties.VariableNames(14 + offset) = {'penalty'};
        
        if ~ismember(allResults{i, 2}, techPen) && ~ismember(allResults{i, 2}, techPenEnd)
            allResults{i, 1}.Properties.VariableNames(15 + offset) = {'registered'}
            allResults{i, 1}.Properties.VariableNames(16 + offset) = {'techPassed'}
        elseif ismember(allResults{i, 2}, techPen)
             allResults{i, 1}.Properties.VariableNames(15 + offset) = {'registered'}
        end
    else
        allResults{i, 1}.Properties.VariableNames = {'overallRank' 'carNumber' 'universityName' 'teamName' 'overallScore' 'designScore' 'costScore' 'accelScore' 'mudBogScore' 'susTracScore' 'waterManeuScore' 'sledPullScore' 'enduroScore' 'techPenalty' 'penalty'};
    end
    
      allResults{i, 1}.universityName = convertCharsToStrings(allResults{i, 1}.universityName)
end