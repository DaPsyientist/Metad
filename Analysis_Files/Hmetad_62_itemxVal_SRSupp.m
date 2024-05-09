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
nR_S1_1 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nR_S1_SciRep62_1.mat')
nR_S1_1 = nR_S1_1(1).x
nR_S1_1 = mat2cell(nR_S1_1,ones(1,62),[6,6])
nR_S1_1 = num2cell(nR_S1_1, 1)
nR_S1_1 = cell2struct(nR_S1_1, 'counts', 1)

nR_S2_1 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nR_S2_SciRep62_2.mat')
nR_S2_1 = nR_S2_1(1).x
nR_S2_1 = mat2cell(nR_S2_1,ones(1,62),[6,6])
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
hdi_95 = calc_HDI(sampleDiff(:), .95) % -0.18 - -0.011
hdi_89 = calc_HDI(sampleDiff(:), .89) % -0.1678 - -0.029
hdi_88 = calc_HDI(sampleDiff(:), .88) % -0.17 - -0.031
ci = calc_CI(sampleDiff(:));
fprintf(('\n Mratio session values = %.2f and %.2f'), exp(hierarchical_metamem_Val.mu_logMratio(1)), exp(hierarchical_metamem_Val.mu_logMratio(2))) %0.06 [Neg], 0.16 [Neut]
fprintf(['\n Estimated difference in Mratio between sessions: ', num2str(exp(hierarchical_metamem_Val.mu_logMratio(1)) - exp(hierarchical_metamem_Val.mu_logMratio(2)))]) %-0.0974

%Plot HDI difference in log-ratio units
plotSamples(sampleDiff)

%Calculate Correlation
disp("rho")
hierarchical_metamem_Val.rho %061

% d'
disp("d'_Neg")
median(hierarchical_metamem_Val.d1(:,1)) %Average d'; (2.42)
std(hierarchical_metamem_Val.d1(:,1)) % 0.81
disp("HDI_d'_Neg")
calc_HDI(hierarchical_metamem_Val.d1(:,1), .95) % 1.073; 4.21
calc_HDI(hierarchical_metamem_Val.d1(:,1), .89) % 1.04; 3.8

disp("d'_Neut")
median(hierarchical_metamem_Val.d1(:,2)) %Average d'; (2.09)
std(hierarchical_metamem_Val.d1(:,2)) % 0.46
disp("HDI_d'_Neut")
calc_HDI(hierarchical_metamem_Val.d1(:,2), .95) % 1.11; 2.84
calc_HDI(hierarchical_metamem_Val.d1(:,2), .89) % 1.30; 2.84

% c (bias)
disp("c1_Neg")
median(hierarchical_metamem_Val.c1(:,1)) %Average c'; (-0.20) conservative responds 'yes' less than an ideal observer would
std(hierarchical_metamem_Val.c1(:,1)) % 0.29
disp("HDI_c1_Neg")
calc_HDI(hierarchical_metamem_Val.c1(:,1), .95) % -0.82; 0.24
calc_HDI(hierarchical_metamem_Val.c1(:,1), .89) % -0.82; 0.00

disp("c1_Neut")
median(hierarchical_metamem_Val.c1(:,2)) %Average c'; (-.47) conservative bias responds yes less than an ideal observer would
std(hierarchical_metamem_Val.c1(:,2)) % 0.31
disp("HDI_c1_Neut")
calc_HDI(hierarchical_metamem_Val.c1(:,2), .95) % -1.03; 0.066
calc_HDI(hierarchical_metamem_Val.c1(:,2), .89) % -0.86; 0.066

%M ratio
disp("Mratio_Neg")
median(hierarchical_metamem_Val.Mratio(:,1)) %Average meta-d'/d'; (0.078)
std(hierarchical_metamem_Val.Mratio(:,1)) %0.017
calc_HDI(hierarchical_metamem_Val.Mratio(:,1), .95) % 0.06; 0.1
calc_HDI(hierarchical_metamem_Val.Mratio(:,1), .89) % 0.063; 0.096

disp("Mratio_Neut")
median(hierarchical_metamem_Val.Mratio(:,2)) %Average meta-d'/d'; (0.18)
std(hierarchical_metamem_Val.Mratio(:,2)) % 0.022
calc_HDI(hierarchical_metamem_Val.Mratio(:,2), .95) % 0.14; 0.23
calc_HDI(hierarchical_metamem_Val.Mratio(:,2), .89) % 0.15; 0.22

%Calculate the difference between Metacognition conditions
sampleDiff = exp(hierarchical_metamem_Val.mcmc.samples.mu_logMratio(:,:,1)) - exp(hierarchical_metamem_Val.mcmc.samples.mu_logMratio(:,:,2)) 
median(sampleDiff(:)) %Average meta-d'/d'; (-0.1)
std(sampleDiff(:)) % 0.043
hdi = calc_HDI(sampleDiff(:), .89) %-0.17, -0.029
