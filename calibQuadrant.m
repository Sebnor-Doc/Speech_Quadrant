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
    currTraj = 100.*currTraj(:,1:3);
    traj{i} = currTraj;
end

% Find resting position
restTraj = {};
restPos = zeros(numTraj, 3);
for i = 1 : numTraj
    restTraj{i} = traj{i}(2:20,:);
    restPos(i,:) = median(restTraj{i});  % Calculate median point
end

restPt = mean(restPos);


% Plot trajectory
figure();

for i = 1 : numTraj
    hold 'on';
    plot3(traj{i}(:,1), traj{i}(:,2), traj{i}(:,3), '-o', 'LineWidth', 1);
    plot3(restPos(i,1), restPos(i,2), restPos(i,3), 'Color', 'g', 'Marker', 'x', 'MarkerSize', 15);
    
end

plot3(restPt(1), restPt(2), restPt(3), 'Color', 'r', 'Marker', 'x', 'MarkerSize', 15);
hold 'off';

ax = gca;
ax.FontSize = fontSize;
ax.XLabel.String = 'X(cm)';
ax.XLabel.FontSize = fontSize;
ax.YLabel.String = 'Y(cm)';
ax.YLabel.FontSize = fontSize;
ax.ZLabel.String = 'Z(cm)';
ax.ZLabel.FontSize = fontSize;
ax.View = [90 0];
grid 'on';