function rSquared = graphLine2D(dataIn)
hold on

temp = xlim

[p, s] = polyfit(dataIn(:,1),dataIn(:,2),1);

rSquared = 1 - (s.normr/norm(dataIn(:,2) - mean(dataIn(:,2))))^2;

x1 = linspace(0,temp(2));
y1 = polyval(p,x1);
plot(x1, y1)
end