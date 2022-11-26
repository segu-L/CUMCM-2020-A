function S=mianji(result)
    temp=find(result(:,2)>217);
    T_min=temp(1);
    [value,T_max]=max(result(:,2));
    x(T_min:T_max,1)=result(T_min:T_max,1);
    x(T_min:T_max,2)=result(T_min:T_max,2);
    x(T_max+1:T_max+(T_max-T_min)+1,2)=217;
    x(T_max+1:T_max+(T_max-T_min)+1,1)=result(T_max:-1:T_min,1);
    S = polyarea(x(T_min:T_max+(T_max-T_min)+1,1),x(T_min:T_max+(T_max-T_min)+1,2));
    plot(x(T_min:T_max+(T_max-T_min)+1,1),x(T_min:T_max+(T_max-T_min)+1,2));
end