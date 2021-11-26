import pickle
import sqlite3
import numpy as np


class ANN(object):

    def __init__(self):
        self.Transform = None
        self.model = None
    
    def load_model(self,folder_path='pkl',model_name='ann'):
        y1_filepath = folder_path +'/'+model_name +'.pkl'
        pipline = pickle.load(open(y1_filepath,'rb')) # {names:model}
        self.model = pipline['ann'] 
        self.Transform = pipline['scaler_X'] 
        print("加载ANN模型···")
        #print("load ann models from files using pickle")

    def predict(self,X):
#        y_predicts = {}
        x_test = self.Transform.transform(X)
        y_predict = self.model.predict(x_test)
        #print(y_predict)
        #y_predicts = {'y1':y_predict[0],'y2':y_predict[1]}
        return y_predict

    def update_model(self,batch_size):
        """
        :param cursor: 数据库查询
        :param batch_size: 训练的最小批大小
        :return:
        """
        failed = False
        fail_reason = ""

        try:
            conn = sqlite3.connect(db_path)
            cursor = conn.cursor()
            # 获取所有数据
            cursor.execute("SELECT * FROM  records")
            results = cursor.fetchmany(batch_size)
            results = [list(results[i])[2:] for i in range(len(results))]
            model = self.model
            print(len(results))
            print("开始ANN模型训练···")
                

            data = np.array(results)
            X_train = data[:,:-1]
            x_train = self.Transform.transform(X_train)
            model.fit(x_train, data[:,-1])
            print("训练成功")

            pkl_filename = 'pkl/ann.pkl'
            pipline = {'scaler_X':self.Transform,'ann':model}
            pickle.dump(pipline, open(pkl_filename, 'wb'))
            self.model = model
            conn.close()    
             
        except  Exception as e:
            failed = True
            fail_reason = e
            print('upate ann model failed...:',e)

        print("update ann model finished !!!")
        
        return failed, fail_reason

		
class Ensemble(object):

    def __init__(self):
        self.models = None
        self.w = [0.35,0.35,0.3]
    
    def load_model(self,folder_path='pkl',model_name='ensemble'):
        print("加载Ensemble模型···")
        y1_filepath = folder_path +'/'+model_name +'.pkl'
        models = pickle.load(open(y1_filepath,'rb')) # {names:model}
        self.models= models['models']
        self.w = models["w"]
        
    def predict(self,X_test):
        self.load_model()
        models = self.models
        y_predict = 0
        for i, model in enumerate(models.values()):
            y_predict_temp = model.predict(X_test)
            y_predict += self.w[i]*y_predict_temp
            #y_predict_detail.append(y_predict_temp)
        return y_predict

    def update_model(self,batch_size):
        """
        :param cursor: 数据库查询
        :param batch_size: 训练的最小批大小
        :return:
        """

        # TODO: directly fit model from sql
        failed = False
        fail_reason = ""

        try:
            conn = sqlite3.connect(db_path)
            cursor=conn.cursor()
            cursor.execute("SELECT * FROM  RECORDS")
            results = cursor.fetchmany(batch_size)
            
            results = [list(results[i])[2:] for i in range(len(results))]            
            print("开始Ensamble模型训练···")
            data = np.array(results)
            X_train,y_train = data[:,:-1],data[:,-1]
            models=save_model(X_train,y_train,file_path="pkl/ensemble.pkl")
            self.models = models

        except  Exception as e:
            failed = True
            fail_reason = e
            print('upate model failed...:',e)

        print("update model finished !!!")

        return failed, fail_reason