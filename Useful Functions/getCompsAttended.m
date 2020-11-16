function teamResults = getCompsAttended(dataIn, wrongNames, team, uniList)

nameLoc = find(uniList(1, :) == team);

nameIndex = uniList(2, nameLoc(1));

allNames = [];

for i = 1:size(uniList, 2)
    if strcmp(uniList(2, i), num2str(nameIndex))
        allNames = [uniList(1, i) allNames];
    end
end

names = {'compName', 'overallRank', 'carNumber', 'universityName', 'teamName', 'overallScore', 'overallDynamic', 'overallStatic', 'costScore', 'designScore', 'salesScore', 'techScore', 'accelScore', 'landManeuScore', 'rockCrawlScore', 'mudBogScore', 'hillClimbScore', 'sledPullScore', 'susTracScore', 'waterManeuScore', 'enduroScore', 'techPenalty', 'penalty', 'registered', 'techPassed', 'PassedTechOnTime'};
types = {'string', 'int8', 'int8', 'string', 'string', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'string', 'string', 'string'};

teamResults = table('Size', [1 26], 'VariableNames', names, 'VariableTypes', types);

compCounter = 1;

for i = 1:size(dataIn, 1)
    currentComp = dataIn{i, 1};
    
    for j = 1:size(allNames, 2)
        if ~isnan(find(strcmp(currentComp.universityName, allNames(j))))
            teamResults.compName(compCounter) = dataIn{i, 3};
            
            teamIndex = find(strcmp(currentComp.universityName, allNames(j)));
            
            for l = 1:size(teamIndex, 1)
                if l > 1
                    blankRow = array2table(NaN(1, 26));
                    
                    blankRow.Properties.VariableNames = teamResults.Properties.VariableNames;
                    
                    teamResults = [teamResults; blankRow];
                    
                    compCounter = compCounter + 1;
                    
                    teamResults.compName(compCounter) = dataIn{i, 3};
                    for k = 1:width(currentComp)
                        currentVar = currentComp.Properties.VariableNames(k);
                        
                        
                        inputResults = currentComp.(currentVar{1});
                        
                        teamResults.(currentVar{1})(compCounter) = inputResults(teamIndex(l));
                    end
                else
                    for k = 1:width(currentComp)
                        currentVar = currentComp.Properties.VariableNames(k);
                        
                        inputResults = currentComp.(currentVar{1});
                        
                        teamResults.(currentVar{1})(compCounter) = inputResults(teamIndex(l));
                    end
                end
            end
            
            compCounter = compCounter + 1;
        end
    end
end

teamResults = flipud(teamResults);

end

