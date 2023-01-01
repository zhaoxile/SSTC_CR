function [psnr, ssim, sam] = my_HSIQA(imagery1, imagery2)

%==========================================================================
% Evaluates the quality assessment indices for two HSIs.
% Input:
%   imagery1 - the reference HSI data array
%   imagery2 - the target HSI data array
% NOTE: HSI data array  is a M*N*K array for imagery with M*N spatial
%	pixels, K bands and DYNAMIC RANGE [0, 255]. If imagery1 and imagery2
%	have different size, the larger one will be truncated to fit the
%	smaller one.
%
% Output:
%   psnr - Peak Signal-to-Noise Ratio
%   ssim - Structure SIMilarity
%   msam - Spectral Angle Mapper
%==========================================================================
[m, n, k, j]     = size(imagery1);
[mm, nn, kk, jj] = size(imagery2);
m = min(m, mm);
n = min(n, nn);
k = min(k, kk);
j = min(j, jj);
imagery1 = imagery1(1:m, 1:n, 1:k, 1:j);
imagery2 = imagery2(1:m, 1:n, 1:k, 1:j);

psnr = my_PSNR(imagery1, imagery2);
ssim = my_SSIM(imagery1, imagery2);
sam  = SAM4D(imagery1/255, imagery2/255);
