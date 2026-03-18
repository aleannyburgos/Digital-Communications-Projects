clc
clear
close

samplerate = 1000;
t = 0 : 1/samplerate : 8;

function y=ustepy(t)
    y = (t>=0);
end

function y = impulse(t)
y = (t == 0); % Define the impulse function
end

y = (ustepy(t) - ustepy(t-1) + ustepy(t-3) - ustepy(t-4) + ustepy(t-6) - ustepy(t-7)) - 0.5;
nexttile;
plot(t,y)
title("Binary Signal")
grid on

nexttile;
yplus = sin(2*pi*t);
plot(t, yplus)
title("Carrier Signal")
grid on

nexttile;
bothplus = y .* yplus;
plot(t, bothplus)
title("BPSK Signal")
grid on