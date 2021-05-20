function [AAC]=AAC(str)
len=length(str);
C={'A', 'R', 'N', 'D', 'C', 'E', 'Q', 'G', 'H', 'I',  'L', 'K', 'M', 'F', 'P', 'S', 'T', 'W', 'Y', 'V','X'};
 l=21;
result=zeros(1,l);
Result=zeros(1,l);
for i=1:len
    for t=1:l
        if strcmp(str(i) , C(t)) 
           result(t)=result(t)+1 ;
        end
    end   
end
for t=1:l
    Result(t)=result(t)/len;
end
AAC=Result;
end