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
nR_S1_1 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nR_S1_40_1_SR_Item.mat')
nR_S1_1 = nR_S1_1(1).x
nR_S1_1 = mat2cell(nR_S1_1,ones(1,40),[6,6])
nR_S1_1 = num2cell(nR_S1_1, 1)
nR_S1_1 = cell2struct(nR_S1_1, 'counts', 1)

nR_S2_1 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nR_S2_40_2_SR_Item.mat')
nR_S2_1 = nR_S2_1(1).x
nR_S2_1 = mat2cell(nR_S2_1,ones(1,40),[6,6])
nR_S2_1 = num2cell(nR_S2_1, 1)
nR_S2_1 = cell2struct(nR_S2_1, 'counts', 1)

% Run Dependent groups model of Hierarchical Meta-d'
hierarchical_metamem_Val = fit_meta_d_mcmc_groupCorr(nR_S1_1, nR_S2_1, mcmc_params)

% Evaluate MCMC
%R hat values (Chain convergence)
hierarchical_metamem_Val.mcmc.Rhat(1).deviance > 1.01
hierarchical_metamem_Val.mcmc.Rhat(1).rho > 1.01
hierarchical_metamem_Val.mcmc.Rhat(1).c1 > 1.01
hierarchical_metamem_Val.mcmc.Rhat(1).d1 > 1.01
hierarchical_metamem_Val.mcmc.Rhat(1).Mratio > 1.01 

%MCMC samples (Chain Mixing/No drift)
plotSamples(hierarchical_metamem_Val.mcmc.samples.rho)
plotSamples(hierarchical_metamem_Val.mcmc.samples.deviance)
plotSamples(exp(hierarchical_metamem.mcmc.samples.mu_logMratio))

%Deviance
hierarchical_metamem_Val.mcmc.dic %1911.8

% ANALYSIS
% Compute HDI of difference in log-ratio
sampleDiff = exp(hierarchical_metamem_Val.mcmc.samples.mu_logMratio(:,:,1)) - exp(hierarchical_metamem_Val.mcmc.samples.mu_logMratio(:,:,2));
hdi_95 = calc_HDI(sampleDiff(:), .95) % -0.031 - 0.30
hdi_89 = calc_HDI(sampleDiff(:), .89) % -0.0046 - 0.26
hdi_88 = calc_HDI(sampleDiff(:), .88) % 0.001 - 0.26
ci = calc_CI(sampleDiff(:));
fprintf(('\n Mratio session values = %.2f and %.2f'), exp(hierarchical_metamem_Val.mu_logMratio(1)), exp(hierarchical_metamem_Val.mu_logMratio(2))) %0.71 [Neg], 0.60 [Neut]
fprintf(['\n Estimated difference in Mratio between sessions: ', num2str(exp(hierarchical_metamem_Val.mu_logMratio(1)) - exp(hierarchical_metamem_Val.mu_logMratio(2)))]) %0.11

%Plot HDI difference in log-ratio units
plotSamples(sampleDiff)

%Calculate Correlation
disp("rho")
hierarchical_metamem_Val.rho %61

% d'
disp("d'_Neg")
median(hierarchical_metamem_Val.d1(:,1)) %Average d'; (2.44)
std(hierarchical_metamem_Val.d1(:,1)) % 0.62
disp("HDI_d'_Neg")
calc_HDI(hierarchical_metamem_Val.d1(:,1), .95) % 1.23; 3.64
calc_HDI(hierarchical_metamem_Val.d1(:,1), .89) % 1.23; 3.11

disp("d'_Neut")
median(hierarchical_metamem_Val.d1(:,2)) %Average d'; (2.02)
std(hierarchical_metamem_Val.d1(:,2)) % 0.46
disp("HDI_d'_Neut")
calc_HDI(hierarchical_metamem_Val.d1(:,2), .95) % 0.76; 2.77
calc_HDI(hierarchical_metamem_Val.d1(:,2), .89) % 1.31; 2.77

% c (bias)
disp("c1_Neg")
median(hierarchical_metamem_Val.c1(:,1)) %Average c'; (-0.20) conservative responds 'yes' less than an ideal observer would
std(hierarchical_metamem_Val.c1(:,1)) % 0.27
disp("HDI_c1_Neg")
calc_HDI(hierarchical_metamem_Val.c1(:,1), .95) % -0.81; 0.17
calc_HDI(hierarchical_metamem_Val.c1(:,1), .89) % -0.66; 0.17

disp("c1_Neut")
median(hierarchical_metamem_Val.c1(:,2)) %Average c'; (-.43) conservative bias responds yes less than an ideal observer would
std(hierarchical_metamem_Val.c1(:,2)) % 0.26
disp("HDI_c1_Neut")
calc_HDI(hierarchical_metamem_Val.c1(:,2), .95) % -0.86; 0.035
calc_HDI(hierarchical_metamem_Val.c1(:,2), .89) % -0.86; -0.045

%M ratio
disp("Mratio_Neg")
median(hierarchical_metamem_Val.Mratio(:,1)) %Average meta-d'/d'; (0.74)
std(hierarchical_metamem_Val.Mratio(:,1)) %0.079
calc_HDI(hierarchical_metamem_Val.Mratio(:,1), .95) % 0.63; 0.93
calc_HDI(hierarchical_metamem_Val.Mratio(:,1), .89) % 0.63; 0.87

disp("Mratio_Neut")
median(hierarchical_metamem_Val.Mratio(:,2)) %Average meta-d'/d'; (0.64)
std(hierarchical_metamem_Val.Mratio(:,2)) % 0.16
calc_HDI(hierarchical_metamem_Val.Mratio(:,2), .95) % 0.42; 0.94
calc_HDI(hierarchical_metamem_Val.Mratio(:,2), .89) % 0.42; 0.84

%Calculate the difference between Metacognition conditions
sampleDiff = exp(hierarchical_metamem_Val.mcmc.samples.mu_logMratio(:,:,1)) - exp(hierarchical_metamem_Val.mcmc.samples.mu_logMratio(:,:,2)) 
median(sampleDiff(:)) %Average meta-d'/d'; (0.13)
std(sampleDiff(:)) % 0.084
hdi = calc_HDI(sampleDiff(:), .88) %0.001, 0.26
