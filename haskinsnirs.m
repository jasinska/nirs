function haskinsnirs(ParticipantID,PolhemusStatus,time)

%polhemusstatus - set this as 1 if you want to process polhemus, set as 0
%if you already have a polhemus saved
%time is 1 or 2 or 3 depending on visit
%ParticipantID should be noted in single quotes. eg. '401001'

addpath(genpath('*/nirs/matlabscripts//'))
rmpath(genpath('*/nirs/matlabscripts/NIRS_SPM_v4_r1_tempoffpath/'))

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

fname_nirs = dir(strcat(pathname, ParticipantID, '*.TXT'));
[nirs_data] = data_conversion_batch(strcat(pathname,fname_nirs.name), 'shimadzu');
beh_data = dir(strcat(pathname, ParticipantID, '_wordDisplay', '*.txt'));
if size(beh_data)==[1 1]
    beh_data=beh_data.name;
else
    [behfilename, behpathname] = uigetfile('*.txt', 'Select your behavioral data file');
    beh_data=strcat(behpathname,behfilename);
end

cd(pathname)

[sizej,sizek]=size(nirs_data.oxyData);
if PolhemusStatus==1
if sizek==62
%This sets up your origins and others file

if exist('/data3/')
chlist=load('/data3/nirs/chList.txt');
else
chlist=load('/Volumes/nirs/chList.txt');
end

polhemusfile = dir(strcat(pathname, ParticipantID, '_*', '-201', '*.mat'));
if size(polhemusfile)==[1 1]
    load(polhemusfile.name);
else
    [polfilename, polpathname] = uigetfile('*.mat', 'Select your polhemus file');
    load(strcat(polpathname,polfilename));
end
polhemus.WriteSPMFNIRS(strcat(pathname, ParticipantID),chlist)%This writes out your origins and others files to your MATLAB folder.
origin_fname = strcat(pathname,  ParticipantID, '_origin.csv');
others_fname = strcat(pathname,  ParticipantID, '_other.csv');
fid=fopen(others_fname);
OTH=textscan(fid,'%s');
OTH=OTH{1,1};
%OTH(97,:)=[];
OTH(72,:)=[];
OTH(69,:)=[];
OTH(48,:)=[];
%OTH(47,:)=[];
OTH(43,:)=[];
fclose(fid);
cell2csv(strcat(pathname, ParticipantID, '_other_58ch.csv'), OTH, ',')
others_fname = strcat(pathname,  ParticipantID, '_other_58ch.csv');
nfri_mni_estimationY(origin_fname, others_fname);
global NFRI_result;
WShatC = NFRI_result.OtherC;
nch = 58;
noptd = 39;
ch_MNI_mm = ones(4, nch);
ch_MNI_mm(1:3,:) = WShatC(noptd+1:end,1:3)';
optd_MNI_mm = ones(4, noptd);
optd_MNI_mm(1:3,:) = WShatC(1:noptd, 1:3)';
handles.optd_MNI_mm = optd_MNI_mm;

template_info = spm_vol([spm('dir') filesep 'templates' filesep 'T1.nii']); %%% T1, T2, EPI template .mat .dim parameter are same
ch_MNI_vx = inv(template_info.mat) * ch_MNI_mm;
[rend, rendered_MNI] = render_MNI_coordinates(ch_MNI_vx, template_info);
%MNI_coordinates(ch_MNI_vx, template_info);
for kk = 1:6
    rendered_MNI{kk}.ren = rend{kk}.ren;
end
NIRS_Rendered_MNI_Viewer(rendered_MNI);
preproc_info.rend_ch_pos = rendered_MNI;
preproc_info.ch_MNI_mm = ch_MNI_mm;
preproc_info.template_info = spm_vol([spm('dir') filesep 'templates' filesep 'T1.nii']);
preproc_info.registration = 'standalone';
preproc_info.ch_config = [];
preproc_info.ch_config.nholder = '1set';
save(strcat(pathname, ParticipantID, '_polhemus.mat'), 'preproc_info');
anatomlabel_finalkaja(WShatC, 'test', 10, 5, pathname,  ParticipantID);
rendered_MNI = preproc_info.rend_ch_pos;
polfigfilepath=strcat(pathname,  ParticipantID, '_Polhemus.jpg');
NIRS_Rendered_MNI_Viewer(rendered_MNI);
else
polhemus_haskins 
end
elseif PolhemusStatus==0
else
disp('You did not specify whether you wanted to create a polhemus or not')
end

%makes NOD
[beh]=tdfread(strcat(beh_data));
Conditions = strcat(beh.blockType,'_',beh.stimType,'_',beh.trialType);
Conditions = cellstr(Conditions);
if sizek==62
time_data = dir(strcat(pathname, ParticipantID, '_201', '*.xls'));
if size(time_data)==[1 1]
    [T.Sig, T.TStr] = xlsread(time_data.name);   
else
    [timefilename, timepathname] = uigetfile('*.xls', 'Select your timing file');
    [T.Sig, T.TStr] = xlsread(strcat(timepathname, timefilename));
end
% The following 5 lines have been modified by Susan Shuai
%t = datestr(T.Sig(10:end,1), 'HH:MM:SS,FFF');
%r=datevec(t);
%f=[3600,60,1];
%r=r(:,4:6)*f.';
%k=r*(nirs_data.fs);
    r1 = datevec(T.Sig(10:end,1));
    f = [0,0,0,3600,60,1]; %% year, month, date, hour, min, second; 
    r = r1 * f.';  
    r = fixtags(r);
    if ~isempty (find(r == 0))
        return;
    end
    k = round(r*(nirs_data.fs)); % this is time point data, so it's rounded
% End of modification. Susan 10/26/2015
starttime=k;
else
    starttime=find(nirs_data.vector_onset==1);
end

endtime=starttime+(1*nirs_data.fs);

blockstart=starttime(1:6:end,1);
blockend=starttime(6:6:end,1)+(1*nirs_data.fs);
blockconditions=Conditions(1:6:end);

videostart=starttime(1:6:end,1);
videostart = videostart - (10*nirs_data.fs);
videoend = videostart + (5*nirs_data.fs);

conditionvector = zeros(length(Conditions),1);

for i = 1:length(Conditions)
    if isequal(Conditions{i,1},'speech_Word_Target')
        conditionvector(i,1)=1;
        elseif isequal(Conditions{i,1},'speech_Word_Filler')
        conditionvector(i,1)=4;
        elseif isequal(Conditions{i,1},'speech_NonWord_Practiced_Target')
        conditionvector(i,1)=2;
        elseif isequal(Conditions{i,1},'speech_NonWord_NotPracticed_Target')
        conditionvector(i,1)=3;
        elseif isequal(Conditions{i,1},'speech_NonWord_Practiced_Filler')
        conditionvector(i,1)=5;
        elseif isequal(Conditions{i,1},'speech_NonWord_NotPracticed_Filler')
        conditionvector(i,1)=6;
        elseif isequal(Conditions{i,1},'text_Word_Target')
        conditionvector(i,1)=7;
        elseif isequal(Conditions{i,1},'text_Word_Filler')
        conditionvector(i,1)=9;
        elseif isequal(Conditions{i,1},'text_NonWord_Practiced_Target')
        conditionvector(i,1)=8;
        elseif isequal(Conditions{i,1},'text_NonWord_NotPracticed_Target')
        conditionvector(i,1)=8;
        elseif isequal(Conditions{i,1},'text_NonWord_Practiced_Filler')
        conditionvector(i,1)=10;
        elseif isequal(Conditions{i,1},'text_NonWord_NotPracticed_Filler')
        conditionvector(i,1)=10;
     end
end

blockconditionvector=zeros(length(blockconditions),1);
for i = 1:length(blockconditions)
    if isequal(blockconditions{i,1},'text_Word_Target')
        blockconditionvector(i,1)=7;
    elseif isequal(blockconditions{i,1},'text_Word_Filler')
        blockconditionvector(i,1)=9;
    elseif isequal(blockconditions{i,1},'text_NonWord_Practiced_Target')
        blockconditionvector(i,1)=8;
    elseif isequal(blockconditions{i,1},'text_NonWord_NotPracticed_Target')
        blockconditionvector(i,1)=8;
    elseif isequal(blockconditions{i,1},'text_NonWord_Practiced_Filler')
        blockconditionvector(i,1)=10;
    elseif isequal(blockconditions{i,1},'text_NonWord_NotPracticed_Filler')
        blockconditionvector(i,1)=10;
    elseif isequal(blockconditions{i,1},'speech_Word_Target')
        blockconditionvector(i,1)=1;
    elseif isequal(blockconditions{i,1},'speech_Word_Filler')
        blockconditionvector(i,1)=4;
    elseif isequal(blockconditions{i,1},'speech_NonWord_Practiced_Target')
        blockconditionvector(i,1)=2;
    elseif isequal(blockconditions{i,1},'speech_NonWord_NotPracticed_Target')
        blockconditionvector(i,1)=3;
    elseif isequal(blockconditions{i,1},'speech_NonWord_Practiced_Filler')
        blockconditionvector(i,1)=5;
    elseif isequal(blockconditions{i,1},'speech_NonWord_NotPracticed_Filler')
        blockconditionvector(i,1)=6;
    end
end


durationvector = ones(length(blockconditionvector),1)*(6.5*nirs_data.fs);
videoduration = ones(length(videostart),1)*(5*nirs_data.fs);

DataMatrix=[blockconditionvector,blockstart,durationvector];
VideoMatrix=[(11*ones(length(videostart),1)),videostart,videoduration];
NewMatrix=[DataMatrix;VideoMatrix];
SortedNewMatrix = sortrows(NewMatrix,1);

Condition1 = SortedNewMatrix(SortedNewMatrix(:,1)==1,:);
Condition2 = SortedNewMatrix(SortedNewMatrix(:,1)==2,:);
Condition3 = SortedNewMatrix(SortedNewMatrix(:,1)==3,:);
Condition4 = SortedNewMatrix(SortedNewMatrix(:,1)==4,:);
Condition5 = SortedNewMatrix(SortedNewMatrix(:,1)==5,:);
Condition6 = SortedNewMatrix(SortedNewMatrix(:,1)==6,:);
Condition11 = SortedNewMatrix(SortedNewMatrix(:,1)==11,:);


ind = strcmp('text_Word_Filler', blockconditions);
if any(ind==1)
%if length(Conditions)>300
Condition7 = SortedNewMatrix(SortedNewMatrix(:,1)==7,:);
Condition8 = SortedNewMatrix(SortedNewMatrix(:,1)==8,:);
Condition9 = SortedNewMatrix(SortedNewMatrix(:,1)==9,:);
Condition10 = SortedNewMatrix(SortedNewMatrix(:,1)==10,:);
names = {'speech_Word_Target','speech_NonWord_Practiced_Target','speech_NonWord_NotPracticed_Target','speech_Word_Filler','speech_NonWord_Practiced_Filler','speech_NonWord_NotPracticed_Filler','text_Word_Target','text_NonWord_Target','text_Word_Filler','text_NonWord_Filler','video'};
durations = {Condition1(:,3), Condition2(:,3), Condition3(:,3), Condition4(:,3),Condition5(:,3), Condition6(:,3), Condition7(:,3), Condition8(:,3),Condition9(:,3), Condition10(:,3), Condition11(:,3)};
onsets = {Condition1(:,2), Condition2(:,2), Condition3(:,2), Condition4(:,2),Condition5(:,2), Condition6(:,2), Condition7(:,2), Condition8(:,2),Condition9(:,2), Condition10(:,2), Condition11(:,2)};
else
names = {'speech_Word_Target','speech_NonWord_Practiced_Target','speech_NonWord_NotPracticed_Target','video'};
durations = {Condition1(:,3), Condition2(:,3), Condition3(:,3),Condition11(:,3)};
onsets = {Condition1(:,2), Condition2(:,2), Condition3(:,2), Condition11(:,2)};
end

NODfile = strcat(pathname, ParticipantID, '_NOD.mat');
save(NODfile, 'onsets', 'durations', 'names');
%else
    %load(strcat(pathname, ParticipantID, '_NOD.mat'));
%end

%FINISH MAKING NOD

%deletes missing channels 4, 9, 30 and 33
if sizek==62;
    save(strcat(pathname, ParticipantID, '_62ch_converted.mat'), 'nirs_data');
    %nirs_data.oxyData(:,59)=[];
    %nirs_data.dxyData(:,59)=[];
    %nirs_data.tHbData(:,59)=[];
    nirs_data.oxyData(:,33)=[];
    nirs_data.dxyData(:,33)=[];
    nirs_data.tHbData(:,33)=[];
    nirs_data.oxyData(:,30)=[];
    nirs_data.dxyData(:,30)=[];
    nirs_data.tHbData(:,30)=[];
    nirs_data.oxyData(:,9)=[];
    nirs_data.dxyData(:,9)=[];
    nirs_data.tHbData(:,9)=[];
    %nirs_data.oxyData(:,8)=[];
    %nirs_data.dxyData(:,8)=[];
    %nirs_data.tHbData(:,8)=[];
    nirs_data.oxyData(:,4)=[];
    nirs_data.dxyData(:,4)=[];
    nirs_data.tHbData(:,4)=[];
    nirs_data.nch=58;
    save(strcat(pathname, ParticipantID, '_converted.mat'), 'nirs_data');
end


load(strcat(pathname, ParticipantID, '_NOD.mat'))
fname_nirs=strcat(pathname, ParticipantID, '_converted.mat');
hb = 'hbo';
HPF = 'wavelet';
LPF = 'hrf';
method_cor = 0;
dir_save = strcat(pathname, 'Analysis/');
mkdir(dir_save);
flag_window = 1;
hrf_type = 0;
units = 0;
[SPM_nirs] = specification_batch(fname_nirs, hb, HPF, LPF, method_cor, dir_save, flag_window, hrf_type, units,  names, onsets, durations); 
hb = 'hbr';
[SPM_nirs] = specification_batch(fname_nirs, hb, HPF, LPF, method_cor, dir_save, flag_window, hrf_type, units,  names, onsets, durations);
 hb = 'hbt';
[SPM_nirs] = specification_batch(fname_nirs, hb, HPF, LPF, method_cor, dir_save, flag_window, hrf_type, units,  names, onsets, durations);
close all



% step 3: model estimation
 disp('Starting estimation')
fname_SPM = strcat(pathname,'Analysis/SPM_indiv_HbO.mat');
[SPM_nirs] = estimation_batch(fname_SPM, fname_nirs);
fname_SPM = strcat(pathname,'Analysis/SPM_indiv_HbR.mat');
[SPM_nirs] = estimation_batch(fname_SPM, fname_nirs);
fname_SPM = strcat(pathname,'Analysis/SPM_indiv_HbT.mat');
[SPM_nirs] = estimation_batch(fname_SPM, fname_nirs);


%saving separate baseline filtering data
cL={'hrf'};
cH={'Wavelet-MDL'};
fnirs_data.cL.type = cL;
fnirs_data.cH.type = cH;
nirs_data.baseline = 'initial time';
cH.SPM=SPM_nirs;
ch.type = 'Wavelet-MDL';
SPM=cH.SPM;
for kk = 1:size(SPM.xX.X,2) -1;
    str_model{kk} = num2str(kk);
end
str_cH = 'Detrending: ';
str_cL = 'LPF: ';
RT = 1./nirs_data.fs;
row = 1:size(nirs_data.oxyData,1);
    
HB = {'R', 'O'};
k = length(row);
h = spm_hrf(RT);
h = [h; zeros(size(h))];
g = abs(fft(h));
h = real(ifft(g));
h = fftshift(h)';
n = length(h);
d = [1:n] - n/2 -1;
KL = spdiags(ones(k,1)*h, d, k,k);
KL = spdiags(1./sum(KL')',0,k,k)*KL;
str_cL = [str_cL cL];
X = SPM.xX.X;
for kk = 1:size(SPM.xX.X,2)-1
    str_model{kk} = num2str(kk);
end
%end of baseline filter seperate file

p_value =  0.05;
HB = {'R', 'O'};
brains = {'left', 'right'};
if exist('/Volumes/nirs/ContrastAnalysis.xls')
[~,contrasts]=xlsread('/Volumes/nirs/ContrastAnalysis.xls');
if length(onsets)<5
[~,contrasts]=xlsread('/Volumes/nirs/ContrastAnalysisYOUNG.xls');
end
else
[~,contrasts]=xlsread('/data3/nirs/ContrastAnalysis.xls');
if length(onsets)<5
[~,contrasts]=xlsread('/data3/nirs/ContrastAnalysisYOUNG.xls');
end
end

for c = 1:length(HB)
    hb = HB{1,c};
    filen_SPM = strcat(pathname, 'Analysis/SPM_indiv_Hb', hb, '.mat'); 

    for a = 1:length(brains)
        spec_hemi = brains{1,a} ;
        filen_ch = strcat(pathname,  ParticipantID,'_polhemus.mat');

        for b = 1:length(contrasts);
            con_name = contrasts{b,1}
            con_vec = contrasts{b,2};
            con_vec  = str2num(con_vec)';

            image_dir_save = strcat(dir_save, con_name, '/', spec_hemi, '/Hb', hb, '/');
            mkdir(image_dir_save);
            STAT = 'T';

            correct_p = 'none';
            disp_fig = 1;
            [stat_brain, act_brain, threshold] = activation_map_batch(filen_SPM, filen_ch, con_name, con_vec, STAT, spec_hemi, p_value, correct_p, disp_fig);
            
            %[T_map, T_brain, T_brain_over] = activation_map_batchIC(fname_SPM, fname_ch, contrast, brain_view, p_value, flag_correction, flag_figure, Ic);
            save(strcat(image_dir_save, 'stat_brain.mat'), 'stat_brain');
            save(strcat(image_dir_save, 'act_brain.mat'), 'act_brain');
            save(strcat(image_dir_save, 'threshold.mat'), 'threshold');
            saveas(gcf, strcat(image_dir_save, spec_hemi, '_', con_name, '.png'))
            close all
        end
    end
end

load(strcat(pathname,'Analysis/SPM_indiv_HbT.mat'));
beta_values=[ones((length(onsets)+1),1)*str2num(ParticipantID),(1:(length(onsets)+1))',SPM_nirs.nirs.beta];
file_name=strcat(pathname, ParticipantID,'_tHbbetas.csv');
csvwrite(file_name, beta_values)

load(strcat(pathname,'Analysis/SPM_indiv_HbO.mat'));
beta_values=[ones((length(onsets)+1),1)*str2num(ParticipantID),(1:(length(onsets)+1))',SPM_nirs.nirs.beta];
file_name=strcat(pathname, ParticipantID,'_oxybetas.csv');
csvwrite(file_name, beta_values)

load(strcat(pathname,'Analysis/SPM_indiv_HbR.mat'));
beta_values=[ones((length(onsets)+1),1)*str2num(ParticipantID),(1:(length(onsets)+1))',SPM_nirs.nirs.beta];
file_name=strcat(pathname, ParticipantID,'_dxybetas.csv');
csvwrite(file_name, beta_values)
base= {'initial time'}
index_start = 1;
index_end = 1;
str_baseline = base;
ntime = size(nirs_data.oxyData, 1);
total_Hb=nirs_data.tHbData;
fnirs_data.oxyData = nirs_data.oxyData - ones(ntime,1)*mean(nirs_data.oxyData(index_start:index_end,:),1);
fnirs_data.dxyData = nirs_data.dxyData - ones(ntime,1)*mean(nirs_data.dxyData(index_start:index_end,:),1);
ftotal_Hb = total_Hb - ones(ntime,1) * mean(total_Hb(index_start:index_end,:),1);
fnirs_data.oxyData = KL * fnirs_data.oxyData;
fnirs_data.dxyData = KL * fnirs_data.dxyData;
ftotal_Hb = KL * ftotal_Hb;
[biasM_oxy] = detrend_wavelet_MDL(fnirs_data.oxyData, X(:,1:end-1));
[biasM_dxy] = detrend_wavelet_MDL(fnirs_data.dxyData, X(:,1:end-1).*(-1));
[biasM_tHb] = detrend_wavelet_MDL(ftotal_Hb, X(:,1:end-1));
fnirs_data.cH.bias_oxy = biasM_oxy;
fnirs_data.cH.bias_dxy = biasM_dxy;
fnirs_data.cH.bias_tHb = biasM_tHb;
fnirs_data.oxyData = fnirs_data.oxyData - biasM_oxy;
fnirs_data.dxyData = fnirs_data.dxyData - biasM_dxy;
fnirs_data.tHbData = ftotal_Hb - biasM_tHb;
fnirs_data.fs=nirs_data.fs;
fnirs_data.nch=nirs_data.nch;
fnirs_data.baseline=nirs_data.baseline;
nirs_data=fnirs_data;
save(strcat(pathname, ParticipantID, '_filteredbaseline.mat'), 'nirs_data');
%END OF PREPARING SEPARATE FILTERED BASELINE FILES

p_value =  0.05;
HB = {'R', 'O'};
brains = {'left', 'right'};

if exist('/data3/')
    [~,contrasts]=xlsread('/data3/nirs/ContrastAnalysis.xls');
    if length(onsets)<5
        [~,contrasts]=xlsread('/data3/nirs/ContrastAnalysisYOUNG.xls');
    end
else
    [~,contrasts]=xlsread('/Volumes/nirs/ContrastAnalysis.xls');
    if length(onsets)<5
        [~,contrasts]=xlsread('/Volumes/nirs/ContrastAnalysisYOUNG.xls');
    end
end





for c = 1:length(HB)
    hb = HB{1,c};
    filen_SPM = strcat(pathname, 'Analysis/SPM_indiv_Hb', hb, '.mat'); 

    for a = 1:length(brains)
        spec_hemi = brains{1,a} ;
        filen_ch = strcat(pathname,  ParticipantID,'_polhemus.mat');

        for b = 1:length(contrasts);
            con_name = contrasts{b,1}
            con_vec = contrasts{b,2};
            con_vec  = str2num(con_vec)';

            image_dir_save = strcat(dir_save, con_name, '/', spec_hemi, '/Hb', hb, '/');
            mkdir(image_dir_save);
            STAT = 'T';

            correct_p = 'none';
            disp_fig = 1;
            [stat_brain, act_brain, threshold] = activation_map_batch(filen_SPM, filen_ch, con_name, con_vec, STAT, spec_hemi, p_value, correct_p, disp_fig);
            
            %[T_map, T_brain, T_brain_over] = activation_map_batchIC(fname_SPM, fname_ch, contrast, brain_view, p_value, flag_correction, flag_figure, Ic);
            save(strcat(image_dir_save, 'stat_brain.mat'), 'stat_brain');
            save(strcat(image_dir_save, 'act_brain.mat'), 'act_brain');
            save(strcat(image_dir_save, 'threshold.mat'), 'threshold');
            saveas(gcf, strcat(image_dir_save, spec_hemi, '_', con_name, '.png'))
            close all
        end
    end
end

load(strcat(pathname,'Analysis/SPM_indiv_HbT.mat'));
beta_values=[ones((length(onsets)+1),1)*str2num(ParticipantID),(1:(length(onsets)+1))',SPM_nirs.nirs.beta];
file_name=strcat(pathname, ParticipantID,'_tHbbetas.csv');
csvwrite(file_name, beta_values)

load(strcat(pathname,'Analysis/SPM_indiv_HbO.mat'));
beta_values=[ones((length(onsets)+1),1)*str2num(ParticipantID),(1:(length(onsets)+1))',SPM_nirs.nirs.beta];
file_name=strcat(pathname, ParticipantID,'_oxybetas.csv');
csvwrite(file_name, beta_values)

load(strcat(pathname,'Analysis/SPM_indiv_HbR.mat'));
beta_values=[ones((length(onsets)+1),1)*str2num(ParticipantID),(1:(length(onsets)+1))',SPM_nirs.nirs.beta];
file_name=strcat(pathname, ParticipantID,'_dxybetas.csv');
csvwrite(file_name, beta_values)


if exist('/data3/')
load('/data3/nirs/Intervention_Pilot/positions.mat')
else
load('/Volumes/nirs/Intervention_Pilot/positions.mat')
end

for ii=1:length(names)
    cond=ii;
figure
for ch = 1:58
CH=nirs_data.oxyData(:,ch);
toplot=struct('HbO',onsets{1,cond}/15.8730);
[HbO, timeT] = cuixuNIRSretrieve(CH, toplot(1,1), 10, 0, 0.0630);
CH=nirs_data.dxyData(:,ch); 
toplot=struct('HbR',onsets{1,cond}/15.8730); 
[HbR, timeT] = cuixuNIRSretrieve(CH, toplot(1,1), 10, 0, 0.0630);
plotting=struct('HbO', HbO.HbO, 'HbR', HbR.HbR);
subplot(5,13,positions(ch,2))
plotAveragekj(plotting,timeT,0,[1,0,0;0,0,1]) %changed time in line 508,511,and 514 to TimeT to avoid conflict with PPI in line 531-535
title(strcat('CH ', num2str(ch)));
end
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0 0 20 10])
set(gcf, 'Position', [100 100 1600 600])
saveas(gcf,strcat(pathname, ParticipantID, '_', names{cond},'.png'));
% close(gcf)
% I = imread(strcat(pathname, ParticipantID, '_', names{cond},'.png'));
% J = imresize(I, [1000 2000]);
% J = imresize(J, 0.75);
% imshow(J);
% delete(strcat(pathname, ParticipantID, '_', names{cond},'.png'));
% saveas(gcf,strcat(pathname, ParticipantID, '_', names{cond},'.png'));
close(gcf)
end

if length(names)>9
    haskinsnirsppi(ParticipantID, time)
else
    haskinsnirsppi_speechonly(ParticipantID,time)
end
end
