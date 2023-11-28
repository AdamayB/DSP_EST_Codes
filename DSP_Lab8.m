clc
clear all
% Pass Band edge/ Transition width/pass band ripple/ stop band attenuation
pbEdge=input("Enter Passband edge Freq:"); %0.1
tranwid=input("Enter Transition Width:"); %0.6
pbRipple=input("Enter Passband Ripple:"); %0.06
sbAtt=input("Enter Stop Band Attenuation:"); %0.36
wp1=pbEdge*pi;
wp2=tranwid*pi;
ws1=pbRipple*pi;
ws2=sbAtt*pi;
wc1=(ws1+wp1)/2;
wc2=(ws2+wp2)/2;

m=49;
n=linspace(0,m-1,m);
hd1=sin(wc2.*((n-(m-1)/2)))./((pi.*(n-((m-1)/2))));
hd1(1,((m-1)/2)+1)=(wc2/pi);
hd2=sin(wc1.*((n-(m-1)/2)))./((pi.*(n-((m-1)/2))));
hd2(1,((m-1)/2)+1)=(wc1/pi);
h = hd1-hd2;

beta=1;
wi = kaiser(m,beta);
wii=[];
for i=1:length(wi)
    wii(1,i) = wi(i,1);
end
h = h.*wii;

[H,w] = freqz(h,1,1024);
wn=w./(2*pi);
hn=abs(H)./max(abs(H));
hn1 = 20*log10(hn);
plot(wn,hn1,'r')
grid
xlabel('\bf Normalized frequency')
ylabel('\bf Normalized frequency response (dB)')
title('\bf Bandpass filter designed with kaiser window function Adamay(102115046)')
