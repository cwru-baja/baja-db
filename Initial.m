presScoresNA = zeros(115)
techScoresNA = zeros(115)

resultsCell = {Baja42Rochester_2013, Baja41Washington_2013, Baja40Tennessee_2013, Baja39Oregon_2012, Baja38Auburn_2012, Baja37Wisconsin_2012, Baja36Kansas_2011, Baja35Illinois_2011, Baja34Birmingham_2011, Baja33Washington_2010, Baja32Rochester_2010, Baja31Carolina_2010, Baja30Wisconsin_2009, Baja29Oregon_2009, Baja28Alabama_2009}

for i = 1:size(resultsCell)
    newTable = array2table(NaN(115-height(resultsCell{i}), width(resultsCell{i})));
    for j = 1:width(resultsCell{i})
        newTable.Properties.VariableNames{j} = char("VarName" + num2str(j));
    end
    resultsCell{i}.Properties.VariableNames{3} = char('VarName3');
    resultsCell{i}.Properties.VariableNames{4} = char('VarName4');
    
    resultsCell{i}(:, 16) = categorical(resultsCell{i}(:, 16))
    resultsCell{i} = [resultsCell{i}; newTable];
end

%Baja42Rochester_2013 = addvars(Baja42Rochester_2013, presScoresNA,'Before','VarName10');


tableArray = [Baja28Alabama_2009 Baja29Oregon_2009 Baja30Wisconsin_2009 Baja31Carolina_2010, Baja42Rochester_2013, Baja41Washington_2013, Baja40Tennessee_2013, Baja39Oregon_2012, Baja38Auburn_2012, Baja37Wisconsin_2012, Baja36Kansas_2011, Baja35Illinois_2011, Baja34Birmingham_2011, Baja33Washington_2010, Baja32Rochester_2010]