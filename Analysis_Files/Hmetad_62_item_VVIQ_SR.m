% Parameter Specification
mcmc_params.response_conditional = 0; % Do we want to fit response-conditional meta-d'?
mcmc_params.nchains = 3; % How Many Chains?
mcmc_params.nburnin = 4000; % How Many Burn-in Samples?
mcmc_params.nsamples = 10000;  %How Many Recorded Samples?
mcmc_params.nthin = 2; % How Often is a Sample Recorded?
mcmc_params.doparallel = 0; % Parallel Option
mcmc_params.dic = 1;  % Save DIC


% Overall Hierarchical Meta-d'
% Load and Clean Data
nR_S1 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nR_S1_SciRep62_SR.mat')
nR_S1 = nR_S1(1).x
nR_S1 = mat2cell(nR_S1,ones(1,62),[6])
nR_S2 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nR_S2_SciRep62_SR.mat')
nR_S2 = nR_S2(1).x
nR_S2 = mat2cell(nR_S2,ones(1,62),[6])
cov = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/VVIQ_SubjCov_62_SR.mat')
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
hierarchical_metamem.mcmc.dic %1950.0

% ANALYSIS
disp("d1")
median(hierarchical_metamem.d1) %Average d'; 2.15 (0.52)
std(hierarchical_metamem.d1)
calc_HDI(hierarchical_metamem.d1(:), .95) % 1.30 - 3.22
calc_HDI(hierarchical_metamem.d1(:), .89) % 1.46 - 3.22

disp("c1")
median(hierarchical_metamem.c1) %Average c'; -0.36 (0.28) liberal responds yes more than an ideal observer would
std(hierarchical_metamem.c1) 
calc_HDI(hierarchical_metamem.c1(:), .95) % -1.01 - 0.00
calc_HDI(hierarchical_metamem.c1(:), .89) % -0.84 - -0.027

disp("meta-d'")
median(hierarchical_metamem.meta_d) %Average meta-d'; 1.45 (0.35)
std(hierarchical_metamem.meta_d) 
calc_HDI(hierarchical_metamem.meta_d(:), .95) % 0.76 - 1.96
calc_HDI(hierarchical_metamem.meta_d(:), .89) % 0.86 - 1.93

disp("Mratio")
median(hierarchical_metamem.Mratio) %Average meta-d'/d'; 0.65 (0.1)
std(hierarchical_metamem.Mratio(:)) 
calc_HDI(hierarchical_metamem.Mratio(:), .95) % 0.47 - 0.87
calc_HDI(hierarchical_metamem.Mratio(:), .89) % 0.49 - 0.77

plotSamples(exp(hierarchical_metamem.mcmc.samples.mu_logMratio))
hdi = calc_HDI(exp(hierarchical_metamem.mcmc.samples.mu_logMratio(:)), .89);
fprintf(['\n HDI on meta-d/d: ', num2str(hdi) '\n\n']) % 0.58, 0.7 

plotSamples(hierarchical_metamem.mcmc.samples.mu_beta1)
hdi = calc_HDI(hierarchical_metamem.mcmc.samples.mu_beta1(:), .89);
median(calc_HDI(hierarchical_metamem.mcmc.samples.mu_beta1(:))) % -0.031
fprintf(['\n HDI on beta1: ', num2str(hdi) '\n\n']) % -0.11, 0.06
