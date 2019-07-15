# __MTR-GL__  
  
MTR-GL (multi-task regression learning with group lasso) is a novel method to precisely model and interpret bioactivities of ligand molecules by combining homologous GPCRs. MTR-GL was examined on a set of thirty-five representative GPCRs datasets that cover nine subfamilies of human GPCRs. The results demonstrate that, the combination of homologous GPCRs in learning bioactivates of ligands can effectively improve the performance and interpretation of models by utilizing similar information of interaction and ligand samples cross these GPCR proteins. This is of great significance for understanding GPCR-ligand interaction and developing new drugs targeting GPCRs. 
  
## ___Reference:___  
Jiansheng Wu, et.al. Homologous G Protein-coupled Receptors Boost the Modelling and Interpretation of Bioactivities of Ligand Molecules. (In review) 
  
### ___ATTN1:___  
* This package is free for academic usage. You can run it at your own risk.  
* For other purposes, please contact PH.D Jiansheng Wu (jansen@njupt.edu.cn).  
* For any problem concerning the code, please feel free to contact PH.D Jiansheng Wu.  

## ___Requirement:___  
To use this package, the Matlab, JAVA JDK and Python (Ver 2.7) environment must be available. 

### ___ATTN2:___   
This package was developed by Miss Yi Sun and Mr. Ben Liu. 

### ___ATTN3: Code usage of MTR-GL___  
We have developed two demo programs for different applications in ligand-based virtual screening, with the source codes and datasets released through http://cbi.njupt.edu.cn/MTR-GL/.  
The code for MTR-GL was written in Matlab2014 and Python 2.7. This provides a general framework for ligand-based virtual screening through multi-task learning with joint feature learning, which allows users to develop their own key substructure recognition and virtual screening tools for drug targets of their interest on the basis of our code. The pipelines have two major functions.  
* __demo_new:__ This provides a general framework on ligand-based virtual screening, and it is easy for users to develop their own virtual screening tools for drug targets of their choice on the basis of our code.  
___Input:___  
Compounds in the format of canonical SMILES and their bioactivity values.  
___Output:___  
Model performance (r^2, RMSE).  
___The procedure is as follows:___  
To input compounds in the format of canonical SMILES and their bioactivity values →To generate Pubchem fingerprints → To train the multi-task regression learning with group lasso (MTR-GL) model → To obtain the model performance.
* __demo_activity:__ This offers the ligand-based virtual screening models for thirty-five important human GPCR drug targets, and users can predict the bioactivities of new compounds acting with these targets, which is important in the implementation of drug design against these drug targets, the prediction of side effects of multi-target drugs, and the risk assessment of drug development. 
#### ___Input:___  
Compounds in the format of canonical SMILES. 
#### ___Output:___  
Bioactivity values interacting with the GPCR drug target of interest. The steps are as follows: Input compounds in the format of canonical SMILES →To generate Pubchem fingerprints→To obtain the bioactivity values based on our trained MTR-GL models.
