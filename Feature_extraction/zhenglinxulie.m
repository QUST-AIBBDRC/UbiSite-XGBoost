clear all
clc
fid=fopen('set1.txt');
string=fscanf(fid,'%s'); %文件输入
%匹配的字符串
firstmatches=findstr(string,'>')+6;%开始位置
endmatches=findstr(string,'>')-1;
firstnum=length(firstmatches); %firstnum=endnum序列的条数
endnum=length(endmatches);
%k是个位数
  for k=1:firstnum-1
    j=1;
    jj=1;
    lensec(k)=endmatches(k+1)-firstmatches(k)+1;%每条序列的长度
  end
  

  
  save pssm_set1.mat lensec