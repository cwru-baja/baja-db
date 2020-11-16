wrongNames = ["Christian Brothers College" "Arizona State Univ - Polytechnic" "California Polytechnic State Univ-SLO" "City College of the City Univ of NY"; 
              "Christian Brothers Univ" "Arizona State Univ Polytechnic" "California State Poly Univ-San Luis Obis" "City College of New York"]

allUnis = getParticipatingUnis(allResults, wrongNames);          

%%
close all;
clc;

%yeeYee1 = getCompResults(allResults, "getCompResults")

%yeeYee2 = getCompsAttended(allResults, wrongNames, "Univ of Illinois - Urbana Champaign", allUnis)
% writetable(yeeYee2, 'UIUCAllResults.xlsx')

% wrongNamesTwo = strings;

%yeeYee4 = getIronTeamResults(allResults, wrongNamesTwo, "2015");

%yeeYee5 = getAvgSeasonResults(allResults, wrongNamesTwo, "2017");

%yeeYee6 = getAvgResults(allResults, wrongNamesTwo, ["2017" "2018" "2019"], 5)

%yeeYee7 = getAvgPlace(allResults, wrongNamesTwo, ["2010" "2011" "2012" "2013" "2014" "2015" "2016" "2017" "2018" "2019"], 10)

%yeeYee3 = getParticipatingUnis(allResults, wrongNames)

%yeeYee8 = getClosestComps(allResults)

yeeYee9 = graphResults2D(allResults, 56, "overallScore", "landManeuScore")
 
%graphLine2D(yeeYee9)

%yeeYee10 = graphResults3D(allResults, 55, "enduroScore", "overallDynamic", "overallStatic")

%yeeYee11 = findResultCorrelation(allResults, 59, "landManeuScore")

%graphLine2D(yeeYee11)

