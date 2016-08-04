function [ppibeta]= PPI_batch(ID, type)

allseeds={[27,38], [34,47], [34], [38]};
allseednames={2738,3447,34,38};

if type=='TPA';
    condvectors={[1,1,2,2,1,-1,3,1,-1],[1,1,1],[2,1,0.5,3,1,0.5]};
    condvectorsnames={'Full_speechwordvnonword','speechwordvbase','speechnonwordvbase',};
elseif type=='TFL';
    condvectors={[1,1,2,2,1,-1,3,1,-1],[1,1,1],[2,1,0.5,3,1,0.5],[7,1,1,8,1,-1],[7,1,1],[8,1,1],[1,1,-1,7,1,1]};
    condvectorsnames={'Full_speechwordvnonword','speechwordvbase','speechnonwordvbase', 'Full_textwordvnonword','textwordvbase','textnonwordvbase', 'Full_textvsspeech_words'};
end
HBs={'R','O'};

%check if data is in data3 or volumes (depends on where you long in from)
if exist('/data3/')
    pathname=strcat('/data3/nirs/', ID, '/');
else
	pathname=strcat('/Volumes/nirs/', ID, '/');
end
for i1=1:length(allseeds)    
    seed_channels=allseeds{1,i1};
    seed_channel=allseednames{1,i1};
    for i2=1:length(condvectors)
        Uu=condvectors{1,i2};
        condvectorname=condvectorsnames{1,i2};        
        for i3=1:length(HBs)            
            HB=HBs{1,i3};        
            dir_save = strcat(pathname, 'PPI_June2016_cond_', condvectorname, '/seedchannel_', num2str(seed_channel),'/Hb',HB,'/');
            if exist(strcat(dir_save, 'PPI_beta.mat'))~=0
                load(strcat(dir_save, 'PPI_beta.mat'));
                if length(ppibeta)~=58
                    ppibetatemp=ones(1,58)*999;
                    ppibetatemp(1,1:length(ppibeta))=ppibeta;
                    ppibeta=ppibetatemp;
                end
            else    
                SPM_file=strcat(pathname,'Analysis_stepremoved/SPM_indiv_Hb',HB,'.mat');
                nirs_file=strcat(pathname, ID, '_filteredbaseline_stepremoved.mat');
                load(strcat(pathname, ID, '_NOD.mat'));
                fname_nirs=nirs_file;
                HPF = 'wavelet';
                LPF = 'hrf';
                method_cor = 0;
                mkdir(dir_save);
                flag_window = 1;
                hrf_type = 0;
                units = 0;
                [PPInirs] = PPI_nirs(SPM_file, nirs_file, seed_channels, Uu, dir_save,HB);
                if HB=='R'
                    hb='hbr';
                else
                    hb='hbo';
                end
                %[SPM] = spm_nirs_design_final_KJ(nirs_fname, flag, flag_type, PPInirs);
                [SPM_nirs] = specification_batch_PPI(fname_nirs, hb, HPF, LPF, method_cor, dir_save, flag_window, hrf_type, units,  names, onsets, durations, PPInirs);
                fname_SPM=strcat(dir_save, 'SPM_indiv_Hb',HB,'.mat');
                [SPM_nirs] = estimation_batch(fname_SPM, fname_nirs);
            end
            con_name = strcat('PPI_',condvectorname);
            if length(SPM_nirs.Sess.U)==4
                con_vec = [0 0 0 0 1 0 0 0];
            elseif length(SPM_nirs.Sess.U)==11
                con_vec = [0 0 0 0 0 0 0 0 0 0 0 1 0 0 0]; 
            end
            views={'left', 'right', 'frontal'};
            for i4=1:length(views)
                spec_hemi=views{1,i4};    
                image_dir_save = strcat(dir_save, con_name, '/', spec_hemi, '/', hb, '/seedchannel_', num2str(seed_channel), '/');
                if exist(strcat(image_dir_save, spec_hemi, '_', con_name,'_seedchannel', num2str(seed_channel), '.png'))~=0
                else 
                    mkdir(image_dir_save);
                    STAT = 'T';
                    p_value =  0.05;
                    filen_SPM=fname_SPM;
                    filen_ch=strcat(pathname, ID, '_polhemus.mat');
                    correct_p = 'none';
                    disp_fig = 1;
                    [stat_brain, act_brain, threshold] = activation_map_batch(filen_SPM, filen_ch, con_name, con_vec, STAT, spec_hemi, p_value, correct_p, disp_fig);            
                    save(strcat(image_dir_save, 'stat_brain.mat'), 'stat_brain');
                    save(strcat(image_dir_save, 'act_brain.mat'), 'act_brain');
                    save(strcat(image_dir_save, 'threshold.mat'), 'threshold');
                    saveas(gcf, strcat(image_dir_save, spec_hemi, '_', con_name,'_seedchannel', num2str(seed_channel), '.png'));
                    close all;
                end
            end
            %fifth row corresponds to PPI in design matrix. First four columns are
            %the conditions
            ppibeta=SPM_nirs.nirs.beta(5,:);
            if length(ppibeta)~=58
                ppibetatemp=ones(1,58)*999;
                ppibetatemp(1,1:length(ppibeta))=ppibeta;
                ppibeta=ppibetatemp;
            end
            save(strcat(dir_save, 'PPI_beta.mat'),'ppibeta')
        end
    end
end
end



