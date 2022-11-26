clc;clear;

for s=65:100
%温度斜率最大值，150~190时间，大于217度的时间，峰值温度
    result = luwenqvxian(182,203,237,254,s);
    shujv(s,1)=0; shujv(s,2)=0; shujv(s,3)=0; shujv(s,4)=0;
    for i=1:length(result)-1
        if abs((result(i+1,2)-result(i,2))/0.5)>shujv(s,1)
            shujv(s,1)=abs((result(i+1,2)-result(i,2))/0.5);
        end
        if result(i,2)>150 && result(i,2)<190 && result(i,2)>result(i-1,2)
            shujv(s,2)=shujv(s,2)+0.5;
        end
        if result(i,2)>217
            shujv(s,3)=shujv(s,3)+0.5;
        end
        if result(i,2)>shujv(s,4)
            shujv(s,4) = result(i,2);
        end
    end
end
x=65:100;

subplot(2,2,1);
plot(x,shujv(65:100,1));
line([65,100],[3,3],'Color','red');

subplot(2,2,2);
plot(x,shujv(65:100,2));
line([65,100],[60,60],'Color','red');line([65,100],[120,120],'Color','red');

subplot(2,2,3);
plot(x,shujv(65:100,3));
line([65,100],[40,40],'Color','red');line([65,100],[90,90],'Color','red');

subplot(2,2,4);
plot(x,shujv(65:100,4));
line([65,100],[240,240],'Color','red');line([65,100],[250,250],'Color','red');

