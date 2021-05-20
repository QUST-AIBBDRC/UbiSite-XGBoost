##UbiSite-XGBoost

Prediction of protein ubiquitination sites via multi-view features based on eXtreme gradient boosting classifier

###UbiSite-XGBoost uses the following dependencies:

 * Python 3.6
 * numpy
 * scipy
 * scikit-learn
 * pandas

###Guiding principles: 

**The dataset file contains six Training datasets, among which Set1, Set2, Set3,Set4, Set5, and Set6, and three independent test datasets, among which Independent test1, Independent test2 , Independent test3.

**Feature extraction：
 * PseAAC.py is the implementation of PseAAC.
 * CKSAAP.m is the implementation of CKSAAP.
 * Bi_profile_bayes.m is the implementation of ANBPB.
 * AAindex.py is the implementation of implement AAindex.
 * EBGW_DATA.m and EBGW.m are the implementation of EBGW.
 * BLOSUM62.py is the implementation of BLOSUM62.
 * zhenglinxulie.m and PsePSSM.m are the implementation of PsePSSM.
 
**Dimension reduction:
 * LASSO_dimensional reduction.py and dimensional_reduction.py are the implementation of LASSO.
 * Elastic net.py is the implementation of Elastic net.
 * ET.py is the implementation of ET.
 * LR.py is the implementation of LR.
 * MI.py is the implementation of MI.
 * SVD.py  is the implementation of SVD.
 
**SMOTE:
 * SMOTE_R_train_test.R  is the implementation of SMOTE.
 
**Classifier:
 * AdaBoost.py is the implementation of Adaboost.
 * ET.py is the implementation of ET.
 * GTB.py is the implementation of GTB.
 * KNN.py is the implementation of KNN.
 * DT.py is the implementation of DT.
 * RF.py is the implementation of RF.
 * SVM.py is the implementation of SVM.
 * XGBoost.py is the implementation of XGBoost.
 * LightGBM.py is the implementation of LightGBM.
 * Bagging.py is the implementation of Bagging.

