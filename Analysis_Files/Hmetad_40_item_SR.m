% Overall Hierarchical Meta-d'
mcmc_params.response_conditional = 0; % Do we want to fit response-conditional meta-d'?
mcmc_params.nchains = 3; % How Many Chains?
mcmc_params.estimate_dprime = 1; 
mcmc_params.nburnin = 4000; % How Many Burn-in Samples?
mcmc_params.nsamples = 10000;  %How Many Recorded Samples?
mcmc_params.nthin = 2; % How Often is a Sample Recorded?
mcmc_params.doparallel = 0; % Parallel Option
mcmc_params.dic = 1;  % Save DIC

% Load and Clean Data
nR_S1 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nR_S1_40_SR.mat')
nR_S1 = nR_S1(1).x
nR_S1 = mat2cell(nR_S1,ones(1,40),[6])
nR_S2 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nR_S2_40_SR.mat')
nR_S2 = nR_S2(1).x
nR_S2 = mat2cell(nR_S2,ones(1,40),[6])

% Run model of Hierarchical Meta-d'
hierarchical_metamem = fit_meta_d_mcmc_group(nR_S1, nR_S2, mcmc_params)

% Evaluate MCMC
%R hat values (Chain convergence)
hierarchical_metamem.mcmc.Rhat(1).deviance > 1.01
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
hierarchical_metamem.mcmc.dic %1317.8

% ANALYSIS
disp("d1")
median(hierarchical_metamem.d1) %Average d'; (2.16)
std(hierarchical_metamem.d1(:)) % 0.49
calc_HDI(hierarchical_metamem.d1(:), .95) % 1.31 - 3.25
calc_HDI(hierarchical_metamem.d1(:), .89) % 1.57 - 3.25


disp("c1")
median(hierarchical_metamem.c1) %Average c'; (-0.35) liberal responds yes more than an ideal observer would
std(hierarchical_metamem.c1(:)) % 0.21
calc_HDI(hierarchical_metamem.c1(:), .95) % -0.84 - -0.058
calc_HDI(hierarchical_metamem.c1(:), .89) % -0.72 - -0.027


disp("meta-d'")
median(hierarchical_metamem.meta_d) %Average meta-d'; (1.22)
std(hierarchical_metamem.meta_d(:)) % 0.35
calc_HDI(hierarchical_metamem.meta_d(:), .95) % 0.49 - 1.69
calc_HDI(hierarchical_metamem.meta_d(:), .89) % 0.72 - 1.69


disp("Mratio")
median(hierarchical_metamem.Mratio) %Average meta-d'/d'; (0.51)
std(hierarchical_metamem.Mratio(:)) % 0.12
calc_HDI(hierarchical_metamem.Mratio(:), .95) % 0.33 - 0.77
calc_HDI(hierarchical_metamem.Mratio(:), .89) % 0.33 - 0.70