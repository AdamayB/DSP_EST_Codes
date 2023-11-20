clc
clear all;
fp=input('Enter the passband frequency:');
tw=input('Enter the transition width:');
tw=tw/8000;
fc=fp+tw/2;
N=50;
h=ones(1,N);
hd=ones(1,N);

for i=1:N
 a(i)=(-(N-1)/2-1)+i;
end
r=hanning(N);
%r=hamming(N);
for i=1:N
 wc=2*pi*fc;
 h(i)=((-1)^i)*sin(a(i)*wc)/(a(i)*wc);
 hd(i)=h(i)*r(i);
end

[X2,w2]=freqz(hd,1,1024);
X2max=max(abs(X2));
plot(w2/pi,20*log10(abs(X2)/X2max));
title('HPF with Hanning Window Freq Response(Adamay 102115046)');
xlabel('f');
ylabel('hd');