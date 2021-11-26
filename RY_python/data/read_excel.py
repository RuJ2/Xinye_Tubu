# -*- coding: utf-8 -*-
"""
Created on Wed Jun 16 10:15:57 2021

@author: ruj72813
"""
import pandas as pd


data_pd = pd.read_excel('data.xlsx', sheet_name='data', header=0)
data_pd = data_pd.dropna()

data_cor = data_pd.corr()
data_pd.to_csv('data.csv',index_label=False)

