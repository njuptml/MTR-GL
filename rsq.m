function [outputArg1] = rsq(x,y)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
xmean = mean(x);
ymean = mean(y);
s1 = (sum((x-xmean).*(y-ymean)))^2;
s2 = (sum((x-xmean).^2)).*(sum((y-ymean).^2));

outputArg1 = s1/s2;

end

