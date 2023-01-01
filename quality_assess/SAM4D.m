function SAM_tensor=SAM4D(TensorT,TensorH)
m=size(TensorT,1);
n=size(TensorT,2);
p=size(TensorT,4);% temporal band
sam=zeros(m,n,p);
for i=1:m
    for j=1:n
        for k=1:p
            T=squeeze(TensorT(i,j,:,k));H=squeeze(TensorH(i,j,:,k));
            sam(i,j,k)=SAM(T,H);
        end
    end
end
SAM_tensor=mean(sam(:));

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
