function D = distEuc(X, Y)
% Compute Euclidean dist between two sets X and Y
  D  = sqrt(distEucSq(X,Y));
end

function D = distEucSq( X, Y )
% Compute squared Euclidean dist between two sets X and Y
  m = size(X,1); n = size(Y,1);
  XX = sum(X.*X,2);
  YY = sum(Y'.*Y',1);
  D  = XX(:,ones(1,n)) + YY(ones(1,m),:) - 2*X*Y';
end