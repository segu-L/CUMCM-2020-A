 clc, clear
%�����ٶȽ�����������Ҫ������
T_1=(165:185);  T_2=(185:205);  T_3=(225:245);  T_4=(245:265);  speed_=(65:100);
T1=175; T2=195; T3=235; T4=255; speed=75;

%�˻����
e=0.1^30; %��ֹ����
L=20000; %����
at=0.999; %�����ٶ�
T=1; %��ʼ�¶�
for k=1:L  %�˻����    ����
%�����½�
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
    %������ۺ���ֵ������
    df=mianji(luwenqvxian(T1_new,T2_new,T3_new,T4_new,speed_new))-mianji(luwenqvxian(T1,T2,T3,T4,speed));
    if df<0 %����׼��
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

