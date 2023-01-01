close all 
Y_tensorT=my2_sentinel2Clean;
for i=1:4
    a=Y_tensorT(:,:,:,i);
    Y_tensorT(:,:,:,i)=a/max(a(:));
end

%% HI
imnameTokyo1         =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Tokyo\','Tokyo1.eps'];
imnameTokyo2         =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Tokyo\','Tokyo2.eps'];
imnameTokyo3       =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Tokyo\','Tokyo3.eps'];
imnameTokyo4       =['C:\Users\pc\Desktop\tcrfctn20220219\fig\Tokyo\','Tokyo4.eps'];

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
print(imnameTokyo1,'-depsc');

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
print(imnameTokyo2,'-depsc');

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
print(imnameTokyo3,'-depsc');


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
print(imnameTokyo4,'-depsc');