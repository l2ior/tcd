function [S1, S2] = initSoft(s1,s2,k)
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
  centers = fastkmeans(X,k);
  %[cidx,dist] = litekmeans(X', k);

  % calculate distance
  dist = distEuc(X,centers)';
  dist = exp(-dist)/median(dist(:)); % convert into probablity in [0,1]
  dist = getTempFeat(dist); % convert into temporal features

  % get integral image
  S1 = single([zeros(k+k^2,1), cumsum(dist(:,1:length(s1)),2)]);
  S2 = single([zeros(k+k^2,1), cumsum(dist(:,length(s1)+1:end),2)]);
end

% compute temporal feature
function feat = getTempFeat(X)
  Xobs = normalizeCol( X' )';
  Xint = getIntFeat( X );
  feat = [Xobs; Xint];
end