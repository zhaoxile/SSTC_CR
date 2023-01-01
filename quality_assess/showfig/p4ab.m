load('LCClean.mat')
load('Mask_Middle2.mat')
load('Mask_Middle1.mat')
load('Mask_Middle4.mat')
Y=LCClean;
Mask=zeros(400,400,7,6);
for i=1:7
    Mask(:,:,i,1)=Mask_Middle2;
end
for i=1:7
    Mask(:,:,i,3)=Mask_Middle1;
end
for i=1:7
    Mask(:,:,i,5)=Mask_Middle4;
end
Y=Y/max(Y(:));
Mask(find(Mask~=0)) = 1;
Test1_Clean=Y(:,:,:,[1,3,5]);
Y=Y.*(1-Mask)+Mask;
Test1_SimuCloud = Y(:,:,:,[1,3,5]);

para_alpha = [1e-3, 5*1e-3, 1e-2, 5*1e-2, 1e-1, 5*1e-1, 1e0, 5*1e0, 1e1, 5*1e1, 1e2, 5*1e2, 1e3];
para_beta  = [1e-3, 5*1e-3, 1e-2, 5*1e-2, 1e-1, 5*1e-1, 1e0, 5*1e0, 1e1, 5*1e1, 1e2, 5*1e2, 1e3];


opts=[];

opts.rho        = 0.001;
opts.k_subspace = 4;
opts.tol        = 1e-4;
opts.maxit      = 1000;
opts.R          = [0,   150, 1, 1;
    0,   0, 1, 1;
    0,   0, 0, 1;
    0,   0, 0, 0];
opts.max_R      = [0,  200, 4, 4;
    0,   0, 4, 4;
    0,   0, 0, 4;
    0,   0, 0, 0];
PSNR1=zeros(12,12);
PSNR2=zeros(12,12);
PSNR3=zeros(12,12);               
SSIM1=zeros(12,12);
SSIM2=zeros(12,12);
SSIM3=zeros(12,12);   
SAM1=zeros(12,12);
SAM2=zeros(12,12);
SAM3=zeros(12,12);   

for j=1:12
    for m=1:12
        
        opts.alpha      = para_alpha(j);
        opts.beta       = para_beta(m);
        
        fprintf('\n')
        fprintf( 'Alpha = %2.4f, beta = %2.3f, Rho = %2.4f, k_subspace = %2.4f, R12= %f, R13= %f, R34= %f,  \n', opts.alpha,opts.beta,opts.rho,opts.k_subspace,opts.max_R(1,2),opts.max_R(1,3),opts.max_R(3,4));
        TCRFCTN_X     = TCR_FCTN(Y, Mask, Test1_Clean, opts);
        [psnr_TCRFCTN1,ssim_TCRFCTN1,sam_TCRFCTN1] = HSIQA(255*TCRFCTN_X(:,:,:,1),255*Test1_Clean(:,:,:,1));
        [psnr_TCRFCTN2,ssim_TCRFCTN2,sam_TCRFCTN2] = HSIQA(255*TCRFCTN_X(:,:,:,3),255*Test1_Clean(:,:,:,2));
        [psnr_TCRFCTN3,ssim_TCRFCTN3,sam_TCRFCTN3] = HSIQA(255*TCRFCTN_X(:,:,:,5),255*Test1_Clean(:,:,:,3));
        PSNR1(j,m)=psnr_TCRFCTN1;
        PSNR2(j,m)=psnr_TCRFCTN2;
        PSNR3(j,m)=psnr_TCRFCTN3;
        SSIM1(j,m)=ssim_TCRFCTN1;
        SSIM2(j,m)=ssim_TCRFCTN2;
        SSIM3(j,m)=ssim_TCRFCTN3;
        SAM1(j,m)=sam_TCRFCTN1;
        SAM2(j,m)=sam_TCRFCTN2;
        SAM3(j,m)=sam_TCRFCTN3;
    end
    save('TCRFCTN_LC_1_ab4.mat', 'PSNR1','SSIM1','SAM1');
    save('TCRFCTN_LC_2_ab4.mat', 'PSNR2','SSIM2','SAM2');
    save('TCRFCTN_LC_3_ab4.mat', 'PSNR3','SSIM3','SAM3');
end