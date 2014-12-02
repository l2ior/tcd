function normData = normalizeCol( data )
% This function normalize the range of every COLUMN to [0,1]

data     = data';
normData = (data - repmat(min(data,[],1),size(data,1),1))*spdiags(1./(max(data,[],1)-min(data,[],1))',0,size(data,2),size(data,2));
normData = normData';

normData(isnan(normData)) = 0; % clean NaN numbers