clc
clear
close

function y=ustepy(t)
    y = (t>=0);
end

function y = impulse(t)
y = (t == 0); % Define the impulse function
end

s = @(t) ustepy(t) - ustepy(t-1) + ustepy(t-2) - ustepy(t-3)+ ustepy(t-4) - ustepy(t-5)+ ustepy(t-6) - ustepy(t-7);

impulseS = @(t) impulse(t) + impulse(t-1) + impulse(t-2) + impulse(t-3) + impulse(t-4) + impulse(t-5) + impulse(t-6)+ impulse(t-7);

nexttile;
fplot(s, [0 8])
grid on
ylim([0 1.5])

nexttile;
fplot(impulseS, [0 8])
grid on
ylim([0 1.5])

%%
t = 0: 1 : 8;
sigs = s(t)
impulses = impulseS(t)

sample = sigs .* impulses;

nexttile;
plot(t, sample)
grid on
ylim([0 1.5])

%%

sig1 = cos(t);
sig2 = -cos(t);

nexttile;
plot(t, sig1)
grid on
ylim([-2 2])

nexttile;
plot(t, sig2)
grid on
ylim([-2 2])

%%

outputSample = sample .* sig1 + sample .* sig2
