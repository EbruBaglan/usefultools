%--------------------------------------
% text splitter for line-numbered codes
% splitter.m
% Programmed by Ebru Baglan
%--------------------------------------

clc, clear, close all

% open the files
fid = fopen('duzelt.txt','rt'); % read-only
fid2 = fopen('newfile.txt','wt'); % write-only

% get the text splitted for each line
g = textscan(fid,'%s','delimiter','\n');
n = size(g{1},1);

for i= 1 : n
    input = g{1}{i};
    
    str1 = strtok(input);
    str2 = extractAfter(input,str1);
    
    fwrite(fid2,str2);  % print into second file
    fprintf(fid2,'\n'); % add new line
end

% close the files
fclose(fid);
fclose(fid2);

clearvars
