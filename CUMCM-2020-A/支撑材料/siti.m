clc;clear;
%暴力搜索算法，运行需要近一小时 
L_min=100;
a=0
for T1=165:185
    for T2=185:205
        for T3=225:245
            for T4=245:265
                for speed=65:100
                    result = luwenqvxian(T1,T2,T3,T4,speed);
                    L=duichen(result);
                    if L<=L_min && yueshu(T1,T2,T3,T4,speed)==1
                        L_min=L;
                        a=a+1;
                        x(a,:)=[L,T1,T2,T3,T4,speed];
                        L,T1,T2,T3,T4,speed
                    end
                end
            end
        end
    end
end

mianji_min=5000;
for i=41:86
    if mianji(luwenqvxian(x(i,2),x(i,3),x(i,4),x(i,5),x(i,6)))<mianji_min
        mianji_min=mianji(luwenqvxian(x(i,2),x(i,3),x(i,4),x(i,5),x(i,6)));
        x(i,2),x(i,3),x(i,4),x(i,5),x(i,6)
    end
end


function value=duichen(result)
[max_,max_n] = max(result(:,2));
m=result(:,2)>217;
for i=1:length(result)
    if m(i)==1
        left_n=i;
        break;
    end
end
for i=length(result):-1:1
    if m(i)==1
        right_n=i;
        break;
    end
end
value=abs((right_n-max_n)-(max_n-left_n));
end