clear;
clc;

f=1:100:12e3;
omega = 2*pi*f;
omega_1 = 369549150;
alpha_1 = 7612.71;
omega_2 = 370370370.4;
alpha_2 = 19018.52;
H_1 = (omega_1)./(omega_1 - omega.^2 + 2j*alpha_1.*omega);
H_2 = (omega_2)./(omega_2 - omega.^2 + 2j*alpha_2.*omega);

H = H_1.*H_2;

freqencies = [1 10 100 1000 10000];
magnitudes = [0 0 0 -0.017 -39.9];
phases = [0 0 -0.1098 -0.929 -5.43];

figure();
semilogx(f, 20*log10(abs(H)));
title('Frequency Response Magnitude');
ylabel('Magnitude (dB)');
xlabel('Frequency (Hz)');
hold on
scatter(freqencies, magnitudes);
hold off

figure();
semilogx(f, unwrap(angle(H)));
title('Frequency Response Phase');
ylabel('Phase (rad)');
xlabel('Frequency (Hz)');
hold on
scatter(freqencies, phases);
hold off