a=importdata('yscore_sum_SMOTE_set4_0.005.500.csv')
 Threshold=a(2:2557,2)';
Output123=a(2:2557,3)';
    Pre_Labels=[];P=[];
    for t=1:2556
            if(Output123(t)>=Threshold(t))
                Pre_Labels=1;
            else
                Pre_Labels=0;
            end
       
           P=[P;Pre_Labels]; 
           Pre_Labels=[];
    end
    label=P;
    save label_yscore_sum_SMOTE_set4_0.005.500.mat label