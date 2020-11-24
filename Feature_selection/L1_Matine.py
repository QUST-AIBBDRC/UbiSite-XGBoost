# -*- coding: utf-8 -*-
"""
Created on Mon Jan 22 11:58:19 2018

@author: 陈成
"""
import os
import scipy.io as sio
import numpy as np
import pandas as pd
from sklearn.feature_selection import SelectKBest
from sklearn.feature_selection import mutual_info_classif
from sklearn.decomposition import TruncatedSVD
from sklearn.preprocessing import scale,StandardScaler
from sklearn.preprocessing import normalize,Normalizer
from sklearn.feature_selection import SelectFromModel
from sklearn.linear_model import Lasso,LassoCV
from sklearn.linear_model import ElasticNet,ElasticNetCV
from sklearn.linear_model import LassoLarsCV,LassoLars
from sklearn.ensemble import ExtraTreesClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.decomposition import PCA
   
#弹性网降维
def elasticNet(data,label,alpha =np.array([0.1])):
    enetCV = ElasticNetCV(alphas=alpha,l1_ratio=0.01,max_iter=2000).fit(data,label)
    enet=ElasticNet(alpha=enetCV.alpha_, l1_ratio=0.01,max_iter=2000)
    enet.fit(data,label)
    mask = enet.coef_ != 0
    new_data = data[:,mask]
    return new_data,mask

#基于L1正则化的决策树选择算法
def selectFromExtraTrees(data,label):
    clf = ExtraTreesClassifier(n_estimators=500, criterion='gini', max_depth=None, 
                               min_samples_split=2, min_samples_leaf=1, min_weight_fraction_leaf=0.0, 
                               max_features='auto', max_leaf_nodes=None, min_impurity_decrease=0.0, 
                               min_impurity_split=None, bootstrap=False, oob_score=False, n_jobs=1, 
                               random_state=None, verbose=0, warm_start=False, class_weight=None)#entropy
    clf.fit(data,label)
    importance=clf.feature_importances_ 
    model=SelectFromModel(clf,prefit=True)
    new_data = model.transform(data)
    
    return new_data,importance

#带L1惩罚项的逻辑回归作为基模型的特征选择
def logistic_dimension(data,label,parameter=0.9):#parameter是可调整的参数
    logistic_=LogisticRegression(penalty="l1", C=parameter)
    model=SelectFromModel(logistic_)
    new_data=model.fit_transform(data, label)
    mask=model.get_support(indices=True)
    return new_data,mask

#互信息进行特征 选择
def mutual_mutual(data,label,k=290):
    model_mutual= SelectKBest(mutual_info_classif, k=k)
    new_data=model_mutual.fit_transform(data, label)
    return new_data

def lassodimension(data,label,alpha=np.array([0.005])):#alpha代表想要传递的alpha的一组值,用在循环中,来找出一个尽可能好的alpha的值
    lassocv=LassoCV(cv=5, alphas=alpha,max_iter=2000).fit(data, label)
#    lasso = Lasso(alpha=lassocv.alpha_, random_state=0)#生成Lasso对象
    x_lasso = lassocv.fit(data,label)#代入alpha进行降维
    mask = x_lasso.coef_ != 0 #mask是一个numpy数组,数组中的元素都是bool值,并且数组的维度和data的维度是相同的
    new_data = data[:,mask]  #将data中相应维度中与mask中为True对应的元素挑选出来
    return new_data,mask #返回降维之后的数组,并将使用lasso训练数据之后得到的最大值一起返回
def lassolarsdimension(data,label):
    lassolarscv=LassoLarsCV(cv=5,max_iter=400).fit(data, label)
    lassolars = LassoLars(alpha=lassolarscv.alpha_)#生成LassoLars对象
    x_lassolars = lassolars.fit(data,label)
    mask = x_lassolars.coef_ != 0
    new_data = data[:,mask]
    return new_data,mask
def TSVD(data,n_components=300):
    svd = TruncatedSVD(n_components=n_components)
    new_data=svd.fit_transform(data)  
    return new_data
