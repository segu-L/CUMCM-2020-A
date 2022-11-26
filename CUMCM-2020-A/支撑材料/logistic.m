function wd=logistic(T_min,T_max,long,L_zhanbi)
x=14*(L_zhanbi/long)-7;
y=1/(1+exp(-x));
wd=y*(T_max-T_min);
if T_max<T_min
    y=1/(1+exp(x));
    wd=y*(T_min-T_max);
end
end
