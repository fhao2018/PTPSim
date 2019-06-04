x=1:1:13;
y=[0.5,0.5,0.5,1,1,0,1,1,1,0.2,0.2,0.2,0.2];

u=mean(y);
%disp(u);
%sigma = std(y);
sigma = 0.7;
disp('��׼��');
disp(std(y));


i=1;
w=[];
while i<=length(y)
    
    w(i)=con(y,i,sigma);
    i=i+1;
end

plot(x,w,'-ro');
xlabel('path index');
ylabel('static collision risk');

% %���������ͼ��
% k=0;
% 
% while k<=length(y)
%     
%     h=con_kernel(k,2);
%     plot(k,h,'ro');
%     hold on;
%     k=k+1;
% end



%����˺���
function g=con_kernel(i,sigma)
g=exp(-i^2/2/sigma^2)/sqrt(2*pi)/sigma;
end

%�������
function w=con(c,i,sigma)
w=0;
k=1;
while k<= length(c)
    w=w+c(k)*con_kernel(i-k,sigma);
    
    k=k+1;
end

end
