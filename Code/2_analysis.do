<<dd_version: 2>>
##  Taleemabad Evaluation by CERP Analytics

### Table of contents

1. Introduction
2. Taleemabad's Evaluation [Add from Taleemabad's Executive summary]  
2.1. Instrument and Data Collection  
2.2. Sampling and Measurement  
2.3. Summary of Results  
	2.3.1. ASER Grades 1 - 3  
	2.3.2. ASER Grades 4 - 5  
	2.3.3. MELQO  
3. Analytics by CERP  
3.1. School level Master Dataset and Variables (Cleaning raw datasets, Raw datasets to one master dataset at School level, Treatment Variable, Matching variable)  
3.2. Balance Test  
3.3. Results (with graphs)  
	3.3.1. ASER Grades 1 - 3  
	3.3.2. ASER Grades 4 - 5  
	3.3.3. MELQO  
4. Conclusion  

**1. Introduction**

**2. Taleemabad's Evaluation**

**2.1. Instrument and Data Collection**
  
**2.2. Sampling and Measurement**
  
**2.3. Summary of Results**

**2.3.1. Grades 1-3:**	

50.7% of all Taleemabad students meet the criteria for all 3 subjects compared to 29.4% of control students at endline. This represents a difference of 0.46 standard deviations compared to the control group (1.58 LAYS). During baseline, the difference between Taleemabad and control students is statistically insignificant from zero for English and Mathematics. For Urdu, however, the difference was -13.6% between Taleemabad and control. At the endline, the difference between Taleemabad and control schools rises to 22.9% for English and 14.6% for Urdu (both significant at 5% level). For Mathematics, however, the difference is -2.9% (i.e. in favor of control schools, significant at 5% level). 

**2.3.2. Grades 4-5:**	

7.2% of all Taleemabad students meet the criteria for all 3 subjects compared to 6.2% of control students at endline. This represents a difference of 0.05 standard deviations compared to the control group (0.4 LAYS). During baseline, the difference between Taleemabad and control students is statistically insignificant from zero for English and Mathematics. For Urdu, however, the difference was -8.7% between Taleemabad and control, meaning that control schools were at a higher level than intervention schools. At the endline, the difference between Taleemabad and control schools rises to 3.6% for English, 1.5% for Mathematics and 2.2% for Urdu (all significant at 5% level). 

**2.3.3. MELQO:**	

At baseline, Taleemabad schools outperformed control schools by ~6 percent of overall score in pre-numeracy but lagged behind control schools in pre-literacy and motor skills by 0.35% and 1.58% respectively. At the endline, the difference between Taleemabad and control schools reduced to ~4% in pre-numeracy whereas Taleemabad schools performed better than control schools in pre-literacy and motor skills by 1.6% and 3.4% respectively. These results are statistically significant at the 5% level. 

**3. Analytics by CERP:** 
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

**3.1. School level Master Dataset and Variables (Cleaning raw datasets, Raw datasets to one master dataset at School level, Treatment Variable, Matching variable)** 

~~~~
<<dd_do: nocomm>>
	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta", clear
	tab matching treatment, m
<</dd_do>>
~~~~

**3.2. Balance Test (Orth_out at baseline and Control) - Results and Graphs**  
Treatment and Control Mean at baseline and endline
~~~~
<<dd_do: nocomm>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	orth_out aser_b_english_Sentence aser_e_english_Sentence aser_b_math_Subtract aser_e_math_Subtract aser_b_urdu_Story aser_e_urdu_Story, by(treatment)
	
	orth_out aser_b_eng_4_5_G5Sentence aser_e_eng_4_5_G5Sentence aser_b_maths_4_5_Division aser_e_maths_4_5_Division aser_b_urdu_4_5_G5Story aser_e_urdu_4_5_G5Story, by(treatment)
	
<</dd_do>>
~~~~

**3.3. Results (with graphs)**  
difference in treatment and control at baseline and endline, and testing whether diff is statistically significant  

**3.3.1. ASER Grades 1 - 3**  

~~~~
<<dd_do: quietly>>
	* English
	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "aser_b_english_Sentence"
	local var_e "aser_e_english_Sentence"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.2)
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'),0.2)
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.2)
	orth_out `a' `b', by(treatment) compare test
	}
<</dd_do>>
~~~~

At baseline, the percentage difference between treatment and control schools for English is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control schools for English is <<dd_display: "`diff_endline'">>% which is statistically significant at 5%. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for English at endline. 

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "aser_b_math_Subtract"
	local var_e "aser_e_math_Subtract"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.4)
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'),0.2)
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.4)
	orth_out `a' `b', by(treatment) compare test
	}
<</dd_do>>
~~~~

At baseline, the percentage difference between treatment and control schools for Maths is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control schools for Maths is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. 

* Urdu
~~~~
<<dd_do: nocomm>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "aser_b_urdu_Story"
	local var_e "aser_e_urdu_Story"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	

	orth_out `a' `b', by(treatment) test
	
	qui summarize `a' if treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = ( `mean_treat_baseline' - `mean_control_baseline' )
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = ( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'
	local diff_endline = ( `mean_treat_endline' - `mean_control_endline' )
	}
<</dd_do>>
~~~~

**3.3.2. ASER Grades 4 - 5**  

*  English
~~~~
<<dd_do: nocomm>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "aser_b_eng_4_5_G5Sentence"
	local var_e "aser_e_eng_4_5_G5Sentence"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	

	orth_out `a' `b', by(treatment) test
	
	qui summarize `a' if treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = ( `mean_treat_baseline' - `mean_control_baseline' )
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = ( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'
	local diff_endline = ( `mean_treat_endline' - `mean_control_endline' )
	
	}
	
<</dd_do>>
~~~~
 
*  Maths
~~~~
<<dd_do: nocomm>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "aser_b_maths_4_5_Division"
	local var_e "aser_e_maths_4_5_Division"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	

	orth_out `a' `b', by(treatment) test
	
	qui summarize `a' if treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = ( `mean_treat_baseline' - `mean_control_baseline' )
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = ( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'
	local diff_endline = ( `mean_treat_endline' - `mean_control_endline' )
	
	}
	
<</dd_do>>
~~~~

*  Urdu
~~~~
<<dd_do: nocomm>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "aser_b_urdu_4_5_G5Story"
	local var_e "aser_e_urdu_4_5_G5Story"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	

	orth_out `a' `b', by(treatment) test
	
	qui summarize `a' if treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = ( `mean_treat_baseline' - `mean_control_baseline' )
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = ( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'
	local diff_endline = ( `mean_treat_endline' - `mean_control_endline' )
	
	}
	
<</dd_do>>
~~~~

**3.3.3. MELQO**  

**4. Conclusion**  

