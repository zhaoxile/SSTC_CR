function []=figureRemovalCloud(Re_tensor, Test1_Clean, enList, RGBBand, lumination)
T=size(Test1_Clean,4);
L=length(enList)+1;
for t=1:T
    hold on
    subplot(T,L,1+(t-1)*L),    imshow(Test1_Clean(:,:,RGBBand,t)*lumination)
end
for l=1:L-1
    for t=1:T
        temp=enList(l);
        hold on
        subplot(T,L,1+(t-1)*L),    imshow(Re_tensor{temp}(:,:,RGBBand,t)*lumination)
    end
end