function [set] =ertaimatrix( A )

% clear all
% clc
% A1=importdata('set1_.txt');
% [m1,n1]=size(A1);
% sequence=[];
% for i=1:m1/2
%     seq=A1{2*i};
%     sequence=[sequence;seq];
% end
% A=sequence;
[m,n]=size(A);
set=[];
for j=1:m
    B=A(j,:);
    M=[];
    for i=1:n
        C=B(i);
        str=strrep(C,'A','01');
        str=strrep(str,'R','02');
        str=strrep(str,'N','03');
        str=strrep(str,'D','04');
        str=strrep(str,'C','05');
        str=strrep(str,'E','06');
        str=strrep(str,'Q','07');
        str=strrep(str,'G','08');
        str=strrep(str,'H','09');
        str=strrep(str,'I','10');
        str=strrep(str,'L','11');
        str=strrep(str,'K','12');
        str=strrep(str,'M','13');
        str=strrep(str,'F','14');
        str=strrep(str,'P','15');
        str=strrep(str,'S','16');
        str=strrep(str,'T','17');
        str=strrep(str,'W','18');
        str=strrep(str,'Y','19');
        str=strrep(str,'V','20');
        str=strrep(str,'X','21');
        M=[M;str];
        str=[];
    end
  shuju=str2num(M);
  shuju=shuju';
  set=[set;shuju];
end
