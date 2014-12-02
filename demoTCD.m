% A TCD demo on discovering temporal commonalities between two sequences
% 
% Version 1.3
%
% Created: Aug-8-2013 by Wen-Sheng Chu (wschu@cmu.edu)
% Revised: Aug-8-2014 by Wen-Sheng Chu (wschu@cmu.edu)
%
% Ref: Unsupervised Temporal Commonality Discovery, ECCV 2012.

clear all; close all; addpaths; 

% Genenrate example
pickEx = 6; % pickEx=1~8 for #examples
[s1, s2, B, L, nRes, gt] = getExample(pickEx);

%% Get init indices using k-means
[S1, S2] = initSoft(s1, s2, B); % note that the len(S1)=len(s1)+1

% One may use the hard assignment by [S1, S2] = initHard(s1,s2,B); 
% However be aware that the results are expected to be unsatisfactory.

%% Setup options
opt.dist      = 'X2'; % distance metric ('l1','l2','X2','int');
opt.maxIter   = 1e6;  % max iteration for TCD
opt.nRes      = nRes; % max number of discoveries
opt.isVerbose = 0;    % verbose or not

%% Run TCD
tic
[R,info] = tcd(S1, S2, L, opt);
toc

%% Print result
printResult(S1, S2, R, gt);
