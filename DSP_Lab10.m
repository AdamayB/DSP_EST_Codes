N=51;
n=0:N-1;
N_Freq1=input('Enter the value of normalized frequency1: '); %0.15
x1=sin(2*pi*N_Freq1*n);
N_Freq2=input('Enter the value of normalized frequency2: '); %0.1
N_Freq3=input('Enter the value of normalized frequency3: '); %0.3
x2=sin(2*pi*N_Freq2*n)+sin(2*pi*N_Freq3*n);
M=input('Value of down sampling factor: '); %5
y1=downsample(x1,M);
L1=length(y1);
y2=downsample(x2,M);
L2=length(y2);
subplot(2,2,1);
stem(0:N-1,x1(1:N));
title('x1(n) Adamay');
subplot(2,2,2);
stem(0:N-1,x2(1:N));
title('x2(n) Adamay');
subplot(2,2,3);
stem(0:L1-1,y1(1:L1));
title('downsampled x1(n) Adamay');
subplot(2,2,4);
stem(0:L2-1,y2(1:L2));
title('downsampled x2(n) Adamay')
