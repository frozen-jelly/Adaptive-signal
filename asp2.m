%% Implement File
% Title:Adaptive Signal Processing Project No.2
% Note:System identification by adaptive filter based on LMS algorithm 
% 
% Env:MATLAB 2016a
% Author:Li Ang
% Date:2018/7/15

clear;
%%
samples=600;
Ts=1/samples;
t=0:Ts:1-Ts;

%load wgn.mat x;
 x=wgn(1,samples,-6,'real');                         % dBW
 save wgn.mat x;
xpow=sum(abs(x(: )).^2)/samples;                    % W
subplot(4,1,1);plot(t,x);
title(sprintf('激励白噪声，功率为：%.4f W',xpow));
xlabel('t/s');ylabel('amp/V');
ylim([-1.3 1.3]);

%% 2. use the noise to active an unknown system which is an AR model
%a=[0.3 0.42 -0.2 0.18];
 a=[0.6 0.1 -0.24 -0.4];
% a=[0.76 0.2 -0.1 -0.32];
d=zeros(1,samples);
shift=zeros(4,1);
for i=1:samples
    d(i)=x(i)-a*shift;
    shift=[d(i);shift(1:3)];
end
dpow=sum(abs(d(: )).^2)/samples;
subplot(4,1,2);plot(t,d);
title(sprintf('未知系统输出，功率为：%.4f W',dpow));
xlabel('t/s');ylabel('amp/V');
ylim([-1.3 1.3]);

%% 3. use the noise to active the LMS filter
y=zeros(1,samples);
e=zeros(1,samples);
mu=0.3;
fircoef=zeros(1,10);
order=length(fircoef);

for i=1:samples
    if order>i
        xc=[fliplr(x(1:i)) zeros(1,order-i)];
    else
        xc=fliplr(x(i-order+1:i));   
    end
    y(i)=sum(xc.*fircoef);
    e(i)=d(i)-y(i);
    fircoef=fircoef+mu*e(i)*xc;
end
subplot(4,1,3);plot(t,y);
title('LMS滤波器输出信号');
xlabel('t/s');ylabel('amp/V');
ylim([-1.3 1.3]);
subplot(4,1,4);plot(t,e);
title('误差信号');
xlabel('t/s');ylabel('amp/V');
ylim([-0.4 0.4]);