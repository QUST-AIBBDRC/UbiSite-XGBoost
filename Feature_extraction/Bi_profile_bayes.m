clear all
clc
A=importdata('set1.txt');
[num]=numel(A);
sequence=[];
for i=1:num/2
    seq=A{2*i};
    sequence=[sequence;seq];
end
 data=sequence;
 [m,n]=size(data);
%  c=m/2;
%  P=data(1:c,:);
%  N=data((c+1):m,:);
 P=data(1:1046,:);
 N=data(1047:m,:);
vector1=[];
for j=1:n
    vector1=[vector1;AAC(P(:,j))];
    vector_P=vector1';
end
vector2=[];
for j=1:n
    vector2=[vector2;AAC(N(:,j))];
    vector_N=vector2';
end
% % C={'A', 'R', 'N', 'D', 'C', 'E', 'Q', 'G', 'H', 'I',  'L', 'K', 'M', 'F', 'P', 'S', 'T', 'W', 'Y', 'V','O'};
% % AA=cell2mat(C);
% % B=AA';
vector_P=vector_P/2;
vector_N=vector_N/2;
set=ertaimatrix(data);
for q=1:n
    vec1=[];
    for p=1:m
        vector11(p,q)=vector_P(set(p,q),q);
%          vec1=[vec1;vector1];
    end   
end
for q=1:n
    vec2=[];
    for p=1:m
        vector21(p,q)=vector_N(set(p,q),q);
%          vec2=[vec2;vector2];
    end     
end
feature=[vector11,vector21];
save    set1_BPB.mat feature