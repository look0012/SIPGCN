 
%fold-1
1
B = TreeBagger(1,Yeast_f1_train_feature,Yeast_f1_train_label);
predict_label1 = predict(B,Yeast_f1_test_feature);
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(str2num(char(predict_label1)),Yeast_f1_test_label );
aa = [ACC,SN,SP,PPV,NPV,F1,MCC];

%fold-2
2
B = TreeBagger(1,Yeast_f2_train_feature,Yeast_f2_train_label);
predict_label2 = predict(B,Yeast_f2_test_feature);
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(str2num(char(predict_label2)),Yeast_f2_test_label );
bb = [ACC,SN,SP,PPV,NPV,F1,MCC];
%fold-3
3
B = TreeBagger(1,Yeast_f3_train_feature,Yeast_f3_train_label);
predict_label3 = predict(B,Yeast_f3_test_feature);
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(str2num(char(predict_label3)),Yeast_f3_test_label );
cc = [ACC,SN,SP,PPV,NPV,F1,MCC];
%fold-4
4
B = TreeBagger(1,Yeast_f4_train_feature,Yeast_f4_train_label);
predict_label4 = predict(B,Yeast_f4_test_feature);
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(str2num(char(predict_label4)),Yeast_f4_test_label );
dd = [ACC,SN,SP,PPV,NPV,F1,MCC];
%fold-5
5
B = TreeBagger(1,Yeast_f5_train_feature,Yeast_f5_train_label);
predict_label5 = predict(B,Yeast_f5_test_feature);
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(str2num(char(predict_label5)),Yeast_f5_test_label );
ee = [ACC,SN,SP,PPV,NPV,F1,MCC];



R=[];
R=[aa;bb;cc;dd;ee]; 