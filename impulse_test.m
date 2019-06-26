clear;

n=-20:100;
x=zeros(1,length(n));
x(21)=1;

% b=1;
% a=[1,0.3,0.42,-0.2,0.18];
% impul=filter(b,a,x);
% subplot(1,2,1);plot(n,impul);
% ylim([-0.4,1.1]);grid on;
% title('未知系统的冲激响应');
% hz=tf(b,a,1,'variable','z^-1');impulse(hz);
% zplane(b,a);

a=1;
b=[0.9830,-0.2437,-0.3300,0.3665];
impul=filter(b,a,x);
subplot(2,2,1);plot(n,impul);
ylim([-0.4,1.1]);grid on;
title('4阶时的冲激响应');

b=[0.9950,-0.2824,-0.3411,0.3675,-0.1839,-0.1796];
impul=filter(b,a,x);
subplot(2,2,2);plot(n,impul);
ylim([-0.4,1.1]);grid on;
title('6阶时的冲激响应');

b=[1.0394,-0.3104,-0.3436,0.4404,-0.2285,-0.1076,0.2404,-0.1197];
impul=filter(b,a,x);
subplot(2,2,3);plot(n,impul);
ylim([-0.4,1.1]);grid on;
title('8阶时的冲激响应');

b=[1.0026,-0.2818,-0.3581,0.3990,-0.1847,-0.1239,0.2543,-0.1262,-0.0636,0.1175];
impul=filter(b,a,x);
subplot(2,2,4);plot(n,impul);
ylim([-0.4,1.1]);grid on;
title('10阶时的冲激响应');
