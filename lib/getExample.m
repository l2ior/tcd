function [s1, s2, B, winLen, nMaxRes, gt, figTitle, dispOpt] = getExample( option )
% Generate examples for the TCD algorithm
%   + Input
%     - option: an integer selecting which example to use (1)
%
%   + Output
%     - s1: sequence 1
%     - s2: sequence 2
%     - B: #clusters for pre-clustering
%     - winLen: the minimal length set in Eq (1)
%     - nMaxRes: #results for TCD to discover
%     - gt: groundtruth for evaluation
%     - figTitle: title for short description of each example
%
% Wen-Sheng Chu (wschu@cmu.edu)
% Ref: Unsupervised Temporal Commonality Discovery, ECCV 2012.

% defaults
if ~exist('nMaxRes','var'), nMaxRes=1; end
if ~exist('option','var'),  option=1;  end

dispOpt = 'l1';
switch option
  case 1
    figTitle = 'Ex1: a short and simple demo';
    s1 = floor(rand(1, 15)*15)+1; s2 = floor(rand(1, 15)*20)+1;
    target = [1,3,5,4,6,2];
    s1(3:8) = target; s2(8:13) = target;
    winLen = 5; B = 5; 
    gt = [3, 8, 8, 13];
    nMaxRes = size(gt,1);

  case 2
    figTitle = 'Using ex2: another short and simple demo';
    s1 = rand(1, 30); s2 = rand(1, 40)*4; 
    target = rand(1, 20)*10;
    s1(3:3+length(target)-1) = target; s2(10:10+length(target)-1) = target;
    winLen = length(target)-1; B = 5; nMaxRes = 1;
    gt = [3, 3+length(target)-1, 10, 10+length(target)-1];
   
  case 3
    figTitle = 'Using ex3: 1 noisy sin vs 1 noisy sin';
    s1 = rand(1, 140); s2 = rand(1, 180)*2; 
    target1 = sin(-pi:0.1:pi)*3+rand(1,length(-pi:0.1:pi)).*1;
    target2 = sin(-pi:0.1:pi)*3+rand(1,length(-pi:0.1:pi)).*1;
    s1(31:31+length(target1)-1) = target1; s2(101:101+length(target2)-1) = target1;
    winLen = length(target1); B = 5; nMaxRes = 1;
    gt = [31, 31+length(target1)-1, 101, 101+length(target2)-1];
    
  case 4
    figTitle = 'Using ex4: 1 thin sin vs 1 fat sin';
    s1 = rand(1, 140); s2 = rand(1, 180)*2; 
    target1 = sin(0.8*(-pi:0.1:pi))*3+rand(1,length(-pi:0.1:pi)).*.8;
    target2 = sin(-pi:0.1:pi)*3+rand(1,length(-pi:0.1:pi)).*.8;
    s1(31:31+length(target1)-1) = target1; s2(101:101+length(target2)-1) = target2;
    winLen = length(target1); B = 5; nMaxRes = 1;
    gt = [31, 31+length(target1)-1, 101, 101+length(target2)-1];
    
  case 5
    figTitle = 'Using ex5: 2 sin vs 1 sin';
    s1 = rand(1, 200); s2 = rand(1, 180)*2; 
    target1 = sin(-pi:0.1:pi)*3+rand(1,length(-pi:0.1:pi)).*2;
    target2 = sin(-pi:0.1:pi)*3+rand(1,length(-pi:0.1:pi)).*3;
    s1(11:11+length(target1)-1) = target1; 
    s1(91:91+length(target2)-1) = target2;
    s2(101:101+length(target1)-1) = target1;
    winLen = length(target1); B = 5; nMaxRes = 2;
    gt(1,:) = [11, 11+length(target1)-1, 101, 101+length(target1)-1];
    gt(2,:) = [91, 91+length(target2)-1, 101, 101+length(target1)-1];
    
  case 6
    figTitle = 'Using ex6: [multiple instances] 2 sin + 2 half sin vs 1 sin';
    s1 = rand(1, 200)*0.6; s2 = rand(1, 400)*2; 
    step = 0.15;
    target1 = sin(-pi:step:pi)*3+rand(1,length(-pi:step:pi)).*0.2;
    target2 = sin(-pi:step:pi)*3+rand(1,length(-pi:step:pi)).*0.2;
    s1(11:11+length(target1)-1) = target1; 
    s1(101:101+length(target1)-1) = target1; 
    % s1(191:191+length(target1)/2-1) = target1(1:length(target1)/2);
    % s1(691:691+length(target1)/2-1) = target1(length(target1)/2+1:end);
    s2(301:301+length(target2)-1) = target2;
    s2(31:31+length(target2)-1) = target2;
    winLen = length(target1)-3; B = 5; nMaxRes = 4;
    gt(1,:) = [11,  11+length(target1)-1,  301, 301+length(target2)-1];
    gt(2,:) = [101, 101+length(target1)-1, 301, 301+length(target2)-1];
    gt(3,:) = [11,  11+length(target1)-1,  31,  31+length(target2)-1];
    gt(4,:) = [101, 101+length(target1)-1, 31,  31+length(target2)-1];
    
  case 7
    figTitle =  'Using ex7: [multiple objects] 2 sin + 2 cos';
    s1 = rand(1, 200)*0.6; s2 = rand(1, 400)*2; 
    step = 0.15;
    target1 = sin(-pi:step:pi)*3+rand(1,length(-pi:step:pi)).*0.2;
    target2 = cos(-pi:step:pi)*3+rand(1,length(-pi:step:pi)).*0.2;
    s1(11:11+length(target1)-1) = target1; 
    s1(101:101+length(target2)-1) = target2; 
    s2(301:301+length(target1)-1) = target1;
    s2(31:31+length(target2)-1) = target2;
    winLen = length(target1); B = 5; nMaxRes = 2;
    gt(1,:) = [11,  11+length(target1)-1,  301, 301+length(target2)-1];
    gt(2,:) = [101, 101+length(target1)-1, 31,  31+length(target2)-1];
    
  case 8
    figTitle = 'Using ex8: [Query by seq1]';
    s2 = rand(1, 200)*0.6; s1 = rand(1, 400)*2; 
    step = 0.15;
    target1 = sin(-pi:step:pi)*3+rand(1,length(-pi:step:pi)).*0.2;
    target2 = sin(-pi:step:pi)*3+rand(1,length(-pi:step:pi)).*0.2;
    s2 = target1; 
    s1(301:301+length(target1)-1) = target1; 
    s1(31:31+length(target2)-1) = target2;
    winLen = length(target1)-1; % -3 for ESS
    B = 5; nMaxRes = 2;
    gt(1,:) = [301, 301+length(target1)-1, 1, length(target1)];
    gt(2,:) = [31, 31+length(target2)-1, 1, length(target1)];
    
  otherwise
    error('selectExample: option out of range\n');
end

%% display
fprintf('===============================================\n');
fprintf('+ %s\n',figTitle);
fprintf('===============================================\n');
fprintf('+ Getting example:\n');
fprintf('  + len(s1)=%d, len(s2)=%d\n',length(s1),length(s2));
fprintf('  + %d commonalities:\n',nMaxRes);
for i = 1:size(gt,1)
  fprintf('    - s1[%3d,%3d], s2[%3d,%3d]\n',gt(i,1:2),gt(i,3:4));
end
