%% Read File
[x,fs]=audioread('in.wav');
N=length(x);
player=audioplayer(x,fs);
player.play

%% Orginal
t=fft(x,N);
X=fftshift(t);
f=-fs/2:fs/N:(fs/2-fs/N);
figure(1)
plot(f,abs(X))
title('original audio signal')
xlabel('freq(hq)');ylabel('magnitude');

%% Compress
Xr=zeros(1,N);
Xr((N/4)+1:(3*N/4))= X((N/4)+1:(3*N/4));   %%FORMULA
%Xr((N*((70/100)/2))+1 : N*(1-(70/100)/2)) = X((N*((70/100)/2))+1 :  N*(1-(70/100)/2));
figure(2)
plot(f, abs((Xr)));
xr= real(ifft(fftshift(Xr)));
audiowrite('Compressed.wav',xr,fs);
title('50% compressed audio')
xlabel('freq(hq)');ylabel('magnitude');