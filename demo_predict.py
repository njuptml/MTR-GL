# -*- coding: utf-8 -*-
"""
Created on Tue May 21 17:51:44 2019

@author: Benli
"""

import pandas as pd
import os

def trans(res):
    tmp = -res
    return 10**tmp
local_path = os.getcwd()
cmd1 = '''javac -classpath ".;'''+ local_path +'''\*" Pubchem_fp.java'''
os.popen(cmd1)
cmd2 = '''java -classpath ".;'''+ local_path +'''\*" Pubchem_fp'''
os.popen(cmd2)
UserInput = pd.read_csv('UserInputData.txt',sep='\t')
weight = pd.read_csv('Weight_all.csv',sep=',')
with open('output_fp.txt',"r") as f:
    error = f.readline()
    data = f.readlines()
target = []
smiles = []
fp = []
for line in data:
    tmp_target_name = line.strip().split('\t')[0]
    tmp_smiles = line.strip().split('\t')[1]
    tmp_fp = line.strip().split('\t')[2:]
    target.append(tmp_target_name)
    smiles.append(tmp_smiles)
    fp.append(tmp_fp)
target_name = target[0]
df_fp = pd.DataFrame(fp,dtype=int)
res = []
for i in range(len(smiles)):
    W = weight[target_name]
    fp = df_fp.iloc[i]
    tmp_res = sum(W*fp)
    res.append(tmp_res)    
predict=pd.DataFrame(res).apply(trans)
output = UserInput
output['predict'] = predict

with open('predict_result.txt', 'w') as ff:
    for j in range(len(output)):
        res_line = '{}\t{}\t{}\n'.format(output.iloc[j,0],output.iloc[j,1],output.iloc[j,2] )
        ff.write(res_line)