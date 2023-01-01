close all 
Y_tensorT=T29RMMClean;
for i=1:6
    a=Y_tensorT(:,:,:,i);
    Y_tensorT(:,:,:,i)=a/max(a(:));
end

%% HI
imnameMorocco1       =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','Morocco1.eps'];
imnameMorocco2       =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','Morocco2.eps'];
imnameMorocco3       =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','Morocco3.eps'];
imnameMorocco4       =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','Morocco4.eps'];
imnameMorocco5       =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','Morocco5.eps'];
imnameMorocco6       =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Morocco\','Morocco6.eps'];

%% 1
clean_band = Y_tensorT(:,:,[3,2,1],1);
clean_sort = sort(clean_band(:));
pixel_num = length(clean_sort);
minv = clean_sort(fix(pixel_num)*0.01);
maxv = clean_sort(fix(pixel_num)*0.99);
I = Y_tensorT(:,:,[3,2,1],1);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameMorocco1,'-depsc');

%% 2
clean_band = Y_tensorT(:,:,[3,2,1],2);
clean_sort = sort(clean_band(:));
pixel_num = length(clean_sort);
minv = clean_sort(fix(pixel_num)*0.01);
maxv = clean_sort(fix(pixel_num)*0.99);
I = Y_tensorT(:,:,[3,2,1],2);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameMorocco2,'-depsc');

%% 3
clean_band = Y_tensorT(:,:,[3,2,1],3);
clean_sort = sort(clean_band(:));
pixel_num = length(clean_sort);
minv = clean_sort(fix(pixel_num)*0.01);
maxv = clean_sort(fix(pixel_num)*0.99);
I = Y_tensorT(:,:,[3,2,1],3);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameMorocco3,'-depsc');


%% 4
clean_band = Y_tensorT(:,:,[3,2,1],4);
clean_sort = sort(clean_band(:));
pixel_num = length(clean_sort);
minv = clean_sort(fix(pixel_num)*0.01);
maxv = clean_sort(fix(pixel_num)*0.99);
I = Y_tensorT(:,:,[3,2,1],4);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameMorocco4,'-depsc');

%% 5
clean_band = Y_tensorT(:,:,[3,2,1],5);
clean_sort = sort(clean_band(:));
pixel_num = length(clean_sort);
minv = clean_sort(fix(pixel_num)*0.01);
maxv = clean_sort(fix(pixel_num)*0.99);
I = Y_tensorT(:,:,[3,2,1],5);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameMorocco5,'-depsc');

%% 6
clean_band = Y_tensorT(:,:,[3,2,1],6);
clean_sort = sort(clean_band(:));
pixel_num = length(clean_sort);
minv = clean_sort(fix(pixel_num)*0.01);
maxv = clean_sort(fix(pixel_num)*0.99);
I = Y_tensorT(:,:,[3,2,1],6);
I = (I-minv)/(maxv-minv);
I(I<0) = 0;
I(I>1) = 1;
figure;imshow(I,'border','tight','initialmagnification','fit');
print(imnameMorocco6,'-depsc');
