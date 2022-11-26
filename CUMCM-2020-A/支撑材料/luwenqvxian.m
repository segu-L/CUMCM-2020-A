function result=luwenqvxian(T1,T2,T3,T4,speed)
%1,2,3列为时间，pcb温度，回流焊炉温度
t=435.5/speed*60;
T0=25;
T_t=25;
for i=0.5:0.5:t
    L=i*speed/60;
    T=wendu(T1,T2,T3,T4,L);
    deilt_T=(T-T0);
    if deilt_T>0
        T0=0.01*deilt_T+T0;       %k*deilt_T
    elseif deilt_T<0
        T0=0.005*deilt_T+T0;
    end
    result(round(i*2),:)=[i,T0,T];
end
end 
