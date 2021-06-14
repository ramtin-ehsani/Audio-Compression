%% Read File
[x,fs]=audioread('in.wav');
length=length(x);
player=audioplayer(x,fs);
player.play

%% Orginal
t=fft(x,length);
X=fftshift(t);
f=-fs/2:fs/length:(fs/2-fs/length);

figure(1)
plot(f,abs(X))
title('Original Audio Signal')
xlabel('Freq(hq)');
ylabel('Magnitude');

%% Compress
Xr=zeros(1,length);
Xr((length/4)+1:(3*length/4))= X((length/4)+1:(3*length/4));

figure(2)
plot(f, abs((Xr)));
xr= real(ifft(fftshift(Xr)));
audiowrite('Compressed.wav',xr,fs);
title('Compressed Audio')
xlabel('Freq(hq)');
ylabel('Magnitude');