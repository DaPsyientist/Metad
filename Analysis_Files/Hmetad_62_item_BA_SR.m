% Parameter Specification
mcmc_params.response_conditional = 0; % Do we want to fit response-conditional meta-d'?
mcmc_params.nchains = 3; % How Many Chains?
mcmc_params.nburnin = 4000; % How Many Burn-in Samples?
mcmc_params.nsamples = 10000;  %How Many Recorded Samples?
mcmc_params.nthin = 2; % How Often is a Sample Recorded?
mcmc_params.doparallel = 0; % Parallel Option
mcmc_params.dic = 1;  % Save DIC

% Load and Clean Data
nR_S1 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nR_S1_SciRep62_SR.mat')
nR_S1 = nR_S1(1).x
nR_S1 = mat2cell(nR_S1,ones(1,62),[6])
nR_S2 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nR_S2_SciRep62_SR.mat')
nR_S2 = nR_S2(1).x
nR_S2 = mat2cell(nR_S2,ones(1,62),[6])
cov = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/BA_SubjCov_62_SR.mat')
cov = cov.x

% Run model of Hierarchical Meta-d'
hierarchical_metamem = fit_meta_d_mcmc_regression(nR_S1, nR_S2, cov, mcmc_params)

% Evaluate MCMC
%R hat values (Chain convergence)
hierarchical_metamem.mcmc.Rhat(1)
hierarchical_metamem.mcmc.Rhat(1).c1 > 1.01
hierarchical_metamem.mcmc.Rhat(1).d1 > 1.01
hierarchical_metamem.mcmc.Rhat(1).Mratio > 1.01

%MCMC samples (Chain Mixing/No drift)
plotSamples(exp(hierarchical_metamem.mcmc.samples.mu_logMratio))
plotSamples(exp(hierarchical_metamem.mcmc.samples.sigma_logMratio))
plotSamples(hierarchical_metamem.mcmc.samples.mu_c2)
plotSamples(hierarchical_metamem.mcmc.samples.sigma_c2)
plotSamples(hierarchical_metamem.mcmc.samples.deviance)

%Deviance
hierarchical_metamem.mcmc.dic %1322.4

% ANALYSIS
disp("d1")
median(hierarchical_metamem.d1) %Average d'; 2.16 (0.49)
std(hierarchical_metamem.d1) 
calc_HDI(hierarchical_metamem.d1(:), .95) % 1.31 - 3.25
calc_HDI(hierarchical_metamem.d1(:), .89) % 1.57 - 3.25

disp("c1")
median(hierarchical_metamem.c1) %Average c'; -0.35 (0.21) liberal responds yes more than an ideal observer would
std(hierarchical_metamem.c1) 
calc_HDI(hierarchical_metamem.c1(:), .95) % -0.84 - -0.058
calc_HDI(hierarchical_metamem.c1(:), .89) % -0.72 - -0.027

disp("meta-d'")
median(hierarchical_metamem.meta_d) %Average meta-d'; 1.22 (0.38)
std(hierarchical_metamem.meta_d) 
calc_HDI(hierarchical_metamem.meta_d(:), .95) % 0.48 - 1.74
calc_HDI(hierarchical_metamem.meta_d(:), .89) % 0.64 - 1.74

disp("Mratio")
median(hierarchical_metamem.Mratio) %Average meta-d'/d'; 0.54 (0.13)
std(hierarchical_metamem.Mratio(:)) 
calc_HDI(hierarchical_metamem.Mratio(:), .95) % 0.31 - 0.8
calc_HDI(hierarchical_metamem.Mratio(:), .89) % 0.32 - 0.75

plotSamples(exp(hierarchical_metamem.mcmc.samples.mu_logMratio))
hdi = calc_HDI(exp(hierarchical_metamem.mcmc.samples.mu_logMratio(:)));
fprintf(['\n HDI on meta-d/d: ', num2str(hdi) '\n\n']) %0.42 - 0.62

plotSamples(hierarchical_metamem.mcmc.samples.mu_beta1)
median(calc_HDI(hierarchical_metamem.mcmc.samples.mu_beta1(:), .89)) %0.11
hdi = calc_HDI(hierarchical_metamem.mcmc.samples.mu_beta1(:), .89);
fprintf(['\n HDI on beta1: ', num2str(hdi) '\n\n']) %-0.051 - 0.27
