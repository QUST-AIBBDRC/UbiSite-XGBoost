# -*- coding: utf-8 -*-
"""
Created on Sun May 13 17:01:11 2018

@author: Administrator
"""

import PSSMmaker

#PSSMMaker.command_pssm('E:\Blast\db\Cytoplasm_test.fasta','try_once.txt','pssm1.pssm')
proseq=r'D:\A_wangx\pssm_try\set1.txt'
outdir=r'D:\A_wangx\pssm_try\jieguoset1'
PSSMmaker.pssm(proseq,outdir)
