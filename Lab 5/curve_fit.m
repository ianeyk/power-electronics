A = readtable("exponential_curve_fit_Vdd_9V.csv")

figure(1);
clf;
hold on;

plot(A.t, A.Vdd_9V + 9)
x = A.t
z = A.Vdd_9V

a = 1.235
lambda = 5.371
phi = 0.8274

K1 = (2.8 + 6 .* i) .* 0.89;
K2 = conj(K1)
t = A.t;
lambda1 = -0.20e6 .* i;
lambda2 = conj(lambda1);

Vr = K1 .* exp(lambda1 .* t) + K2 .* exp(lambda2 .* t);
plot(t, Vr);

L = 9.50e-6; % uH
R = 5; % Ohm

syms C;
my_eq = lambda1 == (-1 ./ (R .* C) + sqrt((1 ./ (R .* C)).^2 - 4 .* 1 .* 1 ./ (L .* C))) ./ (2 .* 1);
soln = solve(my_eq, C, "Real", true)

K12 = (2.8 + 6 .* i) .* 0.89;
K22 = conj(K1)
t = A.t;
C2 = real(soln);

lambda12 = (-1 ./ (R .* C2) + sqrt((1 ./ (R .* C2)).^2 - 4 .* 1 .* 1 ./ (L .* C2))) ./ (2 .* 1);
% lambda12 = abs(soln);
lambda22 = conj(lambda1);

Vr2 = K12 .* exp(lambda12 .* t) + K22 .* exp(lambda22 .* t);
plot(t, Vr2, '--');
legend("data", "original fit", "C fit")