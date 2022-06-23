fidin=fopen('./data/Yeast/dataset_yeast_gsp.fasta');            

P_Sequence=cell(710,1);;   
i=0;
TempS='';   
while ~feof(fidin)                                                      
    tline=fgetl(fidin);                                                    
    
    if double(tline(1))=='>'       
        if i>0 
            P_Sequence(i,1)={TempS};
        end
         i=i+1;
         TempS='';
         continue;  
    else
        TempS=[TempS,tline]; 
    end
end
fclose(fidin);           
save('./data/Yeast/P_Sequence','P_Sequence')     



%¸ºÑù±¾
fidin=fopen('./data/Yeast/dataset_yeast_gsn.fasta');                

N_Sequence=cell(5511,1);;   
i=0;
TempS='';   
while ~feof(fidin)                                                        
    tline=fgetl(fidin);                                                       
    
    if double(tline(1))=='>'      
        if i>0 
            N_Sequence(i,1)={TempS};
        end
         i=i+1;
         TempS='';
         continue;  
    else
        TempS=[TempS,tline]; 
    end
end
fclose(fidin);           
save('./data/Yeast/N_Sequence','N_Sequence')  