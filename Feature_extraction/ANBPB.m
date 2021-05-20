%,PPT3,PPT4
%function [PPT1,PPT2] = ANBPB()
clear;
clc;
%load aa1.mat
[hp positive]=fastaread('1.txt');%trainpositive.txt
% %
% [hp1 positive1]=fastaread('Spositive.txt');%trainpositive.txt
% %
% [hp2 positive2]=fastaread('Tpositive.txt');%trainpositive.txt
% % 产生正类训练集和测试集
%positive=[positive1,positive2];
%x=length(positive);
% t=round(0.9*x);
% %a = randperm(x);
% Train_p = positive(:,(a(1:t)));
% Test_p = positive(:,(a(t+1:end)));
M1=length(positive{1,1});
x=(M1+1)/2;
%中间位置的“T”或“S”去掉
% n1=length(Train_p);
% n3=length(Test_p);
n1=length(positive);
for i=1:n1
   positive{1,i}(x)='';
   s=positive{1,i};
   
   %positive{1,i}=s(2:23);
   % positive{1,i}=s(8:18);
end
[hn negative]=fastaread('0.txt');

n2=length(negative);
%中间位置的“T”或“S”去掉
for i=1:n2
   negative{1,i}(x)='';
   s=negative{1,i};
  
    % negative{1,i}=s(2:23);
    % negative{1,i}=s(8:18);
end
AA='ACDEFGHIKLMNPQRSTVWYX';

% M=length(Train_n{1,1});
M=length(negative{1,1});
F1=zeros(21,M);%记录每个氨基酸在每个位置出现的次数
F2=zeros(21,M);
for m=1:n1
%     l=length(Train_p{1,m});
l=length(positive{1,m});
    for j=1:l
%         t=Train_p{1,m}(j);
 t=positive{1,m}(j);
        k=strfind(AA,t);
        F1(k,j)=F1(k,j)+1;
    end
end
%记录positive-252dataset每个氨基酸在每个位置出现的次数
for m=1:n2
%     l=length(Train_n{1,m});
 l=length(negative{1,m});
    for j=1:l
%         t=Train_n{1,m}(j);
 t=negative{1,m}(j);
        k=strfind(AA,t);
        F2(k,j)=F2(k,j)+1;
    end
end

d1 = var(F1, 0, 1);
d2 = var(F2, 0, 1);

PPe=zeros(20,M);%--Positive Penrichment
PPd=zeros(20,M);%--Positive Pdepletion

for j=1:M
    for k=1:21
        Cxj=F1(k,j);
        Pxj=F1(k,j)/n1;
        X=(n1/20-Cxj)/sqrt(d1(j));    
        PPe(k,j)=normcdf(X,0,1);
    end
end


%------------------------------------------------------------
%--------
NPe=zeros(21,M);%--Negative Penrichment
NPd=zeros(21,M);%--Negative Pdepletion

for j=1:M
    for k=1:21
        Cxj=F2(k,j);
        Pxj=F2(k,j)/n2;
        Y=(n2/20-Cxj)/sqrt(d2(j));   
        NPe(k,j)=normcdf(Y,0,1);
        
    end
end
PPT1=zeros(n1,2*M);
PPT2=zeros(n2,2*M);

for m=1:n1
    for j=1:M
%         t=Train_p{1,m}(j);
 t=positive{1,m}(j);
        k=strfind(AA,t);
        PPT1(m,j)=PPe(k,j);
        PPT1(m,M+j)=NPe(k,j);
     end
end

%%%%%%%%%%%%构建positive-252特征向量
for m=1:n2
    for j=1:M
%         t=Train_n{1,m}(j);
 t=negative{1,m}(j);
        k=strfind(AA,t);
        PPT2(m,j)=PPe(k,j);
        PPT2(m,M+j)=NPe(k,j);
    end
end 


 
 


