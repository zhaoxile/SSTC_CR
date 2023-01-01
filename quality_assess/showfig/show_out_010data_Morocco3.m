close all 
frame = 3;
% index = [260,315,95,150];%3
% load('all_HSIt_tensor_T29RMM.mat')
% load('AcMask1_6_mini.mat')
Y_tensorT=T29RMMClean;
for i=1:6
    a=Y_tensorT(:,:,:,i);
    Y_tensorT(:,:,:,i)=a/max(a(:));
end
% Re_tensor{1}=Re_tensor{1}+AcMask1_6_mini;
%% HI
imnameOr         =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','Or_out_Morocco3.eps'];
imnameOb         =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','Ob_out_Morocco3.eps'];
imnameBCSLRpGS     =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','BCSLRpGS_out_Morocco3.eps'];
imnameTVRSDC        =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','TVRSDC_out_Morocco3.eps'];
imnameRTCR     =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','RTCR_out_Morocco3.eps'];
imnameTCRFCTN      =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','TCRFCTN_out_Morocco3.eps'];

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
% I1 = ShowEnlargedRectangle(I,[index(1),index(3)], [index(2),index(4)],  3,  4);
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameOr,'-depsc');

%% Ob
I = Re_tensor{1}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
% I1 = ShowEnlargedRectangle(I,[index(1),index(3)], [index(2),index(4)],  4.5,  4);
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameOb,'-depsc');

%% BCSLRpGS
I = Re_tensor{2}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
% I1 = ShowEnlargedRectangle(I,[index(1),index(3)], [index(2),index(4)],  4.5,  4);
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameBCSLRpGS,'-depsc');

%% TVRSDC
I = Re_tensor{3}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
% I1 = ShowEnlargedRectangle1(I,[index(1),index(3)], [index(2),index(4)],  4.5,  4);
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameTVRSDC,'-depsc');

%% RTCR 
I = Re_tensor{4}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
% I1 = ShowEnlargedRectangle(I,[index(1),index(3)], [index(2),index(4)],  4.5,  4);
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameRTCR,'-depsc');
% 

%% TCRFCTN
I = Re_tensor{5}(:,:,[3,2,1],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
% I1 = ShowEnlargedRectangle(I,[index(1),index(3)], [index(2),index(4)],  4.5,  4);
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameTCRFCTN,'-depsc');