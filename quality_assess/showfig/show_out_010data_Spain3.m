close all 
frame = 3;
% index = [200,280,260,340];%1
index = [250,305,260,315];%3
% index = [210,340,210,340];%5
% load('all_HSIt_tensor_T29RMM.mat')
% load('AcMask1_6_mini.mat')
Y_tensorT=LCClean;
for i=1:6
    a=Y_tensorT(:,:,:,i);
    Y_tensorT(:,:,:,i)=a/max(a(:));
end
% Re_tensor{1}=Re_tensor{1}+AcMask1_6_mini;
%% HI
imnameOr         =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Spain\','Or_out_Spain3.eps'];
imnameOb         =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Spain\','Ob_out_Spain3.eps'];
imnameBCSLRpGS     =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Spain\','BCSLRpGS_out_Spain3.eps'];
imnameTVRSDC        =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Spain\','TVRSDC_out_Spain3.eps'];
imnameRTCR     =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Spain\','RTCR_out_Spain3.eps'];
imnameTCRFCTN      =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Spain\','TCRFCTN_out_Spain3.eps'];

clean_band = Y_tensorT(:,:,[4,3,2],frame);
clean_sort = sort(clean_band(:));
pixel_num = length(clean_sort);
minv = clean_sort(fix(pixel_num*0.01));
maxv = clean_sort(fix(pixel_num*0.99));

%% Or
I = Y_tensorT(:,:,[4,3,2],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameOr,'-depsc');

%% Ob
I = Re_tensor{1}(:,:,[4,3,2],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameOb,'-depsc');

%% BCSLRpGS
I = Re_tensor{2}(:,:,[4,3,2],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameBCSLRpGS,'-depsc');

%% TVRSDC
I = Re_tensor{3}(:,:,[4,3,2],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameTVRSDC,'-depsc');

%% RTCR 
I = Re_tensor{4}(:,:,[4,3,2],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameRTCR,'-depsc');
% 

%% TCRFCTN
I = Re_tensor{5}(:,:,[4,3,2],frame);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
% I1 = DrawRectangle(I,[index(1),index(3)], [index(2),index(4)],4);
I1 = ShowEnlargedRectangle_wd(I,[index(1),index(3)], [index(2),index(4)],  4,  4);
figure;imshow(I1,'border','tight','initialmagnification','fit');
print(imnameTCRFCTN,'-depsc');
