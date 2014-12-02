function intFeat = getIntFeat( obsFeat )
% Get interaction feature as in Minh's paper
% Input:
%   obsFeat:  The observation feature
% Output:
%   intFeat:  The interaction feature

[d,n] = size( obsFeat );
intFeat = zeros(d^2, n);

parfor i = 1:n-1
  intFeat(:,i) = kron(obsFeat(:,i+1),obsFeat(:,i));
end