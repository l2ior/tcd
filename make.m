% Makefile
%
% Aug-8-2014 by Wen-Sheng Chu (wschu@cmu.edu)

path0 = cd;

mexbits = mexext;
mexbits = str2double(mexbits(end-1:end));

cd src;
mex tcd.cpp;

cd(path0);

