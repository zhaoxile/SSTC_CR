function [] = showAllBand(Y)
[m,n,b,t]=size(Y);
figure
for i=1:t
    for j=1:b
        hold on
        subplot(t,b,j+b*(i-1))
        imshow(Y(:,:,j,i));%分别展示每个谱维度（行）和时间维度（列），
    end
end
end

