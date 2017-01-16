% Input
rootDir = 'C:\Users\sebno\Dropbox\GT-Bionics\Calib_Program\Phoneme\Sub3\phoneme';
fontSize = 26;

phonDirs = cleanDir(rootDir);   % Get all phoneme folders only (use of cleanDir to filter out non-phonemes)
numPhonemes = numel(phonDirs);
numTrials = numel(cleanDir(strcat(rootDir, '\', phonDirs(1).name))); % Number of trials

% Save trajectories in a data structure
traj = cell([1 numTrials]);

for trialIdx = 1 : numTrials
    
    traj{trialIdx} = containers.Map;
    
    for j = 1 : numPhonemes
        phonemeLst = phonDirs(j).name;
        path = char('%1$s/%2$s/%2$s_%3$d/%2$s_%3$d_loca.txt');
        trialPhon = sprintf(path, rootDir, phonemeLst, trialIdx);
        
        currTraj = dlmread(trialPhon);
        currTraj = 100.*currTraj(:,2:3);
        
        traj{trialIdx}(phonemeLst) = currTraj;
    end
         
end

% Plot each trial on its own plot
for trialIdx = 1 : numTrials
   
    phonemeLst = keys(traj{trialIdx});
    
    figure();
    hold on;
   
   for i = 1 : length(phonemeLst)
       phoneme = phonemeLst{i};
       mTraj = traj{trialIdx}(phoneme);
       
       plot(mTraj(:,1), mTraj(:,2), 'DisplayName', phoneme);
       startPt = plot(mTraj(1,1), mTraj(1,2), 'Marker', 'x', 'Color', 'g');
       endPt = plot(mTraj(end,1), mTraj(end,2), 'Marker', '>', 'Color', 'r');
       
       startPt.Annotation.LegendInformation.IconDisplayStyle = 'off';
       endPt.Annotation.LegendInformation.IconDisplayStyle = 'off';
   end
   
   hold off;
   
   ax = gca;
   ax.FontSize = fontSize;
   ax.Title.String = sprintf('Trial %d', trialIdx);
   ax.XLabel.String = 'Y(cm)';
   ax.XLabel.FontSize = fontSize;
   ax.YLabel.String = 'Z(cm)';
   ax.YLabel.FontSize = fontSize;   
   grid 'on';
   legend('show');
   
end