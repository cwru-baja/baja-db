function output_txt = bajaCallback2D(obj,event_obj,xName,yName,teamNames,zName)
% Display data cursor position in a data tip
% obj          Currently not used
% event_obj    Handle to event object
% output_txt   Data tip text, returned as a character vector or a cell array of character vectors

pos = event_obj.Position;
I = event_obj.DataIndex;


%********* Define the content of the data tip here *********%

% Display the x and y values:
output_txt = {['Team: ',convertStringsToChars(teamNames(I))],...
              [convertStringsToChars(xName),formatValue(pos(1),event_obj)],...
              [convertStringsToChars(yName),formatValue(pos(2),event_obj)]};
%***********************************************************%


% If there is a z value, display it:
if length(pos) > 2
    output_txt{end+1} = [convertStringsToChars(zName),formatValue(pos(3),event_obj)];
end

%***********************************************************%

function formattedValue = formatValue(value,event_obj)
% If you do not want TeX formatting in the data tip, uncomment the line below.
% event_obj.Interpreter = 'none';
if strcmpi(event_obj.Interpreter,'tex')
    valueFormat = ' \color[rgb]{0 0.6 1}\bf';
    removeValueFormat = '\color[rgb]{.25 .25 .25}\rm';
else
    valueFormat = ': ';
    removeValueFormat = '';
end
formattedValue = [valueFormat num2str(value,4) removeValueFormat];
