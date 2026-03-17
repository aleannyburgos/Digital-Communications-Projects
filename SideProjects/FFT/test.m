% This script can be used to illustrate two different signals
% and the fourier spectrum of the sum of the signals

clear
clc
close

Ts = 1/50;
t = 0:Ts:10-Ts;

% assign the frequency of signals x(t) and y(t)
x_f = 3
y_f = 2


% plots for x(t) and y(t) as well as a plot with both
figure('Name', 'test signal fourier spectrum');
x = sin(2*pi*x_f*t);
nexttile;
plot(t,x)
title("x(t)")
grid on
xlabel('Time (seconds)')
ylabel('Amplitude')

y = sin(2*pi*y_f*t);
nexttile;
plot(t,y)
title("y(t)")
grid on
xlabel('Time (seconds)')
ylabel('Amplitude')

nexttile;
hold on
plot(t,x)
plot(t,y, "m")
title("x(t) and y(t)")
grid on
hold off

% Here the sum of the signals is defined and plotted
z = x + y;
nexttile;
plot(t,z)
title("z(t)")
grid on
xlabel('Time (seconds)')
ylabel('Amplitude')

% fourier transform is calculated using matlabs fft function
y = fft(z);
fs = 1/Ts;
f = (0:length(y)-1)*fs/length(y);

% this plot shows the fourier spectrum
nexttile;
plot(f,abs(y))
grid on
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Magnitude')