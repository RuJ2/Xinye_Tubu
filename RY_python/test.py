#from Regresser import ANN, Ensemble
#from ga import SAGA
#
#
#ga = SAGA()
#predicts = ga.solve_ga()
#
#print("max_value: ",predicts["max_value"])
#col = ['涂布槽液位','基片定量','传动侧','波美度','打浆度','湿重']
#print("param:")
#for i in range(len(col)):
#	print(col[i]," : ",predicts["param"][i])

from Regresser import ANN #, Ensemble
import numpy as np
#from ga import SAGA



ann = ANN()
#ensemble = Ensemble()
ann.load_model()

X = np.array([[1,2,3,4,5,6]])
y = ann.predict(X)[0]
print(y)