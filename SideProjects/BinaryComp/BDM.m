clc
clear
clf

% angular frequency
wo = 1;
period = (2*pi) / wo;

g1 = @(x)sin(x);
g2 = @(x) -sin(x);

nexttile;
fplot(g1, [0 period])
grid on
title("g1")

nexttile;
fplot(g2, [0 period], "m")
grid on
title("g2")

nexttile;
hold on
fplot(g1, [0 period])
fplot(g2, [0 period], "m")
grid on
hold off

% calculating energies
g1sq = @(x) sin(wo*x).^2;
g2sq = @(x) sin(-wo*x).^2;

Eg1 = integral(g1sq, 0, period)
Eg2 = integral(g2sq, 0, period)

% introduce signal and noise
n = 0.367;
noise = @(x) n*sin(134664*x);
signalmath = @(x) sin(wo*x) + noise(x);

% plot of input signal s
nexttile;
fplot (signalmath, [0 period])
grid on
title("Input noise with noise")

signalmathsq = @(x) (signalmath(x)).^2;

% signal energy
Es = integral(signalmathsq, 0 , period);

bothg1 = @(x) signalmath(x).*g1(x);
bothg2 = @(x) signalmath(x).*g2(x);

E1cc = integral(bothg1, 0, period)
E2cc = integral(bothg2, 0, period)

coeffg1 = 1 / (sqrt(Eg1*Es))*E1cc
coeffg2 = 1 / (sqrt(Eg2*Es))*E2cc

if coeffg1 > coeffg2
    disp('Coefficient for g1 is greater than for g2');

else
    disp('Coefficient for g2 is greater than or equal to for g1');
end