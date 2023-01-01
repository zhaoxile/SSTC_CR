I = imread('cameraman.tif');
I = double(I);
I = I/max(I(:));
I1 = ShowEnlargedRectangle(I,[126,156], [145,175], 5, 1);
figure;imshow(I1,'border','tight','initialmagnification','fit');
set(gcf,'Units','centimeters');
screenposition = get(gcf,'Position');
set(gcf,'PaperPosition',[0 0 screenposition([4,4])],'PaperSize',screenposition([4,4]));
print('test.pdf','-dpdf');
