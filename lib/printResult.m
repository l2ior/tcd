function printResult(S1,S2,Rall,gt)
% Print the groundtruth and our discoveries
% printResult(Rall,gt)

fprintf('===============================================\n');
fprintf('+ TCD results\n');
fprintf('===============================================\n');

for iGT = 1:size(gt,1)
  curgt = gt(iGT,:);
  fprintf('+ truth(%d):\t[%3d, %3d, %3d, %3d]\n',iGT,curgt);
end

for iR = 1:numel(Rall)
  R       = Rall(iR);
  if isempty(R.lo)
    continue;
  end
  hist1   = S1(:,R.lo(2)+1) - S1(:,R.lo(1));
  hist2   = S2(:,R.lo(4)+1) - S2(:,R.lo(3));
  len1    = single(R.lo(2)+1 - R.lo(1));
  len2    = single(R.lo(4)+1 - R.lo(3));
  
  fprintf('+ TCD  (%d):\t[%3d, %3d, %3d, %3d]\n',iR,R.lo);
  fprintf('  - hist1 = [%s\b\b]\n', sprintf('%.1f, ',hist1/len1));
  fprintf('  - hist2 = [%s\b\b]\n', sprintf('%.1f, ',hist2/len2));
end