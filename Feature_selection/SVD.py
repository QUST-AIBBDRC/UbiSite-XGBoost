import numpy as np
import pandas as pd
from sklearn.preprocessing import scale,StandardScaler
from sklearn.decomposition import TruncatedSVD
from sklearn.random_projection import sparse_random_matrix
import scipy.io as sio

data_=pd.read_csv(r'set6A_feature.csv')
data=np.array(data_)
data=data[:,1:]
shu=scale(data)
X=shu
svd = TruncatedSVD(n_components=293, n_iter=10, random_state=20)
hist=svd.fit(X)  
new_data=svd.transform(X)
data_csv = pd.DataFrame(data=new_data)
data_csv.to_csv('set6A_feature293SVD.csv')

