function printResult(S1,S2,Rall,gt)
% Print the groundtruth and our discoveries
% printResult(Rall,gt)

fprintf('===============================================\n');
fprintf('+ TCD results\n');
fprintf('===============================================\n');


gt_dist = size(gt,1);
for iGT = 1:size(gt,1)
  curgt = gt(iGT,:);
  fprintf('+ truth(%d):\t[%3d, %3d, %3d, %3d]\n',iGT,curgt);
  g1 = S1(:,gt(iGT,2)+1) - S1(:,gt(iGT,1));
  g2 = S2(:,gt(iGT,4)+1) - S2(:,gt(iGT,3));
  g1 = g1 / sum(g1);
  g2 = g2 / sum(g2);
  gt_dist(iGT) = sum(abs(g1-g2));
end

for iGT = 1:size(gt,1)
  fprintf('  - |gt(%d)| = %.10f\n', iGT, gt_dist(iGT));
end

for iR = 1:numel(Rall)
  R       = Rall(iR);
  if isempty(R.lo)
    continue;
  end
  hist1   = S1(:,R.lo(2)+1) - S1(:,R.lo(1));
  hist2   = S2(:,R.lo(4)+1) - S2(:,R.lo(3));

  h1 = hist1 / sum(hist1);
  h2 = hist2 / sum(hist2);
  
  fprintf('+ TCD  (%d):\t[%3d, %3d, %3d, %3d]\n',iR,R.lo);
  fprintf('  - hist1 = [%s\b\b]\n', sprintf('%.1f, ',h1));
  fprintf('  - hist2 = [%s\b\b]\n', sprintf('%.1f, ',h2));
  fprintf('  - |h1-h2| = %.10f\n', sum(abs(h1-h2)));
end
