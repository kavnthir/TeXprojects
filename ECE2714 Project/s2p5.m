[x ,Fs] = audioread('aafilter-output.wav');
y = audioread('dtfilter-output.wav');
X = fft(x);
Y = fft(y);
L = length(X);

xP2 = abs(X/L);
xP1 = xP2(1:L/2+1);
xP1(2:end-1) = 2*xP1(2:end-1);

yP2 = abs(Y/L);
yP1 = yP2(1:L/2+1);
yP1(2:end-1) = 2*yP1(2:end-1);

f = Fs*(0:(L/2))/L; 

figure;
subplot(2,1,1);
plot(f,20*log10(xP1)) 
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
title('Pre-Notch Filter Response');
axis tight;
subplot(2,1,2);
plot(f,20*log10(yP1)) 
title('Post-Notch Filter Response');
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
axis tight;