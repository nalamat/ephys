function pval = rayleighsz(r,n)
% pval = rayleighsz(r,n)
% Rayleigh test determines whether a circular distribution is random or
% not random, for unimodal distributions (or "non"-modal)
% H0: bearings are uniformly distributed around the circle
% HA: bearings are distributed nonrandomly
% r... Vector Strength
% n... number of observations
% p... p-value of Rayleigh's test
% Z... the z-statistic
% References:
% Zar, JH (1999) Biostatistical Analysis, 4th ed, Prentice Hall, Upper
% Saddle River, NJ
% Antje Ihlefeld ai33@nyu.edu % compute Rayleigh's Z
Z = n*r^2;
% compute p value using approxation in Zar, p. 617
pval = exp(sqrt(1+4*n+4*(n^2-(Z/r).^2))-(1+2*n));