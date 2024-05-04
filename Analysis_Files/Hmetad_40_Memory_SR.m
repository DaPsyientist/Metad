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
%19
nR_S1_1 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nR_S1_40_SR_Mem_1.mat')
nR_S1_1 = nR_S1_1(1).x
nR_S1_1 = mat2cell(nR_S1_1,ones(1,40),[6,6])
nR_S1_1 = num2cell(nR_S1_1, 1)
nR_S1_1 = cell2struct(nR_S1_1, 'counts', 1)
nR_S2_1 = load('/Users/jcast/Desktop/Grad School/G4/Metad_40/nR_S2_40_SR_Mem_2.mat')
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
plotSamples(exp(hierarchical_metamem_Val_Src.mcmc.samples.mu_logMratio(:)))

%Deviance
hierarchical_metamem_Val.mcmc.dic %2.16 x 10 ^ 3


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





% ANALYSIS
% Compute HDI of difference in log-ratio
sampleDiff = exp(hierarchical_metamem_Val.mcmc.samples.mu_logMratio(:,:,1)) - exp(hierarchical_metamem_Val.mcmc.samples.mu_logMratio(:,:,2));
hdi = calc_HDI(sampleDiff(:), .89);
fprintf(('\n Mratio session values = %.2f and %.2f'), exp(hierarchical_metamem_Val.mu_logMratio(1)), exp(hierarchical_metamem_Val.mu_logMratio(2))); %0.64 [Item], 0.14 [Source]
fprintf(['\n Estimated difference in Mratio between sessions: ', num2str(exp(hierarchical_metamem_Val.mu_logMratio(1)) - exp(hierarchical_metamem_Val.mu_logMratio(2)))]) %0.5
fprintf(['\n HDI on difference in log(Mratio): ', num2str(hdi) '\n\n']) %0.28, 0.66

%Plot HDI difference in log-ratio units
plotSamples(exp(hierarchical_metamem_Val.mcmc.samples.mu_logMratio(:,:,1)))
plotSamples(exp(hierarchical_metamem_Val.mcmc.samples.mu_logMratio(:,:,2)))
plotSamples(sampleDiff)

%Calculate Correlation
disp("rho")
hierarchical_metamem_Val.rho %-.25

% d'
disp("d1_Item")
mean(hierarchical_metamem_Val.d1(:,1)) %Average d'; (2.25)
disp("HDI_d1_Item")
calc_HDI(hierarchical_metamem_Val.d1(:,1)) % 1.04; 3.22
disp("CI_d1_Item")
calc_CI(hierarchical_metamem_Val.d1(:,1)) % 1.12; 3.22
prctile(hierarchical_metamem_Val.d1(:,1), [5.5, 94.5]) %89% CrI (1.31, 3.2)

disp("d1_Source")
mean(hierarchical_metamem_Val.d1(:,2)) %Average d'; (.80)
disp("HDI_d1_Source")
calc_HDI(hierarchical_metamem_Val.d1(:,2)) % -0.094; 2.47
disp("CI_d1_Source")
calc_CI(hierarchical_metamem_Val.d1(:,2)) % -0.064; 2.29
prctile(hierarchical_metamem_Val.d1(:,2), [5.5, 94.5]) %89% CrI (0.00, 1.9)

% c (bias)
disp("c1_Item")
mean(hierarchical_metamem_Val.c1(:,1)) %Average c'; (-0.42) conservative responds 'yes' less than an ideal observer would
disp("HDI_c1_Item")
calc_HDI(hierarchical_metamem_Val.c1(:,1)) % -0.94; 0.00
disp("CI_c1_Item")
calc_CI(hierarchical_metamem_Val.c1(:,1)) % -0.9; -0.03

disp("c1_Source")
mean(hierarchical_metamem_Val.c1(:,2)) %Average c'; (-.37) conservative bias responds yes less than an ideal observer would
disp("HDI_c1_Source")
calc_HDI(hierarchical_metamem_Val.c1(:,2)) % 0.03; 1.14
disp("CI_c1_Source")
calc_CI(hierarchical_metamem_Val.c1(:,2)) % 0.03; 1.04
Val_CI_diff =hierarchical_metamem_Val.mcmc.samples.c1(:,:,1) - hierarchical_metamem_Val.mcmc.samples.c1(:,:,2)
hdi_C1diff = calc_HDI(Val_CI_diff(:)) %0.42

%M ratio
disp("Mratio_Item")
median(hierarchical_metamem_Val.Mratio(:,1)) %Average meta-d'/d'; (0.62); median = 0.6
calc_HDI(hierarchical_metamem_Val.Mratio(:,1)) % 0.45; 0.88
prctile(hierarchical_metamem_Val.Mratio(:,1), [5.5, 94.5]) %89% CrI (0.47, 0.84)


disp("Mratio_Neut")
median(hierarchical_metamem_Val.Mratio(:,2)) %Average meta-d'/d'; (0.53); median = 0.311
calc_HDI(hierarchical_metamem_Val.Mratio(:,2)) % 0.13; 4.88
prctile(hierarchical_metamem_Val.Mratio(:,2), [5.5, 94.5]) %89% CrI (0.16, 1.03)


sampleDiff = exp(hierarchical_metamem_Val.mcmc.samples.mu_logMratio(:,:,1)) - exp(hierarchical_metamem_Val.mcmc.samples.mu_logMratio(:,:,2)) 
%mean = 0.35 (0.12)
hdi = calc_HDI(sampleDiff(:))%0.10, 0.58
ci = calc_CI(sampleDiff(:)) %0.077, 0.56
quantile(sampleDiff(:), [0.055, 0.945]) %Significant at 89% confidence (0.13, 0.53)