<<dd_version: 2>>
####  Taleemabad Evaluation by CERP Analytics

1. Basic Introduction 

2.Summary of results produced by Taleemabad.
* 

3.Analytics by CERP: 

4.Sampling Methodology: Power and standard errors:

5.Balance Tests (ASER, TEACH MELQO):
- Attrition: Table
- Balance Test(s): Tables:  1 for learning outcome vars and other relevant variables

6.Results replications (diff-in-diff) regression at school level to measure treatment effect. (ASER, TEACH MELQO)

7. Other analysis avenues/data visualization(s) to be explored: 


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
	tab matching treatment, m
<</dd_do>>
~~~~

* Balance checks

~~~~
<<dd_do: nocomm>>
	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	orth_out a13_age_b - a13_aser_b_gk_pic_3_per, by(treatment) test
	orth_out a13_age_e - a13_aser_e_gk_pic_3_per, by(treatment) test
	
	orth_out melqo_b_ev_edible_num_per - melqo_b_ms_shape3_per, by(treatment) test
	orth_out melqo_e_ev_edible_num_per - melqo_e_ms_shape3_per, by(treatment) test
	
	orth_out age_b - aser_b_m_g1_3_minus_2dig_per aser_b_m_5digit_nums_per - aser_b_gk_pic_3_per, by(treatment) test
	orth_out age_e - aser_e_e_g1_3_small_per aser_e_u_story_flue_per - aser_e_m_g1_3_minus_2dig_per aser_e_m_5digit_nums_per - aser_e_gk_pic_3_per, by(treatment) test
	
<</dd_do>>
~~~~
