close all 
frame = 1;
index = [110,165,100,155];%1
% load('all_HSIt_tensor_T29RMM.mat')
% load('AcMask1_6_mini.mat')
Y_tensorT=my2_sentinel2Clean;
for i=1:4
    a=Y_tensorT(:,:,:,i);
    Y_tensorT(:,:,:,i)=a/max(a(:));
end
% Re_tensor{1}=Re_tensor{1}+AcMask1_6_mini;
%% HI
imnameOr         =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Tokyo\','Or_Tokyo1.eps'];
imnameOb         =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Tokyo\','Ob_Tokyo1.eps'];
imnameSNN       =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Tokyo\','SNN_Tokyo1.eps'];
imnameTNN       =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Tokyo\','TNN_Tokyo1.eps'];
imnameTT       =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Tokyo\','TT_Tokyo1.eps'];
imnameBCSLRpGS     =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Tokyo\','BCSLRpGS_Tokyo1.eps'];
imnameTVRSDC        =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Tokyo\','TVRSDC_Tokyo1.eps'];
imnameRTCR     =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Tokyo\','RTCR_Tokyo1.eps'];
imnameTCRFCTN      =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Tokyo\','TCRFCTN_Tokyo1.eps'];



clean_band = Y_tensorT(:,:,[3,2,1],frame);
clean_sort = sort(clean_band(:));
pixel_num = length(clean_sort);
minv = clean_sort(fix(pixel_num*0.01));
maxv = clean_sort(fix(pixel_num*0.99));

%% Or
I = Y_tensorT(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameOr,'-depsc');

%% Ob
I = Re_tensor{1}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameOb,'-depsc');

%% SNN
I = Re_tensor{2}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameSNN,'-depsc');


%% TNN
I = Re_tensor{3}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameTNN,'-depsc');

%% TT
I = Re_tensor{4}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameTT,'-depsc');

%% BCSLRpGS
I = Re_tensor{5}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameBCSLRpGS,'-depsc');

%% TVRSDC
I = Re_tensor{6}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameTVRSDC,'-depsc');

%% RTCR 
I = Re_tensor{7}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameRTCR,'-depsc');
% 

%% TCRFCTN
I = Re_tensor{8}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameTCRFCTN,'-depsc');
