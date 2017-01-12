function vowelQuadrant(restPt, ax)

%% Input params
topFrontPt = restPt + [-0.8,1];
lowFrontPt = restPt + [0.2, -2];
topBackPt = restPt + [1.5, 1];
lowBackPt = restPt + [1.5, -2];

quadrantLineWidth = 1.5;
phonemeSize = 18;
phonemeColor = 'black';

%% Create points of interests
% quadrant lines
contour = [topFrontPt(1), lowFrontPt(1), lowBackPt(1), topBackPt(1), topFrontPt(1) ;
           topFrontPt(2), lowFrontPt(2), lowBackPt(2), topBackPt(2), topFrontPt(2)];
       
verticalLine = [topFrontPt + 0.5 .* (topBackPt - topFrontPt); 
                lowFrontPt + 0.5 .* (lowBackPt - lowFrontPt)];
            
horizLineTop = [topFrontPt + (1.0/3) .* (lowFrontPt - topFrontPt);
                topBackPt + (1.0/3) .* (lowBackPt - topBackPt) ];
            
horizLineDown = [topFrontPt + (2.0/3) .* (lowFrontPt - topFrontPt);
                topBackPt + (2.0/3) .* (lowBackPt - topBackPt) ];

% Phonemes
vowelPos = containers.Map; 
vowelPos('a') = lowFrontPt;                         % 'a'
vowelPos(char(228)) = verticalLine(2, :);            % 'ä'
vowelPos(char(593)) = lowBackPt;                    % '?'
vowelPos('e') = horizLineTop(1,:);                  % 'e'               
vowelPos(char(603)) = horizLineDown(1,:);           % '?'
vowelPos('i') = topFrontPt;                         % 'i'
vowelPos(char(618)) = [topFrontPt(1) + 0.1 .* (topBackPt(1) - topFrontPt(1));
                       topFrontPt(2) + 0.1 .* (lowFrontPt(2) - topFrontPt(2)) ];% '?'
vowelPos('u') = topBackPt;                          % 'u'
vowelPos(char(650)) = [topBackPt(1) + 0.1 .* (topFrontPt(1) - topBackPt(1));
                       topBackPt(2) + 0.1 .* (lowBackPt(2) - topBackPt(2)) ]; % '?'
vowelPos('REST') = restPt;                      

%% Plot quadrant
% figure();
hold on;
plot(ax, contour(1,:),contour(2,:), 'LineWidth', quadrantLineWidth, 'Color', 'black');
plot(ax, verticalLine(:,1),verticalLine(:,2), 'LineWidth', quadrantLineWidth, 'Color', 'black');
plot(ax, horizLineTop(:,1),horizLineTop(:,2), 'LineWidth', quadrantLineWidth, 'Color', 'black');
plot(ax, horizLineDown(:,1),horizLineDown(:,2), 'LineWidth', quadrantLineWidth, 'Color', 'black');

for phoneme = keys(vowelPos)
    pos = vowelPos(phoneme{1});
    scatter(ax, pos(1), pos(2), 2*phonemeSize, 'k', 'filled');
    text(pos(1), pos(2)+0.2, phoneme{1}, 'Color', phonemeColor, 'FontSize', phonemeSize);
end
hold off;

end

