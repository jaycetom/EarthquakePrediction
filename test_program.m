%%输入地震目录，震级输入矩阵为M，时间矩阵为t
[M] = xlsread('C:\Users\JackYao\Desktop\database.csv')
n = 50

Num = size(M);
%滑动时间窗
for(f = 0;f<Num;t++)
    
    %%计算Mi和Ni的函数 calculate MN（i）
    for(i=f;i<f+n;i++)
        N(i) = find(== M(i));
    end


    %%a&b value
    for(i=f;i<f+n;i++)
        flag1 = flag1 + M(i)*log(N(i));
        flag2 = flag2 + M(i);
        flag3 = flag3 + log(N(i));
        flag4 = flag4 + M(i)*M(i);        
            
    end
    b_lsq(f) = (n*flag1 - flag2*flag3) / (flag2*flag2 - n*flag4);
    for(i=f;i<f+n;i++)
        flag5 = flag5 + log10(N(i)) + b_lsq(i)*M(i);
    end
    a_lsq(f) = flag5/n;
    for(i=f;i<f+n;i++)
        M1(i) = M(i);
    end
    b_mlk(f) = log10(e)/(mean(M1) - min(M1));
    a_mlk(f) = log10(N) + b_mlk * min(M1);


    %%Time of n events(question)
    T = t(f+n) - t(f);

    %%Seismic energy dE(question)
    for(i=f;i<f+n;i++)
        flag6 = flag6 + (10^(11.8 + 1.5*M(i)))^0.5;
    end
    dE = (flag6 / T)^2;

    %%Mean Magnitude M_mean
    for(i=f;i<f+n;i++)
        M_mean = M_mean + M(i)/n;
    end

    %%Seismic rate changes z（没有理解其中含义）

    %%Maximum magnitude in last seven days
    if(f>=7)
        temp = f-1;
        for(i=6;i>=0;i--)
            M_pre(i) = M(temp);
            temp = temp - 1;
        end
    end
    x_6(f) = max(M_pre);

    %%probability of earthquake occurrence x_7i
    for(i = 0;i < f+n;i++)
    x_7i_lsq(i) = e^((-3)*b_lsq(i)/log(e));
    end
    x_7i_mlk = e^((-3)*b_mlk/log(e));

    %%Deviation from Gutenberg-Richer law Yita
    for(i=f;i<f+n;i++)
        flag7 = flag7 + (log(N(i)) - a_lsq(i) - b_lsq(i)*M(i))^2;
        Yita_lsq(i) = flag7/(n - 1);
        flag8 = flag8 + (log(N(i)) - a_mlk - b_mlk*M(i))^2;
    end
    Yita_mlk = flag8/(n - 1);

    %%Standard deviation of b value Sigmab
    for(i=f;i<f+n;i++)
        flag9 = flag9 + (M(i) - mean(M))^2;
    end
    for(i=f;i<f+n;i++)
    Sigmab_lsq(i) = 2.3*b_lsq(i)*b_lsq(i)*(flag9/(n*(n-1)))^(1/2);
    end
    Sigmab_mlk = 2.3*b_mlk*b_mlk*(flag9/(n*(n-1)))^(1/2);

    %%Magnitude deficit M_def
    for(i=f;i<f+n;i++)
    M_maxexpected_lsq(i) = a_lsq(i) / b_lsq(i);
    end
    M_maxexpected_mlk = a_mlk / b_mlk;
    M_maxactual = max(M);
    for(i=f;i<f+n;i++)
    M_def_lsq(i) = M_maxactual - M_maxexpected_lsq(i);
    end
    M_def_mlk = M_maxactual - M_maxexpected_mlk;

    %%Total recurrence time Tr
    for(flag10 = 4;flag10<=6;flag10+0.1)
         
    



    end

%%计算Mi和Ni的函数 calculate MN（i）
%%N(i) = find(M == M(i))

    
end
