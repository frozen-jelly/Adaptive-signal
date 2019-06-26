%% Implement File
% Title:Adaptive Signal Processing Project No.1
% Note:AR model
% 
% Env:MATLAB 2016a
% Author:Li Ang
% Date:2018/3/30


clear;
%% 1. generate white Gaussian noise
samples=400;
Ts=1/samples;
t=0:Ts:1-Ts;

load randomNoise.mat noise;
figure('NumberTitle','off','Name','Experiment 1');
%noise=wgn(1,samples,-10,'real');                    % dBW
%save randomNoise noise
nspow=sum(abs(noise(: )).^2)/samples;              % W
subplot(4,1,1);plot(t,noise);
title(sprintf('激励白噪声，功率为：%.4f W',nspow));
xlabel('t/s');ylabel('amp/V');

%% 2. use the noise to active an AR generating model
%a=[-0.1 -0.8];		%三种情形下的参数配置
%a=[0.1 -0.8];
a=[-0.976 0.96];
out1=zeros(1,samples);
shift=zeros(2,1);
for i=1:samples
    out1(i)=noise(i)-a*shift;
    shift=[out1(i);shift(1)];
end
out1pow=sum(abs(out1(: )).^2)/samples; 

subplot(4,1,2);plot(t,out1);
title(sprintf('AR模型输出，功率为：%.4f W',out1pow));
xlabel('t/s');ylabel('amp/V');

Rx=AutoCorr(out1);
len=length(Rx);
subplot(4,1,3);plot([1:len;1:len],[zeros(1,len);Rx(1:len)],'r');
title('AR模型输出的自相关函数');

%% 3. feed the AR analyzing model
out2=zeros(1,samples);
shift=zeros(2,1);
for i=1:samples
    out2(i)=out1(i)+a*shift;
    shift=[out1(i);shift(1)];
end
out2pow=sum(abs(out2(: )).^2)/samples;        
subplot(4,1,4);plot(t,out2);
title(sprintf('AR逆模型输出，功率为：%.4f W',out2pow));
xlabel('t/s');ylabel('amp/V');