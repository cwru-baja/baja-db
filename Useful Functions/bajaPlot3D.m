function bajaPlot3D(xData, yData, zData, xDataName, yDataName, zDataName, names, style)

fh = figure;
scatter3(xData, yData, zData, style);

dcm = datacursormode(fh);
datacursormode on
set(dcm, 'updatefcn', {@bajaCallback2D,xDataName, yDataName, names, zDataName})