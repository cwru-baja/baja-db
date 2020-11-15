function bajaPlot2D(xData, yData, xDataName, yDataName, names, style)

fh = figure;
plot(xData, yData, style);

dcm = datacursormode(fh);
datacursormode on
set(dcm, 'updatefcn', {@bajaCallback2D,xDataName, yDataName, names})
