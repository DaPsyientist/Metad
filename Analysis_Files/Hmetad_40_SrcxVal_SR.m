% Overall Hierarchical Meta-d'
mcmc_params.response_conditional = 0; % Do we want to fit response-conditional meta-d'?
mcmc_params.nchains = 3; % How Many Chains?
mcmc_params.nburnin = 4000; % How Many Burn-in Samples?
mcmc_params.nsamples = 10000;  %How Many Recorded Samples?
mcmc_params.nthin = 2; % How Often is a Sample Recorded?
mcmc_params.doparallel = 0; % Parallel Option
mcmc_params.dic = 1;  % Save DIC

% Dependent groups (Neg/Neut) Hierarchical Meta-d'
% Load and Clean Data
nR_S1_1 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nR_S1_40_SR_1_Src.mat')
nR_S1_1 = nR_S1_1(1).x
nR_S1_1 = mat2cell(nR_S1_1,ones(1,40),[6,6])
nR_S1_1 = num2cell(nR_S1_1, 1)
nR_S1_1 = cell2struct(nR_S1_1, 'counts', 1)

nR_S2_1 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nR_S2_40_SR_2_Src.mat')
nR_S2_1 = nR_S2_1(1).x
nR_S2_1 = mat2cell(nR_S2_1,ones(1,40),[6,6])
nR_S2_1 = num2cell(nR_S2_1, 1)
nR_S2_1 = cell2struct(nR_S2_1, 'counts', 1)

% Run Dependent groups model of Hierarchical Meta-d'
hierarchical_metamem_Val_Src = fit_meta_d_mcmc_groupCorr(nR_S1_1, nR_S2_1, mcmc_params)

% Evaluate MCMC
%R hat values (Chain convergence)
hierarchical_metamem_Val_Src.mcmc.Rhat(1).deviance > 1.01
hierarchical_metamem_Val_Src.mcmc.Rhat(1).rho > 1.01
hierarchical_metamem_Val_Src.mcmc.Rhat(1).c1 > 1.01
hierarchical_metamem_Val_Src.mcmc.Rhat(1).d1 > 1.01
hierarchical_metamem_Val_Src.mcmc.Rhat(1).Mratio > 1.01; hierarchical_metamem_Val_Src.mcmc.Rhat(1).Mratio > 1.1

%MCMC samples (Chain Mixing/No drift)
plotSamples(hierarchical_metamem_Val_Src.mcmc.samples.rho)
plotSamples(hierarchical_metamem_Val_Src.mcmc.samples.deviance)
plotSamples(exp(hierarchical_metamem_Val_Src.mcmc.samples.mu_logMratio(:)))

%Deviance
hierarchical_metamem_Val_Src.mcmc.dic %1526.5

% ANALYSIS
% Compute HDI of difference in log-ratio
sampleDiff = exp(hierarchical_metamem_Val_Src.mcmc.samples.mu_logMratio(:,:,1)) - exp(hierarchical_metamem_Val_Src.mcmc.samples.mu_logMratio(:,:,2));
hdi_95 = calc_HDI(sampleDiff(:), .95) % -0.53 - 0.21
hdi_89 = calc_HDI(sampleDiff(:), .89) % -0.46 - 0.15
ci = calc_CI(sampleDiff(:));
fprintf(('\n Mratio session values = %.2f and %.2f'), exp(hierarchical_metamem_Val_Src.mu_logMratio(1)), exp(hierarchical_metamem_Val_Src.mu_logMratio(2))) %0.58 [Neg], 0.74 [Neut]
fprintf(['\n Estimated difference in Mratio between sessions: ', num2str(exp(hierarchical_metamem_Val_Src.mu_logMratio(1)) - exp(hierarchical_metamem_Val_Src.mu_logMratio(2)))]) %-0.16

%Plot HDI difference in log-ratio units
plotSamples(sampleDiff)

%Calculate Correlation
disp("rho")
hierarchical_metamem_Val.rho %61

% d'
disp("d'_Neg")
median(hierarchical_metamem_Val_Src.d1(:,1)) %Average d'; (1.18)
std(hierarchical_metamem_Val_Src.d1(:,1)) % 0.74
disp("HDI_d'_Neg")
calc_HDI(hierarchical_metamem_Val_Src.d1(:,1), .95) % 0.21; 2.84
calc_HDI(hierarchical_metamem_Val_Src.d1(:,1), .89) % 0.21; 2.35

disp("d'_Neut")
median(hierarchical_metamem_Val_Src.d1(:,2)) %Average d'; (0.97)
std(hierarchical_metamem_Val_Src.d1(:,2)) % 0.77
disp("HDI_d'_Neut")
calc_HDI(hierarchical_metamem_Val_Src.d1(:,2), .95) % -0.073; 2.73
calc_HDI(hierarchical_metamem_Val_Src.d1(:,2), .89) % 0.1; 2.64

% c (bias)
disp("c1_Neg")
median(hierarchical_metamem_Val_Src.c1(:,1)) %Average c'; (-0.24) conservative responds 'yes' less than an ideal observer would
std(hierarchical_metamem_Val_Src.c1(:,1)) % 0.31
disp("HDI_c1_Neg")
calc_HDI(hierarchical_metamem_Val_Src.c1(:,1), .95) % -0.32; 0.97
calc_HDI(hierarchical_metamem_Val_Src.c1(:,1), .89) % -0.32; 0.8

disp("c1_Neut")
median(hierarchical_metamem_Val_Src.c1(:,2)) %Average c'; (.41) conservative bias responds yes less than an ideal observer would
std(hierarchical_metamem_Val_Src.c1(:,2)) % 0.3
disp("HDI_c1_Neut")
calc_HDI(hierarchical_metamem_Val_Src.c1(:,2), .95) % -0.031; 1.15
calc_HDI(hierarchical_metamem_Val_Src.c1(:,2), .89) % -0.00; 1.03

%M ratio
disp("Mratio_Neg")
median(hierarchical_metamem_Val_Src.Mratio(:,1)) %Average meta-d'/d'; (0.61)
std(hierarchical_metamem_Val_Src.Mratio(:,1)) %0.056
calc_HDI(hierarchical_metamem_Val_Src.Mratio(:,1), .95) % 0.51; 0.71
calc_HDI(hierarchical_metamem_Val_Src.Mratio(:,1), .89) % 0.53; 0.71

disp("Mratio_Neut")
median(hierarchical_metamem_Val_Src.Mratio(:,2)) %Average meta-d'/d'; (0.83)
std(hierarchical_metamem_Val_Src.Mratio(:,2)) % 0.15
calc_HDI(hierarchical_metamem_Val_Src.Mratio(:,2), .95) % 0.57; 1.15
calc_HDI(hierarchical_metamem_Val_Src.Mratio(:,2), .89) % 0.57; 1.01

%Calculate the difference between Metacognition conditions
sampleDiff = exp(hierarchical_metamem_Val_Src.mcmc.samples.mu_logMratio(:,:,1)) - exp(hierarchical_metamem_Val_Src.mcmc.samples.mu_logMratio(:,:,2)) 
median(sampleDiff(:)) %Average meta-d'/d'; (-0.17)
std(sampleDiff(:)) % 0.19
hdi = calc_HDI(sampleDiff(:), .88) %-0.46, 0.15
