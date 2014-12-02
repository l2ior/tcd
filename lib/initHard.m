function [S1, S2] = initHard(s1,s2,k)
% Init by performing a k-means
%   + Input
%     - s1: sequence 1
%     - s2: sequence 2
%     - k:  #clusters for pre-clustering
%
%   + Output
%     - S1: cluster IDs for sequence 1
%     - S2: cluster IDs for sequence 2
%
% Wen-Sheng Chu (wschu@cmu.edu)
% Ref: Unsupervised Temporal Commonality Discovery, ECCV 2012.

X = [s1, s2]';

% clustering
[~,mincen] = fastkmeans(X,k);

% compute histogram
hist = zeros(k, size(X,1));
for iHist = 1:size(X,1)
  hist(mincen(iHist),iHist) = 1;
end

% get integral image
S1 = [zeros(k,1), cumsum(hist(:,1:length(s1)),2)];
S2 = [zeros(k,1), cumsum(hist(:,length(s1)+1:end),2)];
