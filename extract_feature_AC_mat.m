
[PssmM]=load('./data/Yeast/Yeast_Pssm_N.mat');
for j=1:5511       
     j  
    TempM=cell2mat(PssmM.N_Pssm(1,j));   
    S = AutoCov( TempM, 40 ); 
    N_Feature(j,:)=S(:);               
end
save('./data/Yeast/Feature_AC_N','N_Feature')   

data_DCT = [P_Feature;N_Feature];
label = [ones(710,1);-ones(5511,1)];
data_DCT = [label,data_DCT];
save('./Yeast/Data_feature_AC','data_DCT')   