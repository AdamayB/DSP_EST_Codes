clc
clear all;

fc=input('enter cutoff freq:');
fs=input('Enter sampling freq:');

[b,a]=butter(6,fc/(fs/2));
figure

freqz(b,a,fs);

title('LPF using Butterworth Window Adamay 102115046');