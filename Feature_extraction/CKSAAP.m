clear all
clc
input=importdata('set1.txt');
[m,n]=size(input);
data=input(2:2:m,:);
sequence=data;
%data1=input.textdata(:,1);
% label1=input.data(:,1);
% data=data1(:,1);
% label=label1(:,1);
% num=numel(data);
% sign0=find(label==0);
% sign1=find(label==1); 
% sequence=[data(sign1,:);data(sign0,:)];
% sequence_labele=[ones(300,1);zeros(300,1)];
 out=[];
inputout=sequence;
for i=1:m/2 
    protein=inputout{i};
    output1 =Dipeptide(protein);%Call the Dipeptide function to calculate the cksaap value of each sequence
    out=[out;output1];
end
save set1_7.cksaap.mat out