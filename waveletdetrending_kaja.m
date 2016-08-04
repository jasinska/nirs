function fnirs_data=waveletdetrending_kaja(datatodet, SPM_nirs)

cL={'hrf'};
cH={'Wavelet-MDL'};
base='initial time';
str_baseline = base;
fnirs_data.baseline.type = base;
fnirs_data.cH.type = cH;
str_cH = 'Detrending: ';

RT = 1./datatodet.fs;
row = 1:size(datatodet.oxyData,1);
    
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

X = SPM_nirs.xX.X;
fnirs_data.cH.SPM = SPM_nirs;

ntime = size(datatodet.oxyData, 1);
index_start = 1;
index_end = 1;
str_baseline = base;    

total_Hb=datatodet.tHbData;
ftotal_Hb=datatodet.tHbData;
   
% baseline correction
fnirs_data.oxyData = datatodet.oxyData - ones(ntime,1)*mean(datatodet.oxyData(index_start:index_end,:),1);
fnirs_data.dxyData = datatodet.dxyData - ones(ntime,1)*mean(datatodet.dxyData(index_start:index_end,:),1);
ftotal_Hb = ftotal_Hb - ones(ntime,1) * mean(ftotal_Hb(index_start:index_end,:),1);    
    
% smoothing
fnirs_data.oxyData = KL * fnirs_data.oxyData;
fnirs_data.dxyData = KL * fnirs_data.dxyData;
ftotal_Hb = KL * total_Hb;

% detrending
[biasM_oxy] = detrend_wavelet_MDL(fnirs_data.oxyData, X(:,1:end-1));
[biasM_dxy] = detrend_wavelet_MDL(fnirs_data.dxyData, X(:,1:end-1).*(-1));
[biasM_tHb] = detrend_wavelet_MDL(ftotal_Hb, X(:,1:end-1));
fnirs_data.cH.bias_oxy = biasM_oxy;
fnirs_data.cH.bias_dxy = biasM_dxy;
fnirs_data.cH.bias_tHb = biasM_tHb;        

fnirs_data.oxyData = fnirs_data.oxyData - biasM_oxy;
fnirs_data.dxyData = fnirs_data.dxyData - biasM_dxy;
ftotal_Hb = ftotal_Hb - biasM_tHb;                
fnirs_data.tHbData=ftotal_Hb                
  
fnirs_data.fs=datatodet.fs;
fnirs_data.nch=datatodet.nch;
fnirs_data.baseline='initial time';
disp('END OF PREPARING SEPARATE FILTERED BASELINE FILES')
