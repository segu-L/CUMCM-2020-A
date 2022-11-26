clc;clear;


result = luwenqvxian(173,198,230,257,78);
for i=1:length(result)-1
    y_(i)=(result(i+1,2)-result(i,2))/0.5;
    x_(i)=result(i,1);
end
plot(result(:,1),result(:,2));
hold on;
%plot(result(:,1),result(:,3));

figure('name','温度随时间变化的斜率曲线');
plot(x_,y_);
line([0,400],[3,3],'Color','red');
line([0,400],[-3,-3],'Color','red');


