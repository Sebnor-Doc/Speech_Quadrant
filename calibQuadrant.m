trajFiles = {
    'C:\Users\sebno\Dropbox\GT-Bionics\Calib_Program\Phoneme\Sub3\phoneme\calib\calib_1\calib_1_loca.txt', ...
    'C:\Users\sebno\Dropbox\GT-Bionics\Calib_Program\Phoneme\Sub3\phoneme\calib\calib_2\calib_2_loca.txt', ...
    'C:\Users\sebno\Dropbox\GT-Bionics\Calib_Program\Phoneme\Sub3\phoneme\calib\calib_3\calib_3_loca.txt'
    };
fontSize = 26;

% Get trajectory
traj = {};
numTraj = size(trajFiles, 2);
for i = 1 : numTraj 
    currTraj = dlmread(trajFiles{i});
    currTraj = 100.*currTraj(:,2:3);
    traj{i} = currTraj;
end

% Find resting position
restTraj = {};
restPos = zeros(numTraj, 2);
for i = 1 : numTraj
    restTraj{i} = traj{i}(2:20,:);
    restPos(i,:) = median(restTraj{i});  % Calculate median point
end

restPt = mean(restPos);


% Plot trajectory
figure();

for i = 1 : numTraj
    hold 'on';
    plot(traj{i}(:,1), traj{i}(:,2), '-o', 'LineWidth', 1);
    plot(restPos(i,1), restPos(i,2), 'Color', 'g', 'Marker', 'x', 'MarkerSize', 15);
end

plot(restPt(1), restPt(2), 'Color', 'r', 'Marker', 'x', 'MarkerSize', 15);
hold 'off';

ax = gca;
vowelQuadrant(restPt, ax);

ax.FontSize = fontSize;
ax.XLabel.String = 'Y(cm)';
ax.XLabel.FontSize = fontSize;
ax.YLabel.String = 'Z(cm)';
ax.YLabel.FontSize = fontSize;
grid 'on';

