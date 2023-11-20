clc
clear all;
 
fp=1500;
tw=500;
fsample=8000;
tw=tw/fsample;
fc=fp+tw/2;
N=floor(0.9/tw);
h=ones(1,N);
hd=ones(1,N);

for i=1:N
    a(i)=(-(N-1)/2-1)+i;
end

rectangular=ones(1,N);
triangular=triang(N)
for i=1:N
    wc=2*pi*fc;
    h(i)=sin(a(i)*wc)/(a(i)*wc);
    hd(i)=h(i)*rectangular(i);
end

subplot(2,1,1);
stem(a,hd);
title('LPF with Rectangular Window');
xlabel('t');
ylabel('hd');
[X2,w2]=freqz(hd,1,1024);
X2max=max(abs(X2));
subplot(2,1,2);
plot(w2/pi,20*log10(abs(X2)/X2max));
title('LPF with Rectangular Window Freq Response');
xlabel('f');
ylabel('hd')
