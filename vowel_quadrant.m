%% Input params
topFrontPt = [10, 10];
lowFrontPt = [8, 0];
topBackPt = [0, 10];
lowBackPt = [0, 0];

plotTitle = 'Vowel Quadrant';
quadrantLineWidth = 1.5;
phonemeSize = 18;
phonemeColor = 'blue';

%% Create points of interests
contour = [topFrontPt(1), lowFrontPt(1), lowBackPt(1), topBackPt(1), topFrontPt(1) ;
           topFrontPt(2), lowFrontPt(2), lowBackPt(2), topBackPt(2), topFrontPt(2)];
verticalLine = [5, 4; 10, 0];
horizLineTop = [0, 9.3; 6.66, 6.66];
horizLineDown = [0, 8.66; 3.33, 3.33];

vowelPos = containers.Map; 
vowelPos('a') = lowFrontPt;                         % 'a'
vowelPos(char(228)) = lowBackPt + 0.5 * lowFrontPt; % 'ä'
vowelPos(char(593)) = lowBackPt;                    % '?'
vowelPos('e') = [9.3 6.66];                         % 'e'               
vowelPos(char(603)) = [8.66 3.33];                  % '?'
vowelPos('i') = topFrontPt;                         % 'i'
vowelPos(char(618)) = [9 9];                        % '?'
vowelPos('u') = topBackPt;                          % 'u'
vowelPos(char(650)) = [2 9];                        % '?'
vowelPos('REST') = [6 4];                      

%% Plot quadrant
figure();
hold on;
plot(contour(1,:),contour(2,:), 'LineWidth', quadrantLineWidth, 'Color', 'black');
plot(verticalLine(1,:),verticalLine(2,:), 'LineWidth', quadrantLineWidth, 'Color', 'black');
plot(horizLineTop(1,:),horizLineTop(2,:), 'LineWidth', quadrantLineWidth, 'Color', 'black');
plot(horizLineDown(1,:),horizLineDown(2,:), 'LineWidth', quadrantLineWidth, 'Color', 'black');

for phoneme = keys(vowelPos)
    pos = vowelPos(phoneme{1});
    scatter(pos(1), pos(2), phonemeSize, 'b', 'filled');
    lbl = text(pos(1)+0.3, pos(2)+0.3, phoneme{1}, 'Color', phonemeColor, 'FontSize', phonemeSize);
    lbl.Margin = 20; 
end
hold off;

ax = gca;
ax.XDir = 'reverse';
ax.XLim = [-1 11];
ax.YLim = [-1 11];
ax.FontSize = 20;
ax.Title.String = plotTitle;
grid on;

