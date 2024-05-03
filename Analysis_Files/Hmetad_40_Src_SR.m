% Overall Hierarchical Meta-d'
mcmc_params.response_conditional = 0; % Do we want to fit response-conditional meta-d'?
mcmc_params.estimate_dprime = 1; 
mcmc_params.nchains = 3; % How Many Chains?
mcmc_params.nburnin = 4000; % How Many Burn-in Samples?
mcmc_params.nsamples = 10000;  %How Many Recorded Samples?
mcmc_params.nthin = 2; % How Often is a Sample Recorded?
mcmc_params.doparallel = 0; % Parallel Option
mcmc_params.dic = 1;  % Save DIC

% Load and Clean Data
nR_S1 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nRSrc_S1_40_SR.mat')
nR_S1 = nR_S1(1).x
nR_S1 = mat2cell(nR_S1,ones(1,40),[6])
nR_S2 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nRSrc_S2_40_SR.mat')
nR_S2 = nR_S2(1).x
nR_S2 = mat2cell(nR_S2,ones(1,40),[6])

% Run model of Hierarchical Meta-d'
hierarchical_metamem_src = fit_meta_d_mcmc_group(nR_S1, nR_S2, mcmc_params)

% Evaluate MCMC
%R hat values (Chain convergence)
hierarchical_metamem_src.mcmc.Rhat(1)
hierarchical_metamem_src.mcmc.Rhat(1).c1 > 1.01
hierarchical_metamem_src.mcmc.Rhat(1).d1 > 1.01
hierarchical_metamem_src.mcmc.Rhat(1).Mratio > 1.01

%MCMC samples (Chain Mixing/No drift)
plotSamples(exp(hierarchical_metamem_src.mcmc.samples.mu_logMratio))
plotSamples(exp(hierarchical_metamem_src.mcmc.samples.sigma_logMratio))
plotSamples(hierarchical_metamem_src.mcmc.samples.mu_c2)
plotSamples(hierarchical_metamem_src.mcmc.samples.sigma_c2)
plotSamples(hierarchical_metamem_src.mcmc.samples.deviance)

%Deviance
hierarchical_metamem_src.mcmc.dic %1642.6

% ANALYSIS
disp("d1")
median(hierarchical_metamem_src.d1) %Average d'; (1.19)
std(hierarchical_metamem_src.d1) % 0.45
calc_HDI(hierarchical_metamem_src.d1(:), .95) % 0.8 - 2.34
calc_HDI(hierarchical_metamem_src.d1(:), .89) % -0.8 - 2.07


disp("c1")
median(hierarchical_metamem_src.c1) %Average c'; (0.34) Conservative responds no more than an ideal observer would
std(hierarchical_metamem_src.c1) % 0.064
calc_HDI(hierarchical_metamem_src.c1(:), .95) % 0.26 - 0.47
calc_HDI(hierarchical_metamem_src.c1(:), .89) % 0.26 - 0.47


disp("meta-d'")
median(hierarchical_metamem_src.meta_d) %Average meta-d'; (0.21)
std(hierarchical_metamem_src.meta_d) % 0.17
calc_HDI(hierarchical_metamem_src.meta_d(:), .95) % 0.12 - 0.78
calc_HDI(hierarchical_metamem_src.meta_d(:), .89) % 0.12 - 0.6


disp("Mratio")
median(hierarchical_metamem_src.Mratio) %Average meta-d'/d'; (0.19)
std(hierarchical_metamem_src.Mratio) % 0.13
calc_HDI(hierarchical_metamem_src.Mratio(:), .95) % 0.13 - 0.42 
calc_HDI(hierarchical_metamem_src.Mratio(:), .89) % 0.13 - 0.36 