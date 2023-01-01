function ssim = my_SSIM(imagery1, imagery2)
%==========================================================================
% Evaluates the quality assessment indices for two tensors.
%
% Input:
%   imagery1 - the reference tensor
%   imagery2 - the target tensor

% NOTE: the tensor is a I1*I2*...*IN array and DYNAMIC RANGE [0, 255]. 

% Output:
%   psnr - Peak Signal-to-Noise Ratio
%
% by Yi Peng
% update by Yu-Bang Zheng 11/19/2018
%==========================================================================
Nway = size(imagery1);
if length(Nway)>3
    imagery1 = reshape(imagery1,Nway(1),Nway(2),[]);
    imagery2 = reshape(imagery2,Nway(1),Nway(2),[]);
end
ssim = zeros(prod(Nway(3:end)),1);
parfor i = 1:prod(Nway(3:end))
    ssim(i) = ssim_index(imagery1(:, :, i), imagery2(:, :, i));
end
ssim = mean(ssim);

