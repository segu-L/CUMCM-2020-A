clc;clear;

x=xlsread('����.xlsx','A1:A710');
y=xlsread('����.xlsx','B1:B710');

result = luwenqvxian(175,195,235,255,70);
for i=1:length(result)-1
    y_(i)=(result(i+1,2)-result(i,2))/0.5;
    x_(i)=result(i,1);
end
plot(result(:,1),result(:,2));
hold on;
plot(result(:,1),result(:,3));
hold on;
plot(x,y);
figure('name','�¶���ʱ��仯��б������');
plot(x_,y_);
line([0,400],[3,3],'Color','red');
line([0,400],[-3,-3],'Color','red');

function T=wendu(T1,T2,T3,T4,L) %ƽ�������߽紦�����¶ȳ�
L1=(T1-25)/2.5;
L2=(T2-T1)/2.5;
L3=(T3-T2)/2.5;
L4=(T4-T3)/2.5;
L5=(T4-25)/2.5;
%�����������¶ȣ�10��11����25��
    if L<=L1                  %¯ǰ��
        T=logistic(25,T1,L1,L)+25;            %(T1-25)/25*L+25;
    elseif L>L1 && L< 197.5-(L2-5)/2      %1
        T=T1;
    elseif L>=197.5-(L2-5)/2 && L<202.5+(L2-5)/2    %1,2֮��
        T=logistic(T1,T2,L2,L-(197.5-(L2-5)/2))+T1;           
    elseif L>=202.5+(L2-5)/2 && L<233-(L3-5)/2      %2
        T=T2;
    elseif L>=233-(L3-5)/2 && L<238+(L3-5)/2        %2,3֮��
        T=logistic(T2,T3,L3,L-(233-(L3-5)/2))+T2;         
    elseif L>=238+(L3-5)/2 && L<268.5-(L4-5)/2     %3
        T=T3;
    elseif L>=268.5-(L4-5)/2 && L<273.5+(L4-5)/2    %3,4֮����¶�
        T=logistic(T3,T4,L4,L-(268.5-(L4-5)/2))+T3;        
    elseif L>=273.5+(L4-5)/2 && L<339.5            %4
        T=T4;
    elseif L>=339.5 && L<344.5+(L5-5)/2   %4,5֮��
        T=logistic(T4,25,(L5-5)/2+5,L-339.5)+25;         
    else 
        T=25;
    end
end

% function T=wendu(T1,T2,T3,T4,L)   %���Ա仯�¶ȳ�
%     if L<=25                    %¯ǰ��
%         T=(T1-25)/25*L+25;
%     elseif L>25 && L< 197.5      %1
%         T=T1;
%     elseif L>197.5 && L<202.5    %1,2֮��
%         T=T1+(T2-T1)/5*(L-197.5);
%     elseif L>202.5 && L<233      %2
%         T=T2;
%     elseif L>233 && L<238        %2,3֮��
%         T=(L-233)*(T3-T2)/5+T2;
%     elseif L>=238 && L<268.5     %3
%         T=235;
%     elseif L>268.5 && L<273.5    %3,4֮����¶�
%         T=(L-268.5)/5*(T4-T3)+T3;
%     elseif L>273.5 && L<339.5    %4
%         T=255;
%     elseif L>=339.5 && L<344.5   %4,5֮��
%         T=(5-(L-339.5))/5*(T4-25)+25;
%     elseif L>=344.5 && L<410.5
%         T=25;
%     else 
%         T=25;
%     end
% end

function result=luwenqvxian(T1,T2,T3,T4,speed)
%1,2,3��Ϊʱ�䣬pcb�¶ȣ�������¯�¶�
t=435.5/speed*60;
T0=25;
T_t=25;
for i=0.5:0.5:t
    L=i*speed/60;
    T=wendu(T1,T2,T3,T4,L);
    deilt_T=(T-T0);
%   T0=0.01*deilt_T+T0;
    if deilt_T>0
        T0=0.01*deilt_T+T0;       %k*deilt_T
    elseif deilt_T<0
        T0=0.005*deilt_T+T0;    %����0.01��0.005���
    end
    result(round(i*2),:)=[i,T0,T];
end

end 