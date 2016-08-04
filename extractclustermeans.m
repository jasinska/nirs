if exist('/data3/')
    if groupname=='TFL_Feb2016'
        [~,contrasts]=xlsread('/data3/nirs/ContrastAnalysis.xls');
    else
        [~,contrasts]=xlsread('/data3/nirs/ContrastAnalysisYOUNG.xls');
    end
    pathname='/data3/nirs/';
else
    if groupname=='TFL_Feb2016'
        [~,contrasts]=xlsread('/Volumes/nirs/ContrastAnalysis.xls');
    else
        [~,contrasts]=xlsread('/Volumes/nirs/ContrastAnalysisYOUNG.xls');
    end
    pathname='/Volumes/nirs/';
end

subs=xlsread(strcat(pathname, 'Group/', groupname,  '.xls'));    




HB={'HbR', 'HbO'};
HB={'HbR'};
views={'left','right', 'frontal'};
for i3=1:length(HB)
    Hb=HB{1,i3};
    for i4=1:2
        view=views{1,i4};
        
        load(strcat('/Volumes/nirs/Group/Kaja/TPA_May2016_min20/',Hb, view, '/SPM_group_',view, Hb,'.mat'));
        load(strcat('/Volumes/nirs/Group/Kaja/TPA_May2016_min20/',Hb, view, '/ginterp_avgbeta_',view, Hb,'.mat'));
        load(strcat('/Volumes/nirs/Group/Kaja/TPA_May2016_min20/',Hb, view, '/ginterp_beta_',view, Hb,'.mat'));
        load('/Users/kajajasinska/Documents/MATLAB/spm8_updates_r5236/rend/render_single_subj.mat');
        
        side_hemi = SPM_nirs.nirs.brain_view.index;
        brain = rend{side_hemi}.ren;
        if issparse(brain),
            d = size(brain);
            B1 = spm_dctmtx(d(1),d(1));
            B2 = spm_dctmtx(d(2),d(2));
            brain = B1*brain*B2';
        end
        msk = find(brain>1);brain(msk)=1;
        msk = find(brain<0);brain(msk)=0;
        brain = brain(end:-1:1,:);
        brain = brain * 0.5;
        
        p_value=0.05;
        
        %for i1=1:length(SPM_nirs.xCon)
                    for i1=1:2

            Ic=i1;
            load(strcat('/Volumes/nirs/Group/Kaja/TPA_May2016_min20/',Hb, view, '/ginterp_T_', num2str(Ic),'_',view, Hb,'.mat'));
            index_mask=index_maskkj;
            threshold = spm_u(p_value, df, SPM_nirs.xCon(Ic).STAT);
            if max(stat)>threshold
            index_over = find(stat > threshold);
            index_sigmask = index_mask(index_over);
            statsig = stat(index_over);
            min_stat = min(statsig);
            max_stat = max(statsig);
            smin_stat = max_stat - ((max_stat - min_stat)./63) * 127;
            sbar = linspace(smin_stat, max_stat, 128);
            stat_brain = ((-sbar(1) + sbar(64))/(0.5)).*brain + sbar(1);
            stat_brain(index_sigmask) = statsig;
            
            for i2=1:length(group_beta)
                cond1=group_beta{1,i2}(1,:)';
                cond2=group_beta{1,i2}(2,:)';
                cond3=group_beta{1,i2}(3,:)';
                cond4=group_beta{1,i2}(4,:)';
                cond5=group_beta{1,i2}(5,:)';
                condsig1 = cond1(index_over);
                condsig2 = cond2(index_over);
                condsig3 = cond3(index_over);
                condsig4 = cond4(index_over);
                condsig5 = cond5(index_over);
                
                avgconditionsTdf(i2,1:8)=[mean(condsig1),mean(condsig2),mean(condsig3),mean([mean(condsig2),mean(condsig3)]),mean(condsig4),mean(condsig5),mean(statsig),df(1,2)];   
            end
            percontrast{1,i1}=avgconditionsTdf;
            percontrast{2,i1}=SPM_nirs.xCon(i1).name;
            else
            percontrast{1,i1}=0;
            end
        end
    matrix{i4,1}=percontrast;
    matrix{i4,2}=view;
    end
end
    
