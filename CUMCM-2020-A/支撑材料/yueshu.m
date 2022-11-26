function a=yueshu(T1,T2,T3,T4,speed)
result=luwenqvxian(T1,T2,T3,T4,speed);
a1=1;a2=0;a3=0;a4=0;
shujv2=0; shujv3=0; shujv4=0;
for i1=1:length(result)-1
    y=(result(i1+1,2)-result(i1,2))/0.5;
    if abs(y)>3
        a1=0;
    end
    if result(i1,2)>150 && result(i1,2)<190 && result(i1,2)>result(i1-1,2)
        shujv2=shujv2+0.5;
    end
    if result(i1,2)>217
        shujv3=shujv3+0.5;
    end
    if result(i1,2)>shujv4
        shujv4 = result(i1,2);
    end
end
if shujv2>60 && shujv2<120
    a2=1;
end
if shujv3>40 && shujv3<90
    a3=1;
end
if shujv4>240 && shujv4<250
    a4=1;
end
if a1+a2+a3+a4==4
    a=1;
else
    a=0;
end
end