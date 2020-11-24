clear all
clc
input=importdata('set1.txt');
data=input(2:2:end,:);
[m,n]=size(data);
vector=[];
for i=1:m;
 vector= [vector;EBGW(data{i})];
end
save EBGW_set1_10.mat vector

