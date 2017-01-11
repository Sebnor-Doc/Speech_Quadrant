topFrontPt = [10, 10];
lowFrontPt = [8, 0];
topBackPt = [0, 10];
lowBackPt = [0, 0];

X = [topFrontPt(1), lowFrontPt(1), lowBackPt(1), topBackPt(1), topFrontPt(1)];
Y = [topFrontPt(2), lowFrontPt(2), lowBackPt(2), topBackPt(2), topFrontPt(2)];
i = [9,9];

figure();
hold on;
plot(X,Y);
text(1,1, char('A'));
hold off;

ax = gca;
ax.XDir = 'reverse';
ax.XLim = [-1 11];
ax.YLim = [-1 11];
grid on;

