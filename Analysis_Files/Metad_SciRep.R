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

#Create vector for 40 participants included in source memory analysis
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

### Vividness of Visual Imagery Questionnaire (VVIQ) Score ###
hist(Subj_40$VVIQ_Scores, main = "Vividness of Visual Imagery Questionnaire (VVIQ)", xlab = "VVIQ Scores", 
     ylab = "Frequency", breaks = 14, xlim = c(16,90)); abline(v=32, col=c("red")); abline(v=mean(Subj_40$VVIQ_Scores), col=c("blue"))
summary(Subj_40$VVIQ_Scores); sd(Subj_40$VVIQ_Scores)
#Mean = 57.9 (10.26)
#Range = 41 - 80


#### EDA - Item Recognition ####
#Subsetting data for the acceptable participants (N=27)
Item_Cleaned_Anal_40 <- Item_Cleaned_Anal_40 %>% filter(participant %in% Good_performers_enc) %>% filter(!participant %in% c(Conf_exc, Item_exc, Source_exc, Img_exc, Neg_Metad)) %>% filter(participant %in% Src_40)

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

#Specify Prior
confidence_prior <-
  prior(normal(3, 1), class = "b", coef = "") +
  prior(normal(0, 1), class = "b", coef = "Rec_SceneE")

#Run Model
if (!file.exists("SciRep40_emo_conf_lm.rda")) {
  emo_conf_diff_lm <- brm(avg_conf ~  Rec_Scene + (1 | participant), prior = confidence_prior, data = Item_Conf_Emo, family = gaussian(), seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(emo_conf_diff_lm, file = "./SciRep40_emo_conf_lm.rda") 
} else {
  load("SciRep40_emo_conf_lm.rda")  
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

#Specify Prior
src_confidence_prior <-
  prior(normal(3, 1), class = "b", coef = "") +
  prior(normal(0, 1), class = "b", coef = "Src_SceneE")

#Evaluate the significance of the difference in confidence
Src_Conf_Emo <- Cleaned_Source_Anal_40 %>% group_by(participant, Src_Scene) %>% summarize(avg_conf = mean(as.numeric(Source_Conf_Response)))
if (!file.exists("SciRep40_Src_emo_conf_lm.rda")) {
  Src_emo_conf_diff_lm <- brm(avg_conf ~  Src_Scene + (1 | participant), data = Src_Conf_Emo, family = gaussian(),  prior = src_confidence_prior, seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Src_emo_conf_diff_lm, file = "./SciRep40_Src_emo_conf_lm.rda") 
} else {
  load("SciRep40_Src_emo_conf_lm.rda")  
}
pp_check(Src_emo_conf_diff_lm, ndraws = 40) #Looks like a great fit
summary(Src_emo_conf_diff_lm)
hdi(Src_emo_conf_diff_lm, ci = 0.89)
pd(Src_emo_conf_diff_lm)
plot_model(Src_emo_conf_diff_lm, type="pred")
# Participants were -.11(.04) [-0.16, -0.05] less confident for negative emotion source recognition judgments.

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

#Convert data frame for analysis
Mem_Confidence <- Mem_Confidence_Ppt %>% pivot_longer(c("Source_Conf", "Item_Conf"), names_to = "Memory", values_to = "Conf")
#Specify Prior
memconfidence_prior <-
  prior(normal(3, 1), class = "b", coef = "") +
  prior(normal(0, 1), class = "b", coef = "MemorySource_Conf") 
#Analyze data
if (!file.exists("SciRep40_Mem_conf_lm.rda")) {
  Mem_conf_diff_lm <- brm(Conf ~ Memory + (1 | participant), data = Mem_Confidence, family = gaussian(), prior = memconfidence_prior, seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_conf_diff_lm, file = "./SciRep40_Mem_conf_lm.rda") 
} else {
  load("SciRep40_Mem_conf_lm.rda")  
}
pp_check(Mem_conf_diff_lm, ndraws = 40) #Looks like a great fit
summary(Mem_conf_diff_lm)
hdi(Mem_conf_diff_lm, ci = 0.89)
pd(Mem_conf_diff_lm)
plot_model(Mem_conf_diff_lm, type="pred")
# Participants were 0.54(0.06) [0.45, 0.63] less confident for source confidence judgments.
# 100% pd

#Combine valenced item and source data frames
Item_Conf_Emo$participant <- factor(Item_Conf_Emo$participant)
colnames(Item_Conf_Emo) <- c("participant", "Valence", "avg_conf")
colnames(Src_Conf_Emo) <- c("participant", "Valence", "avg_conf")

#Specify Prior
src_memvalconfidence_prior <-
  prior(normal(3, 1), class = "b", coef = "") +
  prior(normal(0, 1), class = "b", coef = "MemorySource") +
  prior(normal(0, 1), class = "b", coef = "ValenceE")
src_memvalintconfidence_prior <-
  prior(normal(3, 1), class = "b", coef = "") +
  prior(normal(0, 1), class = "b", coef = "MemorySource") +
  prior(normal(0, 1), class = "b", coef = "ValenceE") +
  prior(normal(0, 1), class = "b", coef = "ValenceE:MemorySource") 


if (!file.exists("SciRep40_MemVal_conf_lm.rda")) {
  Mem_emo_conf_diff_lm <- brm(avg_conf ~  Valence + Memory + (1 | participant), data = Mem_Conf_Emo, family = gaussian(), prior = src_memvalconfidence_prior, seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_emo_conf_diff_lm, file = "./SciRep40_Val_conf_lm.rda") 
} else {
  load("SciRep40_MemVal_conf_lm.rda")  
}
if (!file.exists("SciRep40_MemVal_conf_lmint.rda")) {
  Mem_emo_conf_diff_lm_int <- brm(avg_conf ~  Valence * Memory + (1 | participant), data = Mem_Conf_Emo, family = gaussian(), prior = src_memvalintconfidence_prior, seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_emo_conf_diff_lm_int, file = "./SciRep40_MemVal_conf_lmint.rda") 
} else {
  load("SciRep40_MemVal_conf_lmint.rda")  
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
hdi(Mem_emo_conf_diff_lm_int, .89)
p_direction(Mem_emo_conf_diff_lm_int)
plot_model(Mem_emo_conf_diff_lm_int, type = "pred")
plot_model(Mem_emo_conf_diff_lm_int, type = "int", terms = c('ValenceE:MemorySource')) 
#Analysis indicates that negative emotion impacts confidence in item and source memory differently
# Specifically, higher for item memory, but lower for source memory under negative emotion

#Visualization of change in confidence by memory
Mem_Conf_Emo %>% ggplot(aes(x=Valence, y=avg_conf, group=participant)) + geom_point() + geom_line() + facet_wrap(.~Memory)
#Patterns replicate what was determined by the analysis

#### H-Meta-d' Dataprep ####

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
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S1_40_SR.mat", x=nR_S1) #Write Mat file for Stim 1
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S2_40_SR.mat", x=nR_S2) #Write Mat file for Stim 2

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
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nRSrc_S1_40_SR.mat", x=Src_nR_S1) #Write Mat file for Stim 1
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nRSrc_S2_40_SR.mat", x=Src_nR_S2) #Write Mat file for Stim 2


#### H-Meta-d' Dependent Memory DataPrep ####
#Combine matrices into necessary format for H-meta-d'
nR_S1_1 <- cbind(nR_S1, Src_nR_S1)
nR_S2_2<- cbind(nR_S2, Src_nR_S2)

## Each vector has length k x 2 x2 where k is the number of ratings available. (i.e. it should be 12[1-3x2x2])
dim(nR_S1_1) #12 Columns
dim(nR_S2_2) #12 Columns

#Export data matrices
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S1_40_SR_Mem_1.mat", x=nR_S1_1) #Write Mat file for Stim 1
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S2_40_SR_Mem_2.mat", x=nR_S2_2) #Write Mat file for Stim 2


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
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S1_40_1_SR_Item.mat", x=nR_S1_1) #Write Mat file for Stim 1
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S2_40_2_SR_Item.mat", x=nR_S2_2) #Write Mat file for Stim 2

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
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S1_40_SR_1_Src.mat", x=nR_S1_1_Src) #Write Mat file for Stim 1
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/nR_S2_40_SR_2_Src.mat", x=nR_S2_2_Src) #Write Mat file for Stim 2

#### MEMORY: SDT ####
## d ##
item_d <- c(1.4291, 2.3790, 1.5387, 2.2067, 2.6203, 2.1617, 2.7638, 2.2080, 2.2372, 
            2.4630, 2.4500, 2.2123, 1.8736, 2.4740, 2.0284, 2.8290, 2.1278, 1.8139, 
            2.1543, 2.3816, 2.3121, 2.2963, 2.1032, 2.1798, 1.5844, 2.3528, 1.9566, 
            2.5263, 2.0593, 1.8780, 1.9693, 2.4210, 2.7835, 2.5019, 2.2951, 2.4773, 
            1.8636, 2.2581, 2.4160, 2.0814)
mean(item_d); sd(item_d) #2.22 (0.32)
src_d <- c(0.8344, 0.9785, 1.7691, 0.7975, 1.4538, 1.5081, 1.3068, 0.9630, 1.3396, 
           1.0724, 0.9804, 1.0094, 1.4139, 0.9181, 1.1633, 1.0063, 0.9469, 2.0676, 
           1.4199, 0.9463, 1.4339, 0.9205, 0.9352, 1.2629, 2.3408, 2.1523, 1.9807, 
           1.0311, 2.5633, 1.7913, 0.8821, 1.3464, 1.2674, 0.9555, 0.9424, 0.9680, 
           1.6949, 1.2057, 0.9008, 1.6366)
mean(src_d); sd(src_d) #1.3 (0.45)
item_d <- data.frame(cbind(Src_40, item_d))
colnames(item_d) <- c("ID", "Item")
src_d <- data.frame(cbind(Src_40, src_d))
colnames(src_d) <- c("ID", "Src")

full_d <- item_d %>% right_join(src_d)
full_d <- full_d %>% pivot_longer(c("Item", "Src"), names_to = "Memory", values_to = "d")

#Analyze results
Src_d_prior <-
  prior(normal(1, .5), class = "b", coef = "") +
  prior(normal(0, .5), class = "b", coef = "MemorySrc")
if (!file.exists("SciRep40_Mem_d_lm.rda")) {
  Mem_d_lm_40 <- brm(d ~  Memory + (1 | ID), data = full_d, family = gaussian(), prior = Src_d_prior, seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_d_lm_40, file = "./SciRep40_Mem_d_lm.rda") 
} else {
  load("SciRep40_Mem_d_lm.rda")  
}
pp_check(Mem_d_lm_40, ndraws = 40) #Looks like a great fit
summary(Mem_d_lm_40)
mcse(Mem_d_lm_40)
hdi(Mem_d_lm_40, ci = 0.89) # -1.03, -0.75
pd(Mem_d_lm_40)
plot_model(Mem_d_lm_40, type="pred")
# -0.89 [-1.03, -0.75]  more sensitive for neg valence; 1.x more sensitive for ___ than ___ memory
# 100% pd
(mean(item_d$Item)/mean(src_d$Src)) #Difference: 1.7x

## c ##
item_c <- c(0.2032, -0.4282, -0.3910, -0.3907, -0.5103, -0.3142, -0.2842, -0.4035, 
            -0.4522, -0.3202, -0.4187, -0.3192, -0.5146, -0.4803, -0.5689, -0.3452, 
            -0.2040, -0.2602, -0.4936, -0.3522, -0.4018, -0.3509, -0.3559, -0.3023, 
            -0.2832, -0.2012, -0.2541, -0.3566, -0.2283, -0.3973, -0.4944, -0.3681, 
            -0.3498, -0.2334, -0.4422, -0.2787, -0.2017, -0.6048, -0.3533, -0.6148)
mean(item_c); sd(item_c) # -0.36 (0.14)
src_c <- c(0.3497, 0.4248, 0.3120, 0.3338, 0.3789, 0.3521, 0.2601, 0.2575, 0.5139, 0.3043, 0.4639, 
           0.3246, 0.2747, 0.2798, 0.3339, 0.3838, 0.3613, 0.3375, 0.2922, 0.4660, 0.4652, 0.4034, 
           0.4344, 0.3750, 0.3462, 0.4143, 0.3754, 0.3438, 0.2632, 0.3942, 0.2653, 0.3188, 0.2868, 
           0.3060, 0.3045, 0.2931, 0.3442, 0.3404, 0.4075, 0.3381)
mean(src_c); sd(src_c) # 0.35 (0.064)
item_c <- data.frame(cbind(Src_40, item_c))
colnames(item_c) <- c("ID", "Item")
src_c <- data.frame(cbind(Src_40, src_c))
colnames(src_c) <- c("ID", "Src")
full_c <- item_c %>% right_join(src_c)
full_c <- full_c %>% pivot_longer(c("Item", "Src"), names_to = "Memory", values_to = "c")

#Analyze results
Src_c_prior <-
  prior(normal(0, .5), class = "b", coef = "") +
  prior(normal(0, .5), class = "b", coef = "MemorySrc")
if (!file.exists("SciRep40_Mem_c_lm.rda")) {
  Mem_c_lm_40 <- brm(c ~  Memory + (1 | ID), data = full_c, family = gaussian(), prior = Src_c_prior, seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Mem_c_lm_40, file = "./SciRep40_Mem_c_lm.rda") 
} else {
  load("SciRep40_Mem_c_lm.rda")  
}
pp_check(Mem_c_lm_40, ndraws = 40) #Looks like a great fit
summary(Mem_c_lm_40)
mcse(Mem_c_lm_40)
hdi(Mem_c_lm_40, ci = 0.89) # 0.67, 0.74
pd(Mem_c_lm_40)
plot_model(Mem_c_lm_40, type="pred")
# 0.71 [.67, .74]  more conservative for source memory
# 100% pd


#### ITEM: SDT x Valence ####
## d ##
neg_d <- c(1.3230, 2.3886, 1.2245, 2.6656, 3.252, 2.1787, 3.9751, 2.2424, 3.1086, 2.9423, 2.7715, 
           2.1287, 1.9252, 2.7715, 2.0014, 3.6423, 2.7592, 1.9183, 1.9252, 2.5115, 2.1787, 2.5115, 
           2.0529, 2.0529, 1.3475, 2.4928, 1.6492, 2.9423, 1.8990, 1.6803, 1.7356, 2.9828, 2.7715, 
           2.9018, 3.1086, 2.6281, 2.1682, 2.6656, 2.9018, 2.1851)
mean(neg_d); sd(neg_d) #2.41 (0.62)

neut_d <- c(0.7593, 2.1287, 1.4844, 1.8990, 2.6656, 2.0237, 2.1787, 1.8315, 1.4646, 2.2424, 2.1851, 2.0248, 1.7443, 2.5719, 
            1.9140, 2.7715, 1.6420, 1.3108, 2.0914, 2.3886, 2.1851, 1.9252, 1.7356, 1.9391, 1.9140, 2.3220, 2.0237, 2.3886,
            2.1682, 1.7414, 1.8286, 2.3682, 3.4228, 2.1787, 1.8315, 2.4928, 1.1308, 1.9140, 2.1851, 2.2249)
mean(neut_d); sd(neut_d) #2.03 (0.46)
neg_d <- data.frame(cbind(Src_40, neg_d))
colnames(neg_d) <- c("ID", "Neg")

neut_d <- data.frame(cbind(Src_40, neut_d))
colnames(neut_d) <- c("ID", "Neut")

full_d <- neg_d %>% right_join(neut_d)
full_d <- full_d %>% pivot_longer(c("Neg", "Neut"), names_to = "Valence", values_to = "d")

#Specify Prior
d_prior <-
  prior(normal(1.5, .5), class = "b", coef = "") +
  prior(normal(0, .5), class = "b", coef = "ValenceNeut")

#Analyze results
if (!file.exists("SciRep40_item_val_d_lm.rda")) {
  val_d_lm_40 <- brm(d ~  Valence + (1 | ID), data = full_d, family = gaussian(), prior = d_prior, seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(val_d_lm_40, file = "./SciRep40_item_val_d_lm.rda") 
} else {
  load("SciRep40_item_val_d_lm.rda")  
}
pp_check(val_d_lm_40, ndraws = 40) #Looks like a great fit
summary(val_d_lm_40)
mcse(val_d_lm_40)
hdi(val_d_lm_40, ci = 0.89)
pd(val_d_lm_40)
plot_model(val_d_lm_40, type="pred")
(mean(neg_d$Neg)/mean(neut_d$Neut)) 
#0.37 [0.23, 0.51]  more sensitive for neg valence; 1.19x more sensitive than neut memory
# 100% pd


## c ##
neg_c <- c(-0.0386, -0.4664, -0.0878, -0.8084, -0.5152, -0.1219, -0.1536, -0.2796, -0.5869, -0.1896, -0.2750, -0.3364,
           -0.4382, -0.2750, -0.6600, -0.3201, 0.4543, 0.1516, -0.4382, -0.1450, -0.1219, -0.1450, -0.1848, -0.1848,
           0.1678, 0.0352, 0.0170, -0.1896, -0.1079, -0.2172, -0.3434, -0.6498, -0.2750, 0.0502, -0.5869, -0.3466,
           0.0267, -0.8084, 0.0502, -0.5681)
mean(neg_c); sd(neg_c) #-0.25 (0.27)

neut_c <- c(-0.1263, -0.3364, -0.6585, -0.1079, -0.8084, -0.3889, -0.1219, -0.4850, -0.4789, -0.2796, -0.5681, -0.0450,
            -0.7885, -0.8552, -0.7037, -0.2750, -0.3903, -0.4020, -0.6150, -0.4664, -0.5681, -0.4382, -0.3434, -0.2417,
            -0.7037, -0.0502, -0.3889, -0.4664, 0.0267, -0.5300,-0.7464, -0.2167, -0.4298, -0.1219, -0.4850, 0.0352,
            -0.1347, -0.7037, -0.5681,-1.0288)
mean(neut_c); sd(neut_c) #-0.43 (0.26)
neg_c <- data.frame(cbind(Src_40, neg_c))
colnames(neg_c) <- c("ID", "Neg")

neut_c <- data.frame(cbind(Src_40, neut_c))
colnames(neut_c) <- c("ID", "Neut")

full_c <- neg_c %>% right_join(neut_c)
full_c <- full_c %>% pivot_longer(c("Neg", "Neut"), names_to = "Valence", values_to = "c")

#Specify Prior
c_prior <-
  prior(normal(0, .5), class = "b", coef = "") +
  prior(normal(0, .5), class = "b", coef = "ValenceNeut")

#Analyze results
if (!file.exists("SciRep40_item_val_c_lm.rda")) {
  val_c_lm_40 <- brm(c ~  Valence + (1 | ID), data = full_c, family = gaussian(), prior = c_prior, seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(val_c_lm_40, file = "./SciRep40_item_val_c_lm.rda") 
} else {
  load("SciRep40_item_val_c_lm.rda")  
}
pp_check(val_c_lm_40, ndraws = 40) #Looks like a great fit
summary(val_c_lm_40)
mcse(val_c_lm_40)
hdi(val_c_lm_40, ci = 0.89)
pd(val_c_lm_40)
plot_model(val_c_lm_40, type="pred")
# -0.18 [-0.26, -0.09]  more liberal for neutral judgments
# 99.94% pd


#### SOURCE: SDT x Valence ####
## d ##
Src_neg_d <- c(0.4637, 1.3465, 2.2211, 1.0421, 1.3490, 1.6643, 1.5344, 1.5547, 1.7293, 0.8660, 1.2393,
               0.6290, 1.7655, 0.7732, 1.3267, 0.9117, 0.2981, 2.1797, 2.3468, 0.2057, 1.0461, 1.1580,
               0.9998, 1.2040, 2.7511, 2.0574, 2.8353, 0.8651, 3.6678, 1.6773, 0.3765, 0.9578, 1.7793, 
               0.6741, 0.8430, 0.9274, 1.9884, 0.8122, 0.8208, 1.1309)
mean(Src_neg_d); sd(Src_neg_d) #1.35 (0.74)

Src_neut_d <- c(0.9254, 0.2788, 1.3490, 0.1935, 1.5018, 1.4222, 0.8660, 0.2957, 1.3720, 1.0105, 0.1016,
                0.9443, 0.8963, 0.3407, 0.8307, 0.6955, 1.3687, 2.5167, 1.0364, 0.9232, 2.1161, -0.0734,
                0.4296, 1.1614, 2.7325, 3.1314, 1.5941, 0.8162, 2.6360, 2.2391, 0.8074, 1.6251, 0.9602,
                0.9807, 0.4728, 0.6575, 1.5826, 1.1473, 0.4936, 2.2086)
mean(Src_neut_d); sd(Src_neut_d) #1.17 (0.77)

Src_neg_d <- data.frame(cbind(Src_40, Src_neg_d))
colnames(Src_neg_d) <- c("ID", "Neg")

Src_neut_d <- data.frame(cbind(Src_40, Src_neut_d))
colnames(Src_neut_d) <- c("ID", "Neut")

Src_full_d <- Src_neg_d %>% right_join(Src_neut_d)
Src_full_d <- Src_full_d %>% pivot_longer(c("Neg", "Neut"), names_to = "Valence", values_to = "d")

#Specify Prior
Src_d_prior <-
  prior(normal(1, .5), class = "b", coef = "") +
  prior(normal(0, .5), class = "b", coef = "ValenceNeut")

#Analyze results
if (!file.exists("SciRep40_src_val_d_lm.rda")) {
  Src_val_d_lm_40 <- brm(d ~  Valence + (1 | ID), data = Src_full_d, family = gaussian(), prior = Src_d_prior, seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Src_val_d_lm_40, file = "./SciRep40_src_val_d_lm.rda") 
} else {
  load("SciRep40_src_val_d_lm.rda")  
}
pp_check(Src_val_d_lm_40, ndraws = 40) #Looks like a great fit
summary(Src_val_d_lm_40)
mcse(Src_val_d_lm_40)
hdi(Src_val_d_lm_40, 0.88)
pd(Src_val_d_lm_40)
plot_model(Src_val_d_lm_40, type="pred")
# -0.18 [-0.36, -0.01] 1.16x more sensitive for negative judgments
# 93.75% pd

## c ##
Src_neg_c <- c(0.2319, 0.5686, 0.2411, 0.2912, 0, 0.2170, 0.2428, -0.3195, 0.9693, -0.0307, 0.3478,
               0.2099, -0.2676, 0.1926, 0.4335, 0.2186, 0.3595, 0.2282, -0.5583, 0.7180, 0.7949, 0.3418, 
               0.2280, 0.4080, 0.5139, 0.8608, 0.4968, 0.0919, 0, 0.4429, 0.0836, 0.2490, -0.2607, -0.1266,
               0.1029, -0.0000, 0.1248, 0.4061, 0.4104, 0.2468)
mean(Src_neg_c); sd(Src_neg_c) #0.24 (0.31)

Src_neut_c <- c(0.3581, 0.5351, -0.0000, 0.1751, 0.9808, 0.4392, -0.0307, 0.2375, 1.0046, 0.4156, 1.1476, 0.3043,
                0.3435, -0.1703, 0.1332, 0.6197, 0.4125, 0.5105, 0.5182, 0.7803, 0.7758, 0.7112, 1.0270, 0.3867,
                0.1679, 0.3238, 0.4013, 0.5127, -0.0000, 0.5711, 0.0851, 0.1974, 0.3321, 0.5950, 0.2364, 0.2504,
                0.4506, 0.1008, 0.5654, 0.4298)
mean(Src_neut_c); sd(Src_neut_c) #0.42 (0.3)

Src_neg_c <- data.frame(cbind(Src_40, Src_neg_c))
colnames(Src_neg_c) <- c("ID", "Neg")

Src_neut_c <- data.frame(cbind(Src_40, Src_neut_c))
colnames(Src_neut_c) <- c("ID", "Neut")

Src_full_c <- Src_neg_c %>% right_join(Src_neut_c)
Src_full_c <- Src_full_c %>% pivot_longer(c("Neg", "Neut"), names_to = "Valence", values_to = "c")

#Analyze results
if (!file.exists("SciRep40_AD_val_c_lm.rda")) {
  AD_val_c_lm_40 <- brm(c ~  Valence + (1 | ID), data = Src_full_c, family = gaussian(), prior = c_prior, seed = 123, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(AD_val_c_lm_40, file = "./SciRep40_AD_val_c_lm.rda") 
} else {
  load("SciRep40_AD_val_c_lm.rda")  
}
pp_check(AD_val_c_lm_40, ndraws = 40) #Looks like a great fit
summary(AD_val_c_lm_40)
mcse(AD_val_c_lm_40)
hdi(AD_val_c_lm_40, 0.89)
pd(AD_val_c_lm_40)
plot_model(AD_val_c_lm_40, type="pred")
# -0.18 [-0.28, -0.08]  less conservative for negative judgments
# 99.67% pd

##### Standardize Subjective measures #####
Stand_BA <- scale(Subj_40$BA_scores)

## VVIQ ##
Stand_VVIQ <- scale(Subj_40$VVIQ_Scores)

#Combine into single matrix for estimation in Matlab
Stand_VVIQ <- t(matrix(Stand_VVIQ, ncol=1)) #Transposed matrix to meet specifications
Stand_BA <- t(matrix(Stand_BA, ncol=1)) #Transposed matrix to meet specifications

#Export for use in Matlab
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/VVIQ_SubjCov_40_SR.mat", x=Stand_VVIQ) #Write Mat file for Source Subjective Covariates
#writeMat(con="/Users/johnnycastillo/Library/Mobile Documents/com~apple~CloudDocs/Desktop/Grad School/G4/Metad_40/BA_SubjCov_40_SR.mat", x=Stand_BA) #Write Mat file for Source Subjective Covariates


#### Type 1 (d'/c) Subjectives ####
# Create dataframe
#Subjective and Overall SDT
Subj_40$ID <- as.factor(Subj_40$ID)
MLE_2SDT <- data.frame(unique(sort(Subj_40$ID)), item_d, item_c, "Item")
colnames(MLE_2SDT) <- c("ID", "d", "c", "Memory")
MLE_2SDT_Src <- data.frame(unique(sort(Subj_40$ID)), src_d$Src, src_c, "AD")
colnames(MLE_2SDT_Src) <- c("ID", "d", "c", "Memory")
FULL_MLE_SDT <- rbind(MLE_2SDT, MLE_2SDT_Src)

#Joining the SDT data with the Subjective Data
OverallSDT_Subj <- Subj_40 %>% select("ID", "VVIQ_Scores", "BA_scores") %>% full_join(FULL_MLE_SDT)
Item_OverallSDT_Subj <- OverallSDT_Subj %>% filter(Memory == "Item")
AD_OverallSDT_Subj <- OverallSDT_Subj %>% filter(Memory == "AD")

## d' ##
Item_VVIQ_d_prior <-
  prior(normal(1.5, .5), class = "b", coef = "") +
  prior(normal(0, .5), class = "b", coef = "VVIQ_Scores")
#Vividness of Visual Imagery Questionnaire (VVIQ)
Item_OverallSDT_Subj %>% ggplot(aes(x=VVIQ_Scores, y= d)) + xlab("VVIQ Scores") + ylab("d'") + geom_point() + theme_classic() + geom_smooth(method = "lm", color="red", linetype = "dashed", se = TRUE)
cor(Item_OverallSDT_Subj$VVIQ_Scores, Item_OverallSDT_Subj$d) #0.23 correlation
if (!file.exists("SciRep40_VVIQ_d_Item.rda")) {
  Item_VVIQ_d_Item <- brm(d ~ VVIQ_Scores, data = Item_OverallSDT_Subj, family = gaussian(), prior = Item_VVIQ_d_prior, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(Item_VVIQ_d_Item, file = "./SciRep40_VVIQ_d_Item.rda") 
} else {
  load("SciRep40_VVIQ_d_Item.rda")  
}
pp_check(Item_VVIQ_d_Item, ndraws = 40) #Looks like a great fit
summary(Item_VVIQ_d_Item)
mcse(Item_VVIQ_d_Item)
hdi(Item_VVIQ_d_Item, 0.89); ci(Item_VVIQ_d_Item, method = "HDI", ci = 0.89)[2,3];ci(Item_VVIQ_d_Item, method = "HDI", ci = 0.85)[2,4]
pd(Item_VVIQ_d_Item)
plot_model(Item_VVIQ_d_Item, type="pred")
#No apparent association in scatterplot, and no meaningful association in linear model
# 0.01 [-0.00, 0.02]  
# 92.81% pd

# Body Perception Questionnaire - Body Awareness
Item_BA_d_prior <-
  prior(normal(1.5, .5), class = "b", coef = "") +
  prior(normal(0, .5), class = "b", coef = "BA_scores")
Item_OverallSDT_Subj %>% ggplot(aes(x=BA_scores, y= d)) + xlab("Body Awareness Scores") + ylab("d'") + geom_point() + theme_classic() + geom_smooth(method = "lm", color="red", linetype = "dashed", se = TRUE)
cor(Item_OverallSDT_Subj$BA_scores, Item_OverallSDT_Subj$d) #-0.084 correlation
if (!file.exists("SciRep40_BA_d_Item.rda")) {
  BA_Item_d <- brm(d ~ BA_scores, data = Item_OverallSDT_Subj, family = gaussian(), prior = Item_BA_d_prior, iter = 10000, save_pars = save_pars(all = TRUE))
  save(BA_Item_d, file = "./SciRep40_BA_d_Item.rda") 
} else {
  load("SciRep40_BA_d_Item.rda")  
}
pp_check(BA_Item_d, ndraws = 40) #Great fit
print(summary(BA_Item_d),digits=4)
mcse(BA_Item_d)
hdi(BA_Item_d, ci = 0.89); ci(BA_Item_d, method = "HDI", ci = 0.89)[2,3];ci(BA_Item_d, method = "HDI", ci = 0.89)[2,4]
pd(BA_Item_d)
plot_model(BA_Item_d, type="pred")
#No apparent association in scatterplot, and no meaningful association in linear model
# -0.0012 [-0.00, 0.02]  
# 69.33% pd

## c ##
Item_VVIQ_c_prior <-
  prior(normal(0, .5), class = "b", coef = "") +
  prior(normal(0, .5), class = "b", coef = "VVIQ_Scores")
#Vividness of Visual Imagery Questionnaire (VVIQ)
Item_OverallSDT_Subj %>% ggplot(aes(x=VVIQ_Scores, y= c)) + xlab("VVIQ Scores") + ylab("c") + geom_point() + theme_classic() + geom_smooth(method = "lm", color="red", linetype = "dashed", se = TRUE)
cor(Item_OverallSDT_Subj$VVIQ_Scores, Item_OverallSDT_Subj$c) #0.15 correlation
if (!file.exists("SciRep40_VVIQ_c_Item.rda")) {
  VVIQ_c_Item <- brm(c ~ VVIQ_Scores, data = Item_OverallSDT_Subj, family = gaussian(), prior = Item_VVIQ_c_prior, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(VVIQ_c_Item, file = "./SciRep40_VVIQ_c_Item.rda") 
} else {
  load("SciRep40_VVIQ_c_Item.rda")  
}
pp_check(VVIQ_c_Item, ndraws = 40) #Great fit
summary(VVIQ_c_Item);summary(VVIQ_c_Item)[14]
mcse(VVIQ_c_Item)
hdi(VVIQ_c_Item, ci = 0.89); round(ci(VVIQ_c_Item, method = "HDI", ci = 0.89)[2,3], 4);round(ci(VVIQ_c_Item, method = "HDI", ci = 0.89)[2,4],4)
pd(VVIQ_c_Item)
plot_model(VVIQ_c_Item, type="pred")
#No apparent association in scatterplot, and no meaningful association in linear model
# -0.0021 [-0.0015, 0.0058]  
# 82.33% pd

# Body Perception Questionnaire - Body Awareness
Item_BA_c_prior <-
  prior(normal(0, .5), class = "b", coef = "") +
  prior(normal(0, .5), class = "b", coef = "BA_scores")
Item_OverallSDT_Subj %>% ggplot(aes(x=BA_scores, y= c)) + xlab("Body Awareness Scores") + ylab("c") + geom_point() + theme_classic() + geom_smooth(method = "lm", color="red", linetype = "dashed", se = TRUE)
cor(OverallSDT_Subj$BA_scores, OverallSDT_Subj$c) #0.0072 correlation
if (!file.exists("SciRep40_BA_Item.rda")) {
  BA_Item_c <- brm(c ~ BA_scores, data = Item_OverallSDT_Subj, family = gaussian(), iter = 10000, prior= Item_BA_c_prior, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(BA_Item_c, file = "./SciRep40_BA_Item.rda") 
} else {
  load("SciRep40_BA_Item.rda")  
}
pp_check(BA_Item_c, ndraws = 40) #Great fit
print(summary(BA_Item_c),digits=4)
mcse(BA_Item_c)
hdi(BA_Item_c, ci = 0.89); ci(BA_Item_c, method = "HDI", ci = 0.89)[2,3];ci(BA_Item_c, method = "HDI", ci = 0.89)[2,4]
pd(BA_Item_c)
plot_model(BA_Item_c, type="pred")
#No apparent association in scatterplot, and no meaningful association in linear model
# 0.00006 [-0.0011, 0.0023]  
# 72.75% pd

##### Source #####
## d' ##
Src_VVIQ_d_prior <-
  prior(normal(1, .5), class = "b", coef = "") +
  prior(normal(0, .5), class = "b", coef = "VVIQ_Scores")
#Vividness of Visual Imagery Questionnaire (VVIQ)
AD_OverallSDT_Subj %>% ggplot(aes(x=VVIQ_Scores, y= d)) + xlab("VVIQ Scores") + ylab("d'") + geom_point() + theme_classic() + geom_smooth(method = "lm", color="red", linetype = "dashed", se = TRUE)
cor(AD_OverallSDT_Subj$VVIQ_Scores, AD_OverallSDT_Subj$d) #.21 correlation
if (!file.exists("SciRep40_VVIQ_d_Src.rda")) {
  VVIQ_d_Src <- brm(d ~ VVIQ_Scores, data = AD_OverallSDT_Subj, family = gaussian(), prior = Src_VVIQ_d_prior, iter = 10000, save_pars = save_pars(all = TRUE))
  save(VVIQ_d_Src, file = "./SciRep40_VVIQ_d_Src.rda") 
} else {
  load("SciRep40_VVIQ_d_Src.rda")  
}
pp_check(VVIQ_d_Src, ndraws = 40) #Great fit
summary(VVIQ_d_Src)
hdi(VVIQ_d_Src, ci = 0.89); ci(VVIQ_d_Src, method = "HDI", ci = 0.89)[2,3];ci(VVIQ_d_Src, method = "HDI", ci = 0.89)[2,4]
mcse(VVIQ_d_Src)
pd(VVIQ_d_Src)
plot_model(VVIQ_d_Src, type="pred")
#No apprarent associations between VVIQ and sensitivity for source memory
# 0.01 [-0.0023, 0.021]  
# 89.55% pd

# Body Perception Questionnaire - Body Awareness
Src_BA_d_prior <-
  prior(normal(1, .5), class = "b", coef = "") +
  prior(normal(0, .5), class = "b", coef = "BA_scores")
AD_OverallSDT_Subj %>% ggplot(aes(x=BA_scores, y= d)) + xlab("Body Awareness Scores") + ylab("M-Ratio") + geom_point() + theme_classic() + geom_smooth(method = "lm", color="red", linetype = "dashed", se = TRUE)
cor(AD_OverallSDT_Subj$BA_scores, AD_OverallSDT_Subj$d) #-0.027 correlation
if (!file.exists("SciRep40_BA_d_Src.rda")) {
  BA_Src_d <- brm(d ~ BA_scores, data = AD_OverallSDT_Subj, family = gaussian(), prior = Src_BA_d_prior, iter = 10000, save_pars = save_pars(all = TRUE))
  save(BA_Src_d, file = "./SciRep40_BA_d_Src.rda") 
} else {
  load("SciRep40_BA_d_Src.rda")  
}
pp_check(BA_Src_d, ndraws = 40) #Great fit
summary(BA_Src_d)
hdi(BA_Src_d, ci = 0.89);ci(BA_Src_d, method = "HDI", ci = 0.89)[2,3];ci(BA_Src_d, method = "HDI", ci = 0.89)[2,4]
mcse(BA_Src_d)
pd(BA_Src_d)
plot_model(BA_Src_d, type="pred")
#No apparent association in scatterplot, and no meaningful association in linear model
# -0.00 [-0.006, 0.0052]  
# 56.47% pd

## c ##
#Vividness of Visual Imagery Questionnaire (VVIQ)
AD_OverallSDT_Subj %>% ggplot(aes(x=VVIQ_Scores, y= c)) + xlab("VVIQ Scores") + ylab("c") + geom_point() + theme_classic() + geom_smooth(method = "lm", color="red", linetype = "dashed", se = TRUE)
cor(AD_OverallSDT_Subj$VVIQ_Scores, AD_OverallSDT_Subj$c) #.13 correlation
if (!file.exists("SciRep40_VVIQ_c_Src.rda")) {
  VVIQ_c_Src <- brm(c ~ VVIQ_Scores, data = AD_OverallSDT_Subj, family = gaussian(), prior = Item_VVIQ_c_prior, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(VVIQ_c_Src, file = "./SciRep40_VVIQ_c_Src.rda") 
} else {
  load("SciRep40_VVIQ_c_Src.rda")  
}
pp_check(VVIQ_c_Src, ndraws = 40) #Great fit
summary(VVIQ_c_Src)
hdi(VVIQ_c_Src, ci = 0.89);ci(VVIQ_c_Src, method = "HDI", ci = 0.89)[2,3];ci(VVIQ_c_Src, method = "HDI", ci = 0.89)[2,4]
mcse(VVIQ_c_Src)
pd(VVIQ_c_Src)
plot_model(VVIQ_c_Src, type="pred")
#No apprarent associations between VVIQ and sensitivity for source memory
# 0.00 [-0.0009, 0.0024]  
# 77.19% pd

# Body Perception Questionnaire - Body Awareness
AD_OverallSDT_Subj %>% ggplot(aes(x=BA_scores, y= c)) + xlab("Body Awareness Scores") + ylab("M-Ratio") + geom_point() + theme_classic()
cor(AD_OverallSDT_Subj$BA_scores, AD_OverallSDT_Subj$c) #-0.12 correlation
if (!file.exists("SciRep40_BA_c_Src.rda")) {
  BA_Src_c <- brm(c ~ BA_scores, data = AD_OverallSDT_Subj, family = gaussian(), prior = Item_BA_c_prior, iter = 10000, save_pars = save_pars(all = TRUE), control = list(adapt_delta = 0.99))
  save(BA_Src_c, file = "./SciRep40_BA_c_Src.rda") 
} else {
  load("SciRep40_BA_c_Src.rda")  
}
pp_check(BA_Src_c, ndraws = 40) #Great fit
summary(BA_Src_c)
hdi(BA_Src_c, ci = 0.89);ci(BA_Src_c, method = "HDI", ci = 0.89)[2,3];ci(BA_Src_c, method = "HDI", ci = 0.89)[2,4]
mcse(BA_Src_c)
pd(BA_Src_c)
plot_model(BA_Src_c, type="pred")
#No apparent association in scatterplot, and no meaningful association in linear model
# -0.00 [-0.0011, 0.00045]  
# 76.83% pd





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


