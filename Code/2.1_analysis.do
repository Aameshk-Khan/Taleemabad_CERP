<<dd_version: 2>>
<div style="text-align:justify;">  

<div style="text-align: center;">
   <span style="color: black; font-size: 25px; font-weight: bold;">Child Level Analysis</span> 
</div>  

<br>
    
<style>
  figure {
    text-align: center; /* Center-align the figure */
    margin: 20px 0; /* Add margin for spacing */
  }

  img {
    max-width: 100%; /* Make sure the image doesn't exceed its container */
    height: auto; /* Maintain the aspect ratio */
    display: block; /* Remove any extra space below the image */
    margin: 0 auto; /* Center-align the image within the figure */
  }

  figcaption {
    margin-top: 1px; /* Add space between the image and the caption */
	font-style: italic; /* Make the caption italic */
    font-size: 13.5px; /* Set the font size to 10 pixels */
  }
</style>

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
		  
		use "$user/$drive/$folder/Output/Stata/ASER_1_3_Baseline_Cleaned.dta", clear  
		keep  school_name type gender grade aser_b_english_Nothing - aser_b_urdu_Words endlinestatus
		tempfile ASER_1_3_baseline
        save `ASER_1_3_baseline', replace

<</dd_do>>
~~~~   
**Full sample**  
**ASER Grades 1 - 3**  
<figure>
    <img src="ASER Child 1_3.png" alt="tab1" width="600"/>
  <figcaption>Figure 1: % Difference in Grade Threshold Clearing Between Treatment and Control Students at Baseline and Endline using ASER Grades 1 - 3 instrument</figcaption>
</figure>  
~~~~
<<dd_do: quietly>>
 
		use "$user/$drive/$folder/Output/Stata/ASER_1_3_Baseline_Cleaned.dta", clear  
		keep  school_name type gender aser_b_english_Nothing - aser_b_urdu_Words endlinestatus
		gen b_treatment = 1 if type == "Experimental"
	    replace b_treatment = 0 if type == "Controlled"
		
		tempfile ASER_1_3_baseline
        save `ASER_1_3_baseline', replace
		
		use "$user/$drive/$folder/Output/Stata/ASER_1_3_Endline_Cleaned.dta", clear
		keep  school_name type gender aser_e_english_Nothing - aser_e_urdu_Words 
		gen e_treatment = 1 if type == "Experimental"
		replace e_treatment = 0 if type == "Controlled"
		
		gen aser_e_1_3_overall = 1 if aser_e_english_Sentence == 1 & aser_e_math_Subtract == 1 &  aser_e_urdu_Story ==1 
	    replace aser_e_1_3_overall = 0 if aser_e_1_3_overall == .

		tempfile ASER_1_3_endline
        save `ASER_1_3_endline', replace
		
		append using `ASER_1_3_baseline', generate(filenum) 
		
		order school_name type b_treatment e_treatment gender filenum endlinestatus aser_b_english_Nothing - aser_b_urdu_Words aser_e_english_Nothing aser_e_urdu_Words

		* Converting the dummy categorical variables to percentages
	foreach var of varlist aser_b_english_Nothing - aser_b_urdu_Words aser_e_english_Nothing - aser_e_urdu_Words aser_e_1_3_overall{
		replace `var' = `var' * 100
	}
		lab def file 0 "endline" 1 "baseline"
		lab val filenum file
		
		tempfile ASER_1_3_child
        save `ASER_1_3_child', replace
		save "$user/$drive/$folder/Output/Stata/ASER_1_3_Child.dta",replace

<</dd_do>>
~~~~   
~~~~
<<dd_do: quietly>>
	use"$user/$drive/$folder/Output/Stata/ASER_1_3_Child.dta",clear
	
	local var_b "aser_e_1_3_overall"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	
	qui summarize `a' if e_treatment == 0, detail
	local mean_control = round(r(mean),0.01)
	local sd_control = r(sd)

	qui summarize `a' if e_treatment == 1, detail
	local mean_treat = round(r(mean),0.01)

	* Calculate the difference at baseline
	local diff_std = round((( `mean_treat' - `mean_control' ) / `sd_control'), 0.01)
	local diff = round(( `mean_treat' - `mean_control' ),0.01)

	orth_out `a', by(e_treatment) compare test count
	
	* LAYS
	local LAYS = round((`diff_std' / 0.13),0.01)
	}
<</dd_do>>
~~~~
At endline, <<dd_display: "`mean_treat'">>% of treatment students met the criteria for all 3 subjects compared to <<dd_display: ".94">>% of control students. This represents a difference of <<dd_display: "`diff_std'">> standard deviations compared to the control students, which is equivalent to <<dd_display: "`LAYS'">> LAYS.  
~~~~
<<dd_do: quietly>>
	use"$user/$drive/$folder/Output/Stata/ASER_1_3_Child.dta",clear
	
	local var_b "aser_b_english_Sentence"
	local var_e "aser_e_english_Sentence"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	di "`diff_baseline'"
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'),0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	di "`diff_endline'"
	
	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for English is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control students for English is <<dd_display: "`diff_endline'">>% which is statistically significant at 5%. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for English at endline.  
~~~~
<<dd_do: quietly>>

	use"$user/$drive/$folder/Output/Stata/ASER_1_3_Child.dta",clear
	
	local var_b "aser_b_math_Subtract"
	local var_e "aser_e_math_Subtract"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	
	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for Maths is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control students for Maths is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for Maths at endline.  
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/ASER_1_3_Child.dta",clear
	
	local var_b "aser_b_urdu_Story"
	local var_e "aser_e_urdu_Story"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' )* 1000)/1000
	
	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
<</dd_do>>
~~~~  
At baseline, the percentage difference between treatment and control students for Urdu is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control students for Urdu is <<dd_display: "8.26">>% which is statistically significant at the 5% level. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for Urdu at endline.   

**ASER Grades 4 - 5**  
<figure>
    <img src="ASER Child 4_5.png" alt="tab1" width="600"/>
  <figcaption>Figure 2: % Difference in Grade Threshold Clearing Between Treatment and Control Students at Baseline and Endline using ASER Grades 4 - 5 instrument</figcaption>  
</figure>  
~~~~
<<dd_do: quietly>>
 
		use "$user/$drive/$folder/Output/Stata/ASER_4_5_Baseline_Cleaned.dta", clear  
		keep  school_name type gender aser_b_eng_4_5_Nothing - aser_b_urdu_4_5_G5Story endlinestatus
		gen b_treatment = 1 if type == "Experimental"
	    replace b_treatment = 0 if type == "Controlled"
		
		tempfile ASER_4_5_baseline
        save `ASER_4_5_baseline', replace
		
		use "$user/$drive/$folder/Output/Stata/ASER_4_5_Endline_Cleaned.dta", clear
		keep  school_name type gender aser_e_eng_4_5_Nothing - aser_e_urdu_4_5_G5Story
		gen e_treatment = 1 if type == "Experimental"
		replace e_treatment = 0 if type == "Controlled"
		
		gen aser_e_4_5_overall = 1 if aser_e_eng_4_5_G5Sentence ==1 & aser_e_maths_4_5_Division == 1 & aser_e_urdu_4_5_G5Story == 1
		replace aser_e_4_5_overall = 0 if aser_e_4_5_overall == .

		tempfile ASER_4_5_endline
        save `ASER_4_5_endline', replace
		
		append using `ASER_4_5_baseline', generate(filenum) 
		
		order school_name type b_treatment e_treatment gender filenum 

		* Converting the dummy categorical variables to percentages
		foreach var of varlist aser_b_eng_4_5_Nothing - aser_b_urdu_4_5_G5Story aser_e_eng_4_5_Nothing - aser_e_urdu_4_5_G5Story aser_e_4_5_overall{
		replace `var' = `var' * 100
		}
		
		lab def file 0 "endline" 1 "baseline"
		lab val filenum file
		
		tempfile ASER_4_5_child
        save `ASER_4_5_child', replace
		save "$user/$drive/$folder/Output/Stata/ASER_4_5_Child.dta",replace

<</dd_do>>
~~~~ 
~~~~
<<dd_do: quietly>>
	use "$user/$drive/$folder/Output/Stata/ASER_4_5_Child.dta", clear
	
	local var_b "aser_e_4_5_overall"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	
	qui summarize `a' if e_treatment == 0, detail
	local mean_control = round(r(mean),0.01)
	local sd_control = r(sd)

	qui summarize `a' if e_treatment == 1, detail
	local mean_treat = round(r(mean), 0.01)

	* Calculate the difference at baseline
	local diff_std = round((( `mean_treat' - `mean_control' ) / `sd_control'),0.01)
	local diff = round(( `mean_treat' - `mean_control' ),0.01)

	orth_out `a', by(e_treatment) compare test count
	
	* LAYS
	local LAYS = round((`diff_std' / 0.130),0.01)
	}
<</dd_do>>
~~~~
At endline, <<dd_display: "`mean_treat'">>% of treatment students met the criteria for all 3 subjects compared to <<dd_display: "`mean_control'">>% of control students. This represents a difference of <<dd_display: "`diff_std'">> standard deviations compared to the control students, which is equivalent to <<dd_display: "`LAYS'">> LAYS.  
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/ASER_4_5_Child.dta", clear
	
	local var_b "aser_b_eng_4_5_G5Sentence"
	local var_e "aser_e_eng_4_5_G5Sentence"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)

	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
	
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for English is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control students for English is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for English at endline.   
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/ASER_4_5_Child.dta", clear
	
	local var_b "aser_b_maths_4_5_Division"
	local var_e "aser_e_maths_4_5_Division"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)

	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for Maths is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control students for Maths is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for Maths at endline. 

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/ASER_4_5_Child.dta", clear
	
	local var_b "aser_b_urdu_4_5_G5Story"
	local var_e "aser_e_urdu_4_5_G5Story"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)

	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
	
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for Urdu is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control students for Urdu is <<dd_display: "`diff_endline'">>% which is statistically significant at the 5% level. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for Urdu at endline.  

**MELQO**  
<figure>
    <img src="MELQO Child.png" alt="tab1" width="600"/>
  <figcaption>Figure 3: % Difference in Scores between Treatment and Control Students at Baseline and Endline using MELQO</figcaption>
</figure>  
~~~~
<<dd_do: quietly>>
 
		use "$user/$drive/$folder/Output/Stata/MELQO_Baseline_Cleaned", clear
		keep melqo_b_pre_literacy melqo_b_pre_numeracy melqo_b_motor_skills school_name endlinestatus type gender
		gen b_treatment = 1 if type == "Experimental"
	    replace b_treatment = 0 if type == "Controlled"
		
		tempfile MELQO_baseline
        save `MELQO_baseline', replace
		
		use "$user/$drive/$folder/Output/Stata/MELQO_Endline_Cleaned", clear
		keep melqo_e_pre_literacy melqo_e_pre_numeracy melqo_e_motor_skills school_name type gender
		gen e_treatment = 1 if type == "Experimental"
		replace e_treatment = 0 if type == "Controlled"
		
		tempfile MELQO_endline
        save `MELQO_endline', replace
		
		append using `MELQO_baseline', generate(filenum) 
		
		order school_name type b_treatment e_treatment gender filenum 
		
		lab def file 0 "endline" 1 "baseline"
		lab val filenum file
		
		tempfile MELQO_child
        save `MELQO_child', replace
		save "$user/$drive/$folder/Output/Stata/MELQO_Child.dta",replace

<</dd_do>>
~~~~ 
 
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MELQO_Child.dta", clear
	
	local var_b "melqo_b_pre_literacy"
	local var_e "melqo_e_pre_literacy"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.05)
	di "`diff_endline'"
	
	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for pre-literacy is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control students for pre-literacy is <<dd_display: "`diff_endline'">>% which is statistically significant at the 5% level. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for pre-literacy at endline.  

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MELQO_Child.dta", clear
	
	local var_b "melqo_b_pre_numeracy"
	local var_e "melqo_e_pre_numeracy"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	
	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for pre-numeracy is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control students for pre-numeracy is <<dd_display: "`diff_endline'">>% which is statistically significant at the 5% level. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for pre-numeracy at endline.  

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MELQO_Child.dta", clear
	
	local var_b "melqo_b_motor_skills"
	local var_e "melqo_e_motor_skills"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	
	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count
	
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for motor skills is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control students for motor skills is <<dd_display: "`diff_endline'">>% which is statistically significant at the 5% level. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for motor skills at endline.  

**Truncated sample**  
**ASER Grades 1 - 3**    
<figure>
    <img src="ASER Child 1_3_truncated.png" alt="tab1" width="600"/>
  <figcaption>Figure 4: % Difference in Grade Threshold Clearing Between Treatment and Control Students at Baseline and Endline using ASER Grades 1 - 3 instrument</figcaption>
</figure> 
~~~~
<<dd_do: quietly>>
	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta",clear
	keep school_name matching
	
	tempfile SchoolLevel_variables
    save `SchoolLevel_variables', replace

	use"$user/$drive/$folder/Output/Stata/ASER_1_3_Child.dta",clear
	merge m:1 school_name using `SchoolLevel_variables', gen(m1)
	drop m1
	keep if matching == 3
	
	local var_b "aser_e_1_3_overall"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	
	qui summarize `a' if e_treatment == 0, detail
	local mean_control = round(r(mean),0.01)
	local sd_control = r(sd)

	qui summarize `a' if e_treatment == 1, detail
	local mean_treat = round(r(mean),0.01)

	* Calculate the difference at baseline
	local diff_std = round((( `mean_treat' - `mean_control' ) / `sd_control'), 0.01)
	local diff = round(( `mean_treat' - `mean_control' ),0.01)

	orth_out `a', by(e_treatment) compare test count
	
	* LAYS
	local LAYS = round((`diff_std' / 0.13),0.01)
	}
<</dd_do>>
~~~~
At endline, <<dd_display: "`mean_treat'">>% of treatment students met the criteria for all 3 subjects compared to <<dd_display: "`mean_control'">>% of control students. This represents a difference of <<dd_display: "`diff_std'">> standard deviations compared to the control students, which is equivalent to <<dd_display: "`LAYS'">> LAYS.  
~~~~
<<dd_do: quietly>>
	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta",clear
	keep school_name matching
	
	tempfile SchoolLevel_variables
    save `SchoolLevel_variables', replace

	use"$user/$drive/$folder/Output/Stata/ASER_1_3_Child.dta",clear
	merge m:1 school_name using `SchoolLevel_variables', gen(m1)
	drop m1
	keep if matching == 3
	
	local var_b "aser_b_english_Sentence"
	local var_e "aser_e_english_Sentence"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	di "`diff_baseline'"
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'),0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	di "`diff_endline'"
	
	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for English is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control students for English is <<dd_display: "`diff_endline'">>% which is statistically significant at 5%. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for English at endline.  
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta",clear
	keep school_name matching
	
	tempfile SchoolLevel_variables
    save `SchoolLevel_variables', replace

	use"$user/$drive/$folder/Output/Stata/ASER_1_3_Child.dta",clear
	merge m:1 school_name using `SchoolLevel_variables', gen(m1)
	drop m1
	keep if matching == 3
	
	local var_b "aser_b_math_Subtract"
	local var_e "aser_e_math_Subtract"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	
	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for Maths is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control students for Maths is <<dd_display: "`diff_endline'">>% which is statistically significant at the 5% level. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for Maths at endline.  
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta",clear
	keep school_name matching
	
	tempfile SchoolLevel_variables
    save `SchoolLevel_variables', replace

	use"$user/$drive/$folder/Output/Stata/ASER_1_3_Child.dta",clear
	merge m:1 school_name using `SchoolLevel_variables', gen(m1)
	drop m1
	keep if matching == 3
	
	local var_b "aser_b_urdu_Story"
	local var_e "aser_e_urdu_Story"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	di "`diff_endline'"
	
	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
<</dd_do>>
~~~~  
At baseline, the percentage difference between treatment and control students for Urdu is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control students for Urdu is <<dd_display: "`diff_endline'">>% which is statistically significant at the 5% level. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for Urdu at endline.   

**ASER Grades 4 - 5**  
<figure>
    <img src="ASER Child 4_5_truncated.png" alt="tab1" width="600"/>
  <figcaption>Figure 5: % Difference in Grade Threshold Clearing Between Treatment and Control Students at Baseline and Endline using ASER Grades 4 - 5 instrument</figcaption>
</figure>
~~~~
<<dd_do: quietly>>
	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta",clear
	keep school_name matching
	
	tempfile SchoolLevel_variables
    save `SchoolLevel_variables', replace

	use "$user/$drive/$folder/Output/Stata/ASER_4_5_Child.dta", clear
	merge m:1 school_name using `SchoolLevel_variables', gen(m1)
	drop m1
	keep if matching == 3
	
	local var_b "aser_e_4_5_overall"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	
	qui summarize `a' if e_treatment == 0, detail
	local mean_control = round(r(mean),0.01)
	local sd_control = r(sd)

	qui summarize `a' if e_treatment == 1, detail
	local mean_treat = round(r(mean), 0.01)

	* Calculate the difference at baseline
	local diff_std = round((( `mean_treat' - `mean_control' ) / `sd_control'),0.01)
	local diff = round(( `mean_treat' - `mean_control' ),0.01)

	orth_out `a', by(e_treatment) compare test count
	
	* LAYS
	local LAYS = round((`diff_std' / 0.130),0.01)
	}
<</dd_do>>
~~~~
At endline, <<dd_display: "`mean_treat'">>% of treatment students met the criteria for all 3 subjects compared to <<dd_display: "`mean_control'">>% of control students. This represents a difference of <<dd_display: "`diff_std'">> standard deviations compared to the control students, which is equivalent to <<dd_display: "`LAYS'">> LAYS.  
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta",clear
	keep school_name matching
	
	tempfile SchoolLevel_variables
    save `SchoolLevel_variables', replace

	use "$user/$drive/$folder/Output/Stata/ASER_4_5_Child.dta", clear
	merge m:1 school_name using `SchoolLevel_variables', gen(m1)
	drop m1
	keep if matching == 3
	
	local var_b "aser_b_eng_4_5_G5Sentence"
	local var_e "aser_e_eng_4_5_G5Sentence"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)

	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
	
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for English is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control students for English is <<dd_display: "`diff_endline'">>% which is statistically significant at the 5% level. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for English at endline.   
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta",clear
	keep school_name matching
	
	tempfile SchoolLevel_variables
    save `SchoolLevel_variables', replace

	use "$user/$drive/$folder/Output/Stata/ASER_4_5_Child.dta", clear
	merge m:1 school_name using `SchoolLevel_variables', gen(m1)
	drop m1
	keep if matching == 3
	
	local var_b "aser_b_maths_4_5_Division"
	local var_e "aser_e_maths_4_5_Division"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)

	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for Maths is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control students for Maths is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for Maths at endline. 

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta",clear
	keep school_name matching
	
	tempfile SchoolLevel_variables
    save `SchoolLevel_variables', replace

	use "$user/$drive/$folder/Output/Stata/ASER_4_5_Child.dta", clear
	merge m:1 school_name using `SchoolLevel_variables', gen(m1)
	drop m1
	keep if matching == 3
	
	local var_b "aser_b_urdu_4_5_G5Story"
	local var_e "aser_e_urdu_4_5_G5Story"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)

	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
	
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for Urdu is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control students for Urdu is <<dd_display: "`diff_endline'">>% which is statistically significant at the 5% level. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for Urdu at endline.  

**MELQO**
<figure>
    <img src="MELQO Child truncated.png" alt="tab1" width="600"/>
  <figcaption>Figure 6: % Difference in Scores between Treatment and Control Students at Baseline and Endline using MELQO</figcaption>
</figure>
~~~~
<<dd_do: quietly>>
	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta",clear
	keep school_name matching
	
	tempfile SchoolLevel_variables
    save `SchoolLevel_variables', replace

	use "$user/$drive/$folder/Output/Stata/MELQO_Child.dta", clear
	merge m:1 school_name using `SchoolLevel_variables', gen(m1)
	drop m1
	keep if matching == 3
		
	local var_b "melqo_b_pre_literacy"
	local var_e "melqo_e_pre_literacy"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	di "`diff_endline'"
	
	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for pre-literacy is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control students for pre-literacy is <<dd_display: "`diff_endline'">>% which is statistically significant at the 5% level. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for pre-literacy at endline.  

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta",clear
	keep school_name matching
	
	tempfile SchoolLevel_variables
    save `SchoolLevel_variables', replace

	use "$user/$drive/$folder/Output/Stata/MELQO_Child.dta", clear
	merge m:1 school_name using `SchoolLevel_variables', gen(m1)
	drop m1
	keep if matching == 3
	
	local var_b "melqo_b_pre_numeracy"
	local var_e "melqo_e_pre_numeracy"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	
	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count

	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for pre-numeracy is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control students for pre-numeracy is <<dd_display: "`diff_endline'">>% which is statistically significant at the 5% level. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for pre-numeracy at endline.  

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta",clear
	keep school_name matching
	
	tempfile SchoolLevel_variables
    save `SchoolLevel_variables', replace

	use "$user/$drive/$folder/Output/Stata/MELQO_Child.dta", clear
	merge m:1 school_name using `SchoolLevel_variables', gen(m1)
	drop m1
	keep if matching == 3
	
	local var_b "melqo_b_motor_skills"
	local var_e "melqo_e_motor_skills"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	local b : word `i' of `var_e'	
	
	qui summarize `a' if b_treatment == 0, detail
	local mean_control_baseline = r(mean)
	local sd_control_baseline = r(sd)

	qui summarize `a' if b_treatment == 1, detail
	local mean_treat_baseline = r(mean)

	* Calculate the difference at baseline
	local diff_baseline_std = ( `mean_treat_baseline' - `mean_control_baseline' ) / `sd_control_baseline'
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if e_treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if e_treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.01)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	di "`diff_endline'"
	
	orth_out `a', by(b_treatment) compare test count
	orth_out `b', by(e_treatment) compare test count
	
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control students for motor skills is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control students for motor skills is <<dd_display: "9.14">>% which is statistically significant at the 5% level. Expressed in standard deviations, treatment students are <<dd_display: "`diff_endline_std'">> standard deviations above control students for motor skills at endline.  



