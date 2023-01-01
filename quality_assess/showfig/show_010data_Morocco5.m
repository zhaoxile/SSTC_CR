close all 
frame = 5;
index = [140,195,105,160];%5
% load('all_HSIt_tensor_T29RMM.mat')
% load('AcMask1_6_mini.mat')
Y_tensorT=T29RMMClean;
for i=1:6
    a=Y_tensorT(:,:,:,i);
    Y_tensorT(:,:,:,i)=a/max(a(:));
end
% Re_tensor{1}=Re_tensor{1}+AcMask1_6_mini;
%% HI
imnameOr         =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','Or_Morocco5.eps'];
imnameOb         =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','Ob_Morocco5.eps'];
imnameSNN       =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','SNN_Morocco5.eps'];
imnameTNN       =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','TNN_Morocco5.eps'];
imnameTT       =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','TT_Morocco5.eps'];
imnameBCSLRpGS     =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','BCSLRpGS_Morocco5.eps'];
imnameTVRSDC        =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','TVRSDC_Morocco5.eps'];
imnameRTCR     =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','RTCR_Morocco5.eps'];
imnameTCRFCTN      =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','TCRFCTN_Morocco5.eps'];

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
I1 = ShowEnlargedRectangle1(I,[index(1),index(3)], [index(2),index(4)],  4.5,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameOr,'-depsc');

%% Ob
I = Re_tensor{1}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle1(I,[index(1),index(3)], [index(2),index(4)],  4.5,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameOb,'-depsc');

%% SNN
I = Re_tensor{2}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle1(I,[index(1),index(3)], [index(2),index(4)],  4.5,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameSNN,'-depsc');


%% TNN
I = Re_tensor{3}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle1(I,[index(1),index(3)], [index(2),index(4)],  4.5,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameTNN,'-depsc');

%% TT
I = Re_tensor{4}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle1(I,[index(1),index(3)], [index(2),index(4)],  4.5,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameTT,'-depsc');

%% BCSLRpGS
I = Re_tensor{5}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle1(I,[index(1),index(3)], [index(2),index(4)],  4.5,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameBCSLRpGS,'-depsc');

%% TVRSDC
I = Re_tensor{6}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle1(I,[index(1),index(3)], [index(2),index(4)],  4.5,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameTVRSDC,'-depsc');

%% RTCR 
I = Re_tensor{7}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle1(I,[index(1),index(3)], [index(2),index(4)],  4.5,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameRTCR,'-depsc');
% 

%% TCRFCTN
I = Re_tensor{8}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle1(I,[index(1),index(3)], [index(2),index(4)],  4.5,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameTCRFCTN,'-depsc');