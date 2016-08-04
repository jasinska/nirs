function interpolatechannel(ParticipantID, time, badchannel, adjacentchannel)
% This function interpolates a bad channel and interpolates it based on the
% average of the surrounding good channels. User must enter the participant
% ID, their time (T1 or T3), the bad channel, and enter the bad channels as
% [1,2,3,4]. It will only average 2-4 good channels. Created by Kaja and
% Hailey.

a=badchannel;
b=adjacentchannel;

if time~=1
if exist('/data3/')
pathname = strcat('/data3/nirs/', ParticipantID, '_T', num2str(time),'/');
else
    pathname=strcat('/Volumes/nirs/', ParticipantID, '_T', num2str(time), '/');
end
else
if exist('/data3/')
pathname = strcat('/data3/nirs/', ParticipantID, '/');
else
    pathname=strcat('/Volumes/nirs/', ParticipantID, '/');
end
end

load(strcat('/Volumes/nirs/',ParticipantID,'/',ParticipantID,'_filteredbaseline_stepremoved.mat'));
save(strcat('/Volumes/nirs/',ParticipantID,'/',ParticipantID,'_filteredbaseline_stepremoved_preinterpolated.mat'), 'nirs_data')



if length(b)==3
nirs_data.oxyData(:,a)=(nirs_data.oxyData(:,b(1,1))+nirs_data.oxyData(:,b(1,2))+nirs_data.oxyData(:,b(1,3)))/length(b);
elseif length(b)==4
nirs_data.oxyData(:,a)=(nirs_data.oxyData(:,b(1,1))+nirs_data.oxyData(:,b(1,2))+nirs_data.oxyData(:,b(1,3))+nirs_data.oxyData(:,b(1,4)))/length(b);  
elseif length(b)==2
nirs_data.oxyData(:,a)=(nirs_data.oxyData(:,b(1,1))+nirs_data.oxyData(:,b(1,2)))/length(b);  
end

if length(b)==3
nirs_data.dxyData(:,a)=(nirs_data.dxyData(:,b(1,1))+nirs_data.dxyData(:,b(1,2))+nirs_data.dxyData(:,b(1,3)))/length(b);
elseif length(b)==4
nirs_data.dxyData(:,a)=(nirs_data.dxyData(:,b(1,1))+nirs_data.dxyData(:,b(1,2))+nirs_data.dxyData(:,b(1,3))+nirs_data.dxyData(:,b(1,4)))/length(b);  
elseif length(b)==2
nirs_data.dxyData(:,a)=(nirs_data.dxyData(:,b(1,1))+nirs_data.dxyData(:,b(1,2)))/length(b);  
end

if length(b)==3
nirs_data.tHbData(:,a)=(nirs_data.tHbData(:,b(1,1))+nirs_data.tHbData(:,b(1,2))+nirs_data.tHbData(:,b(1,3)))/length(b);
elseif length(b)==4
nirs_data.tHbData(:,a)=(nirs_data.tHbData(:,b(1,1))+nirs_data.tHbData(:,b(1,2))+nirs_data.tHbData(:,b(1,3))+nirs_data.tHbData(:,b(1,4)))/length(b);  
elseif length(b)==2
nirs_data.tHbData(:,a)=(nirs_data.tHbData(:,b(1,1))+nirs_data.tHbData(:,b(1,2)))/length(b);  
end

save(strcat('/Volumes/nirs/',ParticipantID,'/',ParticipantID,'_filteredbaseline_stepremoved.mat'), 'nirs_data')
end