close all 
frame = 1;
index = [225,280,275,330];%1
% load('all_HSIt_tensor_T29RMM.mat')
% load('AcMask1_6_mini.mat')
Y_tensorT=LCClean;
for i=1:6
    a=Y_tensorT(:,:,:,i);
    Y_tensorT(:,:,:,i)=a/max(a(:));
end
% Re_tensor{1}=Re_tensor{1}+AcMask1_6_mini;
%% HI
imnameSpain1     =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Spain\','Spain1.eps'];
imnameSpain2     =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Spain\','Spain2.eps'];
imnameSpain3     =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Spain\','Spain3.eps'];
imnameSpain4     =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Spain\','Spain4.eps'];
imnameSpain5     =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Spain\','Spain5.eps'];
imnameSpain6     =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Spain\','Spain6.eps'];

%% 1
clean_band = Y_tensorT(:,:,[4,3,2],1);
clean_sort = sort(clean_band(:));
pixel_num = length(clean_sort);
minv = clean_sort(fix(pixel_num)*0.01);
maxv = clean_sort(fix(pixel_num)*0.99);
I = Y_tensorT(:,:,[4,3,2],1);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameSpain1,'-depsc');

%% 2
clean_band = Y_tensorT(:,:,[4,3,2],2);
clean_sort = sort(clean_band(:));
pixel_num = length(clean_sort);
minv = clean_sort(fix(pixel_num)*0.01);
maxv = clean_sort(fix(pixel_num)*0.99);
I = Y_tensorT(:,:,[4,3,2],2);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameSpain2,'-depsc');

%% 3
clean_band = Y_tensorT(:,:,[4,3,2],3);
clean_sort = sort(clean_band(:));
pixel_num = length(clean_sort);
minv = clean_sort(fix(pixel_num)*0.01);
maxv = clean_sort(fix(pixel_num)*0.99);
I = Y_tensorT(:,:,[4,3,2],3);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameSpain3,'-depsc');


%% 4
clean_band = Y_tensorT(:,:,[4,3,2],4);
clean_sort = sort(clean_band(:));
pixel_num = length(clean_sort);
minv = clean_sort(fix(pixel_num)*0.01);
maxv = clean_sort(fix(pixel_num)*0.99);
I = Y_tensorT(:,:,[4,3,2],4);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameSpain4,'-depsc');

%% 5
clean_band = Y_tensorT(:,:,[4,3,2],5);
clean_sort = sort(clean_band(:));
pixel_num = length(clean_sort);
minv = clean_sort(fix(pixel_num)*0.01);
maxv = clean_sort(fix(pixel_num)*0.99);
I = Y_tensorT(:,:,[4,3,2],5);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameSpain5,'-depsc');

%% 6
clean_band = Y_tensorT(:,:,[4,3,2],6);
clean_sort = sort(clean_band(:));
pixel_num = length(clean_sort);
minv = clean_sort(fix(pixel_num)*0.01);
maxv = clean_sort(fix(pixel_num)*0.99);
I = Y_tensorT(:,:,[4,3,2],6);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameSpain6,'-depsc');

