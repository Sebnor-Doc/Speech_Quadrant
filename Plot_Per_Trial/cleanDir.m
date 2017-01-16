function [ procDirs ] = cleanDir( rootDir )
%CLEANDIR Summary of this function goes here
%   Detailed explanation goes here

dirs = dir(rootDir);
procDirs = dirs(~ismember({dirs.name},{'.','..', 'calib'}));   % remove system dirs

end

