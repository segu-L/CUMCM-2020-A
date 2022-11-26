 clc, clear
%降温速度较慢，运行需要几分钟
T_1=(165:185);  T_2=(185:205);  T_3=(225:245);  T_4=(245:265);  speed_=(65:100);
T1=175; T2=195; T3=235; T4=255; speed=75;

%退火参数
e=0.1^30; %终止条件
L=20000; %次数
at=0.999; %降温速度
T=1; %初始温度
for k=1:L  %退火过程    次数
%产生新解
T1_new=T1;  T2_new=T2;  T3_new=T3;  T4_new=T4;  speed_new=speed;
 while(1)
    a=rand;
    if a<0.2
        T1_new = T_1(floor(rand*21)+1);
    elseif a<0.4
        T2_new = T_2(floor(rand*21)+1);
    elseif a<0.6
        T3_new = T_3(floor(rand*21)+1);
    elseif a<0.8
        T4_new = T_4(floor(rand*21)+1);
    elseif a<1
        speed_new = speed_(floor(rand*36)+1);
    end
    if yueshu(T1_new,T2_new,T3_new,T4_new,speed_new)==1
        break;
    end
end
    %计算代价函数值的增量
    df=mianji(luwenqvxian(T1_new,T2_new,T3_new,T4_new,speed_new))-mianji(luwenqvxian(T1,T2,T3,T4,speed));
    if df<0 %接受准则
        T1=T1_new;  T2=T2_new;  T3=T3_new;  T4=T4_new;  speed=speed_new; 
    elseif exp(-df/T)>rand
        T1=T1_new;  T2=T2_new;  T3=T3_new;  T4=T4_new;  speed=speed_new; 
    end
    T=T*at;
    if T<e
        break;
    end
end
mianji(luwenqvxian(T1,T2,T3,T4,speed))

