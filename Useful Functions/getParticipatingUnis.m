%This function cleans up the list of universities that have participated in
%Baja SAE competitions
function participatingUnis = getParticipatingUnis(dataIn, dupNames)
%initializing blank string array
participatingUnis = strings;

%for loops run through all competitions and all competitors, and puts
%together all unique names
for i = 1:size(dataIn, 1)
    for j = 1:size(dataIn{i, 1}.universityName, 1)
        if (~ismember(strtrim(dataIn{i, 1}.universityName(j)), participatingUnis)) && ~(strcmp(strtrim(dataIn{i, 1}.universityName(j)), "School"))
            participatingUnis = [strtrim(dataIn{i, 1}.universityName(j)) participatingUnis];
        end
    end
end

%sorting in alphabetical order
participatingUnis = sort(participatingUnis);

%remove first string if it's blank
if strlength(participatingUnis(1)) == 0
    participatingUnis = participatingUnis(2:size(participatingUnis, 2));
end

%finally run cleaning algorithm
participatingUnis = cleanParticipatingUnis(participatingUnis, dupNames);

%this function attempts to clean up the generated list, figuring out which
%names belong to the same university
    function participatingUnis = cleanParticipatingUnis(uniList, dupNames)
        %adding second row that assigns a number to each university
        participatingUnis = [uniList; 1:size(uniList, 2)];
        
        %for loops recognize if any two universities with similar enough
        %names are the same
        for i = 1:size(uniList, 2)
            for j = 1:size(uniList, 2)
                if i ~= j
                    if contains(uniList(i), uniList(j), 'IgnoreCase', true) || strcmp(strrep(uniList(i),' ',''), strrep(uniList(j),' ',''))
                        participatingUnis(2, i) = participatingUnis(2, j);
                    end
                end
            end
        end
        
        %this for loop allows for user input of duplicate names, which will
        %then be filtered
        if dupNames ~= strings
            for i = 1:size(uniList, 2)
                tempIndex = find(participatingUnis(1, i) == dupNames(1, :));
                
                if ~isempty(find(participatingUnis(1, i) == dupNames(1, :)))
                    participatingUnis(2, i) = find(dupNames(2, tempIndex) == participatingUnis(1, :));
                end
            end
        end
    end
end