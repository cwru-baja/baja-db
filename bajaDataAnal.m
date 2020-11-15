function outputData = bajaDataAnal(compData, keyword)

if keyword == "getCompResults"
    outputData = getCompResults(compData)
end

if keyword == "getTeamResults"
    outputData = getCompsAttended(compData)
end

if keyword == "getParticipatingUnis"
    outputData = cleanParticipatingUnis(getParticipatingUnis(compData))
end

    

    function participatingUnis = cleanParticipatingUnis(uniList)
        participatingUnis = [uniList; 1:size(uniList, 2)];
        
        for i = 1:size(uniList, 2)
            for j = 1:size(uniList, 2)
                if i ~= j
                    if contains(uniList(i), uniList(j)) || strcmp(strrep(uniList(i),' ',''), strrep(uniList(j),' ',''))
                        participatingUnis(2, i) = participatingUnis(2, j)
                    end
                end
            end
        end
        
        prompt = 'Please input any duplicate names.'
        dupNames = input(prompt);
        
        for i = 1:size(uniList, 2)
            tempIndex = find(participatingUnis(1, i) == dupNames(1, :))
            
            if ~isempty(find(participatingUnis(1, i) == dupNames(1, :)))
                participatingUnis(2, i) = find(dupNames(2, tempIndex) == participatingUnis(1, :));
            end
        end
    end

end