# -*- coding: utf-8 -*-
"""
Created on Fri Aug 20 21:07:57 2021

@author: ruj72813
"""

from flask import Flask, request
import json
# import sqlite3
import numpy as np
from Regresser import ANN #, Ensemble
#from ga import SAGA



ann = ANN()
ann.load_model()

app = Flask(__name__)
app.secret_key = 'sec123'

@app.route('/')

def hello_world():
    print("运行hello···")
    return 'hello world'
    

@app.route('/getData',methods=['POST'])
def getData():
    print("运行getData···")
    data = request.get_data()
    jdata = json.loads(data.decode("utf-8"))
    
    # col = ['涂布槽液位','基片定量','传动侧','波美度','打浆度','湿重']
    col = ['zLevel','zRation','zDrive','zDegrees','zBeating','zWeight']
    featrues = np.array([[jdata[col[i]] for i in range(6)]])
    predict = {"result": ann.predict(featrues)[0]}
        
    # 返回预测数据
    print(predict)
    return predict


#@app.route('/ga',methods=['POST'])
#def GA():
#    print("运行ga···")
#    data = request.get_data()
#    jdata = json.loads(data.decode("utf-8"))
#    print(jdata)
#    if jdata['method'] == 'ann':
#        ga = SAGA()
#        predicts = ga.solve_ga()
#    return predicts

@app.route('/train',methods=['put'])
def train():
    print("运行train···")


if __name__ == '__main__':
    print("运行main···")
    app.run(port=5000, debug=True)
