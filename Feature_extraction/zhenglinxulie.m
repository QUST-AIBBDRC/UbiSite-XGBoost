clear all
clc
fid=fopen('set1.txt');
string=fscanf(fid,'%s'); %�ļ�����
%ƥ����ַ���
firstmatches=findstr(string,'>')+6;%��ʼλ��
endmatches=findstr(string,'>')-1;
firstnum=length(firstmatches); %firstnum=endnum���е�����
endnum=length(endmatches);
%k�Ǹ�λ��
  for k=1:firstnum-1
    j=1;
    jj=1;
    lensec(k)=endmatches(k+1)-firstmatches(k)+1;%ÿ�����еĳ���
  end
  

  
  save pssm_set1.mat lensec