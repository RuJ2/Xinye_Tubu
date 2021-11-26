# -*- coding: utf-8 -*-
"""
Created on Tue Jun 22 13:36:29 2021

@author: ruj72813
"""
import numpy as np
from Regresser import ANN
from saga import GA
import pandas as pd

ann = ANN()
ann.load_model()
INPUT_NUM = 6


def f(x):
		return ann.predict(np.array(x).reshape(1,-1))[0]



num = INPUT_NUM


data_pd = pd.read_csv('data/data.csv',header=0)
col = ['涂布槽液位','基片定量','传动侧','波美度','打浆度','湿重']
train_data = data_pd[col]

X = train_data.values

bound = [X.min(axis=0), X.max(axis=0)+1]
	

class SAGA():

	def __init__(self):
		self.pop_size = 100
		self.chromosome_length = 10
		self.pc = 0.6
		self.pm = 0.5


	def solve_ga(self):
		ga = GA(self.pop_size, self.chromosome_length, num, bound, self.pc, self.pm, f)
		result = ga.solver()
		res = {
			"max_value": result[0],
			"param": result[1],
		}
		return res