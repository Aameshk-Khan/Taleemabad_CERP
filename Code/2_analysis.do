<<dd_version: 2>>
##  Taleemabad Evaluation by CERP Analytics

## Table of contents

1. Basic Introduction
1. Summary of results produced by Taleemabad
1. Analytics by CERP
1. Sampling methodology
1. Balance tests
1. Taleemabad results replication

### 1. Basic Introduction

### 2. Summary of results produced by Taleemabad

* 2.1. Grades 1-3:	

50.7% of all Taleemabad students meet the criteria for all 3 subjects compared to 29.4% of control students at endline. This represents a difference of 0.46 standard deviations compared to the control group (1.58 LAYS). During baseline, the difference between Taleemabad and control students is statistically insignificant from zero for English and Mathematics. For Urdu, however, the difference was -13.6% between Taleemabad and control. At the endline, the difference between Taleemabad and control schools rises to 22.9% for English and 14.6% for Urdu (both significant at 5% level). For Mathematics, however, the difference is -2.9% (i.e. in favor of control schools, significant at 5% level). 

* 2.2. Grades 4-5:	

7.2% of all Taleemabad students meet the criteria for all 3 subjects compared to 6.2% of control students at endline. This represents a difference of 0.05 standard deviations compared to the control group (0.4 LAYS). During baseline, the difference between Taleemabad and control students is statistically insignificant from zero for English and Mathematics. For Urdu, however, the difference was -8.7% between Taleemabad and control, meaning that control schools were at a higher level than intervention schools. At the endline, the difference between Taleemabad and control schools rises to 3.6% for English, 1.5% for Mathematics and 2.2% for Urdu (all significant at 5% level). 

* 2.3. MELQO:	

At baseline, Taleemabad schools outperformed control schools by ~6 percent of overall score in pre-numeracy but lagged behind control schools in pre-literacy and motor skills by 0.35% and 1.58% respectively. At the endline, the difference between Taleemabad and control schools reduced to ~4% in pre-numeracy whereas Taleemabad schools performed better than control schools in pre-literacy and motor skills by 1.6% and 3.4% respectively. These results are statistically significant at the 5% level. 

### 3. Analytics by CERP: 

### 4. Sampling Methodology: Power and standard errors:

### 5. Balance Tests (ASER, TEACH MELQO):
* 5.1. Attrition: Table
* 5.2. Balance Test(s): Tables:  1 for learning outcome vars and other relevant variables

### 6. Results replications (diff-in-diff) regression at school level to measure treatment effect. (ASER, TEACH MELQO)

### 7. Other analysis avenues/data visualization(s) to be explored: 


~~~~
<<dd_do: quietly>>
clear all
set more off

********************************************************************************

* Set file paths:

	    * Ahmed Raza
		else if c(username) == "ahmed" { 
		global user = "/Users/ahmed"
		global drive = "Library/CloudStorage/GoogleDrive-ahmed.raza@barcelonagse.eu/.shortcut-targets-by-id/1MDY68dfsRcWNPsIU7o-9I2kR2msO-7bk"
		global folder = "[Internal] CERP - Taleemabad  "
		}
		  
		* Aameshk Khan  
		else if c(username) == "aameshkkhan" { 
		global user = "/Users/aameshkkhan"
		global drive = "Library/CloudStorage/GoogleDrive-aameshk.khan@cerp.org.pk/.shortcut-targets-by-id/1MDY68dfsRcWNPsIU7o-9I2kR2msO-7bk"
		global folder = "[Internal] CERP - Taleemabad  "
		  }
<</dd_do>>
~~~~

* Looking at the frequency of schools that were in baseline and endline (Consistent), schools which were only in baseline (Attrition) and schools which were only in endline (Replacement).
~~~~
<<dd_do: nocomm>>
	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta", clear
	tab matching, m
<</dd_do>>
~~~~

~~~~
<<dd_do: nocomm>>
	tab treatment matching, m
<</dd_do>>
~~~~

* Balance checks

~~~~
<<dd_do: nocomm>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	orth_out aser_b_english_Nothing - aser_b_urdu_Words aser_b_eng_4_5_Nothing - aser_b_urdu_4_5_G5Story, by(b_treatment)
	orth_out aser_e_english_Nothing - aser_e_urdu_Words aser_e_eng_4_5_Nothing - aser_e_urdu_4_5_G5Story, by(e_treatment)
	
	orth_out melqo_b_ev_edible_num_per - sd_melqo_b_ms_shape3_per, by(b_treatment)
	orth_out melqo_e_ev_edible_num_per - sd_melqo_e_ms_shape3_per, by(e_treatment)
	
<</dd_do>>
~~~~
