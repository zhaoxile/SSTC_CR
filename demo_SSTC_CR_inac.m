%% =================================================================
clc;
clear;
close all;

addpath(genpath('Data'));
addpath(genpath('Lib'));
addpath(genpath('quality_assess'));

EN_SSTC_CR         = 1;

%%
methodname    = {'Observed','SSTC_CR'};
Mnum          = length(methodname);
Re_tensor     = cell(Mnum,1);
psnr          = cell(Mnum,1);
ssim          = cell(Mnum,1);
sam           = cell(Mnum,1);
nrmse         = cell(Mnum,1);
time          = zeros(Mnum,1);

%% Load initial data
load('africa_ROIs1970_21_15_inac.mat');
Y     = Clean_Image;
for i=1:3
    Y(:,:,:,i)=Y(:,:,:,i).*Simulated_Mask(:,:,i)+1-Simulated_Mask(:,:,i);
end

%%
i  = 1;
Re_tensor{i} = Y;
[psnr_0_1,ssim_0_1,sam_0_1] = HSIQA(255*Y(:,:,:,1),255*Clean_Image(:,:,:,1));
[psnr_0_2,ssim_0_2,sam_0_2] = HSIQA(255*Y(:,:,:,2),255*Clean_Image(:,:,:,2));
[psnr_0_3,ssim_0_3,sam_0_3] = HSIQA(255*Y(:,:,:,3),255*Clean_Image(:,:,:,3));
nrmse_0 = sqrt(norm(Y(:)-Clean_Image(:))^2/numel(Y));
psnr{i} = [psnr_0_1,psnr_0_2,psnr_0_3];
ssim{i} = [ssim_0_1,ssim_0_2,ssim_0_3];
sam{i}  = [sam_0_1,sam_0_2,sam_0_3];
nrmse{i}= nrmse_0;
enList = 1;

%% Perform  algorithms

%%
i = i+1;
if EN_SSTC_CR
    opts=[];
    opts.alpha      = 5*1e-3;
    opts.beta       = 1e-3;
    opts.rho        = 0.01;
    opts.k_subspace = 6;
    opts.tol        = 1e-4;
    opts.maxit      = 1000;
    opts.R          = [0,   1, 1, 1;
                       0,   0, 1, 1;
                       0,   0, 0, 1;
                       0,   0, 0, 0];
    opts.max_R      = [0,  200, 3, 3;
                       0,   0,  3, 3;
                       0,   0,  0, 2;   
                       0,   0,  0, 0];
    fprintf('\n');
    disp(['performing ',methodname{i}, ' ... ']);
    t0= tic;
    [SSTC, Out]     = SSTC_InCR(Y, Initial_Mask, opts);
    time(i)         = toc(t0);
    Re_tensor{i}    = SSTC;
    [psnr_SSTC_1,ssim_SSTC_1,sam_SSTC_1] = HSIQA(255*SSTC(:,:,:,1),255*Clean_Image(:,:,:,1));
    [psnr_SSTC_2,ssim_SSTC_2,sam_SSTC_2] = HSIQA(255*SSTC(:,:,:,2),255*Clean_Image(:,:,:,2));
    [psnr_SSTC_3,ssim_SSTC_3,sam_SSTC_3] = HSIQA(255*SSTC(:,:,:,3),255*Clean_Image(:,:,:,3));
    nrmse_SSTC = sqrt(norm(SSTC(:)-Clean_Image(:))^2/numel(SSTC));
    psnr{i} = [psnr_SSTC_1,psnr_SSTC_2,psnr_SSTC_3];
    ssim{i} = [ssim_SSTC_1,ssim_SSTC_2,ssim_SSTC_3];
    sam{i}  = [sam_SSTC_1,sam_SSTC_2,sam_SSTC_3];
    nrmse{i}= nrmse_SSTC;
    enList  = [enList,i];
end

%% Show result
fprintf('\n');
fprintf('======================= Result ==========================\n');
fprintf(' %8.8s    %6.6s    %6.6s    %6.6s    %6.6s  \n','method','PSNR', 'SSIM','SAM','RMSE' );
for i = 1:length(enList)
    fprintf(' %8.8s    %5.4f    %5.4f    %5.4f    %5.4f\n',...
        methodname{enList(i)},mean(psnr{enList(i)}), mean(ssim{enList(i)}), mean(sam{enList(i)}), nrmse{enList(i)} );
end
fprintf('======================= Result ==========================\n');