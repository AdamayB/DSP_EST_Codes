clc
clear all;

fc=input('enter cutoff freq:'); %300
fs=input('Enter sampling freq:'); %1024

[b,a]=butter(6,fc/(fs/2));
figure

freqz(b,a,fs);

title('LPF using Butterworth Window Adamay 102115046');
