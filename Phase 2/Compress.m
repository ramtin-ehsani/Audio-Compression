clc
clear
close all

%% Read File
[x,fs]=audioread('in.wav');
len=length(x);
player=audioplayer(x,fs);
player.play

%% Orginal
t=fft(x,len);
X=fftshift(t);
f=-fs/2:fs/len:(fs/2-fs/len);

figure(1)
plot(f,abs(X))
title('Original Audio Signal')
xlabel('Freq');
ylabel('Magnitude');

%% Compress
Xr=zeros(1,len);
Xr((len/4)+1:(3*len/4))= X((len/4)+1:(3*len/4));

figure(2)
plot(f, abs((Xr)));
xr= real(ifft(fftshift(Xr)));
audiowrite('Compressed.wav',xr,fs);
title('Compressed Audio Signal')
xlabel('Freq');
ylabel('Magnitude');