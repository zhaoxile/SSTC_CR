function SAM_tensor=SAM3D(TensorT,TensorH)
m=size(TensorT,1);
n=size(TensorT,2);
sam=zeros(m,n);
for i=1:m
    for j=1:n
    T=squeeze(TensorT(i,j,:));H=squeeze(TensorH(i,j,:));
    sam(i,j)=SAM(T,H);
    end
end
SAM_tensor=mean(sam(:));
% SAM_tensor=sum(sum(sam.*Mask(:,:,1)))/sum(sum(Mask(:,:,1)));

end
function SAM_value=SAM(a1,a2)
SigmaTR=a1'*a2;
SigmaT2=a1'*a1;
if SigmaT2 == 0
    SigmaT2 = 2.2204e-16;
end
SigmaR2=a2'*a2;
if SigmaR2 == 0
    SigmaR2 = 2.2204e-16;
end
SAM_value=acosd(SigmaTR/sqrt(SigmaT2*SigmaR2));
end


