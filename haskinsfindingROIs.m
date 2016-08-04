function [LHchtoinclude, RHchtoinclude]=haskinsfindingROIs(pathname, region, ParticipantID)

%this will find where e.g. left STG, what channel it is.

if exist('/data3/')
load('/data3/nirs/matlabscripts/positions.mat');
elseif exist('/Volumes/')
load('/Volumes/nirs/matlabscripts/positions.mat');
end

%load('/data3/nirs/matlabscripts/positions.mat');

%try load('/data3/nirs/matlabscripts/positions.mat');
%end
%try load('/Volumes/nirs/matlabscripts/positions.mat');
%end
  
load(strcat(pathname, ParticipantID, '_polhemus.mat'));
anatomlabel_finalROI(preproc_info.ch_MNI_mm(1:3,:)', 'test', 10, 5, pathname,  ParticipantID);
filename=strcat(pathname, ParticipantID, '_CHcoordinates.csv');
%filename=coordinatesfilename;

delimiter = ',';
formatSpec = '%s%s%s%s%s%s%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
fclose(fileID);

for i = 1:length(dataArray{1,1});
if isempty(dataArray{1,1}{i,1})
    dataArray{1,1}{i,1}=dataArray{1,1}{i-1,1};
end
end

%for jjj=1:length(region)
Index = find(not(cellfun('isempty', strfind(dataArray{1,6},region{1,1}))));
%Index contains the rows locations where dataArray{1,6} (list of brodmann)
%is equal to the ROI

Indexoftext = find(not(cellfun('isempty', strfind(dataArray{1,7},'part of'))));
%we want to get the percentage overalps from dataArray{1,7} but because ','
%is the delimiter, sometimes 'part of' is found in dataArray{1,7} and the
%actual percentage is in dataArray{1,8}...so Indexoftext contains the row
%locations where there is text in {1,7}
for i = 1:length(Indexoftext)
dataArray{1,7}{Indexoftext(i,1),1}=dataArray{1,8}{Indexoftext(i,1),1};
end
%we use row location to find all the text in dataArray{1,7} and replace it
%with the percentages which are found in dataArray{1,8}... now {1,7}
%contains just the percentages and we can continue
clear('coverage')
for i = 1:length(Index)
coverage(i,1)=str2num(dataArray{1,7}{Index(i,1),1});
end
clear('coveragechannels')
clear('Indexofcoverage')
if isempty(Index)

LHchtoinclude=0;
RHchtoinclude=0;
else
%Index contains the rows locations where dataArray{1,6} (list of brodmann)
%is equal to the ROI.
%pull out the percent coverage values from dataArray{1,7} based on the 
Indexofcoverage=find(coverage>0.2); %only use coverages that are over 20%
%there are only length(Indexofcoverage) number of channels that fit our ROI
%and have at least 20%
%find what those channels are
for i = 1:length(Indexofcoverage)
coveragechannels(i,1)=str2num(dataArray{1,1}{Index(Indexofcoverage(i,1),1),1});
end
if exist('coveragechannels')
coveragechannels=unique(coveragechannels);
%coveragechannels=unique(coveragechannels(coveragechannels>13*3))-(13*3);
%58 channels is actually 13 rows of 3 optodes(39) + 58 channels in the
%coordinates file. CH 1-58 is actually #40-97
clear('leftchannels')
clear('rightchannels')
for i=1:length(coveragechannels);
if positions(coveragechannels(i,1),3)==1
    leftchannels(i,1)=coveragechannels(i,1);
elseif positions(coveragechannels(i,1),3)==2
     rightchannels(i,1)=coveragechannels(i,1);
end
end
if exist('leftchannels')
    LHchtoinclude=leftchannels(leftchannels~=0);
else
    LHchtoinclude=0;
    disp('Warning...we did not find any LH channels, please check the polhemus files again')
end
if exist('rightchannels')
    RHchtoinclude=rightchannels(rightchannels~=0);
else
    RHchtoinclude=0;
    disp('Warning...we did not find any RH channels, please check the polhemus files again')
end

else
    coveragechannels=0;
        LHchtoinclude=0;
    RHchtoinclude=0;

     disp('Warning...we did not find any channels with sufficient covrage, please check the polhemus files again')
end


end
end
