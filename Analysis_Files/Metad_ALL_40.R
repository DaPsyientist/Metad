#### Data Cleaning and Prep #### 

### Load packages ###
if (!require("pacman")) {install.packages("pacman"); require("pacman")}
p_load(ggplot2, tidyr, tidyverse, sjPlot, performance, effects, 
       ggpubr, rstudioapi, R.matlab, car, brm, dplyr, brms, bayestestR)

### Loading and Cleaning Data ###
# Note: For this script to work, the data for encoding, subjectives, and recognition must be in
#   the same folder as this script
current_path <- getActiveDocumentContext()$path    # gets path for this R script
setwd(dirname(current_path)) # sets working directory to folder this R script is in

#Load Encoding Data (N=40)
E_115 <- read.csv("115_E.csv", header = TRUE)
E_119 <- read.csv("119_E.csv", header = TRUE)
E_120 <- read.csv("120_E.csv", header = TRUE)
E_124 <- read.csv("124_E.csv", header = TRUE)
E_126 <- read.csv("126_E.csv", header = TRUE)
E_129 <- read.csv("129_E.csv", header = TRUE)
E_130 <- read.csv("130_E.csv", header = TRUE)
E_131 <- read.csv("131_E.csv", header = TRUE)
E_132 <- read.csv("132_E.csv", header = TRUE)
E_133 <- read.csv("133_E.csv", header = TRUE)
E_134 <- read.csv("134_E.csv", header = TRUE)
E_138 <- read.csv("138_E.csv", header = TRUE)
E_139 <- read.csv("139_E.csv", header = TRUE)
E_140 <- read.csv("140_E.csv", header = TRUE)
E_141 <- read.csv("141_E.csv", header = TRUE)
E_142 <- read.csv("142_E.csv", header = TRUE)
E_143 <- read.csv("143_E.csv", header = TRUE)
E_147 <- read.csv("147_E.csv", header = TRUE)
E_149 <- read.csv("149_E.csv", header = TRUE)
E_152 <- read.csv("152_E.csv", header = TRUE)
E_157 <- read.csv("157_E.csv", header = TRUE)
E_162 <- read.csv("162_E.csv", header = TRUE)
E_165 <- read.csv("165_E.csv", header = TRUE)
E_167 <- read.csv("167_E.csv", header = TRUE)
E_172 <- read.csv("172_E.csv", header = TRUE)
E_182 <- read.csv("182_E.csv", header = TRUE)
E_184 <- read.csv("184_E.csv", header = TRUE)
E_186 <- read.csv("186_E.csv", header = TRUE)
E_188 <- read.csv("188_E.csv", header = TRUE)
E_192 <- read.csv("192_E.csv", header = TRUE)
E_193 <- read.csv("193_E.csv", header = TRUE)
E_195 <- read.csv("195_E.csv", header = TRUE)
E_197 <- read.csv("197_E.csv", header = TRUE)
E_203 <- read.csv("203_E.csv", header = TRUE)
E_204 <- read.csv("204_E.csv", header = TRUE)
E_209 <- read.csv("209_E.csv", header = TRUE)
E_215 <- read.csv("215_E.csv", header = TRUE)
E_218 <- read.csv("218_E.csv", header = TRUE)
E_219 <- read.csv("219_E.csv", header = TRUE)
E_220 <- read.csv("220_E.csv", header = TRUE)
E_221 <- read.csv("221_E.csv", header = TRUE)
E_223 <- read.csv("223_E.csv", header = TRUE)
E_224 <- read.csv("224_E.csv", header = TRUE)
E_226 <- read.csv("226_E.csv", header = TRUE)
E_227 <- read.csv("227_E.csv", header = TRUE)
E_228 <- read.csv("228_E.csv", header = TRUE)
E_231 <- read.csv("231_E.csv", header = TRUE)
E_232 <- read.csv("232_E.csv", header = TRUE)
E_233 <- read.csv("233_E.csv", header = TRUE)
E_237 <- read.csv("237_E.csv", header = TRUE)
E_238 <- read.csv("238_E.csv", header = TRUE)
E_241 <- read.csv("241_E.csv", header = TRUE)
E_243 <- read.csv("243_E.csv", header = TRUE)
E_244 <- read.csv("244_E.csv", header = TRUE)
E_249 <- read.csv("249_E.csv", header = TRUE)
E_250 <- read.csv("250_E.csv", header = TRUE)
E_252 <- read.csv("252_E.csv", header = TRUE)
E_253 <- read.csv("253_E.csv", header = TRUE)
E_255 <- read.csv("255_E.csv", header = TRUE)
E_258 <- read.csv("258_E.csv", header = TRUE)
E_259 <- read.csv("259_E.csv", header = TRUE)
E_260 <- read.csv("260_E.csv", header = TRUE)
E_261 <- read.csv("261_E.csv", header = TRUE)
E_262 <- read.csv("262_E.csv", header = TRUE)
E_263 <- read.csv("263_E.csv", header = TRUE)
E_264 <- read.csv("264_E.csv", header = TRUE)
E_268 <- read.csv("268_E.csv", header = TRUE)
E_271 <- read.csv("271_E.csv", header = TRUE)
E_274 <- read.csv("274_E.csv", header = TRUE)
E_280 <- read.csv("280_E.csv", header = TRUE)
E_281 <- read.csv("281_E.csv", header = TRUE)
E_282 <- read.csv("282_E.csv", header = TRUE)
E_283 <- read.csv("283_E.csv", header = TRUE)
E_284 <- read.csv("284_E.csv", header = TRUE)



#Load in Recognition Data (N=40)
R_115 <- read.csv("115_R.csv", header = TRUE)
R_119 <- read.csv("119_R.csv", header = TRUE)
R_120 <- read.csv("120_R.csv", header = TRUE)
R_124 <- read.csv("124_R.csv", header = TRUE)
R_126 <- read.csv("126_R.csv", header = TRUE)
R_129 <- read.csv("129_R.csv", header = TRUE)
R_130 <- read.csv("130_R.csv", header = TRUE)
R_131 <- read.csv("131_R.csv", header = TRUE)
R_132 <- read.csv("132_R.csv", header = TRUE)
R_133 <- read.csv("133_R.csv", header = TRUE)
R_134 <- read.csv("134_R.csv", header = TRUE)
R_138 <- read.csv("138_R.csv", header = TRUE)
R_139 <- read.csv("139_R.csv", header = TRUE)
R_140 <- read.csv("140_R.csv", header = TRUE)
R_141 <- read.csv("141_R.csv", header = TRUE)
R_142 <- read.csv("142_R.csv", header = TRUE)
R_143 <- read.csv("143_R.csv", header = TRUE)
R_147 <- read.csv("147_R.csv", header = TRUE)
R_149 <- read.csv("149_R.csv", header = TRUE)
R_152 <- read.csv("152_R.csv", header = TRUE)
R_157 <- read.csv("157_R.csv", header = TRUE)
R_162 <- read.csv("162_R.csv", header = TRUE)
R_165 <- read.csv("165_R.csv", header = TRUE)
R_167 <- read.csv("167_R.csv", header = TRUE)
R_172 <- read.csv("172_R.csv", header = TRUE)
R_182 <- read.csv("182_R.csv", header = TRUE)
R_184 <- read.csv("184_R.csv", header = TRUE)
R_186 <- read.csv("186_R.csv", header = TRUE)
R_188 <- read.csv("188_R.csv", header = TRUE)
R_192 <- read.csv("192_R.csv", header = TRUE)
R_193 <- read.csv("193_R.csv", header = TRUE)
R_195 <- read.csv("195_R.csv", header = TRUE)
R_197 <- read.csv("197_R.csv", header = TRUE)
R_203 <- read.csv("203_R.csv", header = TRUE)
R_204 <- read.csv("204_R.csv", header = TRUE)
R_209 <- read.csv("209_R.csv", header = TRUE)
R_215 <- read.csv("215_R.csv", header = TRUE)
R_218 <- read.csv("218_R.csv", header = TRUE)
R_219 <- read.csv("219_R.csv", header = TRUE)
R_220 <- read.csv("220_R.csv", header = TRUE)
R_221 <- read.csv("221_R.csv", header = TRUE)
R_223 <- read.csv("223_R.csv", header = TRUE)
R_224 <- read.csv("224_R.csv", header = TRUE)
R_226 <- read.csv("226_R.csv", header = TRUE)
R_227 <- read.csv("227_R.csv", header = TRUE)
R_228 <- read.csv("228_R.csv", header = TRUE)
R_231 <- read.csv("231_R.csv", header = TRUE)
R_232 <- read.csv("232_R.csv", header = TRUE)
R_233 <- read.csv("233_R.csv", header = TRUE)
R_237 <- read.csv("237_R.csv", header = TRUE)
R_238 <- read.csv("238_R.csv", header = TRUE)
R_241 <- read.csv("241_R.csv", header = TRUE)
R_243 <- read.csv("243_R.csv", header = TRUE)
R_244 <- read.csv("244_R.csv", header = TRUE)
R_249 <- read.csv("249_R.csv", header = TRUE)
R_250 <- read.csv("250_R.csv", header = TRUE)
R_252 <- read.csv("252_R.csv", header = TRUE)
R_253 <- read.csv("253_R.csv", header = TRUE)
R_255 <- read.csv("255_R.csv", header = TRUE)
R_258 <- read.csv("258_R.csv", header = TRUE)
R_259 <- read.csv("259_R.csv", header = TRUE)
R_260 <- read.csv("260_R.csv", header = TRUE)
R_261 <- read.csv("261_R.csv", header = TRUE)
R_262 <- read.csv("262_R.csv", header = TRUE)
R_263 <- read.csv("263_R.csv", header = TRUE)
R_264 <- read.csv("264_R.csv", header = TRUE)
R_268 <- read.csv("268_R.csv", header = TRUE)
R_271 <- read.csv("271_R.csv", header = TRUE)
R_274 <- read.csv("274_R.csv", header = TRUE)
R_280 <- read.csv("280_R.csv", header = TRUE)
R_281 <- read.csv("281_R.csv", header = TRUE)
R_282 <- read.csv("282_R.csv", header = TRUE)
R_283 <- read.csv("283_R.csv", header = TRUE)
R_284 <- read.csv("284_R.csv", header = TRUE)

#Load Subjective Questionnaire Data (N=40)
Subj_1 <- read.csv("DemVVIQBPQ_40.csv", header = TRUE)

## Subjective Questionnaires ##
#Calculate subscale scores
SubQs_data <- Subj_1 %>% 
  mutate(BA_scores = BPQ_1_Swallow + BPQ_2_UrgeCough + BPQ_3_MouthDry+ BPQ_4_FastDeath+ BPQ_5_TearyEyes+ BPQ_6_DigestionNoises+ BPQ_7_SwollenBody+
           BPQ_8_UrgeDefecate+ BPQ_9_TenseArms+ BPQ_10_Bloated+ BPQ_11_FaceTension+ BPQ_12_Goosebumps+ BPQ_13_StomachPains+ BPQ_14_StomachDistention+
           BPQ_15_PalmsSweating+ BPQ_16_ForeheadSweat+ BPQ_17_LipTremors+ BPQ_18_ArmpitSweat+ BPQ_19_FaceTemp+ BPQ_20_GrindingTeeth+ BPQ_21_Jitteriness+ 
           BPQ_22_NeckHair+ BPQ_23_DifficultyFocusing+ BPQ_24_UrgeSwallow+ BPQ_25_HeartBeating+ BPQ_26_Constipated) %>%
  mutate(SupraD_Scores = BPQ_27_DifficultyCoordination + BPQ_28_TalkingEating + BPQ_29_IrregularHeartbeat + BPQ_30_FoodDry + BPQ_31_ShortBreath +
           BPQ_32_BreathTalk + BPQ_33_SwallowBreath + BPQ_34_PersistentCough + BPQ_35_GagSaliva + BPQ_36_ChestPain + BPQ_37_GagEat + BPQ_38_CoughSwallow + 
           BPQ_39_CoughOxygen + BPQ_40_EyeControl + BPQ_41_Vomiting) %>%
  mutate(SubD_Scores = BPQ_41_Vomiting + BPQ_42_SourTummy + BPQ_43_Constipated + BPQ_44_Indigestion + BPQ_45_DigestiveProblems + BPQ_46_Diarrhea) %>%
  mutate(VVIQ_Scores = VVIQ_1 + VVIQ_2 + VVIQ_3 + VVIQ_4 + VVIQ_5 + VVIQ_6 + VVIQ_7 + VVIQ_8 + VVIQ_9 + VVIQ_10 + VVIQ_11 + VVIQ_12 + VVIQ_13 + VVIQ_14 + VVIQ_15 + VVIQ_16) %>%
  mutate(Auto_Rct = SubD_Scores+SupraD_Scores)

## Encoding ##
#Define variables of interest 
VOI_Enc <- c("participant", "Encoding_Resp.corr")

#Select Encoding Variables of Interest for each participant, and remove training data
VOI_E_115 <- E_115 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_115 <- na.omit(VOI_E_115)[-c(1:8),]
VOI_E_119 <- E_119 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_119 <- na.omit(VOI_E_119)[-c(1:8),]
VOI_E_120 <- E_120 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_120 <- na.omit(VOI_E_120)[-c(1:8),]
VOI_E_124 <- E_124 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_124 <- na.omit(VOI_E_124)[-c(1:8),]
VOI_E_126 <- E_126 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_126 <- na.omit(VOI_E_126)[-c(1:8),]
VOI_E_129 <- E_129 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_129 <- na.omit(VOI_E_129)[-c(1:8),]
VOI_E_130 <- E_130 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_130 <- na.omit(VOI_E_130)[-c(1:8),]
VOI_E_131 <- E_131 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_131 <- na.omit(VOI_E_131)[-c(1:8),]
VOI_E_132 <- E_132 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_132 <- na.omit(VOI_E_132)[-c(1:8),]
VOI_E_133 <- E_133 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_133 <- na.omit(VOI_E_133)[-c(1:8),]
VOI_E_134 <- E_134 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_134 <- na.omit(VOI_E_134)[-c(1:8),]
VOI_E_138 <- E_138 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_138 <- na.omit(VOI_E_138)[-c(1:8),]
VOI_E_139 <- E_139 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_139 <- na.omit(VOI_E_139)[-c(1:8),]
VOI_E_140 <- E_140 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_140 <- na.omit(VOI_E_140)[-c(1:8),]
VOI_E_141 <- E_141 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_141 <- na.omit(VOI_E_141)[-c(1:8),]
VOI_E_142 <- E_142 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_142 <- na.omit(VOI_E_142)[-c(1:8),]
VOI_E_143 <- E_143 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_143 <- na.omit(VOI_E_143)[-c(1:8),]
VOI_E_147 <- E_147 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_147 <- na.omit(VOI_E_147)[-c(1:8),]
VOI_E_149 <- E_149 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_149 <- na.omit(VOI_E_149)[-c(1:8),]
VOI_E_152 <- E_152 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_152 <- na.omit(VOI_E_152)[-c(1:8),]
VOI_E_157 <- E_157 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_157 <- na.omit(VOI_E_157)[-c(1:8),]
VOI_E_162 <- E_162 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_162 <- na.omit(VOI_E_162)[-c(1:8),]
VOI_E_165 <- E_165 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_165 <- na.omit(VOI_E_165)[-c(1:8),]
VOI_E_167 <- E_167 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_167 <- na.omit(VOI_E_167)[-c(1:8),]
VOI_E_172 <- E_172 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_172 <- na.omit(VOI_E_172)[-c(1:8),]
VOI_E_182 <- E_182 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_182 <- na.omit(VOI_E_182)[-c(1:8),]
VOI_E_184 <- E_184 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_184 <- na.omit(VOI_E_184)[-c(1:8),]
VOI_E_186 <- E_186 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_186 <- na.omit(VOI_E_186)[-c(1:8),]
VOI_E_188 <- E_188 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_188 <- na.omit(VOI_E_188)[-c(1:8),]
VOI_E_192 <- E_192 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_192 <- na.omit(VOI_E_192)[-c(1:8),]
VOI_E_193 <- E_193 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_193 <- na.omit(VOI_E_193)[-c(1:8),]
VOI_E_195 <- E_195 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_195 <- na.omit(VOI_E_195)[-c(1:8),]
VOI_E_197 <- E_197 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_197 <- na.omit(VOI_E_197)[-c(1:8),]
VOI_E_203 <- E_203 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_203 <- na.omit(VOI_E_203)[-c(1:8),]
VOI_E_204 <- E_204 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_204 <- na.omit(VOI_E_204)[-c(1:8),]
VOI_E_209 <- E_209 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_209 <- na.omit(VOI_E_209)[-c(1:8),]
VOI_E_215 <- E_215 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_215 <- na.omit(VOI_E_215)[-c(1:8),]
VOI_E_218 <- E_218 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_218 <- na.omit(VOI_E_218)[-c(1:8),]
VOI_E_219 <- E_219 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_219 <- na.omit(VOI_E_219)[-c(1:8),]
VOI_E_220 <- E_220 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_220 <- na.omit(VOI_E_220)[-c(1:8),]
VOI_E_221 <- E_221 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_221 <- na.omit(VOI_E_221)[-c(1:8),]
VOI_E_223 <- E_223 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_223 <- na.omit(VOI_E_223)[-c(1:8),]
VOI_E_224 <- E_224 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_224 <- na.omit(VOI_E_224)[-c(1:8),]
VOI_E_226 <- E_226 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_226 <- na.omit(VOI_E_226)[-c(1:8),]
VOI_E_227 <- E_227 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_227 <- na.omit(VOI_E_227)[-c(1:8),]
VOI_E_228 <- E_228 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_228 <- na.omit(VOI_E_228)[-c(1:8),]
VOI_E_231 <- E_231 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_231 <- na.omit(VOI_E_231)[-c(1:8),]
VOI_E_232 <- E_232 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_232 <- na.omit(VOI_E_232)[-c(1:8),]
VOI_E_233 <- E_233 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_233 <- na.omit(VOI_E_233)[-c(1:8),]
VOI_E_237 <- E_237 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_237 <- na.omit(VOI_E_237)[-c(1:8),]
VOI_E_238 <- E_238 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_238 <- na.omit(VOI_E_238)[-c(1:8),]
VOI_E_241 <- E_241 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_241 <- na.omit(VOI_E_241)[-c(1:8),]
VOI_E_243 <- E_243 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_243 <- na.omit(VOI_E_243)[-c(1:8),]
VOI_E_244 <- E_244 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_244 <- na.omit(VOI_E_244)[-c(1:8),]
VOI_E_249 <- E_249 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_249 <- na.omit(VOI_E_249)[-c(1:8),]
VOI_E_250 <- E_250 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_250 <- na.omit(VOI_E_250)[-c(1:8),]
VOI_E_252 <- E_252 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_252 <- na.omit(VOI_E_252)[-c(1:8),]
VOI_E_253 <- E_253 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_253 <- na.omit(VOI_E_253)[-c(1:8),]
VOI_E_255 <- E_255 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_255 <- na.omit(VOI_E_255)[-c(1:8),]
VOI_E_258 <- E_258 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_258 <- na.omit(VOI_E_258)[-c(1:8),]
VOI_E_259 <- E_259 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_259 <- na.omit(VOI_E_259)[-c(1:8),]
VOI_E_260 <- E_260 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_260 <- na.omit(VOI_E_260)[-c(1:8),]
VOI_E_261 <- E_261 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_261 <- na.omit(VOI_E_261)[-c(1:8),]
VOI_E_262 <- E_262 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_262 <- na.omit(VOI_E_262)[-c(1:8),]
VOI_E_263 <- E_263 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_263 <- na.omit(VOI_E_263)[-c(1:8),]
VOI_E_264 <- E_264 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_264 <- na.omit(VOI_E_264)[-c(1:8),]
VOI_E_268 <- E_268 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_268 <- na.omit(VOI_E_268)[-c(1:8),]
VOI_E_271 <- E_271 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_271 <- na.omit(VOI_E_271)[-c(1:8),]
VOI_E_274 <- E_274 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_274 <- na.omit(VOI_E_274)[-c(1:8),]
VOI_E_280 <- E_280 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_280 <- na.omit(VOI_E_280)[-c(1:8),]
VOI_E_281 <- E_281 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_281 <- na.omit(VOI_E_281)[-c(1:8),]
VOI_E_282 <- E_282 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_282 <- na.omit(VOI_E_282)[-c(1:8),]
VOI_E_283 <- E_283 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_283 <- na.omit(VOI_E_283)[-c(1:8),]
VOI_E_284 <- E_284 %>% dplyr::select(all_of(VOI_Enc)); VOI_E_284 <- na.omit(VOI_E_284)[-c(1:8),]

#Join dataframes together
E_Data1 <- VOI_E_115  %>% full_join(VOI_E_119) %>% full_join(VOI_E_120) %>%  full_join(VOI_E_124) %>% 
  full_join(VOI_E_126) %>% full_join(VOI_E_129) %>% full_join(VOI_E_130) %>% full_join(VOI_E_131) %>%
  full_join(VOI_E_132) %>% full_join(VOI_E_133) %>% full_join(VOI_E_134) %>% full_join(VOI_E_138) %>% 
  full_join(VOI_E_139) %>% full_join(VOI_E_140) %>% full_join(VOI_E_141) %>% full_join(VOI_E_142) %>% 
  full_join(VOI_E_143) %>% full_join(VOI_E_147) %>% full_join(VOI_E_149) %>% full_join(VOI_E_152) %>% 
  full_join(VOI_E_157) %>% full_join(VOI_E_162) %>% full_join(VOI_E_165) %>% full_join(VOI_E_167) %>%
  full_join(VOI_E_172) %>% full_join(VOI_E_182) %>% full_join(VOI_E_184) %>% full_join(VOI_E_186) %>%
  full_join(VOI_E_188) %>% full_join(VOI_E_192) %>% full_join(VOI_E_193) %>% full_join(VOI_E_195) %>%
  full_join(VOI_E_197) %>% full_join(VOI_E_203) %>% full_join(VOI_E_204) %>% full_join(VOI_E_209) %>%
  full_join(VOI_E_215) %>% full_join(VOI_E_218) %>% full_join(VOI_E_219) %>% full_join(VOI_E_220) %>%
  full_join(VOI_E_221) %>% full_join(VOI_E_223) %>% full_join(VOI_E_224) %>% full_join(VOI_E_226) %>% 
  full_join(VOI_E_227) %>% full_join(VOI_E_228) %>% full_join(VOI_E_231) %>% full_join(VOI_E_232) %>%
  full_join(VOI_E_233) %>% full_join(VOI_E_237) %>% full_join(VOI_E_238) %>% full_join(VOI_E_241) %>% 
  full_join(VOI_E_243) %>% full_join(VOI_E_244) %>% full_join(VOI_E_249) %>% full_join(VOI_E_250) %>% 
  full_join(VOI_E_252) %>% full_join(VOI_E_253) %>% full_join(VOI_E_255) %>% full_join(VOI_E_258) %>%
  full_join(VOI_E_259) %>% full_join(VOI_E_260) %>% full_join(VOI_E_261) %>% full_join(VOI_E_262) %>% 
  full_join(VOI_E_263) %>% full_join(VOI_E_264) %>% full_join(VOI_E_268) %>% full_join(VOI_E_271) %>% 
  full_join(VOI_E_274) %>% full_join(VOI_E_280) %>% full_join(VOI_E_281) %>% full_join(VOI_E_282) %>% 
  full_join(VOI_E_283) %>% full_join(VOI_E_284) 

  
#Rename response column names
names(E_Data1)[names(E_Data1) == "Encoding_Resp.corr"] <- "Resp_Corr" #Rename column


## Item Recognition ##
#Combine Recognition Data
R_Data1 <- R_115  %>% full_join(R_119) %>% full_join(R_120) %>%  full_join(R_124) %>% 
  full_join(R_126) %>% full_join(R_129) %>% full_join(R_130) %>% full_join(R_131) %>%
  full_join(R_132) %>% full_join(R_133) %>% full_join(R_134) %>% full_join(R_138) %>% 
  full_join(R_139) %>% full_join(R_140) %>% full_join(R_141) %>% full_join(R_142) %>% 
  full_join(R_143) %>% full_join(R_147) %>% full_join(R_149) %>% full_join(R_152) %>% 
  full_join(R_157) %>% full_join(R_162) %>% full_join(R_165) %>% full_join(R_167) %>%
  full_join(R_172) %>% full_join(R_182) %>% full_join(R_184) %>% full_join(R_186) %>%
  full_join(R_188) %>% full_join(R_192) %>% full_join(R_193) %>% full_join(R_195) %>%
  full_join(R_197) %>% full_join(R_203) %>% full_join(R_204) %>% full_join(R_209) %>%
  full_join(R_215) %>% full_join(R_218) %>% full_join(R_219) %>% full_join(R_220) %>%
  full_join(R_221) %>% full_join(R_223) %>% full_join(R_224) %>% full_join(R_226) %>% 
  full_join(R_227) %>% full_join(R_228) %>% full_join(R_231) %>% full_join(R_232) %>% 
  full_join(R_233) %>% full_join(R_237) %>% full_join(R_238) %>% full_join(R_241) %>%
  full_join(R_243) %>% full_join(R_244) %>% full_join(R_249) %>% full_join(R_250) %>% 
  full_join(R_252) %>% full_join(R_253) %>% full_join(R_255) %>% full_join(R_258) %>% 
  full_join(R_259) %>% full_join(R_260) %>% full_join(R_261) %>% full_join(R_262) %>% 
  full_join(R_263) %>% full_join(R_264) %>% full_join(R_268) %>% full_join(R_271) %>% 
  full_join(R_274) %>% full_join(R_280) %>% full_join(R_281) %>% full_join(R_282) %>% 
  full_join(R_283) %>% full_join(R_284)                   
  
#Define vector of relevant variables for item responses
VOI_Itm <- c("participant", "Rec_Scene")
VOI_Item <- c("participant", "Item_Mem_Response", "Item_Conf_Response")

#Select relevant variables
Item_1 <- R_Data1 %>% dplyr::select(all_of(VOI_Item))
Item_1 <- na.omit(Item_1)
ItmOrder <- R_Data1 %>% dplyr::select(all_of(VOI_Itm)) %>% filter(Rec_Scene != "") #pull out the order of images
Item_recognition <- as.data.frame(c(Item_1, ItmOrder["Rec_Scene"])) #Add image information

#Split into even and odd numbered participants
Even_I <- Item_recognition %>% filter(participant %in% c(120, 124, 126, 130, 132, 134, 138, 140, 142, 152, 162, 172, 182, 184, 186, 188, 192, 204, 218, 220, 224, 226, 228, 232, 238, 244, 250, 252, 258, 260, 262, 264, 268, 274, 280, 282,  284))
Odd_I <- Item_recognition %>% filter(participant %in% c(115, 119, 129, 131, 133, 139, 141, 143, 147, 149, 157, 165, 167, 193, 195, 197, 203, 209, 215, 219, 221, 223, 227, 231, 233, 237, 241, 243, 249, 253, 255, 259, 261, 263, 271, 281, 283))

#Load Answer Keys
Odd_key <- read.csv("C1_recognition.csv", header = TRUE) #Odd number answer key
Even_key <- read.csv("C2_recognition.csv", header = TRUE) #Even number answer key
names(Odd_key)[names(Odd_key) == "Stim"] <- "Rec_Scene" #Rename columns to merge
names(Even_key)[names(Even_key) == "Stim"] <- "Rec_Scene" #Rename columns to merge

#Define the variables of interest for odd and even dataframes
VOI_OE <- c("participant", "Item_Mem_Response", "Item_Conf_Response", "Rec_Scene")

#Combine participant data with answer key
Item_Odd_Data <- Odd_I %>% dplyr::select(all_of(VOI_OE)) %>% full_join(Odd_key)
Item_Even_Data <- Even_I %>% dplyr::select(all_of(VOI_OE)) %>% full_join(Even_key)

#Create Dataframes for Signal Detection Theory (ie. categorize responses in confusion matrix)
Item_Even_Data <- Item_Even_Data %>% mutate(ItemRespType = case_when((Pres == 1) & (Item_Mem_Response == 1) ~ 'Hit',
                                                                     (Pres == 0) & (Item_Mem_Response == 1) ~ 'FA',
                                                                     (Pres == 1) & (Item_Mem_Response == 0) ~ 'Miss',
                                                                     (Pres == 0) & (Item_Mem_Response == 0) ~ 'CoRej'))
Item_Even_Data$ItemRespType <- as.factor(Item_Even_Data$ItemRespType)
Item_Odd_Data <- Item_Odd_Data %>% mutate(ItemRespType = case_when((Pres == 1) & (Item_Mem_Response == 1) ~ 'Hit',
                                                                   (Pres == 0) & (Item_Mem_Response == 1) ~ 'FA',
                                                                   (Pres == 1) & (Item_Mem_Response == 0) ~ 'Miss',
                                                                   (Pres == 0) & (Item_Mem_Response == 0) ~ 'CoRej')) 
Item_Odd_Data$ItemRespType <- as.factor(Item_Odd_Data$ItemRespType)
#Combine odd and even dataframes
Item_Cleaned_40 <- Item_Odd_Data %>% full_join(Item_Even_Data) %>% filter(Rec_Scene!="")
Item_Cleaned_40$Rec_Scene = str_sub(Item_Cleaned_40$Rec_Scene, 0,1) #Take the first letter of the photo name string
Item_Cleaned_40$Rec_Scene <- factor(Item_Cleaned_40$Rec_Scene)
Item_Cleaned_40$Rec_Scene <- relevel(Item_Cleaned_40$Rec_Scene, "N")

#Create dataframes for descriptive statistics by dummy coding responses
Item_Even_Anal <- Item_Even_Data %>% mutate(Resp_Cor = case_when((Pres == 1) & (Item_Mem_Response == 1) ~ 1,
                                                                 (Pres == 0) & (Item_Mem_Response == 1) ~ 0,
                                                                 (Pres == 1) & (Item_Mem_Response == 0) ~ 0,
                                                                 (Pres == 0) & (Item_Mem_Response == 0) ~ 1))
Item_Even_Anal$Resp_Cor <- as.numeric(Item_Even_Anal$Resp_Cor)
Item_Odd_Anal <- Item_Odd_Data %>% mutate(Resp_Cor = case_when((Pres == 1) & (Item_Mem_Response == 1) ~ 1,
                                                               (Pres == 0) & (Item_Mem_Response == 1) ~ 0,
                                                               (Pres == 1) & (Item_Mem_Response == 0) ~ 0,
                                                               (Pres == 0) & (Item_Mem_Response == 0) ~ 1)) 
Item_Odd_Anal$Resp_Cor <- as.numeric(Item_Odd_Anal$Resp_Cor)
#Combine Dataframes
Item_Cleaned_Anal_40 <- Item_Odd_Anal %>% full_join(Item_Even_Anal) %>% filter(Rec_Scene!="")
Item_Cleaned_Anal_40$Rec_Scene = str_sub(Item_Cleaned_Anal_40$Rec_Scene, 0,1) #Take the first letter of the photo name string
Item_Cleaned_Anal_40$Rec_Scene <- factor(Item_Cleaned_Anal_40$Rec_Scene)
Item_Cleaned_Anal_40$Rec_Scene <- relevel(Item_Cleaned_Anal_40$Rec_Scene, "N")

## Source Recognition ##
VOI_Source <- c("participant", "Source_Mem_Response", "Source_Conf_Response", "Src_Scene")
VOI_Src <- c("participant", "Src_Scene")

#Select Source Variables of Interest for each participant
#Create function to clean data
preprocess_src <- function(data) {
  VOI_Src <- data %>% dplyr::select(all_of(VOI_Source))
  SrcOrder <- as.data.frame(VOI_Src$Src_Scene[c(FALSE, !is.na(VOI_Src$Source_Mem_Response))])
  colnames(SrcOrder) <- c("Src_Scene")
  VOI_Src <- na.omit(VOI_Src[,1:3])
  VOI_Src_df <- as.data.frame(c(VOI_Src, SrcOrder))
  
  return(VOI_Src_df)
}

#Clean data using function
#Note: Responses are variable across participants as source recognition judgments are dependent
#       on participants initially responding they believe the item is old.
VOI_Src_115_df <- preprocess_src(R_115) # 54 trials
VOI_Src_119_df <- preprocess_src(R_119) # 56 trials
VOI_Src_120_df <- preprocess_src(R_120) # 44 trials
VOI_Src_124_df <- preprocess_src(R_124) # 49 trials
VOI_Src_126_df <- preprocess_src(R_126) # 48 trials
VOI_Src_129_df <- preprocess_src(R_129) # 46 trials
VOI_Src_130_df <- preprocess_src(R_130) # 49 trials
VOI_Src_131_df <- preprocess_src(R_131) # 47 trials
VOI_Src_132_df <- preprocess_src(R_132) # 52 trials
VOI_Src_133_df <- preprocess_src(R_133) # 39 trials
VOI_Src_134_df <- preprocess_src(R_134) # 51 trials
VOI_Src_138_df <- preprocess_src(R_138) # 52 trials
VOI_Src_139_df <- preprocess_src(R_139) # 57 trials
VOI_Src_140_df <- preprocess_src(R_140) # 51 trials
VOI_Src_141_df <- preprocess_src(R_141) # 56 trials
VOI_Src_142_df <- preprocess_src(R_142) # 48 trials
VOI_Src_143_df <- preprocess_src(R_143) # 46 trials
VOI_Src_147_df <- preprocess_src(R_147) # 50 trials
VOI_Src_149_df <- preprocess_src(R_149) # 49 trials
VOI_Src_152_df <- preprocess_src(R_152) # 47 trials
VOI_Src_157_df <- preprocess_src(R_157) # 54 trials
VOI_Src_162_df <- preprocess_src(R_162) # 42 trials
VOI_Src_165_df <- preprocess_src(R_165) # 48 trials
VOI_Src_167_df <- preprocess_src(R_167) # 49 trials
VOI_Src_172_df <- preprocess_src(R_172) # 54 trials
VOI_Src_182_df <- preprocess_src(R_182) # 43 trials
VOI_Src_184_df <- preprocess_src(R_184) # 42 trials
VOI_Src_186_df <- preprocess_src(R_186) # 40 trials
VOI_Src_188_df <- preprocess_src(R_188) # 47 trials
VOI_Src_192_df <- preprocess_src(R_192) # 39 trials
VOI_Src_193_df <- preprocess_src(R_193) # 55 trials
VOI_Src_195_df <- preprocess_src(R_195) # 57 trials
VOI_Src_197_df <- preprocess_src(R_197) # 57 trials
VOI_Src_203_df <- preprocess_src(R_203) # 54 trials
VOI_Src_204_df <- preprocess_src(R_204) # 44 trials
VOI_Src_209_df <- preprocess_src(R_209) # 53 trials
VOI_Src_215_df <- preprocess_src(R_215) # 52 trials
VOI_Src_218_df <- preprocess_src(R_218) # 44 trials
VOI_Src_219_df <- preprocess_src(R_219) # 50 trials
VOI_Src_220_df <- preprocess_src(R_220) # 60 trials
VOI_Src_221_df <- preprocess_src(R_221) # 46 trials
VOI_Src_223_df <- preprocess_src(R_223) # 51 trials
VOI_Src_224_df <- preprocess_src(R_224) # 51 trials
VOI_Src_226_df <- preprocess_src(R_226) # 53 trials
VOI_Src_227_df <- preprocess_src(R_227) # 20 trials
VOI_Src_228_df <- preprocess_src(R_228) # 47 trials
VOI_Src_231_df <- preprocess_src(R_231) # 64 trials
VOI_Src_232_df <- preprocess_src(R_232) # 52 trials
VOI_Src_233_df <- preprocess_src(R_233) # 50 trials
VOI_Src_237_df <- preprocess_src(R_237) # 59 trials
VOI_Src_238_df <- preprocess_src(R_238) # 54 trials
VOI_Src_241_df <- preprocess_src(R_241) # 36 trials
VOI_Src_243_df <- preprocess_src(R_243) # 52 trials
VOI_Src_244_df <- preprocess_src(R_244) # 58 trials
VOI_Src_249_df <- preprocess_src(R_249) # 47 trials
VOI_Src_250_df <- preprocess_src(R_250) # 42 trials
VOI_Src_252_df <- preprocess_src(R_252) # 59 trials
VOI_Src_253_df <- preprocess_src(R_253) # 51 trials
VOI_Src_255_df <- preprocess_src(R_255) # 45 trials
VOI_Src_258_df <- preprocess_src(R_258) # 66 trials
VOI_Src_259_df <- preprocess_src(R_259) # 51 trials
VOI_Src_260_df <- preprocess_src(R_260) # 54 trials
VOI_Src_261_df <- preprocess_src(R_261) # 58 trials
VOI_Src_262_df <- preprocess_src(R_262) # 49 trials
VOI_Src_263_df <- preprocess_src(R_263) # 39 trials
VOI_Src_264_df <- preprocess_src(R_264) # 47 trials
VOI_Src_268_df <- preprocess_src(R_268) # 56 trials
VOI_Src_271_df <- preprocess_src(R_271) # 57 trials
VOI_Src_274_df <- preprocess_src(R_274) # 63 trials
VOI_Src_280_df <- preprocess_src(R_280) # 40 trials
VOI_Src_281_df <- preprocess_src(R_281) # 52 trials
VOI_Src_282_df <- preprocess_src(R_282) # 38 trials
VOI_Src_283_df <- preprocess_src(R_283) # 54 trials
VOI_Src_284_df <- preprocess_src(R_284) # 80 trials


#Combine Source Data frames (N=40)
Cleaned_Source <- VOI_Src_115_df %>% full_join(VOI_Src_119_df) %>% full_join(VOI_Src_120_df) %>% 
  full_join(VOI_Src_124_df) %>% full_join(VOI_Src_126_df) %>% full_join(VOI_Src_129_df) %>% 
  full_join(VOI_Src_130_df) %>% full_join(VOI_Src_131_df) %>% full_join(VOI_Src_132_df) %>% 
  full_join(VOI_Src_133_df) %>% full_join(VOI_Src_134_df) %>% full_join(VOI_Src_138_df) %>%
  full_join(VOI_Src_139_df) %>% full_join(VOI_Src_140_df) %>% full_join(VOI_Src_141_df) %>% 
  full_join(VOI_Src_142_df) %>% full_join(VOI_Src_143_df) %>% full_join(VOI_Src_147_df) %>% 
  full_join(VOI_Src_149_df) %>% full_join(VOI_Src_152_df) %>% full_join(VOI_Src_157_df) %>%
  full_join(VOI_Src_162_df) %>% full_join(VOI_Src_165_df) %>% full_join(VOI_Src_167_df) %>% 
  full_join(VOI_Src_172_df) %>% full_join(VOI_Src_182_df) %>% full_join(VOI_Src_184_df) %>% 
  full_join(VOI_Src_186_df) %>% full_join(VOI_Src_188_df) %>% full_join(VOI_Src_192_df) %>% 
  full_join(VOI_Src_193_df) %>% full_join(VOI_Src_195_df) %>% full_join(VOI_Src_197_df) %>% 
  full_join(VOI_Src_203_df) %>% full_join(VOI_Src_204_df) %>% full_join(VOI_Src_209_df) %>% 
  full_join(VOI_Src_215_df) %>% full_join(VOI_Src_218_df) %>% full_join(VOI_Src_219_df) %>% 
  full_join(VOI_Src_220_df) %>% full_join(VOI_Src_221_df) %>% full_join(VOI_Src_223_df) %>%
  full_join(VOI_Src_224_df) %>% full_join(VOI_Src_226_df) %>% full_join(VOI_Src_227_df) %>%
  full_join(VOI_Src_228_df) %>% full_join(VOI_Src_231_df) %>% full_join(VOI_Src_232_df) %>% 
  full_join(VOI_Src_233_df) %>% full_join(VOI_Src_237_df) %>% full_join(VOI_Src_238_df) %>% 
  full_join(VOI_Src_241_df) %>% full_join(VOI_Src_243_df) %>% full_join(VOI_Src_244_df) %>% 
  full_join(VOI_Src_249_df) %>% full_join(VOI_Src_250_df) %>% full_join(VOI_Src_252_df) %>% 
  full_join(VOI_Src_253_df) %>% full_join(VOI_Src_255_df) %>% full_join(VOI_Src_258_df) %>% 
  full_join(VOI_Src_259_df) %>% full_join(VOI_Src_260_df) %>% full_join(VOI_Src_261_df) %>% 
  full_join(VOI_Src_262_df) %>% full_join(VOI_Src_263_df) %>% full_join(VOI_Src_264_df) %>% 
  full_join(VOI_Src_268_df) %>% full_join(VOI_Src_271_df) %>% full_join(VOI_Src_274_df) %>% 
  full_join(VOI_Src_280_df) %>% full_join(VOI_Src_281_df) %>% full_join(VOI_Src_282_df) %>% 
  full_join(VOI_Src_283_df) %>% full_join(VOI_Src_284_df) 

#Create answer key for source memory
Cleaned_Source_Anal_40 <- Cleaned_Source %>% mutate(Src_Ans = case_when(
  str_detect(Src_Scene, "Real") ~ "1",
  str_detect(Src_Scene, "Rec") ~ "0"
)) %>% mutate(MemRespType = case_when((Src_Ans == 1) & (Source_Mem_Response == 1) ~ 'Hit',
                                      (Src_Ans == 0) & (Source_Mem_Response == 1) ~ 'FA',
                                      (Src_Ans == 1) & (Source_Mem_Response == 0) ~ 'Miss',
                                      (Src_Ans == 0) & (Source_Mem_Response == 0) ~ 'CoRej')) %>% 
  mutate(Mem_Resp_Cor = case_when((Source_Mem_Response == 1) & (Src_Ans == 1) ~ 1, 
                                  (Source_Mem_Response == 0) & (Src_Ans == 0) ~ 1, 
                                  (Source_Mem_Response == 1) & (Src_Ans == 0) ~ 0,
                                  (Source_Mem_Response == 0) & (Src_Ans == 1) ~ 0))  %>%
  dplyr::select(participant, Source_Conf_Response, Src_Scene, MemRespType, Mem_Resp_Cor)
Cleaned_Source_Anal_40$participant <- as.factor(Cleaned_Source_Anal_40$participant)
Cleaned_Source_Anal_40$MemRespType <- as.factor(Cleaned_Source_Anal_40$MemRespType)
Cleaned_Source_Anal_40$Source_Conf_Response <- factor(Cleaned_Source_Anal_40$Source_Conf_Response, ordered=TRUE)
Cleaned_Source_Anal_40 <- Cleaned_Source_Anal_40 %>% mutate(Pres = case_when((str_detect(Src_Scene, "Rec") ~ 0)
                                                                             , (str_detect(Src_Scene, "Real") ~ 1)))
Cleaned_Source_Anal_40$Src_Scene = str_sub(Cleaned_Source_Anal_40$Src_Scene, 0,1) #Take the first letter of the photo name string
Cleaned_Source_Anal_40$Src_Scene <- factor(Cleaned_Source_Anal_40$Src_Scene)
Cleaned_Source_Anal_40$Src_Scene <- relevel(Cleaned_Source_Anal_40$Src_Scene, "N")


#### Encoding Performance ####
#Inclusion Check - Complete Answers
(Ppt_Count_Enc <- E_Data1 %>%
    group_by(participant) %>%
    dplyr::summarise(count = n()))
#Everyone has complete data (N=64)

#Calculate the encoding accuracy of each participant
Cleaned_Enc_Anal_40 <- E_Data1 %>% group_by(participant, Resp_Corr) %>%
  dplyr::summarise(sum = n()) %>% spread(Resp_Corr, sum)
colnames(Cleaned_Enc_Anal_40) <- c("participant", "Fail", "Success")
Cleaned_Enc_Anal_40 <- Cleaned_Enc_Anal_40 %>% dplyr::select(participant, Success, Fail)
Cleaned_Enc_Anal_40$Fail[is.na(Cleaned_Enc_Anal_40$Fail)] <- 0
(Cleaned_Enc_Anal_40 <- Cleaned_Enc_Anal_40 %>% mutate(Total = Success +Fail) %>% mutate(Accuracy = Success/(Success + Fail)))

#Exclusion Criteria #1 - Encoding Performance
#Anything under 66[2/3]% would be alarming given the simplicity of the color categorization task
summary(Cleaned_Enc_Anal_40$Accuracy)
#Mean = 78.87% 
#Range = 46.67% - 91.67%
hist(Cleaned_Enc_Anal_40$Accuracy, breaks = 20); abline(v=.66, col="red", lty="dashed")
Cleaned_Enc_Anal_40$participant[Cleaned_Enc_Anal_40$Accuracy < 0.66]; Cleaned_Enc_Anal_40$Accuracy[Cleaned_Enc_Anal_40$Accuracy < 0.66]
#Left Skewed: 5 under --> 138 [53.3%], 149 [55.0%], 231 [48.33%], 241 [46.6%], 258 [51.66%]

#Exclude participants below 66% and recalculate Performance Summary
Enc_Anal_69 <- Cleaned_Enc_Anal_40 %>% filter(Accuracy > 0.66)
summary(Enc_Anal_69$Accuracy)
hist(Enc_Anal_69$Accuracy*100, main = "Distribution of Encoding Accuracy Scores", xlab = "% of accurate responses", ylab = "Frequency", xlim = c(65,100), breaks = 20);abline(v=mean(Enc_Anal_69$Accuracy*100), col=c("blue"))
#Mean = 80.89% 
#Range = 66.67% - 91.67%

#Subsetting for participants with acceptable performance
Good_performers_enc <- Enc_Anal_69$participant
E_Subj_69 <- SubQs_data %>% filter(ID %in% Good_performers_enc)

#Keeping count:
#Total Number:
#Encoding: - 5
#Confidence: -2
#Item: -3
#Source: -2
#Mratio: -1
#Aphantasia: -1
#Source d (Meaningful Metad): 14
#Sum(Excluded):14; 63 - 14 = 49 
#Usable: 35

## Note: A preliminary analysis of the data showed there were several other participants that 
#         violated our exclusion criteria; we define them here.
# Exclusion due to lack of complete use of confidence scale
Conf_exc <- c(184, 227)
# Exclusion due to poor item recognition <70%
Item_exc <- c(115, 126, 133)
# Exclusion due to poor source recognition <50%
Source_exc <- c(140, 252)
# Exclusion due to aphantasia (Lack of mental imagery)
Img_exc <- c(221)
# Added exclusion: Negative M-ratio based on Matthias Guggenmos 2021 paper on Meta-d' reliability
#Guggenmos M. (2021). Measuring metacognitive performance: type 1 performance dependence and test-retest reliability. Neuroscience of consciousness, 2021(1), niab040. https://doi.org/10.1093/nc/niab040
Neg_Metad <- c(233)

#Create vector for participants included in source memory analysis
Src_40 <- c(119, 124, 129, 130, 131, 132, 139, 142, 143, 157, 167, 172, 186, 188, 192, 193, 195, 203, 204, 215, 219, 223, 224, 226, 232, 237, 238, 243, 244, 249, 250, 253, 260, 261, 264, 268, 271, 280, 281, 282)

#Excluding participants according to predefined exclusion criteria
Subj_60 <- E_Subj_69 %>% filter(!ID %in% c(Conf_exc, Item_exc, Source_exc, Img_exc, Neg_Metad))
Subj_40 <- E_Subj_69 %>% filter(!ID %in% c(Conf_exc, Item_exc, Source_exc, Img_exc, Neg_Metad)) %>% filter(ID %in% Src_40)


#### Demographics ####
#Age
hist(Subj_40$Dem_Age, main = "Distribution of Participant Age", ylab = "Frequency", xlab = "Age (years)", 
     xlim = c(15,80), breaks = 20)
summary(Subj_40$Dem_Age)
#Mean Age = 27.07 years
#Range = 18 - 63 years
sd(Subj_40$Dem_Age)
#SD = 9.85 years

#Sex
table(Subj_40$Dem_Sex)
# Female = 34
# Male = 6

#Race 
table(Subj_40$Dem_Race)
Race_table <- as.table(table(Subj_40$Dem_Race)); prop.table(Race_table)
#47.5% White, 37.5% Asian, 7.5% Black, 7.5% other

#Ethnicity
table(Subj_40$Dem_Ltnx) #2 Latinos


#### EDA - Subjective Qs ####
### Porges Body Perception Questionnaire - Short Form (BPQ-SF) ###
## Body Awareness Subscale ##
hist(Subj_40$BA_scores, main = "BPQ - Body Awareness", xlab = "Subscale Scores",
     ylab = "Frequency", xlim = c(20,130), breaks = 14);abline(v=mean(Subj_40$BA_scores), col=c("blue"))
summary(Subj_40$BA_scores); sd(Subj_40$BA_scores) #note, the lowest possible score is 26, highest possible is 130
#Mean = 65.9 (21.76)
#Range = 29 - 110

## Autonomic Reactivity ##
hist(Subj_40$Auto_Rct, main = "BPQ - Autonomic Reactivity", xlab = "Subscale Scores", 
     ylab = "Frequency", breaks = 20); abline(v=mean(Subj_40$Auto_Rct), col=c("blue"))
summary(Subj_40$Auto_Rct); sd(Subj_40$Auto_Rct) #Note: the lowest score possible is 21, highest possible is 97
#Mean = 32.02 (9.59)
#Range = 21 - 59

## Supradiaphragmatic Subscale ##
hist(Subj_40$SupraD_Scores, main = "BPQ - Supradiaphragmatic Arousal", xlab = "Subscale Scores", 
     ylab = "Frequency", breaks = 20); abline(v=mean(Subj_40$SupraD_Scores), col=c("blue"))
summary(Subj_40$SupraD_Scores); sd(Subj_40$SupraD_Scores) #Note: the lowest score possible is 15, highest possible is 69
#Mean = 21.6 (6.33)
#Range = 15 - 42

## Subdiaphragmatic Subscale ##
hist(Subj_40$SubD_Scores, main = "BPQ - Subdiaphragmatic Arousal", xlab = "Subscale Scores", 
     ylab = "Frequency", breaks = 20); abline(v=mean(Subj_40$SubD_Scores), col=c("blue"))
summary(Subj_40$SubD_Scores); sd(Subj_40$SubD_Scores) #Note: the lowest possible score is 6, highest is 28
#Mean: 10.43 (4.06)
#Range: 6-28

### Vividness of Visual Imagery Questionnaire (VVIQ) Score ###
hist(Subj_40$VVIQ_Scores, main = "Vividness of Visual Imagery Questionnaire (VVIQ)", xlab = "VVIQ Scores", 
     ylab = "Frequency", breaks = 14, xlim = c(16,90)); abline(v=32, col=c("red")); abline(v=mean(Subj_40$VVIQ_Scores), col=c("blue"))
summary(Subj_40$VVIQ_Scores); sd(Subj_40$VVIQ_Scores)
#Mean = 57.9 (10.26)
#Range = 41 - 80


#### EDA - Item Recognition ####
#Subsetting data for the acceptable participants (N=27)
Item_Cleaned_Anal_40 <- Item_Cleaned_Anal_40 %>% filter(participant %in% Good_performers_enc) %>% filter(!participant %in% c(Conf_exc, Item_exc, Source_exc, Img_exc, Neg_Metad)) %>% filter(participant %in% Src_40)
Item_Cleaned_Anal_60 <- Item_Cleaned_Anal_60 %>% filter(participant %in% Good_performers_enc) %>% filter(!participant %in% c(Conf_exc, Item_exc, Source_exc, Img_exc, Neg_Metad)) 

#Sanity Check - Number of Responses x Participant
Item_Ppt_Count <- Item_Cleaned_Anal_40 %>%
  group_by(participant) %>%
  summarise(count = n()) 
sum(Item_Ppt_Count$count < 120) #CHECK: Everyone has full count data (120 trials)

# Confidence
#Participant level
ggplot(Item_Cleaned_Anal_40, aes(x=Item_Conf_Response)) + geom_histogram(stat="count") + facet_wrap(~participant) +
  ggtitle("Item Confidence ~ Participant") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Confidence")
#Different response patterns across participants, but most are skewed towards high confidence responses
#Participants displayed a mix of response strategies
Ppt_Conf_Item <- Item_Cleaned_Anal_40 %>% group_by(participant) %>% summarize(avg = mean(as.numeric(Item_Conf_Response)))
hist(Ppt_Conf_Item$avg, xlab="Confidence Scores", main = "Distribution of average confidence")
mean(Ppt_Conf_Item$avg) #Average confidence: 2.45
sd(Ppt_Conf_Item$avg) #Stdev: 0.26
#Individual participants generally had high confidence

#Emotion level
ggplot(Item_Cleaned_Anal_40, aes(x=Item_Conf_Response)) + geom_histogram(stat="count") + facet_wrap(Item_Mem_Response ~ Rec_Scene) +
  ggtitle("Item Confidence ~ Valence & Response") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Confidence")
#No difference in confidence judgments with "No" responses, but higher confidence with "yes" responses with emotion

#Participant x Emotion level
ggplot(Item_Cleaned_Anal_40, aes(x=Item_Conf_Response, fill = Rec_Scene)) + geom_histogram(stat="count", position="dodge") + facet_wrap(~participant) +
  ggtitle("Item Confidence Responses ~ Valence (Participant)") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Confidence")
#No clear pattern

#Sanity Check - Better than chance performance
Item_Chance_df <- Item_Cleaned_Anal_40 %>%
  group_by(participant, Resp_Cor) %>%
  summarise(count = n()) %>% 
  spread("Resp_Cor", "count") %>%
  dplyr::select(participant, '1', '0')
colnames(Item_Chance_df) <- c("participant", "Success", "Failure")
Item_Chance_df <- Item_Chance_df %>%
  mutate(Accuracy = Success /(Success + Failure))
summary(Item_Chance_df$Accuracy); sd(Item_Chance_df$Accuracy)
hist(Item_Chance_df$Accuracy, breaks = 10, xlim = c(0.66,1), xlab = "Accuracy", main= "Item Memory Accuracy") #No outliers, no distinct shape
#Mean = 84.4% (0.0536) 
#Range = 70 - 94.17%

#Sanity Check - Distribution of Confidence Responses
#Overall
Item_Confidence_Data <- Item_Cleaned_Anal_40 %>%
  group_by(participant, Item_Conf_Response) %>%
  summarise(count = n()) 
Item_Confidence_Data_spread <- Item_Confidence_Data %>%
  spread("Item_Conf_Response", "count") #Create counts of success and failure

#By Emotion
Item_EmoConfidence_Data <- Item_Cleaned_Anal_40 %>%
  group_by(participant, Item_Conf_Response, Rec_Scene) %>%
  summarise(count = n()) 
Item_EmoConfidence_Data_spread <- Item_EmoConfidence_Data %>%
  spread("Item_Conf_Response", "count") #Create counts of success and failure
#36/40 used complete Confidence scale range for both valence types (90%)
#The participants who didn't: 130 [E1]; 186 [E1]; 193 [E1]

#Visualize confidence change score by emotion
Item_Conf_diff <- Item_Cleaned_Anal_40 %>% group_by(participant, Rec_Scene) %>% summarize(avg_conf = mean(as.numeric(Item_Conf_Response))) %>% 
  spread(Rec_Scene, avg_conf) %>% mutate(CD = E-N)
sum(Item_Conf_diff$CD > 0)
hist(Item_Conf_diff$CD, breaks = 15);abline(v=0, col="red", lwd=4, lty=2) 
#30/40 (75%) more confident in E than N
# 2 (=) 

#Evaluate the significance of the difference in confidence
Item_Conf_Emo <- Item_Cleaned_Anal_40 %>% group_by(participant, Rec_Scene) %>% summarize(avg_conf = mean(as.numeric(Item_Conf_Response)))
Item_Conf_Emo %>% group_by(Rec_Scene) %>% summarize(avg=mean(avg_conf), stdev = sd(avg_conf))
if (!file.exists("emo_conf_diff_lm.rda")) {
  emo_conf_diff_lm <- brm(avg_conf ~  Rec_Scene + (1 | participant), data = Item_Conf_Emo, family = gaussian(), seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(emo_conf_diff_lm, file = "./emo_conf_diff_lm.rda") 
} else {
  load("emo_conf_diff_lm.rda")  
}
pp_check(emo_conf_diff_lm, ndraws = 40) #Looks like a great fit
summary(emo_conf_diff_lm)
pd(emo_conf_diff_lm)
ci(emo_conf_diff_lm, type="hdi", ci=0.89)
# Participants were .08[0.05-0.12] more confident for negative emotion item recognition judgments.


#### EDA - Source Recognition ####
Cleaned_Source_Anal_40 <- Cleaned_Source_Anal_40  %>% filter(!participant %in% c(Conf_exc, Item_exc, Source_exc, Img_exc, Neg_Metad)) %>% filter(participant %in% unique(Item_Conf_diff$participant))

#Sanity Check - Number of Responses x Participant
Src_Ppt_Count <- Cleaned_Source_Anal_40 %>%
  group_by(participant) %>%
  summarise(count = n()) 
summary(Src_Ppt_Count$count); sd(Src_Ppt_Count$count)
#Mean = 50.42 (5.54)
#Range = 38 - 59

#Sanity Check - Better than chance performance
Src_Chance_df <- Cleaned_Source_Anal_40 %>%
  group_by(participant, Mem_Resp_Cor) %>%
  summarise(count = n()) %>% 
  spread("Mem_Resp_Cor", "count") %>%
  dplyr::select(participant, '1', '0')
colnames(Src_Chance_df) <- c("participant", "Success", "Failure")
Src_Chance_df <- Src_Chance_df %>%
  mutate(Accuracy = Success /(Success + Failure))
summary(Src_Chance_df$Accuracy); sd(Src_Chance_df$Accuracy)
hist(Src_Chance_df$Accuracy, breaks = 20, xlim = c(0.4,1), xlab = "Accuracy", main = "Source Memory Accuracy") #Normal distributed and outliers
#Mean = 61.64% (8)
#Range = 50 - 80.43%


#Sanity Check - Distribution of Confidence Responses
#Overall
Src_Confidence_Data <- Cleaned_Source_Anal_40 %>%
  group_by(participant, Source_Conf_Response) %>%
  summarise(count = n()) 
Src_Confidence_Data_spread <- Src_Confidence_Data %>%
  spread("Source_Conf_Response", "count") #Create counts of success and failure
# 27/27 used complete Confidence scale range overall (100%)

#By Emotion
Src_EmoConfidence_Data <- Cleaned_Source_Anal_40 %>%
  group_by(participant, Source_Conf_Response, Src_Scene) %>%
  summarise(count = n()) 
Src_EmoConfidence_Data_spread <- Src_EmoConfidence_Data %>%
  spread("Source_Conf_Response", "count") #Create counts of success and failure
# 24/27 used complete Confidence scale range for both valence types (88.9%)
#  119 [E3];186[E1]; 219[E1]

### Source Confidence ###
#Overall
barplot(table(na.omit(Cleaned_Source_Anal_40$Source_Conf_Response)), xlab = "Confidence", main = "Confidence Counts", ylab = "Frequency"); na.omit(Cleaned_Source_Anal_40) %>% group_by(Source_Conf_Response) %>% summarize(counts = n()) #Counts
mean(na.omit(as.numeric(Cleaned_Source_Anal_40$Source_Conf_Response))); sd(na.omit(as.numeric(Cleaned_Source_Anal_40$Source_Conf_Response))); #u = 1.88 (0.81)
#People were generally confident

#Participant level
Cleaned_Source_Anal_40 %>% ggplot(aes(x = Source_Conf_Response)) + geom_bar()+ ggtitle("Source Confidence ~ Participant") + xlab("Confidence") +
  facet_wrap(participant~.)+ theme(plot.title = element_text(hjust = 0.5))
#Participants displayed a mix of response strategies
Ppt_Conf_Src <- Cleaned_Source_Anal_40 %>% group_by(participant) %>% summarize(avg = mean(as.numeric(Source_Conf_Response)))
hist(Ppt_Conf_Src$avg, xlab="Confidence Scores", main = "Distribution of average confidence")
#Individual participants were generally confident

#Participant x Emotion
ggplot(Cleaned_Source_Anal_40, aes(x=Source_Conf_Response, fill = Src_Scene)) + geom_histogram(stat="count", position="dodge") + facet_wrap(~participant) +
  ggtitle("Source Memory Confidence ~ Valence (Participant)")+xlab("Confidence Scores") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Confidence")
#Difficult to see a definitive pattern

#By response
ggplot(Cleaned_Source_Anal_40, aes(x=Source_Conf_Response)) + geom_histogram(stat="count") + facet_wrap(~Mem_Resp_Cor) +
  ggtitle("Source Confidence ~ Responses") + xlab("Confidence") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Confidence")
#People were generally more confident in "yes" responses than "no" responses

#Emotion
Cleaned_Source_Anal_40 %>% ggplot(aes(x = Source_Conf_Response)) + geom_bar()+ ggtitle("Source Confidence ~ Valence") +
  facet_wrap(Src_Scene~.) + theme(plot.title = element_text(hjust = 0.5)) + xlab("Confidence"); Cleaned_Source_Anal_40 %>% group_by(Src_Scene, Source_Conf_Response) %>% summarize(counts = n()) #Counts
#Clear difference for lower confidence for negatively valenced images
Cleaned_Source_Anal_40 %>% group_by(Src_Scene) %>% summarize(mean = mean(as.numeric(Source_Conf_Response)), sem = (sd(as.numeric(Source_Conf_Response))/sqrt(27))) #uN - 1.98(.157) ; uE - 1.86(.155)

#Emotion x Response
ggplot(Cleaned_Source_Anal_40, aes(x=Source_Conf_Response)) + geom_histogram(stat="count") + facet_grid(Src_Scene ~ MemRespType) + ggtitle("Source Confidence ~ Response Type x Valence") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Confidence")
#Difference in response pattern for "Hit" trials across neutral and negative emotion types
# Specifically, high confidence responses for neutral images appear to be more likely to be correct

#Emotion x Participant
ggplot(Cleaned_Source_Anal_40, aes(x=Source_Conf_Response)) + geom_histogram(stat="count") + facet_wrap(~participant) +
  ggtitle("Source Confidence ~ Participant") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Confidence")
Cleaned_Source_Anal_40 %>% ggplot(aes(x = Source_Conf_Response, fill = Src_Scene)) + geom_histogram(stat="count", position = "dodge")+ ggtitle("Source Confidence ~ Participant") +
  facet_wrap(participant~.) + xlab("Confidence")
Cleaned_Source_Anal_40 %>% group_by(participant, Src_Scene) %>% summarize(avg_conf = mean(as.numeric(Source_Conf_Response)))
Cleaned_Source_Anal_40 %>% group_by(participant, Src_Scene, Source_Conf_Response) %>% summarize(counts = n()) #Counts
#Hard to interpret clear pattern

#Visualize confidence change score by emotion
Src_Conf_diff <- Cleaned_Source_Anal_40 %>% group_by(participant, Src_Scene) %>% summarize(avg_conf = mean(as.numeric(Source_Conf_Response))) %>% 
  spread(Src_Scene, avg_conf) %>% mutate(CD = E-N)
sum(Src_Conf_diff$CD < 0) #29/40 people had higher confidence in Neutral than Emotional
#In 72.5% [29/40] of cases, participants had less confidence in their emotional than their neutral responses
hist(Src_Conf_diff$CD, breaks = 15, xlab= "Confidence Difference", main= "Difference in Confidence (E-N)"); abline(v=0, col="red", lwd=4, lty=2)

#Evaluate the significance of the difference in confidence
Src_Conf_Emo <- Cleaned_Source_Anal_40 %>% group_by(participant, Src_Scene) %>% summarize(avg_conf = mean(as.numeric(Source_Conf_Response)))
if (!file.exists("Src_emo_conf_diff_lm.rda")) {
  Src_emo_conf_diff_lm <- brm(avg_conf ~  Src_Scene + (1 | participant), data = Src_Conf_Emo, family = gaussian(), seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Src_emo_conf_diff_lm, file = "./Src_emo_conf_diff_lm.rda") 
} else {
  load("Src_emo_conf_diff_lm.rda")  
}
pp_check(Src_emo_conf_diff_lm, ndraws = 40) #Looks like a great fit
summary(Src_emo_conf_diff_lm)
hdi(Src_emo_conf_diff_lm, ci = 0.89)
pd(Src_emo_conf_diff_lm)
plot_model(Src_emo_conf_diff_lm, type="pred")
# Participants were -.11(.04) [-0.16, -0.06] less confident for negative emotion source recognition judgments.


#### EDA - Confidence in Memory ####
#Create dataframe
Ppt_Conf_Src$participant <- factor(Ppt_Conf_Src$participant); Ppt_Conf_Item$participant <- factor(Ppt_Conf_Item$participant)
Mem_Confidence_Ppt <- Ppt_Conf_Src %>% mutate(Source_Conf = avg) %>% select(participant, Source_Conf) %>% left_join(Ppt_Conf_Item %>% 
                          mutate(Item_Conf = avg) %>% select(participant, Item_Conf)) %>% filter((participant %in% Src_40))
mean(Mem_Confidence_Ppt$Item_Conf); sd(Mem_Confidence_Ppt$Item_Conf) #2.45 (0.26)
mean(Mem_Confidence_Ppt$Source_Conf); sd(Mem_Confidence_Ppt$Source_Conf) #1.91 (0.36)
sum(Mem_Confidence_Ppt$Item_Conf > Mem_Confidence_Ppt$Source_Conf)
hist(Mem_Confidence_Ppt$Item_Conf - Mem_Confidence_Ppt$Source_Conf, breaks= 12)
#39/40 (97.5%) have higher confidence in Item than Source

#Combine item and source data frames
Item_Conf_Emo$participant <- factor(Item_Conf_Emo$participant)
colnames(Item_Conf_Emo) <- c("participant", "Valence", "avg_conf")
colnames(Src_Conf_Emo) <- c("participant", "Valence", "avg_conf")

Mem_Conf_Emo <- Src_Conf_Emo %>% mutate(Memory = "Source") %>% full_join(Item_Conf_Emo %>% mutate(Memory = "Item"))
if (!file.exists("Mem_conf_diff_lm.rda")) {
  Mem_conf_diff_lm <- brm(avg_conf ~  Memory + (1 | participant), data = Mem_Conf_Emo, family = gaussian(), seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_conf_diff_lm, file = "./Mem_conf_diff_lm.rda") 
} else {
  load("Mem_conf_diff_lm.rda")  
}
Mem_Conf_Emo <- Src_Conf_Emo %>% mutate(Memory = "Source") %>% full_join(Item_Conf_Emo %>% mutate(Memory = "Item"))
if (!file.exists("Mem_emo_conf_diff_lm.rda")) {
  Mem_emo_conf_diff_lm <- brm(avg_conf ~  Valence + Memory + (1 | participant), data = Mem_Conf_Emo, family = gaussian(), seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_emo_conf_diff_lm, file = "./Mem_emo_conf_diff_lm.rda") 
} else {
  load("Mem_emo_conf_diff_lm.rda")  
}
if (!file.exists("Mem_emo_conf_diff_lm_int.rda")) {
  Mem_emo_conf_diff_lm_int <- brm(avg_conf ~  Valence * Memory + (1 | participant), data = Mem_Conf_Emo, family = gaussian(), seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_emo_conf_diff_lm_int, file = "./Mem_emo_conf_diff_lm_int.rda") 
} else {
  load("Mem_emo_conf_diff_lm_int.rda")  
}

#Model Comparison
bayes_factor(Mem_emo_conf_diff_lm_int, Mem_emo_conf_diff_lm)
waic(Mem_emo_conf_diff_lm, Mem_emo_conf_diff_lm_int) #Suggests using loo, but interaction model preferred
RegEmoDiff <- loo(Mem_emo_conf_diff_lm, moment_match = TRUE)
IntEmoDiff <- loo(Mem_emo_conf_diff_lm_int, moment_match = TRUE)
loo_compare(RegEmoDiff, IntEmoDiff) #Best fitting model is interaction model

#Evaluate winning model
pp_check(Mem_emo_conf_diff_lm_int)
summary(Mem_emo_conf_diff_lm_int)
p_direction(Mem_emo_conf_diff_lm_int)
round(ci(Mem_emo_conf_diff_lm_int, method = "HDI", ci = 0.89)[2,3], 4);round(ci(Mem_emo_conf_diff_lm_int, method = "HDI", ci = 0.9)[2,4],4)
plot_model(Mem_emo_conf_diff_lm_int, type = "pred")
plot_model(Mem_emo_conf_diff_lm_int, type = "int", terms = c('ValenceE:MemorySource')) 
#Analysis indicates that negative emotion impacts confidence in item and source memory differently
# Specifically, higher for item memory, but lower for source memory under negative emotion

#Visualization of change in confidence by memory
Mem_Conf_Emo %>% ggplot(aes(x=Valence, y=avg_conf, group=participant)) + geom_point() + geom_line() + facet_wrap(.~Memory)
#Patterns replicate what was determined by the analysis


#### MLE Meta-d' Dataprep ####

#Create filter for participats that are usable
Metad_Filter <- Confidence_Data_S1_R1$participant %in% Item_Ppt_Count$participant

#FITTING META D'
## Data from each subject need to be coerced into two vectors nR_S1 & nR_S2, which CONTAIN CONFIDENCE-RATING COUNTS
##  for when the 'stimulus' was S1 & S2, respectively.
## Confidence counts are entered such that the first entry refers to counts of maximum confidence in an S1 response,
##  and the last entry to maximum confidence in an S2 response. (S1_Pres_3, S1_Pres_2, S1_Pres_1, S2_Abs_1, S2_Abs_2, S2_Abs_3)


## ITEM MEMORY
#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R1_Old)
Confidence_Data_S1_R1 <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 1 & Item_Mem_Response == 1) %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success
#Correction for 0 cell counts needed to stabilize predictions in MLE
# This is  generalization of the log-linear correction typically applied when estimating 
#   type 1 d’, as recommended by Hautus (1995)
Confidence_Data_S1_R1$`1`[is.na(Confidence_Data_S1_R1$`1`)] <- 0; Confidence_Data_S1_R1$`2`[is.na(Confidence_Data_S1_R1$`2`)] <- 0; Confidence_Data_S1_R1$`3`[is.na(Confidence_Data_S1_R1$`3`)] <- 0
Confidence_Data_S1_R1 <- Confidence_Data_S1_R1 %>% select('participant','3','2','1')  #Correct order
Confidence_Data_S1_R1<-data.frame(Confidence_Data_S1_R1) 
colnames(Confidence_Data_S1_R1) <- c("ID", "3", "2","1")
Confidence_Data_S1_R1 <- as.matrix(Confidence_Data_S1_R1)[,2:4]

#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R2_New)
Confidence_Data_S1_R2 <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 1 & Item_Mem_Response == 0) %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of failure
#Correction for 0 cell counts needed to stabilize predictions in MLE
Confidence_Data_S1_R2$`1`[is.na(Confidence_Data_S1_R2$`1`)] <- 0; Confidence_Data_S1_R2$`2`[is.na(Confidence_Data_S1_R2$`2`)] <- 0; Confidence_Data_S1_R2$`3`[is.na(Confidence_Data_S1_R2$`3`)] <- 0
Confidence_Data_S1_R2 <- as.matrix(Confidence_Data_S1_R2)
Confidence_Data_S1_R2 <- data.frame(Confidence_Data_S1_R2) 
colnames(Confidence_Data_S1_R2) <- c("ID", "1", "2","3")
Confidence_Data_S1_R2 <- as.matrix(Confidence_Data_S1_R2)[,2:4]

#Combine matrices into single matrix representing confidence data x response for stimulus 1
#Confidence Rating count when the 'stimulus' was S1
nR_S1 <-  cbind(Confidence_Data_S1_R1, Confidence_Data_S1_R2)     
                            
#Coerce Data frame to quantify confidence counts x Stimulus type (New) x response (Old)
Confidence_Data_S2_R1 <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 0 & Item_Mem_Response == 1) %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
#Convert the dataframe to complete matrix

#Correction for 0 cell counts needed to stabilize predictions in MLE
Confidence_Data_S2_R1$`1`[is.na(Confidence_Data_S2_R1$`1`)] <- 0; Confidence_Data_S2_R1$`2`[is.na(Confidence_Data_S2_R1$`2`)] <- 0; Confidence_Data_S2_R1$`3`[is.na(Confidence_Data_S2_R1$`3`)] <- 0
Confidence_Data_S2_R1_part1 <- as.matrix(Confidence_Data_S2_R1[1:4,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_part1 <- rbind(Confidence_Data_S2_R1_part1, c(131, 0, 0, 0)) #add missing participant 131
Confidence_Data_S2_R1_part2 <- as.matrix(Confidence_Data_S2_R1[5:39,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1 <- rbind(Confidence_Data_S2_R1_part1, Confidence_Data_S2_R1_part2) #Combine the three parts into a cohesive matrix 
Confidence_Data_S2_R1 <- as.data.frame(Confidence_Data_S2_R1) %>% select(participant, '3','2','1')
Confidence_Data_S2_R1 <- as.matrix(Confidence_Data_S2_R1)[,2:4]

#Coerce Data frame to quantify confidence counts x Stimulus type (New) x response (New))
Confidence_Data_S2_R2 <-  Item_Cleaned_Anal_40 %>%
  filter(Pres == 0 & Item_Mem_Response == 0) %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of failure
#Correction for 0 cell counts needed to stabilize predictions in MLE
Confidence_Data_S2_R2$`1`[is.na(Confidence_Data_S2_R2$`1`)] <- 0; Confidence_Data_S2_R2$`2`[is.na(Confidence_Data_S2_R2$`2`)] <- 0; Confidence_Data_S2_R2$`3`[is.na(Confidence_Data_S2_R2$`3`)] <- 0
Confidence_Data_S2_R2 <- as.matrix(Confidence_Data_S2_R2)[,2:4]

#Combine matrices into single matrix representing confidence data x response for stimulus 2
#Confidence Rating count when the 'stimulus' was S2
nR_S2 <-  cbind(Confidence_Data_S2_R1, Confidence_Data_S2_R2)

## Each vector has length k x 2 where k is the number of ratings available. (i.e. it should be 6[1-3x2])
dim(nR_S1) #6 Columns
dim(nR_S2) #6 Columns

## They should approximately be mirror images in magnitude
nR_S1; nR_S2 #Grouping is approximately mirrored in nature

#Adding 0.25 to all cells [a generalization of the log-linear correction
# typically applied when estimating type 1 d’, as recommended by Hautus (1995)
nR_S1 <- nR_S1 + 0.5
nR_S2 <- nR_S2 + 0.5


#Export data matrices
writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S1_SciRep40_MLE2.mat", x=nR_S1) #Write Mat file for Stim 1
writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S2_SciRep40_MLE2.mat", x=nR_S2) #Write Mat file for Stim 2

## SOURCE MEMORY
Src_Confidence_Data_S1_R1 <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 1 & Mem_Resp_Cor == 1) %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Src_Confidence_Data_S1_R1$`1`[is.na(Src_Confidence_Data_S1_R1$`1`)] <- 0; Src_Confidence_Data_S1_R1$`2`[is.na(Src_Confidence_Data_S1_R1$`2`)] <- 0; Src_Confidence_Data_S1_R1$`3`[is.na(Src_Confidence_Data_S1_R1$`3`)] <- 0 #Order still needs to be flipped
Src_Confidence_Data_S1_R1 <- Src_Confidence_Data_S1_R1 %>% select('participant','3','2','1')  #Correct order
Src_Confidence_Data_S1_R1<-data.frame(Src_Confidence_Data_S1_R1) 
colnames(Src_Confidence_Data_S1_R1) <- c("ID", "3", "2","1")
Src_Confidence_Data_S1_R1 <- as.matrix(Src_Confidence_Data_S1_R1)[,2:4]
Src_Confidence_Data_S1_R1 <- apply(Src_Confidence_Data_S1_R1, 2, str_remove_all, " ")  
Src_Confidence_Data_S1_R1 <- matrix(as.numeric(Src_Confidence_Data_S1_R1),    # Convert to numeric matrix
                                    ncol = ncol(Src_Confidence_Data_S1_R1))
colnames(Src_Confidence_Data_S1_R1) <- c('3','2','1')

#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R2_New)
Src_Confidence_Data_S1_R2 <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 1 & Mem_Resp_Cor == 0) %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of failure
#Correction for 0 cell counts needed to stabilize predictions in MLE
Src_Confidence_Data_S1_R2$`1`[is.na(Src_Confidence_Data_S1_R2$`1`)] <- 0; Src_Confidence_Data_S1_R2$`2`[is.na(Src_Confidence_Data_S1_R2$`2`)] <- 0; Src_Confidence_Data_S1_R2$`3`[is.na(Src_Confidence_Data_S1_R2$`3`)] <- 0 #Order still needs to be flipped
Src_Confidence_Data_S1_R2 <- Src_Confidence_Data_S1_R2 %>% select('participant','3','2','1')  #Correct order
Src_Confidence_Data_S1_R2<-data.frame(Src_Confidence_Data_S1_R2) 
colnames(Src_Confidence_Data_S1_R2) <- c("ID", "1", "2","3")
Src_Confidence_Data_S1_R2_part1 <- as.matrix(Src_Confidence_Data_S1_R2[1:8,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_part1 <- rbind(Src_Confidence_Data_S1_R2_part1, c(143, 0, 0, 0)) #add missing participant 143
Src_Confidence_Data_S1_R2_part2 <- as.matrix(Src_Confidence_Data_S1_R2[9:23,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_part2 <- rbind(Src_Confidence_Data_S1_R2_part2, c(232, 0, 0, 0), c(237, 0, 0, 0)) #add missing participant 143
Src_Confidence_Data_S1_R2_part3 <- as.matrix(Src_Confidence_Data_S1_R2[24:37,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2 <- rbind(Src_Confidence_Data_S1_R2_part1, Src_Confidence_Data_S1_R2_part2, Src_Confidence_Data_S1_R2_part3)
Src_Confidence_Data_S1_R2 <- as.matrix(Src_Confidence_Data_S1_R2)[,2:4]
Src_Confidence_Data_S1_R2 <- apply(Src_Confidence_Data_S1_R2, 2, str_remove_all, " ")  
Src_Confidence_Data_S1_R2 <- matrix(as.numeric(Src_Confidence_Data_S1_R2),    # Convert to numeric matrix
                                    ncol = ncol(Src_Confidence_Data_S1_R2))
colnames(Src_Confidence_Data_S1_R2) <- c('1','2','3')

#Combine matrices into single matrix representing confidence data x response for stimulus 1
#Confidence Rating count when the 'stimulus' was S1
Src_nR_S1 <-  cbind(Src_Confidence_Data_S1_R1, Src_Confidence_Data_S1_R2)     

#Coerce Data frame to quantify confidence counts x Stimulus type (New) x response (Old)
Src_Confidence_Data_S2_R1 <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 0 & Mem_Resp_Cor == 1) %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success
#Correction for 0 cell counts needed to stabilize predictions in MLE
Src_Confidence_Data_S2_R1$`1`[is.na(Src_Confidence_Data_S2_R1$`1`)] <- 0; Src_Confidence_Data_S2_R1$`2`[is.na(Src_Confidence_Data_S2_R1$`2`)] <- 0; Src_Confidence_Data_S2_R1$`3`[is.na(Src_Confidence_Data_S2_R1$`3`)] <- 0 #Order still needs to be flipped
Src_Confidence_Data_S2_R1 <- Src_Confidence_Data_S2_R1 %>% select('participant','3','2','1')  #Correct order
Src_Confidence_Data_S2_R1<-data.frame(Src_Confidence_Data_S2_R1) 
colnames(Src_Confidence_Data_S2_R1) <- c("ID", "3", "2","1")
Src_Confidence_Data_S2_R1 <- as.matrix(Src_Confidence_Data_S2_R1)[,2:4]
Src_Confidence_Data_S2_R1 <- apply(Src_Confidence_Data_S2_R1, 2, str_remove_all, " ")  
Src_Confidence_Data_S2_R1 <- matrix(as.numeric(Src_Confidence_Data_S2_R1),    # Convert to numeric matrix
                                    ncol = ncol(Src_Confidence_Data_S2_R1))
colnames(Src_Confidence_Data_S2_R1) <- c('3','2','1')

#Coerce Data frame to quantify confidence counts x Stimulus type (New) x response (New))
Src_Confidence_Data_S2_R2 <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 0 & Mem_Resp_Cor == 0) %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Src_Confidence_Data_S2_R2$`1`[is.na(Src_Confidence_Data_S2_R2$`1`)] <- 0; Src_Confidence_Data_S2_R2$`2`[is.na(Src_Confidence_Data_S2_R2$`2`)] <- 0; Src_Confidence_Data_S2_R2$`3`[is.na(Src_Confidence_Data_S2_R2$`3`)] <- 0 #Order still needs to be flipped
Src_Confidence_Data_S2_R2 <- Src_Confidence_Data_S2_R2 %>% select('participant','1','2','3')  #Correct order
Src_Confidence_Data_S2_R2<-data.frame(Src_Confidence_Data_S2_R2) 
colnames(Src_Confidence_Data_S2_R2) <- c("ID", "1", "2","3")
Src_Confidence_Data_S2_R2 <- as.matrix(Src_Confidence_Data_S2_R2)[,2:4]
Src_Confidence_Data_S2_R2 <- apply(Src_Confidence_Data_S2_R2, 2, str_remove_all, " ")  
Src_Confidence_Data_S2_R2 <- matrix(as.numeric(Src_Confidence_Data_S2_R2),    # Convert to numeric matrix
                                    ncol = ncol(Src_Confidence_Data_S2_R2))
colnames(Src_Confidence_Data_S2_R2) <- c('1','2','3')

#Combine matrices into single matrix representing confidence data x response for stimulus 2
#Confidence Rating count when the 'stimulus' was S2
Src_nR_S2 <-  cbind(Src_Confidence_Data_S2_R1, Src_Confidence_Data_S2_R2)

## Each vector has length k x 2 where k is the number of ratings available. (i.e. it should be 6[1-3x2])
dim(Src_nR_S1) #6 Columns
dim(Src_nR_S2) #6 Columns

## They should approximately be mirror images in magnitude
Src_nR_S1; Src_nR_S2 #Grouping is approximately mirrored in nature

#Adding 0.25 to all cells [a generalization of the log-linear correction
# typically applied when estimating type 1 d’, as recommended by Hautus (1995)
Src_nR_S1 <- Src_nR_S1 + 0.5
Src_nR_S2 <- Src_nR_S2 + 0.5

#Export data matrices
#library(R.matlab)
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nRSrc_S1_SciRep40_MLE.mat", x=Src_nR_S1) #Write Mat file for Stim 1
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nRSrc_S2_SciRep40_MLE.mat", x=Src_nR_S2) #Write Mat file for Stim 2


#### MLE Dependent Item  DataPrep ####
## ITEM MEMORY ##
#OLD STIM
#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R1_Old) x Valence (Negative)
Confidence_Data_S1_R1_Neg <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 1 & Item_Mem_Response == 1) %>%
  filter(Rec_Scene == "E") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Confidence_Data_S1_R1_Neg$`1`[is.na(Confidence_Data_S1_R1_Neg$`1`)] <- 0; Confidence_Data_S1_R1_Neg$`2`[is.na(Confidence_Data_S1_R1_Neg$`2`)] <- 0; Confidence_Data_S1_R1_Neg$`3`[is.na(Confidence_Data_S1_R1_Neg$`3`)] <- 0
Confidence_Data_S1_R1_Neg <- Confidence_Data_S1_R1_Neg %>% select('participant','3','2','1')  #Correct order
Confidence_Data_S1_R1_Neg<-data.frame(Confidence_Data_S1_R1_Neg) 
colnames(Confidence_Data_S1_R1_Neg) <- c("ID", "3", "2","1")
Confidence_Data_S1_R1_Neg <- as.matrix(Confidence_Data_S1_R1_Neg)[,2:4]

#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R1_Old) x Valance (Neutral)
Confidence_Data_S1_R1_Neut <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 1 & Item_Mem_Response == 1) %>%
  filter(Rec_Scene == "N") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Confidence_Data_S1_R1_Neut$`1`[is.na(Confidence_Data_S1_R1_Neut$`1`)] <- 0; Confidence_Data_S1_R1_Neut$`2`[is.na(Confidence_Data_S1_R1_Neut$`2`)] <- 0; Confidence_Data_S1_R1_Neut$`3`[is.na(Confidence_Data_S1_R1_Neut$`3`)] <- 0
Confidence_Data_S1_R1_Neut <- Confidence_Data_S1_R1_Neut %>% select('participant','3','2','1')  #Correct order
Confidence_Data_S1_R1_Neut<-data.frame(Confidence_Data_S1_R1_Neut) 
colnames(Confidence_Data_S1_R1_Neut) <- c("ID", "3", "2","1")
Confidence_Data_S1_R1_Neut <- as.matrix(Confidence_Data_S1_R1_Neut)[,2:4]

#NEW RESPONSE
#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R2_New) x Valence (Negative)
Confidence_Data_S1_R2_Neg <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 1 & Item_Mem_Response == 0) %>%
  filter(Rec_Scene == "E") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Confidence_Data_S1_R2_Neg$`1`[is.na(Confidence_Data_S1_R2_Neg$`1`)] <- 0; Confidence_Data_S1_R2_Neg$`2`[is.na(Confidence_Data_S1_R2_Neg$`2`)] <- 0; Confidence_Data_S1_R2_Neg$`3`[is.na(Confidence_Data_S1_R2_Neg$`3`)] <- 0
Confidence_Data_S1_R2_Neg <- Confidence_Data_S1_R2_Neg %>% select('participant','1','2','3')  #Correct order
colnames(Confidence_Data_S1_R2_Neg) <- c("ID", "1", "2","3")
Confidence_Data_S1_R2_Neg <- as.matrix(Confidence_Data_S1_R2_Neg)[,2:4]

#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R2_New) x Valence (Neutral)
Confidence_Data_S1_R2_Neut <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 1 & Item_Mem_Response == 0) %>%
  filter(Rec_Scene == "N") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Confidence_Data_S1_R2_Neut$`1`[is.na(Confidence_Data_S1_R2_Neut$`1`)] <- 0; Confidence_Data_S1_R2_Neut$`2`[is.na(Confidence_Data_S1_R2_Neut$`2`)] <- 0; Confidence_Data_S1_R2_Neut$`3`[is.na(Confidence_Data_S1_R2_Neut$`3`)] <- 0
Confidence_Data_S1_R2_Neut <- Confidence_Data_S1_R2_Neut %>% select('participant','1','2','3')  #Correct order
Confidence_Data_S1_R2_Neut<-data.frame(Confidence_Data_S1_R2_Neut) 
colnames(Confidence_Data_S1_R2_Neut) <- c("ID", "1", "2","3")
Confidence_Data_S1_R2_Neut <- as.matrix(Confidence_Data_S1_R2_Neut)[,2:4]

#NEW STIM
#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R1_Old)
Confidence_Data_S2_R1_Neg <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 0 & Item_Mem_Response == 1) %>%
  filter(Rec_Scene == "E") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
Confidence_Data_S2_R1_Neg$`1`[is.na(Confidence_Data_S2_R1_Neg$`1`)] <- 0; Confidence_Data_S2_R1_Neg$`2`[is.na(Confidence_Data_S2_R1_Neg$`2`)] <- 0; Confidence_Data_S2_R1_Neg$`3`[is.na(Confidence_Data_S2_R1_Neg$`3`)] <- 0
Confidence_Data_S2_R1_Neg_part1 <- as.matrix(Confidence_Data_S2_R1_Neg[1:3,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neg_part2 <- as.matrix(Confidence_Data_S2_R1_Neg[4,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neg_part3 <- as.matrix(Confidence_Data_S2_R1_Neg[5,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neg_part4 <- as.matrix(Confidence_Data_S2_R1_Neg[6:11,])
Confidence_Data_S2_R1_Neg_part5 <- as.matrix(Confidence_Data_S2_R1_Neg[12:26,])
Confidence_Data_S2_R1_Neg_part6 <- as.matrix(Confidence_Data_S2_R1_Neg[27:28,])
Confidence_Data_S2_R1_Neg_part7 <- as.matrix(Confidence_Data_S2_R1_Neg[29:30,])
Confidence_Data_S2_R1_Neg_part8 <- as.matrix(Confidence_Data_S2_R1_Neg[31:32,])
Confidence_Data_S2_R1_Neg_part1 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part1, c(130, 0, 0, 0), c(131, 0, 0, 0))) #add missing participant 131
Confidence_Data_S2_R1_Neg_part2 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part2, c(139, 0, 0, 0))) #add missing participant 139
Confidence_Data_S2_R1_Neg_part3 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part3, c(143, 0, 0, 0))) #add missing participant 143, 152
Confidence_Data_S2_R1_Neg_part4 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part4, c(193, 0, 0, 0)))
Confidence_Data_S2_R1_Neg_part5 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part5, c(253, 0, 0, 0))) #add missing participant 162, 165
Confidence_Data_S2_R1_Neg_part6 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part6, c(264, 0, 0, 0))) #add missing participant 193
Confidence_Data_S2_R1_Neg_part7 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part7, c(280, 0, 0, 0))) #add missing participant 221
Confidence_Data_S2_R1_Neg <- rbind(Confidence_Data_S2_R1_Neg_part1, Confidence_Data_S2_R1_Neg_part2, Confidence_Data_S2_R1_Neg_part3, Confidence_Data_S2_R1_Neg_part4, Confidence_Data_S2_R1_Neg_part5, Confidence_Data_S2_R1_Neg_part6, Confidence_Data_S2_R1_Neg_part7, Confidence_Data_S2_R1_Neg_part8)
Confidence_Data_S2_R1_Neg <- as.matrix(Confidence_Data_S2_R1_Neg)[,2:4]
Confidence_Data_S2_R1_Neg <- apply(Confidence_Data_S2_R1_Neg, 2, str_remove_all, " ")  
Confidence_Data_S2_R1_Neg <- matrix(as.numeric(Confidence_Data_S2_R1_Neg),    # Convert to numeric matrix
                                    ncol = ncol(Confidence_Data_S2_R1_Neg))
colnames(Confidence_Data_S2_R1_Neg) <- c('3','2','1')

#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R1_Old) x Valance (Neutral)
Confidence_Data_S2_R1_Neut <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 0 & Item_Mem_Response == 1) %>%
  filter(Rec_Scene == "N") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Confidence_Data_S2_R1_Neut$`1`[is.na(Confidence_Data_S2_R1_Neut$`1`)] <- 0; Confidence_Data_S2_R1_Neut$`2`[is.na(Confidence_Data_S2_R1_Neut$`2`)] <- 0; Confidence_Data_S2_R1_Neut$`3`[is.na(Confidence_Data_S2_R1_Neut$`3`)] <- 0
Confidence_Data_S2_R1_Neut <- Confidence_Data_S2_R1_Neut %>% select('participant','3','2','1')  #Correct order
Confidence_Data_S2_R1_Neut<-data.frame(Confidence_Data_S2_R1_Neut) 
colnames(Confidence_Data_S2_R1_Neut) <- c("ID", "3", "2","1")
Confidence_Data_S2_R1_Neut_part1 <- as.matrix(Confidence_Data_S2_R1_Neut[1:4,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neut_part2 <- as.matrix(Confidence_Data_S2_R1_Neut[5:12,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neut_part3 <- as.matrix(Confidence_Data_S2_R1_Neut[13:30,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neut_part4 <- as.matrix(Confidence_Data_S2_R1_Neut[31:36,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neut_part1 <- as.matrix(rbind(Confidence_Data_S2_R1_Neut_part1, c(131, 0, 0, 0))) #add missing participant 131
Confidence_Data_S2_R1_Neut_part2 <- as.matrix(rbind(Confidence_Data_S2_R1_Neut_part2, c(188, 0, 0, 0))) #add missing participant 152
Confidence_Data_S2_R1_Neut_part3 <- as.matrix(rbind(Confidence_Data_S2_R1_Neut_part3, c(260, 0, 0, 0))) #add missing participant 162
Confidence_Data_S2_R1_Neut_part4 <- as.matrix(rbind(Confidence_Data_S2_R1_Neut_part4, c(282, 0, 0, 0))) #add missing participant 182
Confidence_Data_S2_R1_Neut <- rbind(Confidence_Data_S2_R1_Neut_part1, Confidence_Data_S2_R1_Neut_part2, Confidence_Data_S2_R1_Neut_part3, Confidence_Data_S2_R1_Neut_part4)
Confidence_Data_S2_R1_Neut <- as.matrix(Confidence_Data_S2_R1_Neut)[,2:4]
Confidence_Data_S2_R1_Neut <- apply(Confidence_Data_S2_R1_Neut, 2, str_remove_all, " ")  
Confidence_Data_S2_R1_Neut <- matrix(as.numeric(Confidence_Data_S2_R1_Neut),    # Convert to numeric matrix
                                     ncol = ncol(Confidence_Data_S2_R1_Neut))
colnames(Confidence_Data_S2_R1_Neut) <- c('3','2','1')

#NEW RESPONSE
#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R2_New) x Valence (Negative)
Confidence_Data_S2_R2_Neg <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 0 & Item_Mem_Response == 0) %>%
  filter(Rec_Scene == "E") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Confidence_Data_S2_R2_Neg$`1`[is.na(Confidence_Data_S2_R2_Neg$`1`)] <- 0; Confidence_Data_S2_R2_Neg$`2`[is.na(Confidence_Data_S2_R2_Neg$`2`)] <- 0; Confidence_Data_S2_R2_Neg$`3`[is.na(Confidence_Data_S2_R2_Neg$`3`)] <- 0
Confidence_Data_S2_R2_Neg <- Confidence_Data_S2_R2_Neg %>% select('participant','1','2','3')  #Correct order
Confidence_Data_S2_R2_Neg<-data.frame(Confidence_Data_S2_R2_Neg) 
colnames(Confidence_Data_S2_R2_Neg) <- c("ID", "1", "2","3")
Confidence_Data_S2_R2_Neg <- as.matrix(Confidence_Data_S2_R2_Neg)[,2:4]

#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R2_New) x Valence (Negative)
Confidence_Data_S2_R2_Neut <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 0 & Item_Mem_Response == 0) %>%
  filter(Rec_Scene == "N") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Confidence_Data_S2_R2_Neut$`1`[is.na(Confidence_Data_S2_R2_Neut$`1`)] <- 0; Confidence_Data_S2_R2_Neut$`2`[is.na(Confidence_Data_S2_R2_Neut$`2`)] <- 0; Confidence_Data_S2_R2_Neut$`3`[is.na(Confidence_Data_S2_R2_Neut$`3`)] <- 0
Confidence_Data_S2_R2_Neut <- Confidence_Data_S2_R2_Neut %>% select('participant','1','2','3')  #Correct order
Confidence_Data_S2_R2_Neut<-data.frame(Confidence_Data_S2_R2_Neut) 
colnames(Confidence_Data_S2_R2_Neut) <- c("ID", "1", "2","3")
Confidence_Data_S2_R2_Neut <- as.matrix(Confidence_Data_S2_R2_Neut)[,2:4]

#Combine matrices into single matrix representing confidence data x response for stimulus 1
#Confidence Rating count when the 'stimulus' was S1 and Valence was negative
nR_S1_neg <-  cbind(Confidence_Data_S1_R1_Neg, Confidence_Data_S1_R2_Neg)

#Combine matrices into single matrix representing confidence data x response for stimulus 1
#Confidence Rating count when the 'stimulus' was S1 and Valence was neutral
nR_S1_neut <-  cbind(Confidence_Data_S1_R1_Neut, Confidence_Data_S1_R2_Neut)

#Combine matrices into single matrix representing confidence data x response for stimulus 2
#Confidence Rating count when the 'stimulus' was S1 and Valence was negative
nR_S2_neg <-  cbind(Confidence_Data_S2_R1_Neg, Confidence_Data_S2_R2_Neg)

#Combine matrices into single matrix representing confidence data x response for stimulus 2
#Confidence Rating count when the 'stimulus' was S2 and Valence was neutral
nR_S2_neut <-  cbind(Confidence_Data_S2_R1_Neut, Confidence_Data_S2_R2_Neut)

#Combine matrices into necessary format for H-meta-d'
nR_S1_1 <- cbind(nR_S1_neg, nR_S1_neut)
nR_S2_2<- cbind(nR_S2_neg, nR_S2_neut)

## Each vector has length k x 2 x2 where k is the number of ratings available. (i.e. it should be 12[1-3x2x2])
dim(nR_S1_1) #12 Columns
dim(nR_S2_2) #12 Columns

#Adding 0.25 to all cells [a generalization of the log-linear correction
# typically applied when estimating type 1 d’, as recommended by Hautus (1995)
nR_S1_1 <- nR_S1_1 + 0.5
nR_S2_2 <- nR_S2_2 + 0.5


#Export data matrices
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S1_SciRep40_1_MLE.mat", x=nR_S1_1) #Write Mat file for Stim 1
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S2_SciRep40_2_MLE.mat", x=nR_S2_2) #Write Mat file for Stim 2


#### MLE Dependent Source  DataPrep ####
## SOURCE MEMORY ##
#OLD STIM
Src_Confidence_Data_S1_R2 <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 1 & Mem_Resp_Cor == 0) %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count")
#Coerce Data frame to quantify source confidence counts x Stimulus type (S1_Old) x response (R1_Old) x Valence (Negative)
Src_Confidence_Data_S1_R1_Neg <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 1 & Mem_Resp_Cor == 1) %>%
  filter(Src_Scene == "E") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Src_Confidence_Data_S1_R1_Neg$`1`[is.na(Src_Confidence_Data_S1_R1_Neg$`1`)] <- 0; Src_Confidence_Data_S1_R1_Neg$`2`[is.na(Src_Confidence_Data_S1_R1_Neg$`2`)] <- 0; Src_Confidence_Data_S1_R1_Neg$`3`[is.na(Src_Confidence_Data_S1_R1_Neg$`3`)] <- 0
Src_Confidence_Data_S1_R1_Neg <- Src_Confidence_Data_S1_R1_Neg %>% select('participant','3','2','1')  #Correct order
Src_Confidence_Data_S1_R1_Neg<-data.frame(Src_Confidence_Data_S1_R1_Neg) 
colnames(Src_Confidence_Data_S1_R1_Neg) <- c("ID", "3", "2","1")
Src_Confidence_Data_S1_R1_Neg <- apply(Src_Confidence_Data_S1_R1_Neg, 2, str_remove_all, " ")  
Src_Confidence_Data_S1_R1_Neg <- matrix(as.numeric(Src_Confidence_Data_S1_R1_Neg),    # Convert to numeric matrix
                                        ncol = ncol(Src_Confidence_Data_S1_R1_Neg))
Src_Confidence_Data_S1_R1_Neg <- Src_Confidence_Data_S1_R1_Neg[,2:4]
colnames(Src_Confidence_Data_S1_R1_Neg) <- c('3','2','1')

#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R1_Old) x Valance (Neutral)
Src_Confidence_Data_S1_R1_Neut <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 1 & Mem_Resp_Cor == 1) %>%
  filter(Src_Scene == "N") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Src_Confidence_Data_S1_R1_Neut$`1`[is.na(Src_Confidence_Data_S1_R1_Neut$`1`)] <- 0; Src_Confidence_Data_S1_R1_Neut$`2`[is.na(Src_Confidence_Data_S1_R1_Neut$`2`)] <- 0; Src_Confidence_Data_S1_R1_Neut$`3`[is.na(Src_Confidence_Data_S1_R1_Neut$`3`)] <- 0
Src_Confidence_Data_S1_R1_Neut <- Src_Confidence_Data_S1_R1_Neut %>% select('participant','3','2','1')  #Correct order
Src_Confidence_Data_S1_R1_Neut<-data.frame(Src_Confidence_Data_S1_R1_Neut) 
colnames(Src_Confidence_Data_S1_R1_Neut) <- c("ID", "3", "2","1")
Src_Confidence_Data_S1_R1_Neut <- apply(Src_Confidence_Data_S1_R1_Neut, 2, str_remove_all, " ")  
Src_Confidence_Data_S1_R1_Neut <- matrix(as.numeric(Src_Confidence_Data_S1_R1_Neut),    # Convert to numeric matrix
                                        ncol = ncol(Src_Confidence_Data_S1_R1_Neut))
Src_Confidence_Data_S1_R1_Neut <- Src_Confidence_Data_S1_R1_Neut[,2:4]
colnames(Src_Confidence_Data_S1_R1_Neut) <- c('3','2','1')

#NEW RESPONSE
#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R2_New) x Valence (Negative)
Src_Confidence_Data_S1_R2_Neg <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 1 & Mem_Resp_Cor == 0) %>%
  filter(Src_Scene == "E") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Src_Confidence_Data_S1_R2_Neg$`1`[is.na(Src_Confidence_Data_S1_R2_Neg$`1`)] <- 0; Src_Confidence_Data_S1_R2_Neg$`2`[is.na(Src_Confidence_Data_S1_R2_Neg$`2`)] <- 0; Src_Confidence_Data_S1_R2_Neg$`3`[is.na(Src_Confidence_Data_S1_R2_Neg$`3`)] <- 0
Src_Confidence_Data_S1_R2_part1 <- as.matrix(Src_Confidence_Data_S1_R2_Neg[1:8,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_part1 <- rbind(Src_Confidence_Data_S1_R2_part1, c(143, 0, 0, 0)) #add missing participant 143
Src_Confidence_Data_S1_R2_part2 <- as.matrix(Src_Confidence_Data_S1_R2_Neg[9:23,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_part2 <- rbind(Src_Confidence_Data_S1_R2_part2, c(232, 0, 0, 0), c(237, 0, 0, 0), c(238, 0, 0, 0)) #add missing participant 143
Src_Confidence_Data_S1_R2_part3 <- as.matrix(Src_Confidence_Data_S1_R2_Neg[24,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_part3 <- rbind(Src_Confidence_Data_S1_R2_part3, c(244, 0, 0, 0)) #add missing participant 143
Src_Confidence_Data_S1_R2_part4 <- as.matrix(Src_Confidence_Data_S1_R2_Neg[25:35,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_Neg <- rbind(Src_Confidence_Data_S1_R2_part1, Src_Confidence_Data_S1_R2_part2, Src_Confidence_Data_S1_R2_part3, Src_Confidence_Data_S1_R2_part4)
Src_Confidence_Data_S1_R2_Neg <- as.matrix(Src_Confidence_Data_S1_R2_Neg)[,2:4]
Src_Confidence_Data_S1_R2_Neg <- apply(Src_Confidence_Data_S1_R2_Neg, 2, str_remove_all, " ")  
Src_Confidence_Data_S1_R2_Neg <- matrix(as.numeric(Src_Confidence_Data_S1_R2_Neg),    # Convert to numeric matrix
                                        ncol = ncol(Src_Confidence_Data_S1_R2_Neg))
colnames(Src_Confidence_Data_S1_R2_Neg) <- c('3','2','1')


#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R2_New) x Valence (Neutral)
Src_Confidence_Data_S1_R2_Neut <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 1 & Mem_Resp_Cor == 0) %>%
  filter(Src_Scene == "N") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Src_Confidence_Data_S1_R2_Neut$`1`[is.na(Src_Confidence_Data_S1_R2_Neut$`1`)] <- 0; Src_Confidence_Data_S1_R2_Neut$`2`[is.na(Src_Confidence_Data_S1_R2_Neut$`2`)] <- 0; Src_Confidence_Data_S1_R2_Neut$`3`[is.na(Src_Confidence_Data_S1_R2_Neut$`3`)] <- 0
Src_Confidence_Data_S1_R2_part1 <- as.matrix(Src_Confidence_Data_S1_R2_Neut[1:4,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_part2 <- as.matrix(Src_Confidence_Data_S1_R2_Neut[5:7,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_part3 <- as.matrix(Src_Confidence_Data_S1_R2_Neut[8:15,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_part4 <- as.matrix(Src_Confidence_Data_S1_R2_Neut[16:17,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_part5 <- as.matrix(Src_Confidence_Data_S1_R2_Neut[18:20,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_part6 <- as.matrix(Src_Confidence_Data_S1_R2_Neut[21:23,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_part7 <- as.matrix(Src_Confidence_Data_S1_R2_Neut[24:32,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_part1 <- rbind(Src_Confidence_Data_S1_R2_part1, c(131, 0, 0, 0)) #add missing participant 131
Src_Confidence_Data_S1_R2_part2 <- rbind(Src_Confidence_Data_S1_R2_part2, c(143, 0, 0, 0)) #add missing participant 143
Src_Confidence_Data_S1_R2_part3 <- rbind(Src_Confidence_Data_S1_R2_part3, c(203, 0, 0, 0)) #add missing participant 143
Src_Confidence_Data_S1_R2_part4 <- rbind(Src_Confidence_Data_S1_R2_part4, c(219, 0, 0, 0)) #add missing participant 143
Src_Confidence_Data_S1_R2_part5 <- rbind(Src_Confidence_Data_S1_R2_part5, c(232, 0, 0, 0), c(237, 0, 0, 0)) #add missing participant 143
Src_Confidence_Data_S1_R2_part6 <- rbind(Src_Confidence_Data_S1_R2_part6, c(249, 0, 0, 0)) #add missing participant 143
Src_Confidence_Data_S1_R2_part7 <- rbind(Src_Confidence_Data_S1_R2_part7, c(282, 0, 0, 0)) #add missing participant 143
Src_Confidence_Data_S1_R2_Neut <- rbind(Src_Confidence_Data_S1_R2_part1, Src_Confidence_Data_S1_R2_part2, Src_Confidence_Data_S1_R2_part3, Src_Confidence_Data_S1_R2_part4, Src_Confidence_Data_S1_R2_part5, Src_Confidence_Data_S1_R2_part6, Src_Confidence_Data_S1_R2_part7) #Combine the three parts into a cohesive matrix 
Src_Confidence_Data_S1_R2_Neut <- as.matrix(Src_Confidence_Data_S1_R2_Neut)[,2:4]
Src_Confidence_Data_S1_R2_Neut <- apply(Src_Confidence_Data_S1_R2_Neut, 2, str_remove_all, " ")  
Src_Confidence_Data_S1_R2_Neut <- matrix(as.numeric(Src_Confidence_Data_S1_R2_Neut),    # Convert to numeric matrix
                                     ncol = ncol(Src_Confidence_Data_S1_R2_Neut))
colnames(Src_Confidence_Data_S1_R2_Neut) <- c('3','2','1')

#NEW STIM
#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R1_Old)
Src_Confidence_Data_S2_R1_Neg <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 0 & Mem_Resp_Cor == 1) %>%
  filter(Src_Scene == "E") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
Src_Confidence_Data_S2_R1_Neg$`1`[is.na(Src_Confidence_Data_S2_R1_Neg$`1`)] <- 0; Src_Confidence_Data_S2_R1_Neg$`2`[is.na(Src_Confidence_Data_S2_R1_Neg$`2`)] <- 0; Src_Confidence_Data_S2_R1_Neg$`3`[is.na(Src_Confidence_Data_S2_R1_Neg$`3`)] <- 0
Src_Confidence_Data_S2_R1_Neg_part1 <- as.matrix(Src_Confidence_Data_S2_R1_Neg[1:18,]) #Split up matrix to add additional rows
Src_Confidence_Data_S2_R1_Neg_part2 <- as.matrix(Src_Confidence_Data_S2_R1_Neg[19:27,]) #Split up matrix to add additional rows
Src_Confidence_Data_S2_R1_Neg_part3 <- as.matrix(Src_Confidence_Data_S2_R1_Neg[28:38,]) #Split up matrix to add additional rows
Src_Confidence_Data_S2_R1_Neg_part1 <- as.matrix(rbind(Src_Confidence_Data_S2_R1_Neg_part1, c(204, 0, 0, 0))) #add missing participant 131
Src_Confidence_Data_S2_R1_Neg_part2 <- as.matrix(rbind(Src_Confidence_Data_S2_R1_Neg_part2, c(244, 0, 0, 0))) #add missing participant 131
Src_Confidence_Data_S2_R1_Neg <- rbind(Src_Confidence_Data_S2_R1_Neg_part1, Src_Confidence_Data_S2_R1_Neg_part2, Src_Confidence_Data_S2_R1_Neg_part3)
Src_Confidence_Data_S2_R1_Neg <- as.matrix(Src_Confidence_Data_S2_R1_Neg)[,2:4]
Src_Confidence_Data_S2_R1_Neg <- apply(Src_Confidence_Data_S2_R1_Neg, 2, str_remove_all, " ")  
Src_Confidence_Data_S2_R1_Neg <- matrix(as.numeric(Src_Confidence_Data_S2_R1_Neg),    # Convert to numeric matrix
                                    ncol = ncol(Src_Confidence_Data_S2_R1_Neg))
colnames(Src_Confidence_Data_S2_R1_Neg) <- c('3','2','1')


#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R1_Old) x Valance (Neutral)
Src_Confidence_Data_S2_R1_Neut <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 0 & Mem_Resp_Cor == 1) %>%
  filter(Src_Scene == "N") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Src_Confidence_Data_S2_R1_Neut$`1`[is.na(Src_Confidence_Data_S2_R1_Neut$`1`)] <- 0; Src_Confidence_Data_S2_R1_Neut$`2`[is.na(Src_Confidence_Data_S2_R1_Neut$`2`)] <- 0; Src_Confidence_Data_S2_R1_Neut$`3`[is.na(Src_Confidence_Data_S2_R1_Neut$`3`)] <- 0
Src_Confidence_Data_S2_R1_Neut <- Src_Confidence_Data_S2_R1_Neut %>% select('participant','3','2','1')  #Correct order
Src_Confidence_Data_S2_R1_Neut<-data.frame(Src_Confidence_Data_S2_R1_Neut) 
colnames(Src_Confidence_Data_S2_R1_Neut) <- c("ID", "3", "2","1")
Src_Confidence_Data_S2_R1_Neut <- as.matrix(Src_Confidence_Data_S2_R1_Neut)[,2:4]
Src_Confidence_Data_S2_R1_Neut <- apply(Src_Confidence_Data_S2_R1_Neut, 2, str_remove_all, " ")  
Src_Confidence_Data_S2_R1_Neut <- matrix(as.numeric(Src_Confidence_Data_S2_R1_Neut),    # Convert to numeric matrix
                                         ncol = ncol(Src_Confidence_Data_S2_R1_Neut))
colnames(Src_Confidence_Data_S2_R1_Neut) <- c('3','2','1')


#NEW RESPONSE
#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R2_New) x Valence (Negative)
Src_Confidence_Data_S2_R2_Neg <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 0 & Mem_Resp_Cor == 0) %>%
  filter(Src_Scene == "E") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Src_Confidence_Data_S2_R2_Neg$`1`[is.na(Src_Confidence_Data_S2_R2_Neg$`1`)] <- 0; Src_Confidence_Data_S2_R2_Neg$`2`[is.na(Src_Confidence_Data_S2_R2_Neg$`2`)] <- 0; Src_Confidence_Data_S2_R2_Neg$`3`[is.na(Src_Confidence_Data_S2_R2_Neg$`3`)] <- 0
Src_Confidence_Data_S2_R2_Neg <- Src_Confidence_Data_S2_R2_Neg %>% select('participant','1','2','3')  #Correct order
Src_Confidence_Data_S2_R2_Neg<-data.frame(Src_Confidence_Data_S2_R2_Neg) 
colnames(Src_Confidence_Data_S2_R2_Neg) <- c("ID", "1", "2","3")
Src_Confidence_Data_S2_R2_Neg <- as.matrix(Src_Confidence_Data_S2_R2_Neg)[,2:4]
Src_Confidence_Data_S2_R2_Neg <- apply(Src_Confidence_Data_S2_R2_Neg, 2, str_remove_all, " ")  
Src_Confidence_Data_S2_R2_Neg <- matrix(as.numeric(Src_Confidence_Data_S2_R2_Neg),    # Convert to numeric matrix
                                         ncol = ncol(Src_Confidence_Data_S2_R2_Neg))
colnames(Src_Confidence_Data_S2_R2_Neg) <- c('3','2','1')


#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R2_New) x Valence (Negative)
Src_Confidence_Data_S2_R2_Neut <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 0 & Mem_Resp_Cor == 0) %>%
  filter(Src_Scene == "N") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
#Correction for 0 cell counts needed to stabilize predictions in MLE
Src_Confidence_Data_S2_R2_Neut$`1`[is.na(Src_Confidence_Data_S2_R2_Neut$`1`)] <- 0; Src_Confidence_Data_S2_R2_Neut$`2`[is.na(Src_Confidence_Data_S2_R2_Neut$`2`)] <- 0; Src_Confidence_Data_S2_R2_Neut$`3`[is.na(Src_Confidence_Data_S2_R2_Neut$`3`)] <- 0
Src_Confidence_Data_S2_R2_Neut <- Src_Confidence_Data_S2_R2_Neut %>% select('participant','1','2','3')  #Correct order
Src_Confidence_Data_S2_R2_Neut<-data.frame(Src_Confidence_Data_S2_R2_Neut) 
colnames(Src_Confidence_Data_S2_R2_Neut) <- c("ID", "1", "2","3")
Src_Confidence_Data_S2_R2_Neut <- as.matrix(Src_Confidence_Data_S2_R2_Neut)[,2:4]
Src_Confidence_Data_S2_R2_Neut <- apply(Src_Confidence_Data_S2_R2_Neut, 2, str_remove_all, " ")  
Src_Confidence_Data_S2_R2_Neut <- matrix(as.numeric(Src_Confidence_Data_S2_R2_Neut),    # Convert to numeric matrix
                                        ncol = ncol(Src_Confidence_Data_S2_R2_Neut))
colnames(Src_Confidence_Data_S2_R2_Neut) <- c('3','2','1')

#Combine matrices into single matrix representing confidence data x response for stimulus 1
#Confidence Rating count when the 'stimulus' was S1 and Valence was negative
nR_S1_neg_Src <-  cbind(Src_Confidence_Data_S1_R1_Neg, Src_Confidence_Data_S1_R2_Neg)

#Combine matrices into single matrix representing confidence data x response for stimulus 1
#Confidence Rating count when the 'stimulus' was S1 and Valence was neutral
nR_S1_neut_Src <-  cbind(Src_Confidence_Data_S1_R1_Neut, Src_Confidence_Data_S1_R2_Neut)

#Combine matrices into single matrix representing confidence data x response for stimulus 2
#Confidence Rating count when the 'stimulus' was S1 and Valence was negative
nR_S2_neg_Src <-  cbind(Src_Confidence_Data_S2_R1_Neg, Src_Confidence_Data_S2_R2_Neg)

#Combine matrices into single matrix representing confidence data x response for stimulus 2
#Confidence Rating count when the 'stimulus' was S2 and Valence was neutral
nR_S2_neut_Src <-  cbind(Src_Confidence_Data_S2_R1_Neut, Src_Confidence_Data_S2_R2_Neut)

#Combine matrices into necessary format for H-meta-d'
nR_S1_1_Src <- cbind(nR_S1_neg_Src, nR_S1_neut_Src); nR_S1_1_Src <- apply(nR_S1_1_Src, c(1,2), as.numeric)
nR_S2_2_Src <- cbind(nR_S2_neg_Src, nR_S2_neut_Src); nR_S2_2_Src <- apply(nR_S2_2_Src, c(1,2), as.numeric)


## Each vector has length k x 2 x2 where k is the number of ratings available. (i.e. it should be 12[1-3x2x2])
dim(nR_S1_1_Src) #12 Columns
dim(nR_S2_2_Src) #12 Columns

#Adding 0.25 to all cells [a generalization of the log-linear correction
# typically applied when estimating type 1 d’, as recommended by Hautus (1995)
nR_S1_1_Src <- nR_S1_1_Src + 0.5
nR_S2_2_Src <- nR_S2_2_Src + 0.5

#Export data matrices
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nRSrc_S1_SciRep40_1_1_MLE.mat", x=nR_S1_1_Src) #Write Mat file for Stim 1
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nRSrc_S2_SciRep40_1_2_MLE.mat", x=nR_S2_2_Src) #Write Mat file for Stim 2


#### H-Meta-d' Dataprep ####
#index for 35/66
inclusion_chk <- unique(Item_Cleaned_Anal_40$participant) %in% Src_40

#FITTING META D'
## Data from each subject need to be coerced into two vectos nR_S1 & nR_S2 , which CONTAIN CONFIDENCE-RATING COUNTS
##  for when the 'stimulus' was S1 & S2, respectively.
## Confidence counts are entered such that the first entry refers to counts of maximum confidence in an S1 response,
##  and the last entry to maximum confidence in an S2 response. (S1_Pres_3, S1_Pres_2, S1_Pres_1, S2_Abs_1, S2_Abs_2, S2_Abs_3)

##### ITEM MEMORY #####
#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R1_Old)
Confidence_Data_S1_R1 <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 1 & Item_Mem_Response == 1) %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
Confidence_Data_S1_R1[is.na(Confidence_Data_S1_R1)] = 0 #Order still needs to be flipped
colnames(Confidence_Data_S1_R1) <- c('participant', '1','3','2')
Confidence_Data_S1_R1 <- Confidence_Data_S1_R1 %>% select('participant','3','2','1')  #Correct order
Confidence_Data_S1_R1<-data.frame(Confidence_Data_S1_R1) 
colnames(Confidence_Data_S1_R1) <- c("ID", "3", "2","1")
Confidence_Data_S1_R1 <- as.matrix(Confidence_Data_S1_R1)[,2:4]


#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R2_New)
Confidence_Data_S1_R2 <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 1 & Item_Mem_Response == 0) %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of failure
Confidence_Data_S1_R2[is.na(Confidence_Data_S1_R2)] = 0 #Order still needs to be flipped
Confidence_Data_S1_R2 <- as.matrix(Confidence_Data_S1_R2)
Confidence_Data_S1_R2 <- data.frame(Confidence_Data_S1_R2) 
colnames(Confidence_Data_S1_R2) <- c("ID", "1", "2","3")
Confidence_Data_S1_R2 <- as.matrix(Confidence_Data_S1_R2)[,2:4]

#Combine matrices into single matrix representing confidence data x response for stimulus 1
#Confidence Rating count when the 'stimulus' was S1
nR_S1 <-  cbind(Confidence_Data_S1_R1, Confidence_Data_S1_R2)     

#Coerce Data frame to quantify confidence counts x Stimulus type (New) x response (Old)
Confidence_Data_S2_R1 <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 0 & Item_Mem_Response == 1) %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
# Convert the column to numeric type
Confidence_Data_S2_R1$`1`[is.na(Confidence_Data_S2_R1$`1`)] <- 0; Confidence_Data_S2_R1$`2`[is.na(Confidence_Data_S2_R1$`2`)] <- 0.; Confidence_Data_S2_R1$`3`[is.na(Confidence_Data_S2_R1$`3`)] <- 0
Confidence_Data_S2_R1_part1 <- as.matrix(Confidence_Data_S2_R1[1:4,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_part1 <- rbind(Confidence_Data_S2_R1_part1, c(131, 0, 0, 0)) #add missing participant 131
Confidence_Data_S2_R1_part2 <- as.matrix(Confidence_Data_S2_R1[5:39,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1 <- rbind(Confidence_Data_S2_R1_part1, Confidence_Data_S2_R1_part2) #Combine the three parts into a cohesive matrix 
Confidence_Data_S2_R1 <- as.data.frame(Confidence_Data_S2_R1) %>% select(participant, '3','2','1')
Confidence_Data_S2_R1 <- as.matrix(Confidence_Data_S2_R1)[,2:4]

#Convert the dataframe to complete matrix
#Correction for 0 cell counts needed to stabilize predictions in MLE
Confidence_Data_S2_R2 <-  Item_Cleaned_Anal_40 %>%
  filter(Pres == 0 & Item_Mem_Response == 0) %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of failure
#Correction for 0 cell counts needed to stabilize predictions in MLE
Confidence_Data_S2_R2$`1`[is.na(Confidence_Data_S2_R2$`1`)] <- 0; Confidence_Data_S2_R2$`2`[is.na(Confidence_Data_S2_R2$`2`)] <- 0; Confidence_Data_S2_R2$`3`[is.na(Confidence_Data_S2_R2$`3`)] <- 0
Confidence_Data_S2_R2 <- as.matrix(Confidence_Data_S2_R2)[,2:4]

#Coerce Data frame to quantify confidence counts x Stimulus type (New) x response (New))
Confidence_Data_S2_R2 <-  Item_Cleaned_Anal_40 %>%
  filter(Pres == 0 & Item_Mem_Response == 0) %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of failure
Confidence_Data_S2_R2[is.na(Confidence_Data_S2_R2)] = 0 #Order still needs to be flipped
Confidence_Data_S2_R2 <- as.matrix(Confidence_Data_S2_R2)[,2:4]

#Combine matrices into single matrix representing confidence data x response for stimulus 2
#Confidence Rating count when the 'stimulus' was S2
nR_S2 <-  cbind(Confidence_Data_S2_R1, Confidence_Data_S2_R2)

## Each vector has length k x 2 where k is the number of ratings available. (i.e. it should be 6[1-3x2])
dim(nR_S1) #6 Columns
dim(nR_S2) #6 Columns

## They should approximately be mirror images in magnitude
nR_S1; nR_S2 #Grouping is approximately mirrored in nature

#Export data matrices
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S1_40_HM.mat", x=nR_S1[inclusion_chk,]) #Write Mat file for Stim 1
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S2_40_HM.mat", x=nR_S2[inclusion_chk,]) #Write Mat file for Stim 2

##### SOURCE MEMORY #####
Src_Confidence_Data_S1_R1 <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 1 & Mem_Resp_Cor == 1) %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
Src_Confidence_Data_S1_R1[is.na(Src_Confidence_Data_S1_R1)] = 0 #Order still needs to be flipped
Src_Confidence_Data_S1_R1 <- Src_Confidence_Data_S1_R1 %>% select('participant','3','2','1')  #Correct order
Src_Confidence_Data_S1_R1<-data.frame(Src_Confidence_Data_S1_R1) 
colnames(Src_Confidence_Data_S1_R1) <- c("ID", "3", "2","1")
Src_Confidence_Data_S1_R1 <- as.matrix(Src_Confidence_Data_S1_R1)[,2:4]
Src_Confidence_Data_S1_R1 <- apply(Src_Confidence_Data_S1_R1, 2, str_remove_all, " ")  
Src_Confidence_Data_S1_R1 <- matrix(as.numeric(Src_Confidence_Data_S1_R1),    # Convert to numeric matrix
                                    ncol = ncol(Src_Confidence_Data_S1_R1))
colnames(Src_Confidence_Data_S1_R1) <- c('3','2','1')

#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R2_New)
Src_Confidence_Data_S1_R2 <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 1 & Mem_Resp_Cor == 0) %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of failure
#Correction for 0 cell counts needed to stabilize predictions in MLE
Src_Confidence_Data_S1_R2$`1`[is.na(Src_Confidence_Data_S1_R2$`1`)] <- 0; Src_Confidence_Data_S1_R2$`2`[is.na(Src_Confidence_Data_S1_R2$`2`)] <- 0; Src_Confidence_Data_S1_R2$`3`[is.na(Src_Confidence_Data_S1_R2$`3`)] <- 0 #Order still needs to be flipped
Src_Confidence_Data_S1_R2 <- Src_Confidence_Data_S1_R2 %>% select('participant','3','2','1')  #Correct order
Src_Confidence_Data_S1_R2<-data.frame(Src_Confidence_Data_S1_R2) 
colnames(Src_Confidence_Data_S1_R2) <- c("ID", "1", "2","3")
Src_Confidence_Data_S1_R2_part1 <- as.matrix(Src_Confidence_Data_S1_R2[1:8,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_part1 <- rbind(Src_Confidence_Data_S1_R2_part1, c(143, 0, 0, 0)) #add missing participant 143
Src_Confidence_Data_S1_R2_part2 <- as.matrix(Src_Confidence_Data_S1_R2[9:23,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2_part2 <- rbind(Src_Confidence_Data_S1_R2_part2, c(232, 0, 0, 0), c(237, 0, 0, 0)) #add missing participant 143
Src_Confidence_Data_S1_R2_part3 <- as.matrix(Src_Confidence_Data_S1_R2[24:37,]) #Split up matrix to add additional rows
Src_Confidence_Data_S1_R2 <- rbind(Src_Confidence_Data_S1_R2_part1, Src_Confidence_Data_S1_R2_part2, Src_Confidence_Data_S1_R2_part3)
Src_Confidence_Data_S1_R2 <- as.matrix(Src_Confidence_Data_S1_R2)[,2:4]
Src_Confidence_Data_S1_R2 <- apply(Src_Confidence_Data_S1_R2, 2, str_remove_all, " ")  
Src_Confidence_Data_S1_R2 <- matrix(as.numeric(Src_Confidence_Data_S1_R2),    # Convert to numeric matrix
                                    ncol = ncol(Src_Confidence_Data_S1_R2))
colnames(Src_Confidence_Data_S1_R2) <- c('1','2','3')

#Combine matrices into single matrix representing confidence data x response for stimulus 1
#Confidence Rating count when the 'stimulus' was S1
Src_nR_S1 <-  cbind(Src_Confidence_Data_S1_R1, Src_Confidence_Data_S1_R2)     

#Coerce Data frame to quantify confidence counts x Stimulus type (New) x response (Old)
Src_Confidence_Data_S2_R1 <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 0 & Mem_Resp_Cor == 1) %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success
#Correction for 0 cell counts needed to stabilize predictions in MLE
Src_Confidence_Data_S2_R1$`1`[is.na(Src_Confidence_Data_S2_R1$`1`)] <- 0; Src_Confidence_Data_S2_R1$`2`[is.na(Src_Confidence_Data_S2_R1$`2`)] <- 0; Src_Confidence_Data_S2_R1$`3`[is.na(Src_Confidence_Data_S2_R1$`3`)] <- 0 #Order still needs to be flipped
Src_Confidence_Data_S2_R1 <- Src_Confidence_Data_S2_R1 %>% select('participant','3','2','1')  #Correct order
Src_Confidence_Data_S2_R1<-data.frame(Src_Confidence_Data_S2_R1) 
colnames(Src_Confidence_Data_S2_R1) <- c("ID", "3", "2","1")
Src_Confidence_Data_S2_R1 <- as.matrix(Src_Confidence_Data_S2_R1)[,2:4]
Src_Confidence_Data_S2_R1 <- apply(Src_Confidence_Data_S2_R1, 2, str_remove_all, " ")  
Src_Confidence_Data_S2_R1 <- matrix(as.numeric(Src_Confidence_Data_S2_R1),    # Convert to numeric matrix
                                    ncol = ncol(Src_Confidence_Data_S2_R1))
colnames(Src_Confidence_Data_S2_R1) <- c('3','2','1')

#Coerce Data frame to quantify confidence counts x Stimulus type (New) x response (New))
Src_Confidence_Data_S2_R2 <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 0 & Mem_Resp_Cor == 0) %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
Src_Confidence_Data_S2_R2[is.na(Src_Confidence_Data_S2_R2)] = 0 #Order still needs to be flipped
Src_Confidence_Data_S2_R2 <- Src_Confidence_Data_S2_R2 %>% select('participant','1','2','3')  #Correct order
Src_Confidence_Data_S2_R2<-data.frame(Src_Confidence_Data_S2_R2) 
colnames(Src_Confidence_Data_S2_R2) <- c("ID", "1", "2","3")
Src_Confidence_Data_S2_R2 <- as.matrix(Src_Confidence_Data_S2_R2)[,2:4]
Src_Confidence_Data_S2_R2 <- apply(Src_Confidence_Data_S2_R2, 2, str_remove_all, " ")  
Src_Confidence_Data_S2_R2 <- matrix(as.numeric(Src_Confidence_Data_S2_R2),    # Convert to numeric matrix
                                    ncol = ncol(Src_Confidence_Data_S2_R2))
colnames(Src_Confidence_Data_S2_R2) <- c('1','2','3')

#Combine matrices into single matrix representing confidence data x response for stimulus 2
#Confidence Rating count when the 'stimulus' was S2
Src_nR_S2 <-  cbind(Src_Confidence_Data_S2_R1, Src_Confidence_Data_S2_R2)

## Each vector has length k x 2 where k is the number of ratings available. (i.e. it should be 6[1-3x2])
dim(Src_nR_S1) #6 Columns
dim(Src_nR_S2) #6 Columns

## They should approximately be mirror images in magnitude
Src_nR_S1; Src_nR_S2 #Grouping is approximately mirrored in nature

#Export data matrices
#library(R.matlab)
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nRSrc_S1_40_HM.mat", x=Src_nR_S1[inclusion_chk,]) #Write Mat file for Stim 1
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nRSrc_S2_40_HM.mat", x=Src_nR_S2[inclusion_chk,]) #Write Mat file for Stim 2


#### H-Meta-d' Dependent Memory DataPrep ####
#Combine matrices into necessary format for H-meta-d'
nR_S1_1 <- cbind(nR_S1, Src_nR_S1)
nR_S2_2<- cbind(nR_S2, Src_nR_S2)

## Each vector has length k x 2 x2 where k is the number of ratings available. (i.e. it should be 12[1-3x2x2])
dim(nR_S1_1) #12 Columns
dim(nR_S2_2) #12 Columns

#Filter by usable participants
nR_S1_1 <- nR_S1_1[inclusion_chk,]
nR_S2_2 <- nR_S2_2[inclusion_chk,]

#Export data matrices
#library(R.matlab)
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S1_40_Mem_1.mat", x=nR_S1_1) #Write Mat file for Stim 1
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S2_40_Mem_2.mat", x=nR_S2_2) #Write Mat file for Stim 2


#### H-Meta-d' Dependent Item DataPrep ####
## ITEM MEMORY ##
#OLD STIM
#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R1_Old) x Valence (Negative)
Confidence_Data_S1_R1_Neg <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 1 & Item_Mem_Response == 1) %>%
  filter(Rec_Scene == "E") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
Confidence_Data_S1_R1_Neg[is.na(Confidence_Data_S1_R1_Neg)] = 0 #Order still needs to be flipped
Confidence_Data_S1_R1_Neg <- Confidence_Data_S1_R1_Neg %>% select('participant','3','2','1')  #Correct order
Confidence_Data_S1_R1_Neg<-data.frame(Confidence_Data_S1_R1_Neg) 
colnames(Confidence_Data_S1_R1_Neg) <- c("ID", "3", "2","1")
Confidence_Data_S1_R1_Neg <- as.matrix(Confidence_Data_S1_R1_Neg)[,2:4]

#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R1_Old) x Valance (Neutral)
Confidence_Data_S1_R1_Neut <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 1 & Item_Mem_Response == 1) %>%
  filter(Rec_Scene == "N") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
Confidence_Data_S1_R1_Neut[is.na(Confidence_Data_S1_R1_Neut)] = 0 #Order still needs to be flipped
Confidence_Data_S1_R1_Neut <- Confidence_Data_S1_R1_Neut %>% select('participant','3','2','1')  #Correct order
Confidence_Data_S1_R1_Neut<-data.frame(Confidence_Data_S1_R1_Neut) 
colnames(Confidence_Data_S1_R1_Neut) <- c("ID", "3", "2","1")
Confidence_Data_S1_R1_Neut <- as.matrix(Confidence_Data_S1_R1_Neut)[,2:4]

#NEW RESPONSE
#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R2_New) x Valence (Negative)
Confidence_Data_S1_R2_Neg <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 1 & Item_Mem_Response == 0) %>%
  filter(Rec_Scene == "E") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
Confidence_Data_S1_R2_Neg[is.na(Confidence_Data_S1_R2_Neg)] = 0 #Order still needs to be flipped
Confidence_Data_S1_R2_Neg <- Confidence_Data_S1_R2_Neg %>% select('participant','1','2','3')  #Correct order
Confidence_Data_S1_R2_Neg<-data.frame(Confidence_Data_S1_R2_Neg) 
colnames(Confidence_Data_S1_R2_Neg) <- c("ID", "1", "2","3")
Confidence_Data_S1_R2_Neg <- as.matrix(Confidence_Data_S1_R2_Neg)[,2:4]

#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R2_New) x Valence (Neutral)
Confidence_Data_S1_R2_Neut <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 1 & Item_Mem_Response == 0) %>%
  filter(Rec_Scene == "N") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
Confidence_Data_S1_R2_Neut[is.na(Confidence_Data_S1_R2_Neut)] = 0 #Order still needs to be flipped
Confidence_Data_S1_R2_Neut <- Confidence_Data_S1_R2_Neut %>% select('participant','1','2','3')  #Correct order
Confidence_Data_S1_R2_Neut<-data.frame(Confidence_Data_S1_R2_Neut) 
colnames(Confidence_Data_S1_R2_Neut) <- c("ID", "1", "2","3")
Confidence_Data_S1_R2_Neut <- as.matrix(Confidence_Data_S1_R2_Neut)[,2:4]

#NEW STIM
#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R1_Old)
Confidence_Data_S2_R1_Neg <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 0 & Item_Mem_Response == 1) %>%
  filter(Rec_Scene == "E") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
Confidence_Data_S2_R1_Neg[is.na(Confidence_Data_S2_R1_Neg)] = 0 #Order still needs to be flipped
Confidence_Data_S2_R1_Neg <- Confidence_Data_S2_R1_Neg %>% select('participant','3','2','1')  #Correct order
Confidence_Data_S2_R1_Neg<-data.frame(Confidence_Data_S2_R1_Neg) 
colnames(Confidence_Data_S2_R1_Neg) <- c("ID", "3", "2","1")
Confidence_Data_S2_R1_Neg_part1 <- as.matrix(Confidence_Data_S2_R1_Neg[1:3,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neg_part2 <- as.matrix(Confidence_Data_S2_R1_Neg[4,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neg_part3 <- as.matrix(Confidence_Data_S2_R1_Neg[5,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neg_part4 <- as.matrix(Confidence_Data_S2_R1_Neg[6:11,])
Confidence_Data_S2_R1_Neg_part5 <- as.matrix(Confidence_Data_S2_R1_Neg[12:26,])
Confidence_Data_S2_R1_Neg_part6 <- as.matrix(Confidence_Data_S2_R1_Neg[27:28,])
Confidence_Data_S2_R1_Neg_part7 <- as.matrix(Confidence_Data_S2_R1_Neg[29:30,])
Confidence_Data_S2_R1_Neg_part8 <- as.matrix(Confidence_Data_S2_R1_Neg[31:32,])
Confidence_Data_S2_R1_Neg_part1 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part1, c(130, 0, 0, 0), c(131, 0, 0, 0))) #add missing participant 131
Confidence_Data_S2_R1_Neg_part2 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part2, c(139, 0, 0, 0))) #add missing participant 139
Confidence_Data_S2_R1_Neg_part3 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part3, c(143, 0, 0, 0))) #add missing participant 143, 152
Confidence_Data_S2_R1_Neg_part4 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part4, c(193, 0, 0, 0)))
Confidence_Data_S2_R1_Neg_part5 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part5, c(253, 0, 0, 0))) #add missing participant 162, 165
Confidence_Data_S2_R1_Neg_part6 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part6, c(264, 0, 0, 0))) #add missing participant 193
Confidence_Data_S2_R1_Neg_part7 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part7, c(280, 0, 0, 0))) #add missing participant 221
Confidence_Data_S2_R1_Neg <- rbind(Confidence_Data_S2_R1_Neg_part1, Confidence_Data_S2_R1_Neg_part2, Confidence_Data_S2_R1_Neg_part3, Confidence_Data_S2_R1_Neg_part4, Confidence_Data_S2_R1_Neg_part5, Confidence_Data_S2_R1_Neg_part6, Confidence_Data_S2_R1_Neg_part7, Confidence_Data_S2_R1_Neg_part8)
Confidence_Data_S2_R1_Neg <- as.matrix(Confidence_Data_S2_R1_Neg)[,2:4]
Confidence_Data_S2_R1_Neg <- apply(Confidence_Data_S2_R1_Neg, 2, str_remove_all, " ")  
Confidence_Data_S2_R1_Neg <- matrix(as.numeric(Confidence_Data_S2_R1_Neg),    # Convert to numeric matrix
                                    ncol = ncol(Confidence_Data_S2_R1_Neg))
colnames(Confidence_Data_S2_R1_Neg) <- c('3','2','1')

#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R1_Old) x Valance (Neutral)
Confidence_Data_S2_R1_Neut <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 0 & Item_Mem_Response == 1) %>%
  filter(Rec_Scene == "N") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
Confidence_Data_S2_R1_Neut[is.na(Confidence_Data_S2_R1_Neut)] = 0 #Order still needs to be flipped
Confidence_Data_S2_R1_Neut <- Confidence_Data_S2_R1_Neut %>% select('participant','3','2','1')  #Correct order
Confidence_Data_S2_R1_Neut<-data.frame(Confidence_Data_S2_R1_Neut) 
colnames(Confidence_Data_S2_R1_Neut) <- c("ID", "3", "2","1")
Confidence_Data_S2_R1_Neut_part1 <- as.matrix(Confidence_Data_S2_R1_Neut[1:4,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neut_part2 <- as.matrix(Confidence_Data_S2_R1_Neut[5:12,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neut_part3 <- as.matrix(Confidence_Data_S2_R1_Neut[13:30,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neut_part4 <- as.matrix(Confidence_Data_S2_R1_Neut[31:36,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neut_part1 <- as.matrix(rbind(Confidence_Data_S2_R1_Neut_part1, c(131, 0, 0, 0))) #add missing participant 131
Confidence_Data_S2_R1_Neut_part2 <- as.matrix(rbind(Confidence_Data_S2_R1_Neut_part2, c(188, 0, 0, 0))) #add missing participant 152
Confidence_Data_S2_R1_Neut_part3 <- as.matrix(rbind(Confidence_Data_S2_R1_Neut_part3, c(260, 0, 0, 0))) #add missing participant 162
Confidence_Data_S2_R1_Neut_part4 <- as.matrix(rbind(Confidence_Data_S2_R1_Neut_part4, c(282, 0, 0, 0))) #add missing participant 182
Confidence_Data_S2_R1_Neut <- rbind(Confidence_Data_S2_R1_Neut_part1, Confidence_Data_S2_R1_Neut_part2, Confidence_Data_S2_R1_Neut_part3, Confidence_Data_S2_R1_Neut_part4)
Confidence_Data_S2_R1_Neut <- as.matrix(Confidence_Data_S2_R1_Neut)[,2:4]
Confidence_Data_S2_R1_Neut <- apply(Confidence_Data_S2_R1_Neut, 2, str_remove_all, " ")  
Confidence_Data_S2_R1_Neut <- matrix(as.numeric(Confidence_Data_S2_R1_Neut),    # Convert to numeric matrix
                                     ncol = ncol(Confidence_Data_S2_R1_Neut))
colnames(Confidence_Data_S2_R1_Neut) <- c('3','2','1')
 

#NEW RESPONSE
#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R2_New) x Valence (Negative)
Confidence_Data_S2_R2_Neg <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 0 & Item_Mem_Response == 0) %>%
  filter(Rec_Scene == "E") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
Confidence_Data_S2_R2_Neg[is.na(Confidence_Data_S2_R2_Neg)] = 0 #Order still needs to be flipped
Confidence_Data_S2_R2_Neg <- Confidence_Data_S2_R2_Neg %>% select('participant','1','2','3')  #Correct order
Confidence_Data_S2_R2_Neg<-data.frame(Confidence_Data_S2_R2_Neg) 
colnames(Confidence_Data_S2_R2_Neg) <- c("ID", "1", "2","3")
Confidence_Data_S2_R2_Neg <- as.matrix(Confidence_Data_S2_R2_Neg)[,2:4]

#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R2_New) x Valence (Negative)
Confidence_Data_S2_R2_Neut <- Item_Cleaned_Anal_40 %>%
  filter(Pres == 0 & Item_Mem_Response == 0) %>%
  filter(Rec_Scene == "N") %>%
  group_by(participant, Item_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Item_Conf_Response", "count") #Create counts of success 
Confidence_Data_S2_R2_Neut[is.na(Confidence_Data_S2_R2_Neut)] = 0 #Order still needs to be flipped
Confidence_Data_S2_R2_Neut <- Confidence_Data_S2_R2_Neut %>% select('participant','1','2','3')  #Correct order
Confidence_Data_S2_R2_Neut<-data.frame(Confidence_Data_S2_R2_Neut) 
colnames(Confidence_Data_S2_R2_Neut) <- c("ID", "1", "2","3")
Confidence_Data_S2_R2_Neut <- as.matrix(Confidence_Data_S2_R2_Neut)[,2:4]

#Combine matrices into single matrix representing confidence data x response for stimulus 1
#Confidence Rating count when the 'stimulus' was S1 and Valence was negative
nR_S1_neg <-  cbind(Confidence_Data_S1_R1_Neg, Confidence_Data_S1_R2_Neg)

#Combine matrices into single matrix representing confidence data x response for stimulus 1
#Confidence Rating count when the 'stimulus' was S1 and Valence was neutral
nR_S1_neut <-  cbind(Confidence_Data_S1_R1_Neut, Confidence_Data_S1_R2_Neut)

#Combine matrices into single matrix representing confidence data x response for stimulus 2
#Confidence Rating count when the 'stimulus' was S1 and Valence was negative
nR_S2_neg <-  cbind(Confidence_Data_S2_R1_Neg, Confidence_Data_S2_R2_Neg)

#Combine matrices into single matrix representing confidence data x response for stimulus 2
#Confidence Rating count when the 'stimulus' was S2 and Valence was neutral
nR_S2_neut <-  cbind(Confidence_Data_S2_R1_Neut, Confidence_Data_S2_R2_Neut)

#Combine matrices into necessary format for H-meta-d'
nR_S1_1 <- cbind(nR_S1_neg, nR_S1_neut)
nR_S2_2<- cbind(nR_S2_neg, nR_S2_neut)

## Each vector has length k x 2 x2 where k is the number of ratings available. (i.e. it should be 12[1-3x2x2])
dim(nR_S1_1) #12 Columns
dim(nR_S2_2) #12 Columns

#Export data matrices
#library(R.matlab)
writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S1_40x2_1_Item.mat", x=nR_S1_1) #Write Mat file for Stim 1
writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S2_40x2_2_Item.mat", x=nR_S2_2) #Write Mat file for Stim 2

#### H-Meta-d' Dependent Source DataPrep ####
#OLD STIM
#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R1_Old) x Valence (Negative)
Confidence_Data_S1_R1_Neg <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 1 & Mem_Resp_Cor == 1) %>%
  filter(Src_Scene == "E") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
Confidence_Data_S1_R1_Neg[is.na(Confidence_Data_S1_R1_Neg)] = 0 #Order still needs to be flipped
Confidence_Data_S1_R1_Neg <- Confidence_Data_S1_R1_Neg %>% select('participant','3','2','1')  #Correct order
Confidence_Data_S1_R1_Neg<-data.frame(Confidence_Data_S1_R1_Neg) 
colnames(Confidence_Data_S1_R1_Neg) <- c("ID", "3", "2","1")
Confidence_Data_S1_R1_Neg <- as.matrix(Confidence_Data_S1_R1_Neg)[,2:4]
Confidence_Data_S1_R1_Neg <- apply(Confidence_Data_S1_R1_Neg, 2, str_remove_all, " ")  
Confidence_Data_S1_R1_Neg <- matrix(as.numeric(Confidence_Data_S1_R1_Neg),    # Convert to numeric matrix
                                    ncol = ncol(Confidence_Data_S1_R1_Neg))
colnames(Confidence_Data_S1_R1_Neg) <- c('3','2','1')

#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R1_Old) x Valance (Neutral)
Confidence_Data_S1_R1_Neut <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 1 & Mem_Resp_Cor == 1) %>%
  filter(Src_Scene == "N") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
Confidence_Data_S1_R1_Neut[is.na(Confidence_Data_S1_R1_Neut)] = 0 #Order still needs to be flipped
Confidence_Data_S1_R1_Neut <- Confidence_Data_S1_R1_Neut %>% select('participant','3','2','1')  #Correct order
Confidence_Data_S1_R1_Neut<-data.frame(Confidence_Data_S1_R1_Neut) 
colnames(Confidence_Data_S1_R1_Neut) <- c("ID", "3", "2","1")
Confidence_Data_S1_R1_Neut <- as.matrix(Confidence_Data_S1_R1_Neut)[,2:4]
Confidence_Data_S1_R1_Neut <- apply(Confidence_Data_S1_R1_Neut, 2, str_remove_all, " ")  
Confidence_Data_S1_R1_Neut <- matrix(as.numeric(Confidence_Data_S1_R1_Neut),    # Convert to numeric matrix
                                    ncol = ncol(Confidence_Data_S1_R1_Neut))
colnames(Confidence_Data_S1_R1_Neut) <- c('3','2','1')

#NEW RESPONSE
#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R2_New) x Valence (Negative)
Confidence_Data_S1_R2_Neg <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 1 & Mem_Resp_Cor == 0) %>%
  filter(Src_Scene == "E") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
Confidence_Data_S1_R2_Neg[is.na(Confidence_Data_S1_R2_Neg)] = 0 #Order still needs to be flipped
Confidence_Data_S1_R2_Neg <- Confidence_Data_S1_R2_Neg %>% select('participant','1','2','3')  #Correct order
Confidence_Data_S1_R2_Neg<-data.frame(Confidence_Data_S1_R2_Neg) 
colnames(Confidence_Data_S1_R2_Neg) <- c("ID", "1", "2","3")
Confidence_Data_S1_R2_part1 <- as.matrix(Confidence_Data_S1_R2_Neg[1:8,]) #Split up matrix to add additional rows
Confidence_Data_S1_R2_part1 <- rbind(Confidence_Data_S1_R2_part1, c(143, 0, 0, 0)) #add missing participant 
Confidence_Data_S1_R2_part2 <- as.matrix(Confidence_Data_S1_R2_Neg[9:23,]) #Split up matrix to add additional rows
Confidence_Data_S1_R2_part3 <- as.matrix(Confidence_Data_S1_R2_Neg[24,]) #Split up matrix to add additional rows
Confidence_Data_S1_R2_part2 <- rbind(Confidence_Data_S1_R2_part2, c(232, 0, 0, 0), c(237, 0, 0, 0), c(238, 0, 0, 0)) #add missing participant 
Confidence_Data_S1_R2_part3 <- rbind(Confidence_Data_S1_R2_part3, c(244, 0, 0, 0)) #add missing participant 
Confidence_Data_S1_R2_part4 <- as.matrix(Confidence_Data_S1_R2_Neg[25:35,]) #Split up matrix to add additional rows
Confidence_Data_S1_R2_Neg <- rbind(Confidence_Data_S1_R2_part1, Confidence_Data_S1_R2_part2, Confidence_Data_S1_R2_part3, Confidence_Data_S1_R2_part4) #Combine the three parts into a cohesive matrix 
Confidence_Data_S1_R2_Neg <- as.matrix(Confidence_Data_S1_R2_Neg)[,2:4]
Confidence_Data_S1_R2_Neg <- apply(Confidence_Data_S1_R2_Neg, 2, str_remove_all, " ")  
Confidence_Data_S1_R2_Neg <- matrix(as.numeric(Confidence_Data_S1_R2_Neg),    # Convert to numeric matrix
                                     ncol = ncol(Confidence_Data_S1_R2_Neg))
colnames(Confidence_Data_S1_R2_Neg) <- c('3','2','1')

#Coerce Data frame to quantify confidence counts x Stimulus type (S1_Old) x response (R2_New) x Valence (Neutral)
Confidence_Data_S1_R2_Neut <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 1 & Mem_Resp_Cor == 0) %>%
  filter(Src_Scene == "N") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
Confidence_Data_S1_R2_Neut[is.na(Confidence_Data_S1_R2_Neut)] = 0 #Order still needs to be flipped
Confidence_Data_S1_R2_Neut <- Confidence_Data_S1_R2_Neut %>% select('participant','1','2','3')  #Correct order
Confidence_Data_S1_R2_Neut<-data.frame(Confidence_Data_S1_R2_Neut) 
colnames(Confidence_Data_S1_R2_Neut) <- c("ID", "1", "2","3")
Confidence_Data_S1_R2_part1 <- as.matrix(Confidence_Data_S1_R2_Neut[1:4,]) #Split up matrix to add additional rows
Confidence_Data_S1_R2_part2 <- as.matrix(Confidence_Data_S1_R2_Neut[5:7,]) #Split up matrix to add additional rows
Confidence_Data_S1_R2_part3 <- as.matrix(Confidence_Data_S1_R2_Neut[8:15,]) #Split up matrix to add additional rows
Confidence_Data_S1_R2_part4 <- as.matrix(Confidence_Data_S1_R2_Neut[16:17,]) #Split up matrix to add additional rows
Confidence_Data_S1_R2_part5 <- as.matrix(Confidence_Data_S1_R2_Neut[18:20,]) #Split up matrix to add additional rows
Confidence_Data_S1_R2_part6 <- as.matrix(Confidence_Data_S1_R2_Neut[21:23,]) #Split up matrix to add additional rows
Confidence_Data_S1_R2_part7 <- as.matrix(Confidence_Data_S1_R2_Neut[24:32,]) #Split up matrix to add additional rows
Confidence_Data_S1_R2_part1 <- rbind(Confidence_Data_S1_R2_part1, c(131, 0, 0, 0)) #add missing participant 131
Confidence_Data_S1_R2_part2 <- rbind(Confidence_Data_S1_R2_part2, c(143, 0, 0, 0)) #add missing participant 143
Confidence_Data_S1_R2_part3 <- rbind(Confidence_Data_S1_R2_part3, c(203, 0, 0, 0)) #add missing participant 143
Confidence_Data_S1_R2_part4 <- rbind(Confidence_Data_S1_R2_part4, c(219, 0, 0, 0)) #add missing participant 143
Confidence_Data_S1_R2_part5 <- rbind(Confidence_Data_S1_R2_part5, c(232, 0, 0, 0), c(237, 0, 0, 0)) #add missing participant 143
Confidence_Data_S1_R2_part6 <- rbind(Confidence_Data_S1_R2_part6, c(249, 0, 0, 0)) #add missing participant 143
Confidence_Data_S1_R2_part7 <- rbind(Confidence_Data_S1_R2_part7, c(282, 0, 0, 0)) #add missing participant 143
Confidence_Data_S1_R2_Neut <- rbind(Confidence_Data_S1_R2_part1, Confidence_Data_S1_R2_part2, Confidence_Data_S1_R2_part3, Confidence_Data_S1_R2_part4, Confidence_Data_S1_R2_part5, Confidence_Data_S1_R2_part6, Confidence_Data_S1_R2_part7) #Combine the three parts into a cohesive matrix 
Confidence_Data_S1_R2_Neut <- as.matrix(Confidence_Data_S1_R2_Neut)[,2:4]
Confidence_Data_S1_R2_Neut <- apply(Confidence_Data_S1_R2_Neut, 2, str_remove_all, " ")  
Confidence_Data_S1_R2_Neut <- matrix(as.numeric(Confidence_Data_S1_R2_Neut),    # Convert to numeric matrix
                                    ncol = ncol(Confidence_Data_S1_R2_Neut))
colnames(Confidence_Data_S1_R2_Neut) <- c('3','2','1')

#NEW STIM
#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R1_Old)
Confidence_Data_S2_R1_Neg <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 0 & Mem_Resp_Cor == 1) %>%
  filter(Src_Scene == "E") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
Confidence_Data_S2_R1_Neg[is.na(Confidence_Data_S2_R1_Neg)] = 0 #Order still needs to be flipped
Confidence_Data_S2_R1_Neg <- Confidence_Data_S2_R1_Neg %>% select('participant','3','2','1')  #Correct order
Confidence_Data_S2_R1_Neg<-data.frame(Confidence_Data_S2_R1_Neg) 
colnames(Confidence_Data_S2_R1_Neg) <- c("ID", "3", "2","1")
Confidence_Data_S2_R1_Neg_part1 <- as.matrix(Confidence_Data_S2_R1_Neg[1:18,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neg_part2 <- as.matrix(Confidence_Data_S2_R1_Neg[19:27,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neg_part3 <- as.matrix(Confidence_Data_S2_R1_Neg[28:38,]) #Split up matrix to add additional rows
Confidence_Data_S2_R1_Neg_part1 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part1, c(204, 0, 0, 0))) #add missing participant 131
Confidence_Data_S2_R1_Neg_part2 <- as.matrix(rbind(Confidence_Data_S2_R1_Neg_part2, c(244, 0, 0, 0))) #add missing participant 131
Confidence_Data_S2_R1_Neg <- rbind(Confidence_Data_S2_R1_Neg_part1, Confidence_Data_S2_R1_Neg_part2, Confidence_Data_S2_R1_Neg_part3)
Confidence_Data_S2_R1_Neg <- as.matrix(Confidence_Data_S2_R1_Neg)[,2:4]
Confidence_Data_S2_R1_Neg <- apply(Confidence_Data_S2_R1_Neg, 2, str_remove_all, " ")  
Confidence_Data_S2_R1_Neg <- matrix(as.numeric(Confidence_Data_S2_R1_Neg),    # Convert to numeric matrix
                                    ncol = ncol(Confidence_Data_S2_R1_Neg))
colnames(Confidence_Data_S2_R1_Neg) <- c('3','2','1')


#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R1_Old) x Valance (Neutral)
Confidence_Data_S2_R1_Neut <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 0 & Mem_Resp_Cor == 1) %>%
  filter(Src_Scene == "N") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
Confidence_Data_S2_R1_Neut[is.na(Confidence_Data_S2_R1_Neut)] = 0 #Order still needs to be flipped
Confidence_Data_S2_R1_Neut <- Confidence_Data_S2_R1_Neut %>% select('participant','3','2','1')  #Correct order
Confidence_Data_S2_R1_Neut<-data.frame(Confidence_Data_S2_R1_Neut) 
colnames(Confidence_Data_S2_R1_Neut) <- c("ID", "3", "2","1")
Confidence_Data_S2_R1_Neut <- as.matrix(Confidence_Data_S2_R1_Neut)[,2:4]
Confidence_Data_S2_R1_Neut <- apply(Confidence_Data_S2_R1_Neut, 2, str_remove_all, " ")  
Confidence_Data_S2_R1_Neut <- matrix(as.numeric(Confidence_Data_S2_R1_Neut),    # Convert to numeric matrix
                                     ncol = ncol(Confidence_Data_S2_R1_Neut))
colnames(Confidence_Data_S2_R1_Neut) <- c('3','2','1')


#NEW RESPONSE
#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R2_New) x Valence (Negative)
Confidence_Data_S2_R2_Neg <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 0 & Mem_Resp_Cor == 0) %>%
  filter(Src_Scene == "E") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
Confidence_Data_S2_R2_Neg[is.na(Confidence_Data_S2_R2_Neg)] = 0 #Order still needs to be flipped
Confidence_Data_S2_R2_Neg <- Confidence_Data_S2_R2_Neg %>% select('participant','1','2','3')  #Correct order
Confidence_Data_S2_R2_Neg<-data.frame(Confidence_Data_S2_R2_Neg) 
colnames(Confidence_Data_S2_R2_Neg) <- c("ID", "1", "2","3")
Confidence_Data_S2_R2_Neg <- as.matrix(Confidence_Data_S2_R2_Neg)[,2:4]
Confidence_Data_S2_R2_Neg <- apply(Confidence_Data_S2_R2_Neg, 2, str_remove_all, " ")  
Confidence_Data_S2_R2_Neg <- matrix(as.numeric(Confidence_Data_S2_R2_Neg),    # Convert to numeric matrix
                                     ncol = ncol(Confidence_Data_S2_R2_Neg))
colnames(Confidence_Data_S2_R2_Neg) <- c('3','2','1')

#Coerce Data frame to quantify confidence counts x Stimulus type (S2_New) x response (R2_New) x Valence (Negative)
Confidence_Data_S2_R2_Neut <- Cleaned_Source_Anal_40 %>%
  filter(Pres == 0 & Mem_Resp_Cor == 0) %>%
  filter(Src_Scene == "N") %>%
  group_by(participant, Source_Conf_Response) %>%
  summarize(count = n()) %>%
  spread("Source_Conf_Response", "count") #Create counts of success 
Confidence_Data_S2_R2_Neut[is.na(Confidence_Data_S2_R2_Neut)] = 0 #Order still needs to be flipped
Confidence_Data_S2_R2_Neut <- Confidence_Data_S2_R2_Neut %>% select('participant','1','2','3')  #Correct order
Confidence_Data_S2_R2_Neut<-data.frame(Confidence_Data_S2_R2_Neut) 
colnames(Confidence_Data_S2_R2_Neut) <- c("ID", "1", "2","3")
Confidence_Data_S2_R2_Neut <- as.matrix(Confidence_Data_S2_R2_Neut)[,2:4]
Confidence_Data_S2_R2_Neut <- apply(Confidence_Data_S2_R2_Neut, 2, str_remove_all, " ")  
Confidence_Data_S2_R2_Neut <- matrix(as.numeric(Confidence_Data_S2_R2_Neut),    # Convert to numeric matrix
                                    ncol = ncol(Confidence_Data_S2_R2_Neut))
colnames(Confidence_Data_S2_R2_Neut) <- c('3','2','1')

#Combine matrices into single matrix representing confidence data x response for stimulus 1
#Confidence Rating count when the 'stimulus' was S1 and Valence was negative
nR_S1_neg_Src <-  cbind(Confidence_Data_S1_R1_Neg, Confidence_Data_S1_R2_Neg)

#Combine matrices into single matrix representing confidence data x response for stimulus 1
#Confidence Rating count when the 'stimulus' was S1 and Valence was neutral
nR_S1_neut_Src <-  cbind(Confidence_Data_S1_R1_Neut, Confidence_Data_S1_R2_Neut)

#Combine matrices into single matrix representing confidence data x response for stimulus 2
#Confidence Rating count when the 'stimulus' was S1 and Valence was negative
nR_S2_neg_Src <-  cbind(Confidence_Data_S2_R1_Neg, Confidence_Data_S2_R2_Neg)

#Combine matrices into single matrix representing confidence data x response for stimulus 2
#Confidence Rating count when the 'stimulus' was S2 and Valence was neutral
nR_S2_neut_Src <-  cbind(Confidence_Data_S2_R1_Neut, Confidence_Data_S2_R2_Neut)

#Combine matrices into necessary format for H-meta-d'
nR_S1_1_Src <- cbind(nR_S1_neg_Src, nR_S1_neut_Src)
nR_S2_2_Src <- cbind(nR_S2_neg_Src, nR_S2_neut_Src)

## Each vector has length k x 2 x2 where k is the number of ratings available. (i.e. it should be 12[1-3x2x2])
dim(nR_S1_1_Src) #12 Columns
dim(nR_S2_2_Src) #12 Columns

#Export data matrices
#library(R.matlab)
writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S1_40_1_Src.mat", x=nR_S1_1_Src) #Write Mat file for Stim 1
writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S2_40_2_Src.mat", x=nR_S2_2_Src) #Write Mat file for Stim 2

#Combine for H-Meta-d' Valence x Memory
nR_S1_Neg <- cbind(nR_S1_neg_Src, nR_S1_neg)
nR_S2_Neg <- cbind(nR_S2_neg_Src, nR_S2_neg)

nR_S1_Neut <- cbind(nR_S1_neut_Src , nR_S1_neut)
nR_S2_Neut <- cbind(nR_S2_neut_Src, nR_S2_neut)[inclusion_chk,]

#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S1_66_1_NegMem.mat", x=nR_S1_Neg) #Write Mat file for Stim 1
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S2_66_2_NegMem.mat", x=nR_S2_Neg) #Write Mat file for Stim 2
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S1_66_1_NeutMem.mat", x=nR_S1_Neut) #Write Mat file for Stim 1
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S2_66_2_NeutMem.mat", x=nR_S2_Neg) #Write Mat file for Stim 2

#### Item MLE M-ratio ####
# Sensitivity
Item_d_60 <- c(1.05, 1.92, 2.32, 1.33, 2.13, 2.99, 2.12, 1.33, 2.82, 1.34,  
            2.08, 2.17, 2.54, 2.99, 2.66, 2.73, 3.04, 2.54, 2.11, 2.02, 1.89,
            2.67, 2.06, 3.2, 1.99, 1.99, 1.57, 2.07, 2.6, 2.53, 2.51, 2.16, 2.73,
            2.26, 1.92, 2.04, 1.25, 1.5, 2.46, 1.84, 
            2.7, 2.06, 1.74, 1.81, 2.62, 1.98, 2.23, 3.14, 2.55, 2.15,
            2.64, 2.4, 2.57, 1.63, 1.85, 2.35, 2.51, 2.26, 2.83, 1.75)
Item_d_40 <- Item_d_60[above_d]
mean(Item_d_60); sd(Item_d_60) # 2.22 (0.49)
mean(Item_d_40); sd(Item_d_40) # 2.22 (0.47)

# Response Bias
Item_c_60 <- c(-0.11, -0.3, -0.41, -0.29, -0.3, -0.41, -0.13, -0.29, -0.18, -0.029, 
            -0.38, -0.45, -0.24, -0.36, -0.13, -0.4, -0.38, -0.35,-0.28, -0.41, -0.18, 
            -0.35, -0.42, -0.14, -0.082, -0.069, -0.14, -0.48, -0.29, -0.16, -0.3, -0.4,
            0.0076, -0.2608, -0.303, -0.2, -0.31, -0.06, -0.037, -0.086,
            -0.19, -0.08, -0.19, -0.46, -0.05, -0.21, -0.13, -0.22, -0.074, -0.36,
            -0.83, -0.22, -0.85, -0.085, 0.1, -0.7, -0.19, -0.33, -0.2, 0.39)
Item_c_40 <- Item_c_60[above_d]
mean(Item_c_60); sd(Item_c_60) # -0.25 (0.2)
mean(Item_c_40); sd(Item_c_40) # -0.26 (0.18)
sum(Item_c_60<0) #57/60 were liberal (95%)
sum(Item_c_40<0) #40/40 were liberal (100%)
# Metacognitive Accuracy (M-Ratio [H-Meta-d'/d'])
Item_MRat_60 <- c(1.15, 0.56, 0.94, 0.78, 0.75, 0.58, 0.43, 1.23, 1.13, 0.29, 0.89, 0.88, 0.53,
               0.51, 0.43, 0.48, 0.56, 0.7, 1.27, 0.69, 0.28, 0.58, 0.57, 0.41, 0.86, 0.72,
               0.85, 0.85, 0.87, 0.43, 0.44, 1.13, 0.63, 0.76, 1.07, 0.84, 0.92, 0.25, 0.69, 0.45,
               0.48, 1.02, 0.48, 0.8, 0.12, 0.4, 0.38, 0.56, 0.89, 0.9, 0.89, 0.42, 0.45,
               0.98, 1.07, 0.88, 0.53, 0.4, 0.63, 0.62)
Item_MRat_40 <- Item_MRat_60[above_d]
mean(Item_MRat_60); sd(Item_MRat_60) # 0.688 (0.27)
mean(Item_MRat_40); sd(Item_MRat_40) # 0.699 (0.28)


# Create dataframe
#Get participants in analysis
MLE_2SDT_60 <- data.frame(unique(sort(Subj_60$ID)), Item_d_60, Item_c_60)
MLE_2SDT_40 <- data.frame(unique(sort(Subj_40$ID)), Item_d_40, Item_c_40)

colnames(MLE_2SDT_60) <- c("ID", "d", "c")
colnames(MLE_2SDT_40) <- c("ID", "d", "c")

#Combine with Subjective data
Subjective_Quest <- Subj_40 %>% select(ID, Dem_Sex, BA_scores, SupraD_Scores, VVIQ_Scores)
Subjective_Quest$ID <- as.factor(Subjective_Quest$ID)
SDTnSubj <- Subjective_Quest %>% right_join(MLE_2SDT)
SDTnSubj$Dem_Sex <- as.factor(SDTnSubj$Dem_Sex)
SDTnSubj$Dem_Sex  <- relevel(SDTnSubj$Dem_Sex , ref = "Male")
# ScatterplotMatrix
scatterplotMatrix(~ BA_scores + SupraD_Scores + VVIQ_Scores + d + c, smooth=FALSE, 
                  by.group=TRUE, regLine=TRUE, data=SDTnSubj, row1attop = TRUE, legend= c(coords="bottomright"))
#There appears to be a positive association between BA_Scores and SupraD scores, as well as VVIQ and c

#### Source MLE M-ratio ####
# Sensitivity
Source_d_60 <- c(0.74, 0.06, 0.81, 1.91, 0.56, 1.37, 1.6, 0.49, 1.23, -0.097, 0.85, 1.62, 0.085, -0.002,
              0.96, -0.021, 0.411, 0.84, 0.85, 0.27, 1.34, 0.68, 1.13, 0.87, 0.74, 0.13, 2.44, 1.44, 0.12, 0.57, 
              0.29, 1.54, 0.49, 0.69, 0.80, 1.27, 0.29, 2.92, 2.65, 2.32, 
              0.87, 3.27, 2.06, 0.62, 1.39, -0.57, 0.29, 1.22, 0.82, 0.43,
              0.22, 0.71, 0.82, 1.84, 0.5, 1.06, 0.72, 1.69, -0.47, -0.85)
above_d <- Source_d > 0.5
sum(above_d) #40 eligible participants
Source_d_40 <- Source_d_60[above_d]

mean(Source_d_60); sd(Source_d_60) # 0.898 (0.82)
mean(Source_d_40); sd(Source_d_40) # 1.3 (0.68)

# Response Bias
Source_c_60  <- c(-0.93, -4.58, 0.2, -0.011, -0.25, 0.52, -0.27, 0.83, 0.055, -0.64, -0.03, 0.4, 6.2, 1.82, 
              0.011, 0.18, -3.28, -0.87, 0.19, -0.079, 0.035, -0.073, -0.41, 0.18, 0.44,  -8.38, -0.12,-0.08, 3.28, 2.2,  
              1.5, 0.33, -0.18, 0.80, -0.54, -0.23, 2.06, 0.023, 0.43, 0.99,
              -0.065, 0, 0.22, 0.075, -0.15, -0.22, -1.47, -0.14, -0.04, -0.25,
              -2.19, 0.22, -0.1, -0.095, 0.048, 0.18, 0.075, 0.38, 0.13, 0.21)
Source_c_40 <- Source_c_60[above_d]

mean(Source_c_60); sd(Source_c_60) # -0.024 (1.74)
mean(Source_c_40); sd(Source_c_40) # 0.089 (0.50)


# Metacognitive Accuracy (M-Ratio [H-Meta-d'/d'])
Source_MRat_60 <- c(-2.96, -44.53, 0.34, -0.085, -1.03, 1.28, -0.83, 2.42, 0.64, -1.56, -0.79, 0.4, 11.6, 
                 4.09, 0.058, 0.46, -5.7, -1.26, 0.68, -3.09, 0.57, -1.12, -1.54, 0.41, 1.2, -20.68, -0.34, 
                 -1.01, 7.24, 2.87, 4.28, 0.4, -0.69, 1.62, -0.89, -0.53, 3.64, 0.057, 0.64, 0.21, 
                 -0.23, -0.16, 0.42, 0.87, -0.69, -0.43, -5.64, -1.35, -0.21, -1.56, -3.88, 1.13, -0.73, -0.31,
                 0.22, 0.65, 0.15, 1.2, 0.17, 2.04)
Source_MRat_40 <- Source_MRat_60[above_d]

mean(Source_MRat_60); sd(Source_MRat_60) # -0.87 (6.82)
mean(Source_MRat_40); sd(Source_MRat_40) # -0.0068 (1.04)

#Create data frame
MLE_2SDT_Src_40 <- data.frame(unique(sort(Subj_40$ID)), Source_d_40, Source_c_40, Source_MRat_40)
colnames(MLE_2SDT_Src_40) <- c("ID", "d_Src", "c_Src", "Src_MRat")

#Differences for memory type
#Create dataframe
Item_MLE_40 <- data.frame(cbind(unique(Subj_40$ID), Item_d_40, Item_c_40))
colnames(Item_MLE_40) <- c("ID", "d", "c")
Item_MLE_40 <- Item_MLE_40 %>% mutate(Memory = "Item")
Source_MLE_40 <- data.frame(cbind(unique(Subj_40$ID), Source_d_40, Source_c_40))
colnames(Source_MLE_40) <- c("ID", "d", "c")
Source_MLE_40 <- Source_MLE_40 %>% mutate(Memory = "Source")
Memory_MLE_40 <- Item_MLE_40 %>% full_join(Source_MLE_40)


#Fit linear models
### N = 40 ###
## d (Sensitivity)
if (!file.exists("Mem_diff_d_lm_40.rda")) {
  Mem_diff_d_lm_40 <- brm(d ~  Memory + (1 | ID), data = Memory_MLE_40, family = gaussian(), seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_diff_d_lm_40, file = "./Mem_diff_d_lm_40.rda") 
} else {
  load("Mem_diff_d_lm_40.rda")  
}
pp_check(Mem_diff_d_lm_40, ndraws = 40) #Looks like an ok fit
summary(Mem_diff_d_lm_40)
pd(Mem_diff_d_lm_40)
hdi(Mem_diff_d_lm_40,ci=0.89)
#0.91 [0.7, 1.11]  more sensitive for item memory; 1.71x more sensitive than source memory
# 100% pd

## c (Response bias)
if (!file.exists("Mem_diff_c_lm_40.rda")) {
  Mem_diff_c_lm_40 <- brm(c ~  Memory + (1 | ID), data = Memory_MLE_40, family = gaussian(), seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_diff_c_lm_40, file = "./Mem_diff_c_lm_40.rda") 
} else {
  load("Mem_diff_c_lm_40.rda")  
}
pp_check(Mem_diff_c_lm_40, ndraws = 40) #Looks like an ok fit
summary(Mem_diff_c_lm_40)
pd(Mem_diff_c_lm_40)
hdi(Mem_diff_c_lm_40,ci=0.89)
#.3 [0.17, 0.44] more liberal for item judgements
# 99.99% pd

#Create dataframe to visualize differences
SDT_Item <- cbind(Subj_40$ID, Item_d_40, Item_c_40, rep("Item", length(Subj_40$ID)))
SDT_Src <- cbind(Subj_40$ID, Source_d_40, Source_c_40, rep("Source", length(Subj_40$ID)))
colnames(SDT_Item) <- c("ID", "d", "c", "Memory"); colnames(SDT_Src) <- c("ID", "d", "c", "Memory")
SDT_Item <- data.frame(SDT_Item); SDT_Src <- data.frame(SDT_Src)
SDT_Item$ID <- factor(SDT_Item$ID); SDT_Src$ID <- factor(SDT_Src$ID); SDT_Item$Memory <- factor(SDT_Item$Memory); SDT_Src$Memory <- factor(SDT_Src$Memory)
SDT_Item$d <- as.numeric(SDT_Item$d); SDT_Src$d <- as.numeric(SDT_Src$d);  SDT_Item$c <- as.numeric(SDT_Item$c); SDT_Src$c <- as.numeric(SDT_Src$c)
SDT_Memory <- SDT_Item %>% full_join(SDT_Src)
#Create Plots
SDT_Memory %>% ggplot(aes(x=Memory, y=d, group=ID)) + ylab("d' score") +  xlab("Memory Type") + geom_point() + geom_line() + theme_classic() 
SDT_Memory %>% ggplot(aes(x=Memory, y=c, group=ID)) + ylab("c score") +  xlab("Memory Type") + geom_point() + geom_line() + theme_classic() 

#### Item MLE x Valence ####
##  ---  Negative  ---  ##
# Sensitivity
Item_E_d_60 <- c(1.3508, 2.0585, 2.39, 1.26, 
              2.4889, 3.05, 2.18, 1.35, 3.63, 
              1.11, 2.29, 2.94, 3.17, 
              2.81, 2.89, 2.58, 2.94, 2.74, 
              2.18, 1.85, 1.96, 2.76, 2.01, 
              3.37, 2.57, 1.95, 1.87, 1.97,  
              2.85, 2.56, 2.28, 2.18, 2.94,
              2.48, 2.04, 2.08, 1.22, 1.38,
              2.53, 1.66, 2.89, 1.93, 1.7,
              1.71, 1.88, 2.29, 2.38,
              2.73, 2.84, 2.02, 2.5, 2.91,
              2.59, 2.16, 1.53, 2.48, 2.78,
              2.19, 3.62, 1.11)
Item_E_d_40 <- Item_E_d_60[above_d]

mean(Item_E_d_60); sd(Item_E_d_60) # 2.3 (0.6)
mean(Item_E_d_40); sd(Item_E_d_40) # 2.34 (0.54)


# Response Bias
Item_E_c_60 <- c(-0.0305, -0.1256, -0.46, -0.12,
              -0.1982, -0.35, -0.09, -0.087, -0.18,
              -0.018, -0.22, -0.39, -0.07, 
              -0.31, -0.1, -0.38, -0.21, -0.18, 
              -0.42, -0.35, -0.153, -0.19, -0.41, 
              -0.088, 0.45, -0.11, 0.18, -0.42, 
              -0.039, -0.11, -0.26, -0.15, -0.038,
              -0.084, -0.23, -0.17, -0.0041, 0.18,
              -0.015, -0.013, -0.096, -0.14, -0.12,
              -0.33, -0.089, -0.28, 0.1,
              -0.17, -0.022, -0.024, -0.69, -0.31,
              -0.11, -0.013, -0.074, -0.79, 0,
              -0.49, 0.0079, 0.67)
Item_E_c_40 <- Item_E_c_60[above_d]

mean(Item_E_c_60); sd(Item_E_c_60) # -0.15 (0.23)
mean(Item_E_c_40); sd(Item_E_c_40) #  -0.17 (0.21)
sum(Item_E_c_60<0) #53/60 were liberal (88.3%)
sum(Item_E_c_40<0) #36/40 were liberal (90%)

##  ---  Neutral  ---  ##
# Sensitivity
Item_N_d_60 <- c(0.7484, 1.73, 2.17, 1.53,
              1.8789, 2.5, 2.05, 1.36, 2.15,
              1.54, 1.82, 1.48, 1.89, 
              2.7, 2.29, 2.4, 2.7, 2.17, 
              2.08, 2.21, 1.74, 2.4, 1.91, 
              2.74, 1.67, 2.025, 1.35, 2.09,
              2.28, 2.38, 2.18, 2.48, 2.47,
              1.97, 1.73, 1.93, 1.39, 1.92,
              2.25, 2.05, 2.38, 2.16, 1.73,
              1.82, 1.12, 1.61, 2.02,
              3.21, 2.18, 2.4, 2.22, 1.81,
              2.44, 1.14, 2.16, 1.91, 2.18,
              2.05, 2.26, 2.36)
Item_N_d_40 <- Item_N_d_60[above_d]

mean(Item_N_d_60); sd(Item_N_d_60) # 2.03 (0.43)
mean(Item_N_d_40); sd(Item_N_d_40) #  1.99 (0.45)


# Response Bias
Item_N_c_60 <- c(-0.2680, -0.41, -0.34, -0.35, 
              -0.1986, -0.4, -0.12, -0.42, -0.16,
              -0.04, -0.58, -0.46, -0.22, 
              -0.38, -0.13, -0.32, -0.49, -0.32, 
              -0.01, -0.36, -0.21, -0.44, -0.42, 
              -0.21, -0.28, 0.085, -0.23, -0.51,
              -0.3, -0.14, -0.28, -0.61, 0.15,
              -0.53, -0.33, -0.20, -0.38, 0.15,
              -0.051, 0.05, -0.22, 0.003, -0.27,
              -0.61, 0.044, 0.049, -0.17,
              -0.19, -0.12, -0.51, -0.65, -0.17,
              -0.0049, -0.2, 0, -0.5, -0.38,
              -0.073, -0.22, 0.22)
Item_N_c_40 <- Item_N_c_60[above_d]

mean(Item_N_c_60); sd(Item_N_c_60) # -0.24 (0.21)
mean(Item_N_c_40); sd(Item_N_c_40) #  -0.25 (0.19)
sum(Item_N_c_60<0) #51/60 were liberal (85%)
sum(Item_N_c_40<0) #36/40 were liberal (90%)

#Valence differences for Item Memory
## N = 60 ##
#Create dataframe for comparisons 
Neut_SDT_60 <- data.frame(cbind(Subj_60$ID, Item_N_d_60, Item_N_c_60)); colnames(Neut_SDT_60) <- c("ID", "d", "c")
Neut_SDT_60 <- Neut_SDT_60 %>% mutate(Valence = "Neutral")
Neg_SDT_60 <- data.frame(cbind(Subj_60$ID, Item_E_d_60, Item_E_c_60)); colnames(Neg_SDT_60) <- c("ID", "d", "c")
Neg_SDT_60 <- Neg_SDT_60 %>% mutate(Valence = "Negative")
Valenced_SDT_60 <- Neut_SDT_60 %>% full_join(Neg_SDT_60)

## N = 40 ##
#Create dataframe for comparisons 
Neut_SDT_40 <- data.frame(cbind(Subj_40$ID, Item_N_d_40, Item_N_c_40)); colnames(Neut_SDT_40) <- c("ID", "d", "c")
Neut_SDT_40 <- Neut_SDT_40 %>% mutate(Valence = "Neutral")
Neg_SDT_40 <- data.frame(cbind(Subj_40$ID, Item_E_d_40, Item_E_c_40)); colnames(Neg_SDT_40) <- c("ID", "d", "c")
Neg_SDT_40 <- Neg_SDT_40 %>% mutate(Valence = "Negative")
Valenced_SDT_40 <- Neut_SDT_40 %>% full_join(Neg_SDT_40)

## N = 60 ##
## d (Sensitivity)
if (!file.exists("Mem_diff_dVal_lm_60.rda")) {
  Mem_diff_dVal_lm_60 <- brm(d ~ Valence + (1 | ID), data = Valenced_SDT_60, family = gaussian(), seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_diff_dVal_lm_60, file = "./Mem_diff_dVal_lm_60.rda") 
} else {
  load("Mem_diff_dVal_lm_60.rda")  
}
pp_check(Mem_diff_dVal_lm_60, ndraws = 40) #Fantastic fit
summary(Mem_diff_dVal_lm_60)
ci(Mem_diff_dVal_lm_60, type="hdi", ci=0.89)
pd(Mem_diff_dVal_lm_60)
hdi(Mem_diff_dVal_lm_60,ci=0.89)
# 0.28 [.17, .39]  more sensitive for negatively valenced images
# 99.99% pd

## c (Response Bias)
if (!file.exists("Mem_diff_cVal_lm_60.rda")) {
  Mem_diff_cVal_lm_60 <- brm(c ~ Valence + (1 | ID), data = Valenced_SDT_60, family = gaussian(), seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_diff_cVal_lm_60, file = "./Mem_diff_cVal_lm_60.rda") 
} else {
  load("Mem_diff_cVal_lm_60.rda")  
}
pp_check(Mem_diff_cVal_lm_60, ndraws = 40) #Ok fit
summary(Mem_diff_cVal_lm_60)
ci(Mem_diff_cVal_lm_60, type="hdi", ci=0.89)
pd(Mem_diff_cVal_lm_60)
hdi(Mem_diff_cVal_lm_60,ci=0.89)
# 0.10 [0.05, 0.14] more liberal for neutral 
# 99.91% pd

## N = 40 ##
## d (Sensitivity)
if (!file.exists("Mem_diff_dVal_lm_40.rda")) {
  Mem_diff_dVal_lm_40 <- brm(d ~ Valence + (1 | ID), data = Valenced_SDT_40, family = gaussian(), seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_diff_dVal_lm_40, file = "./Mem_diff_dVal_lm_40.rda") 
} else {
  load("Mem_diff_dVal_lm_40.rda")  
}
pp_check(Mem_diff_dVal_lm_40, ndraws = 40) #Fantastic fit
summary(Mem_diff_dVal_lm_40)
ci(Mem_diff_dVal_lm_40, type="hdi", ci=0.89)
pd(Mem_diff_dVal_lm_40)
hdi(Mem_diff_dVal_lm_40,ci=0.89)
# 0.34 [.21, .46]  more sensitive for negatively valenced images
# 99.99% pd

## c (Response Bias)
if (!file.exists("Mem_diff_cVal_lm_40.rda")) {
  Mem_diff_cVal_lm_40 <- brm(c ~ Valence + (1 | ID), data = Valenced_SDT_40, family = gaussian(), seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_diff_cVal_lm_40, file = "./Mem_diff_cVal_lm_40.rda") 
} else {
  load("Mem_diff_cVal_lm_40.rda")  
}
pp_check(Mem_diff_cVal_lm_40, ndraws = 40) #Ok fit
summary(Mem_diff_cVal_lm_40)
ci(Mem_diff_cVal_lm_40, type="hdi", ci=0.89)
pd(Mem_diff_cVal_lm_40)
hdi(Mem_diff_cVal_lm_40,ci=0.89)
# 0.09 [0.03, 0.14] more liberal for neutral 
# 99.42% pd

#### Source MLE x Valence ####
##  ---  Negative  ---  ##
# Sensitivity
Item_E_d <- c(0.45, -0.29, 1.3, 2.18, 1.38, 0.68, 1.52, 0.032, -0.12, 1.53, 
              -0.17, -0.4, -0.09, 0.093, 1.78, 0.74, 1.31, -0.48, 0.31, 0.25, 
              1.03, 1.01, 0.24, 0.95, 1.87, 2.62, 1.03, 1.69, 0.42, 0.96, -0.65, 
              0.21, 0.88, 0.55, 0.92, 0.95, 1.94, 0.84, 0.85, 1.21)
mean(Item_E_d); sd(Item_E_d)#0.79 (077)
# Response Bias
Item_E_c <- c(-0.56, -0.2, -1.05, -0.067, 0, 0.32, 0.19, 5.8, -4.29, -1.38, 
              1.57, -0.14, 2.45, -0.53, -0.063, -0.35, -0.12, 0.22, 1.38, -0.37,
              1.89, -0.2, -0.51, 0.86, 0.71, -0.25, 0.12, -0.061, -0.0124, -0.01, 1.41, 
              0.28, 0.085, -0.15, 0.2, 0.0089, 0.55, 0.08, -.35, 0.52)
mean(Item_E_c); sd(Item_E_c) #0.2 (1.37)
sum(Item_E_c<0) #20/35 were liberal (57.1%)

##  ---  Neutral  ---  ##
# Sensitivity
Item_N_d <- c(0.99, 0.6, 0.22, 1.35, 1.25, 0.28, 0.9, -0.22, -0.055, 1.17, 
              -1.61, 0.47, 0.098, 0.46, 0.9, 0.35, 0.81, 0.8, -0.07, 0.3,
              1.91, 0.38, 0.25, 1.83, 2.94, 1.57, 1.32, 1.99, 0.82, 1.62, -0.4, 
              -1.18, -0.18, 0.2, 0.48, 0.61, 1.6, 1.19, 0.54, 2.03)
mean(Item_N_d);sd(Item_N_d) # 0.71 (0.88)
# Response Bias
Item_N_c <- c(-0.52, 0.26, 1.14, -0.028, 1.32, 0.36, 0.064, -1.19, -0.42, 0.64, 
              0.087, -2.17, 2.93, -0.024, 0.054, -0.23, -0.19, 0.3, -7.95, 2.54, 
              0.07, 0.27, 1.14, 0.24, 0.18, 0.063, -0.098, 0.56, 0.28, -0.096, -0.6,
              0.016, -4.34, 1.49, 0.29, 0.89, 0.4, 0.1, 1.47, 0.33)
mean(Item_N_c); sd(Item_N_c) #-0.0093 (1.72)
sum(Item_N_c<0) #13/35 were liberal (32.5%)


#Valence differences for Item Memory
#Create dataframe for comparisons
Neut_SDTSrc <- data.frame(cbind(Subj_40$ID, Item_N_d_40, Item_N_c_40)); colnames(Neut_SDTSrc) <- c("ID", "d", "c")
Neut_SDTSrc <- Neut_SDTSrc %>% mutate(Valence = "Neutral")
Neg_SDTSrc <- data.frame(cbind(Subj_40$ID, Item_E_d_40, Item_E_c_40)); colnames(Neg_SDTSrc) <- c("ID", "d", "c")
Neg_SDTSrc <- Neg_SDTSrc %>% mutate(Valence = "Negative")
Valenced_SDTSrc <- Neut_SDTSrc %>% full_join(Neg_SDTSrc)
Valenced_SDTSrc$Valence <- as.factor(Valenced_SDTSrc$Valence)

## d (Sensitivity)
if (!file.exists("Mem_diff_dVal_lmSrc.rda")) {
  Mem_diff_dVal_lmSrc <- brm(d ~ Valence + (1 | ID), data = Valenced_SDTSrc, family = gaussian(), seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_diff_dVal_lm, file = "./Mem_diff_dVal_lmSrc.rda") 
} else {
  load("Mem_diff_dVal_lmSrc.rda")  
}
pp_check(Mem_diff_dVal_lmSrc, ndraws = 40) #Fantastic fit
summary(Mem_diff_dVal_lmSrc)
ci(Mem_diff_dVal_lmSrc, type="hdi", ci=0.89)
pd(Mem_diff_dVal_lmSrc)
hdi(Mem_diff_dVal_lmSrc,ci=0.89)
# 0.34 [0.21, 0.46]  more sensitive for negatively valenced images

## c (Response Bias)
if (!file.exists("Mem_diff_cVal_lm.rda")) {
  Mem_diff_cVal_lmSrc <- brm(c ~ Valence + (1 | ID), data = Valenced_SDTSrc, family = gaussian(), seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_diff_cVal_lm, file = "./Mem_diff_cVal_lm.rda") 
} else {
  load("Mem_diff_cVal_lm.rda")  
}
pp_check(Mem_diff_cVal_lmSrc, ndraws = 40) #Ok fit
summary(Mem_diff_cVal_lmSrc)
ci(Mem_diff_cVal_lmSrc, type="hdi", ci=0.89)
pd(Mem_diff_cVal_lmSrc)
hdi(Mem_diff_cVal_lmSrc,ci=0.89)
# 0.09 [0.03, 0.14] more liberal for neutral 


#### M-Ratio & Subjectives ####
#Joining the SDT data with the Subjective Data
#Subjective and Overall SDT
Subj_40$ID <- as.factor(Subj_40$ID)
OverallSDT_Subj <- Subj_40 %>% full_join(MLE_2SDT_40, by = "ID") %>% full_join(MLE_2SDT_Src_40, by = "ID")
#Add M-Ratio to dataframe
MLE_2SDT_MRat <- data.frame(unique(sort(Subj_40$ID)), Item_MRat[above_d])
colnames(MLE_2SDT_MRat) <- c("ID", "Item_MRat")
OverallSDT_Subj <- OverallSDT_Subj %>% full_join(MLE_2SDT_MRat, by="ID")
##Subsetting for usable Source memory participants
OverallSDT_Subj_40 <- OverallSDT_Subj %>% filter(ID %in% OverallSDT_Subj$ID) 

##### Item #####
#Vividness of Visual Imagery Questionnaire (VVIQ)
OverallSDT_Subj %>% ggplot(aes(x=VVIQ_Scores, y= Item_MRat[above_d])) + xlab("VVIQ Scores") + ylab("M-Ratio") + geom_point() + theme_classic()
cor(OverallSDT_Subj$VVIQ_Scores, Item_MRat[above_d]) #-0.092 correlation
if (!file.exists("VVIQ_Mratio_Item.rda")) {
  VVIQ_Mratio_Item <- brm(Item_MRat ~ VVIQ_Scores, data = OverallSDT_Subj, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(VVIQ_Mratio_Item, file = "./VVIQ_Mratio_Item.rda") 
} else {
  load("VVIQ_Mratio_Item.rda")  
}
pp_check(VVIQ_Mratio_Item, ndraws = 40) #Great fit
summary(VVIQ_Mratio_Item)
ci(VVIQ_Mratio_Item, method = "HDI", ci = 0.89)
#No apparent association in scatterplot, and no meaningful association in linear model

# Body Perception Questionnaire - Autonomic reactivity
OverallSDT_Subj %>% ggplot(aes(x=Auto_Rct, y= Item_MRat)) + xlab("Autonomic Reactivity Scores") + ylab("M-Ratio") + geom_point() + theme_classic()
cor(OverallSDT_Subj$Auto_Rct, OverallSDT_Subj$Item_MRat) #0.049 correlation
if (!file.exists("BA_Item_MRatio.rda")) {
  BA_Item_MRatio <- brm(Item_MRat ~ Auto_Rct, data = OverallSDT_Subj, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(BA_Item_MRatio, file = "./BA_Item_MRatio.rda") 
} else {
  load("BA_Item_MRatio.rda")  
}
pp_check(BA_Item_MRatio, ndraws = 40) #Great fit
print(summary(BA_Item_MRatio),digits=3)
ci(BA_Item_MRatio, method = "HDI", ci = 0.89)
#No apparent association in scatterplot, and no meaningful association in linear model

# Body Perception Questionnaire - Body Awareness
OverallSDT_Subj %>% ggplot(aes(x=BA_scores, y= Item_MRat)) + xlab("Body Awareness Scores") + ylab("M-Ratio") + geom_point() + theme_classic()
cor(OverallSDT_Subj$BA_scores, OverallSDT_Subj$Item_MRat) #0.093 correlation
if (!file.exists("BA_Item_MRatio.rda")) {
  BA_Item_MRatio <- brm(Item_MRat ~ BA_scores, data = OverallSDT_Subj, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(BA_Item_MRatio, file = "./BA_Item_MRatio.rda") 
} else {
  load("BA_Item_MRatio.rda")  
}
pp_check(BA_Item_MRatio, ndraws = 40) #Great fit
print(summary(BA_Item_MRatio),digits=4)
ci(BA_Item_MRatio, method = "HDI", ci = 0.89, digits=3)
#No apparent association in scatterplot, and no meaningful association in linear model

#Body Perception Questionnaire - SupraD scores
OverallSDT_Subj %>% ggplot(aes(x=SupraD_Scores, y= Item_MRat)) + xlab("SupraD Scores") + ylab("M-Ratio") + geom_point() + theme_classic()
cor(OverallSDT_Subj$SupraD_Scores, OverallSDT_Subj$Item_MRat) #0.12 correlation
if (!file.exists("SupraD_Item_MRatio.rda")) {
  SupraD_Item_MRatio <- brm(Item_MRat ~ SupraD_Scores, data = OverallSDT_Subj, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(SupraD_Item_MRatio, file = "./SupraD_Item_MRatio.rda") 
} else {
  load("SupraD_Item_MRatio.rda")  
}
pp_check(SupraD_Item_MRatio, ndraws = 40) #Good fit
summary(SupraD_Item_MRatio)
ci(SupraD_Item_MRatio, method = "HDI", ci = 0.89)
#No apparent association in scatterplot, and no meaningful association in linear model

#Body Perception Questionnaire - SubD scores
OverallSDT_Subj %>% ggplot(aes(x=SubD_Scores, y = Item_MRat)) + xlab("SubD Scores") + ylab("M-Ratio") + geom_point() + theme_classic()
cor(OverallSDT_Subj$SubD_Scores, OverallSDT_Subj$Item_MRat) #-0.069 correlation
if (!file.exists("SubD_Item_MRatio.rda")) {
  SubD_Item_MRatio <- brm(Item_MRat ~ SubD_Scores, data = OverallSDT_Subj, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(SubD_Item_MRatio, file = "./SubD_Item_MRatio.rda") 
} else {
  load("SubD_Item_MRatio.rda")  
}
pp_check(SubD_Item_MRatio, ndraws = 40) #Great fit
summary(SubD_Item_MRatio)
ci(SubD_Item_MRatio, method = "HDI", ci = 0.89)
#No apparent association in scatterplot, and no meaningful association in linear model

##### Source #####
#Vividness of Visual Imagery Questionnaire (VVIQ)
OverallSDT_Subj_40 %>% ggplot(aes(x=VVIQ_Scores, y= Src_MRat)) + xlab("VVIQ Scores") + ylab("M-Ratio") + geom_point() + theme_classic()
cor(OverallSDT_Subj_40$VVIQ_Scores, OverallSDT_Subj_40$Src_MRat) #.34 correlation
if (!file.exists("VVIQ_Mratio_Src.rda")) {
  VVIQ_Mratio_Src <- brm(Src_MRat ~ VVIQ_Scores, data = OverallSDT_Subj_40, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(VVIQ_Mratio_Src, file = "./VVIQ_Mratio_Src.rda") 
} else {
  load("VVIQ_Mratio_Src.rda")  
}
pp_check(VVIQ_Mratio_Src, ndraws = 40) #Great fit
summary(VVIQ_Mratio_Src)
ci(VVIQ_Mratio_Src, method = "HDI", ci = 0.89)
pd(VVIQ_Mratio_Src)
hdi(VVIQ_Mratio_Src, ci = 0.89)
#VVIQ meaningfully associated with Source memory

# Body Perception Questionnaire - Autonomic Reactivity
OverallSDT_Subj_40 %>% ggplot(aes(x=Auto_Rct, y= Src_MRat)) + xlab("Body Awareness Scores") + ylab("M-Ratio") + geom_point() + theme_classic()
cor(OverallSDT_Subj_40$Auto_Rct, OverallSDT_Subj_40$Src_MRat) #0.19 correlation
if (!file.exists("AR_Src_MRatio.rda")) {
  AR_Src_MRatio <- brm(Src_MRat ~ Auto_Rct, data = OverallSDT_Subj_40, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(BA_Src_MRatio, file = "./AR_Src_MRatio.rda") 
} else {
  load("AR_Src_MRatio.rda")  
}
pp_check(AR_Src_MRatio, ndraws = 40) #Great fit
print(summary(AR_Src_MRatio), digits = 4)
print(ci(AR_Src_MRatio, method = "HDI", ci = 0.89), digits = 9)
pd(AR_Src_MRatio)
hdi(AR_Src_MRatio, ci = 0.89)
#Non-meaningful association between autonomic arousal and Source metacognitive efficiency

# Body Perception Questionnaire - Body Awareness
OverallSDT_Subj_40 %>% ggplot(aes(x=BA_scores, y= Src_MRat)) + xlab("Body Awareness Scores") + ylab("M-Ratio") + geom_point() + theme_classic()
cor(OverallSDT_Subj_40$BA_scores, OverallSDT_Subj_40$Src_MRat) #0.15 correlation
if (!file.exists("BA_Src_MRatio.rda")) {
  BA_Src_MRatio <- brm(Src_MRat ~ BA_scores, data = OverallSDT_Subj_40, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(BA_Src_MRatio, file = "./BA_Src_MRatio.rda") 
} else {
  load("BA_Src_MRatio.rda")  
}
pp_check(BA_Src_MRatio, ndraws = 40) #Great fit
summary(BA_Src_MRatio)
ci(BA_Src_MRatio, method = "HDI", ci = 0.89)
pd(BA_Src_MRatio)
hdi(BA_Src_MRatio, ci = 0.89)
#No apparent association in scatterplot, and no meaningful association in linear model

#Body Perception Questionnaire - SupraD scores
OverallSDT_Subj_40 %>% ggplot(aes(x=SupraD_Scores, y= Src_MRat)) + xlab("SupraD Scores") + ylab("M-Ratio") + geom_point() + theme_classic()
cor(OverallSDT_Subj_40$SupraD_Scores, OverallSDT_Subj_40$Src_MRat) #0.19 correlation
if (!file.exists("SupraD_Src_MRatio.rda")) {
  SupraD_Src_MRatio <- brm(Src_MRat ~ SupraD_Scores, data = OverallSDT_Subj_40, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(SupraD_Src_MRatio, file = "./SupraD_Src_MRatio.rda") 
} else {
  load("SupraD_Src_MRatio.rda")  
}
pp_check(SupraD_Src_MRatio, ndraws = 40) #Good fit
summary(SupraD_Src_MRatio)
ci(SupraD_Src_MRatio, method = "HDI", ci = 0.89)
pd(SupraD_Src_MRatio)
hdi(SupraD_Src_MRatio, ci = 0.89)
#At 89% confidence there is no association between Supradiaphramatic reactivity and MRatio Scores in Source Memory

#Body Perception Questionnaire - SubD scores
OverallSDT_Subj_40 %>% ggplot(aes(x=SubD_Scores, y = Src_MRat)) + xlab("SubD Scores") + ylab("M-Ratio") + geom_point() + theme_classic()
cor(OverallSDT_Subj_40$SubD_Scores, OverallSDT_Subj_40$Src_MRat) #0.15 correlation
if (!file.exists("SubD_Src_MRatio.rda")) {
  SubD_Src_MRatio <- brm(Src_MRat ~ SubD_Scores, data = OverallSDT_Subj_40, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(SubD_Src_MRatio, file = "./SubD_Src_MRatio.rda") 
} else {
  load("SubD_Src_MRatio.rda")  
}
pp_check(SubD_Src_MRatio, ndraws = 40) #Great fit
print(summary(SubD_Src_MRatio), digits=4)
ci(SubD_Src_MRatio, method = "HDI", ci = 0.89)
pd(SupraD_Src_MRatio)
hdi(SupraD_Src_MRatio, ci = 0.89)
#No apparent association in scatterplot, and no meaningful association in linear model

## Autonomic Arousal + VVIQ
#Body Perception Questionnaire - SupraD scores
if (!file.exists("SupraDVVIQ_Src_MRatio.rda")) {
  SupraDVVIQ_Src_MRatio <- brm(Src_MRat ~ Auto_Rct + VVIQ_Scores, data = OverallSDT_Subj_40, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(SupraDVVIQ_Src_MRatio, file = "./SupraDVVIQ_Src_MRatio.rda") 
} else {
  load("SupraDVVIQ_Src_MRatio.rda")  
}
pp_check(SupraDVVIQ_Src_MRatio, ndraws = 40) #Good fit
summary(SupraDVVIQ_Src_MRatio)
ci(SupraDVVIQ_Src_MRatio, method = "HDI", ci = 0.89)
pd(SupraD_Src_MRatio)
hdi(SupraD_Src_MRatio, ci = 0.89)
#AutoReact (0.04 [0.01, 0.08]) & VVIQ (0.04 [0.01, 0.07])

if (!file.exists("SupraDVVIQ_Src_MRatio_int.rda")) {
  SupraDVVIQ_Src_MRatio_int <- brm(Src_MRat ~ Auto_Rct * VVIQ_Scores, data = OverallSDT_Subj_40, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(SupraDVVIQ_Src_MRatio_int, file = "./SupraDVVIQ_Src_MRatio_int.rda") 
} else {
  load("SupraDVVIQ_Src_MRatio_int.rda")  
}
pp_check(SupraDVVIQ_Src_MRatio_int, ndraws = 40) #Good fit
summary(SupraDVVIQ_Src_MRatio_int)
ci(SupraDVVIQ_Src_MRatio_int, method = "HDI", ci = 0.89)
pd(SupraDVVIQ_Src_MRatio_int)
hdi(SupraDVVIQ_Src_MRatio_int, ci = 0.89)

(Mrat_Subj_comparisons <- bayesfactor_models(VVIQ_Mratio_Src, AR_Src_MRatio, SupraDVVIQ_Src_MRatio, SupraDVVIQ_Src_MRatio_int, denominator = VVIQ_Mratio_Src))
#Inconclusive evidence in support of 3 models: SupraDScores, VVIQ, and their combined model.


##### Standardize Meaningful Predictors #####
### Item ###
#N/A

### Source ### 
## BPQ - Supradiaphragmatic Reactivity ##
Stand_BA <- scale(Subj_40$BA_scores)

## VVIQ ##
Stand_VVIQ <- scale(Subj_40$VVIQ_Scores)

#Combine into single matrix for estimation in Matlab
Stand_VVIQ <- t(matrix(Stand_VVIQ, ncol=1)) #Transposed matrix to meet specifications
Stand_BA <- t(matrix(Stand_BA, ncol=1)) #Transposed matrix to meet specifications


#Export for use in Matlab
writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/VVIQ_SubjCov_40x.mat", x=Stand_VVIQ) #Write Mat file for Source Subjective Covariates
writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/BA_SubjCov_40.mat", x=Stand_BA) #Write Mat file for Source Subjective Covariates


#Evaluate results of RH-Meta-d' analysis
Source_MRat[Stand_SupraD > 1]
Source_MRat[Stand_SupraD < -1]

#### Type 1 (d'/c) Subjectives ####
## d' ##
#Vividness of Visual Imagery Questionnaire (VVIQ)
OverallSDT_Subj %>% ggplot(aes(x=VVIQ_Scores, y= Item_d_40)) + xlab("VVIQ Scores") + ylab("d'") + geom_point() + theme_classic()
cor(OverallSDT_Subj$VVIQ_Scores, OverallSDT_Subj$d) #0.23 correlation
if (!file.exists("VVIQ_Mratio_Item.rda")) {
  VVIQ_d_Item <- brm(d ~ VVIQ_Scores, data = OverallSDT_Subj_40, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(VVIQ_Mratio_Item, file = "./VVIQ_Mratio_Item.rda") 
} else {
  load("VVIQ_Mratio_Item.rda")  
}
pp_check(VVIQ_d_Item, ndraws = 40) #Great fit
summary(VVIQ_d_Item)
round(ci(VVIQ_d_Item, method = "HDI", ci = 0.86)[2,3], 5); round(ci(VVIQ_d_Item, method = "HDI", ci = 0.86)[2,4], 5)
pd(VVIQ_d_Item)
hdi(VVIQ_d_Item, ci = 0.89)
#No apparent associations

# Body Perception Questionnaire - Body Awareness
OverallSDT_Subj %>% ggplot(aes(x=BA_scores, y= Item_d_40)) + xlab("Body Awareness Scores") + ylab("d'") + geom_point() + theme_classic()
cor(OverallSDT_Subj$BA_scores, OverallSDT_Subj$Item_d_40) #-0.1 correlation
if (!file.exists("BA_Item_MRatio.rda")) {
  BA_Item_d <- brm(Item_d_40 ~ BA_scores, data = OverallSDT_Subj, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(BA_Item_MRatio, file = "./BA_Item_MRatio.rda") 
} else {
  load("BA_Item_MRatio.rda")  
}
pp_check(BA_Item_d, ndraws = 40) #Great fit
print(summary(BA_Item_d),digits=4)
ci(BA_Item_d, method = "HDI", ci = 0.85)[2,3];ci(BA_Item_d, method = "HDI", ci = 0.85)[2,4]
pd(BA_Item_d)
hdi(BA_Item_d, ci = 0.89)
#No apparent association in scatterplot, and no meaningful association in linear model

## c ##
#Vividness of Visual Imagery Questionnaire (VVIQ)
OverallSDT_Subj %>% ggplot(aes(x=VVIQ_Scores, y= Item_c_40)) + xlab("VVIQ Scores") + ylab("c") + geom_point() + theme_classic()
cor(OverallSDT_Subj$VVIQ_Scores, OverallSDT_Subj$Item_c_40) #0.27 correlation
if (!file.exists("VVIQ_Mratio_Item.rda")) {
  VVIQ_c_Item <- brm(Item_c_40 ~ VVIQ_Scores, data = OverallSDT_Subj, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(VVIQ_Mratio_Item, file = "./VVIQ_Mratio_Item.rda") 
} else {
  load("VVIQ_Mratio_Item.rda")  
}
pp_check(VVIQ_c_Item, ndraws = 40) #Great fit
summary(VVIQ_c_Item);summary(VVIQ_c_Item)[14]
round(ci(VVIQ_c_Item, method = "HDI", ci = 0.88)[2,3], 4);round(ci(VVIQ_c_Item, method = "HDI", ci = 0.88)[2,4],4)
pd(VVIQ_c_Item)
#Minor association between VVIQ and c (response bias)
#Visual imagery capabilities are positively associated with more conservative responding

# Body Perception Questionnaire - Body Awareness
OverallSDT_Subj %>% ggplot(aes(x=BA_scores, y= Item_c_40)) + xlab("Body Awareness Scores") + ylab("c") + geom_point() + theme_classic()
cor(OverallSDT_Subj$BA_scores, OverallSDT_Subj$Item_c_40) #-0.08 correlation
if (!file.exists("BA_Item_MRatio.rda")) {
  BA_Item_c <- brm(Item_c_40 ~ BA_scores, data = OverallSDT_Subj, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(BA_Item_MRatio, file = "./BA_Item_MRatio.rda") 
} else {
  load("BA_Item_MRatio.rda")  
}
pp_check(BA_Item_c, ndraws = 40) #Great fit
print(summary(BA_Item_c),digits=4)
ci(BA_Item_c, method = "HDI", ci = 0.85)[2,3];ci(BA_Item_c, method = "HDI", ci = 0.85)[2,4]
pd(BA_Item_c)
#No apparent association in scatterplot, and no meaningful association in linear model


##### Source #####
## d' ##
#Vividness of Visual Imagery Questionnaire (VVIQ)
OverallSDT_Subj_40 %>% ggplot(aes(x=VVIQ_Scores, y= d_Src)) + xlab("VVIQ Scores") + ylab("d'") + geom_point() + theme_classic()
cor(OverallSDT_Subj_40$VVIQ_Scores, OverallSDT_Subj_40$d_Src) #.19 correlation
if (!file.exists("VVIQ_Mratio_Src.rda")) {
  VVIQ_d_Src <- brm(Source_d_40 ~ VVIQ_Scores, data = OverallSDT_Subj_40, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(VVIQ_Mratio_Src, file = "./VVIQ_Mratio_Src.rda") 
} else {
  load("VVIQ_Mratio_Src.rda")  
}
pp_check(VVIQ_d_Src, ndraws = 40) #Great fit
summary(VVIQ_d_Src)
ci(VVIQ_d_Src, method = "HDI", ci = 0.89)[2,3];ci(VVIQ_d_Src, method = "HDI", ci = 0.89)[2,4]
pd(VVIQ_d_Item)
hdi(VVIQ_d_Item, ci = 0.89)
#No apprarent associations between VVIQ and sensitivity for source memory

# Body Perception Questionnaire - Body Awareness
OverallSDT_Subj_40 %>% ggplot(aes(x=BA_scores, y= d_Src)) + xlab("Body Awareness Scores") + ylab("M-Ratio") + geom_point() + theme_classic()
cor(OverallSDT_Subj_40$BA_scores, OverallSDT_Subj_40$d_Src) #-0.042 correlation
if (!file.exists("BA_Src_MRatio.rda")) {
  BA_Src_d <- brm(Source_d_40 ~ BA_scores, data = OverallSDT_Subj_35, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
  save(BA_Src_MRatio, file = "./BA_Src_MRatio.rda") 
} else {
  load("BA_Src_MRatio.rda")  
}
pp_check(BA_Src_d, ndraws = 40) #Great fit
summary(BA_Src_d)
ci(BA_Src_d, method = "HDI", ci = 0.89)[2,3];ci(BA_Src_d, method = "HDI", ci = 0.89)[2,4]
#No apparent association in scatterplot, and no meaningful association in linear model

## c ##
#Vividness of Visual Imagery Questionnaire (VVIQ)
OverallSDT_Subj_40 %>% ggplot(aes(x=VVIQ_Scores, y= c_Src)) + xlab("VVIQ Scores") + ylab("c") + geom_point() + theme_classic()
cor(OverallSDT_Subj_40$VVIQ_Scores, OverallSDT_Subj_40$c_Src) #.19 correlation
if (!file.exists("VVIQ_Mratio_Src.rda")) {
  VVIQ_c_Src <- brm(Source_c_40 ~ VVIQ_Scores, data = OverallSDT_Subj_40, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(VVIQ_Mratio_Src, file = "./VVIQ_Mratio_Src.rda") 
} else {
  load("VVIQ_Mratio_Src.rda")  
}
pp_check(VVIQ_c_Src, ndraws = 40) #Great fit
summary(VVIQ_c_Src)
ci(VVIQ_c_Src, method = "HDI", ci = 0.89)[2,3];ci(VVIQ_c_Src, method = "HDI", ci = 0.89)[2,4]
pd(VVIQ_c_Src)
hdi(VVIQ_c_Src, ci = 0.89)
#No apprarent associations between VVIQ and sensitivity for source memory

# Body Perception Questionnaire - Body Awareness
OverallSDT_Subj_40 %>% ggplot(aes(x=BA_scores, y= c_Src)) + xlab("Body Awareness Scores") + ylab("M-Ratio") + geom_point() + theme_classic()
cor(OverallSDT_Subj_40$BA_scores, OverallSDT_Subj_40$c_Src) #0.2 correlation
if (!file.exists("BA_Src_MRatio.rda")) {
  BA_Src_c <- brm(c_Src ~ BA_scores, data = OverallSDT_Subj_40, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(BA_Src_MRatio, file = "./BA_Src_MRatio.rda") 
} else {
  load("BA_Src_MRatio.rda")  
}
pp_check(BA_Src_c, ndraws = 40) #Great fit
summary(BA_Src_c)
ci(BA_Src_c, method = "HDI", ci = 0.89)[2,3];ci(BA_Src_c, method = "HDI", ci = 0.89)[2,4]
pd(BA_Src_c)
hdi(BA_Src_c, ci = 0.89)
#No apparent association in scatterplot, and no meaningful association in linear model

#### Model Comparison  ####
#Create dataframe for model comparisons
#Combining NEUTRAL ITEM SDT
NEUT_SDT <- data.frame(unique(sort(Subj_40$ID)), Item_N_d[above_d], Item_N_c[above_d])
colnames(NEUT_SDT) <- c("ID", "d_Neut", "c_Neut")
NEUT_SDT$ID <- factor(NEUT_SDT$ID)

#Combining NEGATIVE ITEM SDT
EMO_SDT <- data.frame(unique(sort(Subj_40$ID)), Item_E_d[above_d], Item_E_c[above_d])
colnames(EMO_SDT) <- c("ID", "d_Emo", "c_Emo")
EMO_SDT$ID <- as.factor(EMO_SDT$ID)

#Subjective and Valence SDT Long format
ValencedSDTSubj <- Subj_40 %>% full_join(NEUT_SDT, by = "ID") %>% full_join(EMO_SDT, by = "ID")
column_order <- c("ID", "Dem_Age", "Dem_Sex", "Dem_Race", "Dem_Ltnx", "BA_scores", "SupraD_Scores",
                  "SubD_Scores", "VVIQ_Scores", "d_Neut", "d_Emo", "c_Neut", "c_Emo")
ValencedSDT_Subj <- ValencedSDTSubj[,column_order]
dscoreLong <- ValencedSDT_Subj %>% gather(key = "Valence", value = "d_scores", 10:11, factor_key = TRUE) 
levels(dscoreLong$Valence)[levels(dscoreLong$Valence)=="d_Neut"] <- "Neutral"
levels(dscoreLong$Valence)[levels(dscoreLong$Valence)=="d_Emo"] <- "Negative"
cscoreLong <- ValencedSDT_Subj %>% select(ID, c_Neut, c_Emo) %>% gather(key = "Valence", value = "c_scores", 2:3, factor_key = TRUE) 
levels(cscoreLong$Valence)[levels(cscoreLong$Valence)=="c_Neut"] <- "Neutral"
levels(cscoreLong$Valence)[levels(cscoreLong$Valence)=="c_Emo"] <- "Negative"
ValSDT_SubjAll <- dscoreLong
ValSDT_SubjAll$c_scores <- cscoreLong$c_scores
ValSDT_SubjAll <- ValSDT_SubjAll %>% select(ID, Dem_Age, Dem_Sex, Dem_Race, Dem_Ltnx, BA_scores, SupraD_Scores, SubD_Scores, VVIQ_Scores,
                                            Valence, d_scores, c_scores)

##### d' score models #####
dscore_Val <- brm(d_scores ~ Valence, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
### VVIQ ###
dscore_VVIQ_Val <- brm(d_scores ~ Valence+VVIQ_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
dscore_VVIQ_Valint <- brm(d_scores ~ Valence*VVIQ_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
dscore_VVIQ <- brm(d_scores ~ VVIQ_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
(d_VVIQ_comparisons <- bayesfactor_models(dscore_Val, dscore_VVIQ, dscore_VVIQ_Val, dscore_VVIQ_Valint, denominator = dscore_Val))
#Valence model is best supported by the data

### BA Scores ###
dscore_BA <- brm(d_scores ~ BA_scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
dscore_BA_Val <- brm(d_scores ~ Valence+BA_scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
dscore_BA_Valint <- brm(d_scores ~ Valence*BA_scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
(d_BA_comparisons <- bayesfactor_models(dscore_Val, dscore_BA, dscore_BA_Val, dscore_BA_Valint, denominator = dscore_Val))
#Valence model is best supported by the data

### SupraD Scores ###
dscore_SupraD_Valint <- brm(d_scores ~ Valence*SupraD_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
dscore_SupraD_Val <- brm(d_scores ~ Valence+SupraD_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
dscore_SupraD <- brm(d_scores ~ SupraD_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
(d_SupraD_comparisons <- bayesfactor_models(dscore_Val, dscore_SupraD, dscore_SupraD_Val, dscore_SupraD_Valint, demoninator = dscore_Val))
#Valence model is best supported by the data

### SubD Scores ###
dscore_SubD <- brm(d_scores ~ SubD_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
dscore_SubD_Valint <- brm(d_scores ~ Valence*SubD_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
dscore_SubD_Val <- brm(d_scores ~ Valence+SubD_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
(d_SubD_comparisons <- bayesfactor_models(dscore_Val, dscore_SubD, dscore_SubD_Val, dscore_SubD_Valint, denominator = dscore_Val))
#Valence model is best supported by the data

#The best fitting d' model was the Valence only model
summary(dscore_Val)
ci(dscore_Val, method = "HDI", ci = 0.89)
plot_model(dscore_Val, type = "pred")


##### c score models #####
cscore_Val <- brm(c_scores ~ Valence, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
### VVIQ ###
cscore_VVIQ <- brm(c_scores ~ VVIQ_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
cscore_VVIQ_Valint <- brm(c_scores ~ Valence*VVIQ_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
cscore_VVIQ_Val <- brm(c_scores ~ Valence+VVIQ_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
(c_VVIQ_comparisons <- bayesfactor_models(cscore_Val, cscore_VVIQ, cscore_VVIQ_Val, cscore_VVIQ_Valint, denominator = cscore_Val))
#Valence + VVIQ and most supported

### BA Scores ###
cscore_BA <- brm(c_scores ~ BA_scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
cscore_BA_Val <- brm(c_scores ~ Valence+BA_scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
cscore_BA_Valint <- brm(c_scores ~ Valence*BA_scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
(c_BA_comparisons <- bayesfactor_models(cscore_Val, cscore_BA, cscore_BA_Val, cscore_BA_Valint, denominator = cscore_Val))
#Valence model is best supported by the data

### SupraD Scores ###
cscore_SupraD_Val <- brm(c_scores ~ Valence+SupraD_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
cscore_SupraD_Valint <- brm(c_scores ~ Valence*SupraD_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
cscore_SupraD <- brm(c_scores ~ SupraD_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
(c_SupraD_comparisons <- bayesfactor_models(cscore_Val, cscore_SupraD, cscore_SupraD_Val, cscore_SupraD_Valint, denominator = cscore_Val))
#Valence model is best supported by the data

### SubD Scores ###
cscore_SubD <- brm(c_scores ~ SubD_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
cscore_SubD_Val <- brm(c_scores ~ Valence+SubD_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
cscore_SubD_Valint <- brm(c_scores ~ Valence*SubD_Scores, data = ValSDT_SubjAll, family = gaussian(), save_pars = save_pars(all = TRUE))
(c_SubD_comparisons <- bayesfactor_models(cscore_Val, cscore_SubD, cscore_SubD_Val, cscore_SubD_Valint, denominator = cscore_Val))
#Valence model is best supported by the data

#The evidence does not support models which include subjective questionnaires beyond Valence
#   (VVIQ, BPQ) for d', but there is moderate evidence for an effect of VVIQ in addition to Valence for c'


####  Path Analysis  ####
new_nR_S1 <-nR_S1[61:63,]
new_nR_S2 <- nR_S2[61:63,]
writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S1_3new_1_MLE.mat", x=new_nR_S1) #Write Mat file for Stim 1
writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S2_3new_2_MLE.mat", x=new_nR_S2) #Write Mat file for Stim 2

newSrc_nR_S1 <- Src_nR_S1[61:63,]
newSrc_nR_S2 <- Src_nR_S2[61:63,] 
writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nRSrc_S1_3new2_SrcMLE.mat", x=newSrc_nR_S1) #Write Mat file for Stim 1
writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nRSrc_S2_3new2_SrcMLE.mat", x=newSrc_nR_S2) #Write Mat file for Stim 2


#115,  119,  120, 124,  126,  129,  130,  131, 132, 133, 134, 138, 139, 140, 141, 142, 143, 147, 149, 152, 157, 
#162, 165, 167, 172, 182, 184, 186, 188, 192, 193, 195, 197, 203, 204, 209, 215, 218, 219, 220, 221, 223, 224, 
#226, 227, 228, 231, 232, 233, 237, 238, 241, 243, 244, 249, 250, 252, 253, 255, 258, 259, 260, 261, 262, 263, 
#264

> cor(OverallSDT_Subj_35$d, OverallSDT_Subj_35$Item_MRat)
[1] -0.257466
> plot(OverallSDT_Subj_35$d, OverallSDT_Subj_35$Item_MRat)
lm_d_Mrat<- brm(Item_MRat ~ d, data = OverallSDT_Subj_35, family = gaussian(), iter = 10000, save_pars = save_pars(all = TRUE))
pp_check(lm_d_Mrat, ndraws = 40) #Great fit
summary(lm_d_Mrat)
ci(lm_d_Mrat, method = "HDI", ci = 0.83)[2,3];ci(lm_d_Mrat, method = "HDI", ci = 0.83)[2,4] #Also significant with 85% confidence
plot_model(lm_d_Mrat, type="pred")


#Mratio for 40 x Valence
E_Mrat <- c(0.84, 1.45, 1.7, 0.92, 1.23, 2.23, 1.2, 1.63, 1.25, 1.85, 5.16, 1.55, 1.24, 1.72, 0.27, 1.26, 1.04,
            0.53, 1.47, 1.37, 1.02, 1.62, 1.57, -0.96, 1.26, 0.99, -0.21, 0.47, 0.71, 0.58, 6.96, 0.57,
            0.02, 1.22, 0.9, 0.31, 0.41, 1.08, -0.19, 0.87)
N_Mrat <- c(2, 0.52, 0.94, 0.51, 0.55, 0.97, 1.19, 0.84, 0.29, 0.91, 0.57, 0.61, 0.41, 0.42, 0.26, 0.57, 0.6,
            0.87, 0.58, 0.45, 0.99, 0.97, 0.53, -0.28, 0.66, -0.12, -0.88, 0.52, 0.82, 0.32, 0.08, 1.03,
            0.88, 0.66, 0.36, 0.26, 1.41, 0.72, 0.67, 0.07)

#path mode
Path_mat <- rbind(cbind(OverallSDT_Subj_40$ID, OverallSDT_Subj_40$VVIQ_Scores, N_Mrat, Item_N_d, rep("N")),
                  cbind(OverallSDT_Subj_40$ID, OverallSDT_Subj_40$VVIQ_Scores, E_Mrat, Item_E_d, rep("E")))

#Create df
Path_df <- data.frame(Path_mat); colnames(Path_df) <- c("ID", "VVIQ", "Item_MRat", "d_score", "Valence")
Path_df$Valence <- factor(Path_df$Valence, levels = c("N", "E"))
Path_df$Item_MRat <- as.numeric(Path_df$Item_MRat)
Path_df$d_score <- as.numeric(Path_df$d_score)
Path_df$VVIQ <- as.numeric(Path_df$VVIQ)
write.csv(Path_df, file = "Pathdf.csv", row.names = FALSE)

#Standardize variables for path analysis
StandPath_df<- Path_df %>% mutate(across(where(is.numeric), scale))

# Answer Key
Path_metaimagery <- '
   Item_MRat ~  a*d_score + b*Valence + c*VVIQ 
   d_score ~ d*Valence
   VVIQ_ind := c*a
   Val_ind := d*a
   tot := VVIQ_ind+Val_ind+c+b
   VVIQprop := VVIQ_ind/tot
   Valprop := Val_ind/tot
'
Lavaan_finalmodel <- lavaan::sem(Path_metaimagery, data = StandPath_df)  ## standardizing variables

## parameter names
semPaths(Lavaan_finalmodel, what = "path", edge.label.cex = 2, layout = "tree2", residuals = FALSE, edge.color = 1, 
         esize = 1, rotation = 2, sizeMan = 8, asize = 2.5, fade = FALSE, exoCov = FALSE, nDigits = 3, intercepts = FALSE)
## unstandardized parameters
semPaths(Lavaan_finalmodel, what = "est", edge.label.cex = 2, layout = "tree2", residuals = TRUE, edge.color = 1, 
         esize = 1, rotation = 2, sizeMan = 8, asize = 2.5, fade = FALSE, exoCov = FALSE, nDigits = 3, intercepts = FALSE)
summary(Lavaan_finalmodel, standardized = TRUE) ## we add the standardized parameters right away 

Lavaan_finalmodel_summary <- summary(Lavaan_finalmodel, standardized = TRUE)$pe  ## we're saving the parameter estimate table from the summary to use later

customLayout <- matrix(c(2, 0,  # MRATIO at the top
                         -2, 0,  # d_score on the left
                         0, -2,   # Valence on the right
                         0, 2), # VVIQ at the bottom
                       ncol = 2, byrow = TRUE)
path_pvalues <- c(0.66, 0.002, 0.81, 0.011, 0.005) # Replace with your actual p-values
path_colors <- ifelse(path_pvalues < 0.05, "forestgreen", "grey")

# Create custom labels with both estimates and p-values
# The format is "estimate (p-value)"
custom_labels <- paste(round(Lavaan_finalmodel_summary$est, 3), " (p=", round(Lavaan_finalmodel_summary$pvalue, 3), ")", sep="")
custom_labels <- c("-0.053\n (p=0.66)",  "0.73\n (p=0.002)", "0.028\n (p=0.81)", "0.226\n (p=0.041)", "0.613\n (p=0.005)")

semPaths(Lavaan_finalmodel, what = "est", edge.label.cex = 1.5, layout = customLayout,
         residuals = FALSE, edge.color = path_colors, esize = 6, rotation = 1,
         sizeMan = 13, asize = 5, fade = FALSE, exoCov = TRUE, nDigits = 3,
         intercepts = FALSE, ,nodeLabels = c("Item\n M-ratio", "d' score", "Negative\n Valence", "VVIQ\n score"), edgeLabels = custom_labels)












#Mratio for 35 x Valence
E_Mrat <- c(0.84, 1.45, 1.7, 0.92, 1.23, 2.23, 1.2, 1.63, 1.25, 1.85, 5.16, 1.55, 1.24, 1.72, 0.27, 1.26, 1.04,
            0.53, 1.47, 1.37, 1.02, 1.62, 1.57, -0.96, 1.26, 0.99, -0.21, 0.47, 0.71, 0.58, 6.96, 0.57,
            0.02, 1.22, 0.9, 0.31, 0.41, 1.08, -0.19, 0.87)
N_Mrat <- c(2, 0.52, 0.94, 0.51, 0.55, 0.97, 1.19, 0.84, 0.29, 0.91, 0.57, 0.61, 0.41, 0.42, 0.26, 0.57, 0.6,
            0.87, 0.58, 0.45, 0.99, 0.97, 0.53, -0.28, 0.66, -0.12, -0.88, 0.52, 0.82, 0.32, 0.08, 1.03,
            0.88, 0.66, 0.36, 0.26, 1.41, 0.72, 0.67, 0.07)
sum(E_Mrat>N_Mrat)/40

#path mode
Path_mat <- rbind(cbind(OverallSDT_Subj_40$ID, OverallSDT_Subj_40$VVIQ_Scores, N_Mrat, Item_N_d[above_d], Item_N_c[above_d], rep("N")),
                  cbind(OverallSDT_Subj_40$ID, OverallSDT_Subj_40$VVIQ_Scores, E_Mrat, Item_E_d[above_d], Item_E_c[above_d], rep("E")))

#Create df
Path_df <- data.frame(Path_mat); colnames(Path_df) <- c("ID", "VVIQ", "Item_MRat", "d_score", "c_score", "Valence")
Path_df$Valence <- factor(Path_df$Valence, levels = c("N", "E"))
Path_df$Item_MRat <- as.numeric(Path_df$Item_MRat)
Path_df$d_score <- as.numeric(Path_df$d_score)
Path_df$VVIQ <- as.numeric(Path_df$VVIQ)
Path_df$c_score <- as.numeric(Path_df$c_score)

#Standardize variables for path analysis
StandPath_df<- Path_df %>% mutate(across(where(is.numeric), scale))

# Answer Key
Path_metaimagery <- '
   Item_MRat ~  a*d_score + b*Valence + c*VVIQ + h*c_score
   d_score ~ e*Valence 
   c_score ~ f*VVIQ + g*Valence
   VVIQ_ind := h*f
   Val_ind := a*e
   Val_ind2 := h*g
   tot := VVIQ_ind+Val_ind+Val_ind2+c+b+a
   VVIQprop := (VVIQ_ind)/tot
   Valprop := (Val_ind+Val_ind2)/tot
'





Path_metaimagery <- '
   Item_MRat ~ a*Valence + b*VVIQ + c*c_score
   d_score ~ d*Valence 
   c_score ~ e*VVIQ + f*Valence
   VVIQ_ind := b*e
   Val_ind := a*f
   tot := VVIQ_ind+Val_ind+c+a+b
   VVIQprop := VVIQ_ind+b/tot
   Valprop := Val_ind+a/tot
'
Path_metaimagery <- '
   Item_MRat ~  a*d_score + b*Valence + c*VVIQ + h*c_score
   d_score ~ e*Valence + d*VVIQ
   c_score ~ f*VVIQ + g*Valence
   VVIQ_ind := c*f
   VVIQ_ind2 := c*
   Val_ind := e*a
   Val_ind2 := c*g
   tot := VVIQ_ind+Val_ind+Val_ind2+c+b
   VVIQprop := VVIQ_ind/tot
   Valprop := Val_ind+Val_ind2/tot
'

Lavaan_finalmodel <- lavaan::sem(Path_metaimagery, data = StandPath_df)  ## standardizing variables

## parameter names
semPaths(Lavaan_finalmodel, what = "path", edge.label.cex = 2, layout = "tree2", residuals = FALSE, edge.color = 1, 
         esize = 1, rotation = 2, sizeMan = 8, asize = 2.5, fade = FALSE, exoCov = FALSE, nDigits = 3, intercepts = FALSE)
## unstandardized parameters
semPaths(Lavaan_finalmodel, what = "est", edge.label.cex = 2, layout = "tree2", residuals = TRUE, edge.color = 1, 
         esize = 1, rotation = 2, sizeMan = 8, asize = 2.5, fade = FALSE, exoCov = FALSE, nDigits = 3, intercepts = FALSE)
summary(Lavaan_finalmodel, standardized = TRUE) ## we add the standardized parameters right away 

Lavaan_finalmodel_summary <- summary(Lavaan_finalmodel, standardized = TRUE)$pe  ## we're saving the parameter estimate table from the summary to use later

customLayout <- matrix(c(2, 0,  # MRATIO at the top
                         -2, 0,  # d_score on the left
                         0, -2,   # Valence on the right
                         0, 2, # VVIQ at the bottom
                         -6, 0),
                       ncol = 2, byrow = TRUE)


customLayout <- matrix(c(2, 0,  # MRATIO to the right
                         0, 0,  # d_score on the left
                         0, -2,   # cScore on the bottom
                         0, 2, # VVIQ at the top
                         -6, 0), #Negative valence left(est)
                       ncol = 2, byrow = TRUE)

customLayout <- matrix(c(0, 0,  # MRATIO to the right
                         16, 0,  # d_score on the left
                         -16, 0,   # cScore on the bottom
                         0, 4, # VVIQ at the top
                         0, -4), #Negative valence left(est)
                       ncol = 2, byrow = TRUE)

#path_pvalues <- c(0.442, 0.000, 0.369, 0.111, 0.000, 0.007, 0.000,  0.012) # Replace with your actual p-values
path_pvalues <- c(0.300, 0.001, 0.480, 0.118, 0.001, 0.001, 0.044) # Replace with your actual p-values

path_colors <- ifelse(path_pvalues < 0.05, "forestgreen", "grey")

# Create custom labels with both estimates and p-values
# The format is "estimate (p-value)"
custom_labels <- paste(round(Lavaan_finalmodel_summary$est, 3), " (p=", round(Lavaan_finalmodel_summary$pvalue, 3), ")", sep="")
custom_labels <- c("-0.115\n (p=0.3)",  "0.77\n (p=0.001)", "0.079\n (p=0.48)", "-0.18\n (p=0.12)",  "0.67\n (p=0.001)", "0.34\n (p=0.001)",  "0.41\n (p=0.044)")

semPaths(Lavaan_finalmodel, what = "est", edge.label.cex = 1.5, layout = customLayout,
         residuals = FALSE, edge.color = path_colors, esize = 6, rotation = 1,
         sizeMan = 10, asize = 5, fade = FALSE, exoCov = FALSE, nDigits = 3,
         intercepts = FALSE, ,nodeLabels = c("Item\n M-ratio", "d' score", "c score", "Negative\n Valence", "VVIQ\n score"), edgeLabels = custom_labels)


#c("Item\n M-ratio", "d' score", "Negative\n Valence", "c score\n score", "VVIQ")
#c("Item\n M-ratio", "d' score", "VVIQ\n score", "Negative\n Valence",  "c score"), edgeLabels = custom_labels)


