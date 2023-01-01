for i=[1,2,3,5,6,7,8]
    a=sam{i};
%     fprintf('&  %5.4f  ', a(1))
    fprintf('&  %5.4f  ', a)
end

for i=[1,2,3,4,5]
    a=sam{i};
    fprintf('&  %5.4f  ', a(2))
end

for i=[1,2,3,4,5,6,7,8]
    a=sam{i};
    sam{i}=mean(a);
end

%% size = [10,11,12,13]'
%% R12 = 4,  R13 =5, R14 =6,
%% R23 = 7,  R24 =8, R34 =9;
N=4;
Nway = [20 30 40,50];
R    = [0   8   9   10
        0   0   11   12
        0   0   0   13
        0   0   0   0];

tempdim = R+R';  tempdim(tempdim==0) = []; 
tempdim = reshape(tempdim,N-1,N);   tempdim = tempdim'; 
tempdim(:,end+1) = Nway';

G = cell(1,N);
G1 = cell(1,N);
for i = 1:N
    G{i} = roundn(rand(tempdim(i,:)),-4); 
    G1{i} = gpuArray(G{i});
end
1
tic
X = tnprod_new(G);
toc

2
tic
X1 = tnprod_new(G1);
toc

1
rest =2;
tic
Out1 = tnprod_rest_new(G,rest);
toc

2
tic
Out2 = tnprod_rest_new(G1,rest);
toc

1
tic
Out11 = tnreshape_new(Out1,N);
toc

2
tic
Out22 = tnreshape_new(Out2,N);
toc
