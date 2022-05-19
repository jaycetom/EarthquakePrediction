function [TP, FP ,TN, FN, sens, spec, ppv, npv ,Acc, MCC ,RScore] = Contingency_Table(True_lable,Testpre_lable)
%���ڼ���������б�׼
n=size(True_lable(:));
TP=0;FP=0;TN=0;FN=0;sens=0;spec=0;ppv=0;npv=0;Acc=0;

for i=1:1:n
    if (Testpre_lable(i)==1) &&( True_lable(i)==1)
         TP=TP+1;
    end
    if (Testpre_lable(i)==0)&& (True_lable(i)==1)
         FP=FP+1;
    end
    if (Testpre_lable(i)==1) && (True_lable(i)==0)
         FN=FN+1;
    end
    if (Testpre_lable(i)==0) && (True_lable(i)==0)
         TN=TN+1;
    end

end

sens = TP/(TP+FN);
spec = TN/(TN+FP);
ppv = TP/(TP+FP);
npv = TN/(TN+FN);

%��������˹���ϵ��
X = (TP+FP)*(TP+FN)*(TN+FP)*(TN+FN);
MCC = (TP*TN-FP*FN)/sqrt(X);

%����Ԥ��׼ȷ��
Acc = (TP+TN)/(TP+TN+FP+FN);

%����R�÷�
RScore = ((TP*TN)-(FP*FN))/((TP+FN)*(FP+FN));


end
