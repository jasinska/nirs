function [PPInirs] = PPI_nirs(SPM_file, nirs_file, seed_channels, Uu, dir_save,HB)


%SPM_file     - name of SPM_indiv_HbX.mat file
%nirs_file    - name of filtered, step-removed file
%y is the seed channel time series.
%Uu           - Matrix of input variables and contrast weights. This is an
%                [n x 3] matrix. The first column indexes SPM.Sess.U(i). The
%                second column indexes the name of the input or cause, see
%                SPM.Sess.U(i).name{j}. The third column is the contrast
%                weight. Unless there are parametric effects the second
%                column will generally be a 1.
%dir_save     - directory where this is saved to 


%PPI.ppi      - (PSY*xn  or xn1*xn2) convolved with the HRF
% PPI.Y        - Original HbX eigenvariate. Use as covariate of no interest
% PPI.P        - PSY convolved with HRF for psychophysiologic interactions. 
% PPI.name     - Name of PPI
% PPI.xY       - Original seed channel information
% PPI.xn       - Deconvolved neural signal(s)
% PPI.psy.u    - Psychological variable or input function (PPIs only)
% PPI.psy.w    - Contrast weights for psychological variable (PPIs only)
% PPI.psy.name - Names of psychological conditions (PPIs only)


load(SPM_file)
load(nirs_file)

if HB=='O'
if length(seed_channels)==2
    y=(nirs_data.oxyData(:,seed_channels(1))+nirs_data.oxyData(:,seed_channels(2)))/2;
elseif length(seed_channels)==3
    y=(nirs_data.oxyData(:,seed_channels(1))+nirs_data.oxyData(:,seed_channels(2))+nirs_data.oxyData(:,seed_channels(3)))/3;
elseif length(seed_channels)==4
    y=(nirs_data.oxyData(:,seed_channels(1))+nirs_data.oxyData(:,seed_channels(2))+nirs_data.oxyData(:,seed_channels(3))+nirs_data.oxyData(:,seed_channels(4)))/4;
elseif length(seed_channels)==1
    y=nirs_data.oxyData(:,seed_channels(1));
end
elseif HB=='R'
if length(seed_channels)==2
    y=(nirs_data.dxyData(:,seed_channels(1))+nirs_data.dxyData(:,seed_channels(2)))/2;
elseif length(seed_channels)==3
    y=(nirs_data.dxyData(:,seed_channels(1))+nirs_data.dxyData(:,seed_channels(2))+nirs_data.dxyData(:,seed_channels(3)))/3;
elseif length(seed_channels)==4
    y=(nirs_data.dxyData(:,seed_channels(1))+nirs_data.dxyData(:,seed_channels(2))+nirs_data.dxyData(:,seed_channels(3))+nirs_data.dxyData(:,seed_channels(4)))/4;
elseif length(seed_channels)==1
    y=nirs_data.dxyData(:,seed_channels(1));
end
end
   

% Setup variables
%--------------------------------------------------------------------------
RT      = SPM_nirs.xY.RT;
dt      = SPM_nirs.xBF.dt;
NT      = RT/dt;
fMRI_T0 = SPM_nirs.xBF.T0;
N= length(nirs_data.oxyData);
k       = 1:NT:N*NT;


%-Compute regional response in terms of first eigenvariate
%--------------------------------------------------------------------------
[m,n]   = size(y);
if m > n
    [v,s,v] = svd(y'*y);
    s       = diag(s);
    v       = v(:,1);
    u       = y*v/sqrt(s(1));
else
    [u,s,u] = svd(y*y');
    s       = diag(s);
    u       = u(:,1);
    v       = y'*u/sqrt(s(1));
end
d       = sign(sum(v));
u       = u*d;
v       = v*d;
Y       = u*sqrt(s(1)/n);
 
%-Set in structure
%--------------------------------------------------------------------------
xYnirs.y    = y;
xYnirs.u    = Y;
xYnirs.v    = v;
xYnirs.s    = s;

%set up
Sess=SPM_nirs.Sess;

% get 'causes' or inputs U
    %----------------------------------------------------------------------
    U.name = {};
    U.u    = [];
    U.w    = [];
    
    
    for i = 1:size(Uu,1)
            U.u           = [U.u Sess.U(Uu(i,1)).u(33:end,Uu(i,2))];
            U.name{end+1} = Sess.U(Uu(i,1)).name{Uu(i,2)};
            U.w           = [U.w Uu(i,3)];
    end
        
    
 
% Setup other output variables
%--------------------------------------------------------------------------
PPInirs.xY = xYnirs;
PPInirs.RT = RT;
PPInirs.dt = dt;        
        
    
% Create basis functions and hrf in scan time and microtime
%--------------------------------------------------------------------------
hrf = spm_hrf(dt);

% Create convolved explanatory {Hxb} variables in scan time
%--------------------------------------------------------------------------
xb  = spm_dctmtx(N*NT + 128,N);
Hxb = zeros(N,N);
for i = 1:N
    Hx       = conv(xb(:,i),hrf);
    Hxb(:,i) = Hx(k + 128);
end
xb = xb(129:end,:);


% Get confounds (in scan time) and constant term
%--------------------------------------------------------------------------
X0     = SPM_nirs.xX.xKXs.X(:,[SPM_nirs.xX.iB SPM_nirs.xX.iG]);
M  = size(X0,2);

% Get response variable
%--------------------------------------------------------------------------
for i = 1:size(xYnirs,2)
    Y(:,i) = xYnirs(i).u;
end


% Remove confounds and save Y in ouput structure
%--------------------------------------------------------------------------
Yc    = Y - X0*inv(X0'*X0)*X0'*Y;
PPInirs.Y = Yc(:,1);
if size(Y,2) == 2
    PPInirs.P = Yc(:,2);
end

% Specify covariance components; assume neuronal response is white
% treating confounds as fixed effects
%--------------------------------------------------------------------------
Q = speye(N,N)*N/trace(Hxb'*Hxb);
Q = blkdiag(Q, speye(M,M)*1e6  );

% Get whitening matrix (NB: confounds have already been whitened)
%--------------------------------------------------------------------------

%kaja added to get whitening matrix done.
xX            = SPM_nirs.xX;
[nScan nBeta] = size(xX.X);


V = speye(nScan, nScan);
[u s] = spm_svd(V);
s     = spdiags(1./sqrt(diag(s)),0,length(s),length(s));
W     = u*s*u';
W     = W.*(abs(W) > 1e-6);
xX.W  = sparse(W);
W=xX.W;


% Create structure for spm_PEB
%--------------------------------------------------------------------------
clear P
P{1}.X = [W*Hxb X0];        % Design matrix for lowest level
P{1}.C = speye(N,N)/4;      % i.i.d assumptions
P{2}.X = sparse(N + M,1);   % Design matrix for parameters (0's)
P{2}.C = Q;

% COMPUTE PSYCHOPHYSIOLOGIC INTERACTIONS
    % use basis set in microtime
    %----------------------------------------------------------------------
    % get parameter estimates and neural signal; beta (C) is in scan time
    % This clever trick allows us to compute the betas in scan time which
    % is much quicker than with the large microtime vectors. Then the betas
    % are applied to a microtime basis set generating the correct neural
    % activity to convolve with the psychological variable in microtime
    %----------------------------------------------------------------------
    C  = spm_PEB(Y,P);
    xn = xb*C{2}.E(1:N);
    xn = spm_detrend(xn);
    
% Setup psychological variable from inputs and contrast weights
    %----------------------------------------------------------------------
    PSY = zeros(N*NT,1);
    for i = 1:size(U.u,2)
        PSY = PSY + full(U.u(:,i) * U.w(i));
    end
    PSY = spm_detrend(PSY);    
    
 % Multiply psychological variable by neural signal
    %----------------------------------------------------------------------
    PSYxn = PSY.*xn;

    % Convolve, convert to scan time, and account for slice timing shift
    %----------------------------------------------------------------------
    ppi = conv(PSYxn,hrf);
    ppi = ppi((k-1) + fMRI_T0);

    % Convolve psych effect, convert to scan time, and account for slice
    % timing shift
    %----------------------------------------------------------------------
    PSYHRF = conv(PSY,hrf);
    PSYHRF = PSYHRF((k-1) + fMRI_T0);

    % Save psychological variables
    %----------------------------------------------------------------------
    PPInirs.psy = U;
    PPInirs.P   = PSYHRF;
    PPInirs.xn  = xn;
    PPInirs.ppi = spm_detrend(ppi);    
    
% Save
%--------------------------------------------------------------------------
save(strcat(dir_save, 'PPInirs.mat'), 'PPInirs');
end
