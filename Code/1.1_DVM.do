* Purpose: Data verification checks and Merging.
* Author(s): Aameshk
* Date: 20th Oct 2023

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
		    
********************************************************************************
{ // ASER (1-3)
* ASER - BASELINE (1-3) Cleaned:
use "$user/$drive/$folder/Output/Stata/ASER_1_3_Baseline_Cleaned", clear

* Generating a school-level dataset
	gen b_treatment = 1 if type == "Experimental"
	replace b_treatment = 0 if type == "Controlled"
	foreach var of varlist aser_b_e_capital_per - aser_b_gk_pic_3_per {
		gen sd_`var' = `var'
	}
	collapse (mean) aser_b_e_capital_per - aser_b_gk_pic_3_per b_treatment (sd) sd_aser_b_e_capital_per - sd_aser_b_gk_pic_3_per (mean) aser_b_english_Nothing - aser_b_urdu_Words, by(school_name)
	tempfile ASER_1_3_Baseline_School_level
	save `ASER_1_3_Baseline_School_level', replace
	
* ASER - ENDLINE (1-3) Cleaned:
use "$user/$drive/$folder/Output/Stata/ASER_1_3_Endline_Cleaned", clear

* Generating a school-level dataset
	gen e_treatment = 1 if type == "Experimental"
	replace e_treatment = 0 if type == "Controlled"
	foreach var of varlist aser_e_e_capital_per - aser_e_gk_pic_3_per {
		gen sd_`var' = `var'
	}
	collapse (mean)  aser_e_e_capital_per - aser_e_gk_pic_3_per e_treatment (sd)  sd_aser_e_e_capital_per - sd_aser_e_gk_pic_3_per (mean) aser_e_english_Nothing - aser_e_urdu_Words, by(school_name)
	tempfile ASER_1_3_Endline_School_level
	save `ASER_1_3_Endline_School_level', replace
	
* Merging ASER 1-3 Endline and Baseline
	use `ASER_1_3_Baseline_School_level', clear
	merge 1:1 school_name using `ASER_1_3_Endline_School_level', gen(m1) 
	/*

    Result                           # of obs.
    -----------------------------------------
    not matched                            43
        from master                        11  (m1==1)
        from using                         32  (m1==2)

    matched                                39  (m1==3)
    -----------------------------------------
	*/
	gen matching = 1 if m1 == 1
	replace matching = 2 if m1 == 2
	replace matching = 3 if m1 == 3
	lab def match 1 "Attrition" 2 "Replacement" 3 "Consistent"
	lab val matching match
	drop m1
	
* Converting the dummy categorical variables to percentages
	foreach var of varlist aser_b_english_Nothing - aser_b_urdu_Words aser_e_english_Nothing - aser_e_urdu_Words {
		replace `var' = `var' * 100
	}

	tab matching, m
	order school_name b_treatment e_treatment matching
	tempfile ASER_1_3_School_level
	save `ASER_1_3_School_level', replace
	}
********************************************************************************
{ // ASER (4-5)
* ASER - BASELINE (4-5) Cleaned:
use "$user/$drive/$folder/Output/Stata/ASER_4_5_Baseline_Cleaned", clear

* Generating a school-level dataset
	gen b_treatment = 1 if type == "Experimental"
	replace b_treatment = 0 if type == "Controlled"
	foreach var of varlist  aser_b_e_sent_per - aser_b_gk_pic_3_per {
		gen sd_`var' = `var'
	}
	collapse (mean)  aser_b_e_sent_per - aser_b_gk_pic_3_per b_treatment (sd)  sd_aser_b_e_sent_per - sd_aser_b_gk_pic_3_per (mean) aser_b_eng_4_5_Nothing - aser_b_urdu_4_5_G5Story, by(school_name)
	tempfile ASER_4_5_Baseline_School_level
	save `ASER_4_5_Baseline_School_level', replace
	
* ASER - ENDLINE (4-5) Cleaned:
use "$user/$drive/$folder/Output/Stata/ASER_4_5_Endline_Cleaned", clear

* Generating a school-level dataset
	gen e_treatment = 1 if type == "Experimental"
	replace e_treatment = 0 if type == "Controlled"
	foreach var of varlist  aser_e_e_sent_per - aser_e_gk_pic_3_per {
		gen sd_`var' = `var'
	}	
	collapse (mean) aser_e_e_sent_per - aser_e_gk_pic_3_per e_treatment (sd) sd_aser_e_e_sent_per - sd_aser_e_gk_pic_3_per (mean) aser_e_eng_4_5_Nothing - aser_e_urdu_4_5_G5Story, by(school_name)
	tempfile ASER_4_5_Endline_School_level
	save `ASER_4_5_Endline_School_level', replace
	
* Merging ASER 4-5 Baseline and Endline
	use `ASER_4_5_Baseline_School_level', clear
	merge 1:1 school_name using `ASER_4_5_Endline_School_level', gen(m1)
	/*
	    Result                           # of obs.
    -----------------------------------------
    not matched                            39
        from master                         9  (m1==1) "schools in baseline that were not in endline period"
        from using                         30  (m1==2) "schools in endline that were not in baseline period"

    matched                                37  (m1==3) "schools in endline and baseline period"
    -----------------------------------------
	*/
	gen matching = 1 if m1 == 1
	replace matching = 2 if m1 == 2
	replace matching = 3 if m1 == 3
	lab def match 1 "Attrition" 2 "Replacement" 3 "Consistent"
	lab val matching match
	drop m1
	
* Converting the dummy categorical variables to percentages
	foreach var of varlist aser_b_eng_4_5_Nothing - aser_b_urdu_4_5_G5Story aser_e_eng_4_5_Nothing - aser_e_urdu_4_5_G5Story {
		replace `var' = `var' * 100
	}

	tab matching, m
	order school_name b_treatment e_treatment matching
	tempfile ASER_4_5_School_level
	save `ASER_4_5_School_level', replace
}
********************************************************************************
{ // MELQO

* MELQO - BASELINE Cleaned:
use "$user/$drive/$folder/Output/Stata/MELQO_Baseline_Cleaned", clear

* Generating a school-level dataset
	gen b_treatment = 1 if type == "Experimental"
	replace b_treatment = 0 if type == "Controlled"
	foreach var of varlist melqo_b_ev_edible_num_per - melqo_b_ms_shape3_per {
		gen sd_`var' = `var'
	}
	collapse (mean) melqo_b_ev_edible_num_per - melqo_b_ms_shape3_per b_treatment (sd) sd_melqo_b_ev_edible_num_per - sd_melqo_b_ms_shape3_per, by(school_name)
	tempfile MELQO_Baseline_School_level
	save `MELQO_Baseline_School_level', replace
	
* MELQO - ENDLINE Cleaned:
use "$user/$drive/$folder/Output/Stata/MELQO_Endline_Cleaned", clear

* Generating a school-level dataset
	gen e_treatment = 1 if type == "Experimental"
	replace e_treatment = 0 if type == "Controlled"
	foreach var of varlist melqo_e_ev_edible_num_per - melqo_e_ms_shape3_per {
		gen sd_`var' = `var'
	}
	collapse (mean)  melqo_e_ev_edible_num_per - melqo_e_ms_shape3_per e_treatment (sd) sd_melqo_e_ev_edible_num_per - sd_melqo_e_ms_shape3_per, by(school_name)
	tempfile MELQO_Endline_School_level
	save `MELQO_Endline_School_level', replace
	
* Merging MELQO Baseline and Endline
	use `MELQO_Baseline_School_level', clear
	merge 1:1 school_name using `MELQO_Endline_School_level', gen(m1)
	/*
    Result                           # of obs.
    -----------------------------------------
    not matched                            31
        from master                         0  (m1==1)
        from using                         31  (m1==2)

    matched                                53  (m1==3)
    -----------------------------------------
	*/
	gen matching = 1 if m1 == 1
	replace matching = 2 if m1 == 2
	replace matching = 3 if m1 == 3
	lab def match 1 "Attrition" 2 "Replacement" 3 "Consistent"
	lab val matching match
	drop m1

	tab matching, m
	order school_name b_treatment e_treatment matching
	tempfile MELQO_School_level
	save `MELQO_School_level', replace
}
********************************************************************************
// School Level Master Dataset
use `ASER_1_3_School_level', clear
* Renaming variables to identify those from ASER Grade 1 -3 
foreach var of varlist *per {
	rename `var' a13_`var'
}
merge 1:1 school_name using `ASER_4_5_School_level', gen(m1)
/*
    Result                           # of obs.
    -----------------------------------------
    not matched                            10
        from master                         8  (m1==1)
        from using                          2  (m1==2)

    matched                                74  (m1==3)
    -----------------------------------------
*/
drop m1
merge 1:1 school_name using `MELQO_School_level', gen(m1)
/*
    Result                           # of obs.
    -----------------------------------------
    not matched                            26
        from master                        13  (m1==1)
        from using                         13  (m1==2)

    matched                                71  (m1==3)
    -----------------------------------------
*/
drop m1

sort school_name
encode school_name, gen(school_id)

* Treatment variable
/*
1.	Treatment variable in master dataset: categorical variable with value labels
	a.	Consistent
		i.	Treatment in both endline and baseline
		ii.	Control in both endline and baseline
		iii.Treatment in baseline and control in endline
		iv.	Treatment in endline and control in baseline
	b.	Attrition
		i.	Treatment in baseline
		ii.	Control in baseline
	c.	Replacement
		i.	Treatment in endline
		ii.	Control in endline


* Generating treatment status variable, accouting for the change in treatment status from baseline to endline for some schools
	gen treatment = 1 if b_treatment == 1 & e_treatment == 1 
	replace treatment = 2 if b_treatment == 0 & e_treatment == 0
	replace treatment = 3 if b_treatment == 1 & e_treatment == 0
	replace treatment = 4 if b_treatment == 0 & e_treatment == 1
	replace treatment = 5 if b_treatment == 1 & e_treatment == .
	replace treatment = 6 if b_treatment == 0 & e_treatment == .
	replace treatment = 7 if b_treatment == . & e_treatment == 1
	replace treatment = 8 if b_treatment == . & e_treatment == 0
	
	lab def treatment_ 1 "Treatment in both endline and baseline" 2 "Control in both endline and baseline" 3 "Treatment in baseline and control in endline" 4 "Treatment in endline and control in baseline" 5 "Attrition: Treatment in baseline" 6 "Attrition: Control in baseline" 7 "Replacement: Treatment in endline" 8 "Replacement: Control in endline"
	lab val treatment treatment_
*/

** Schools for which the treatment status changes from treatment in baseline to control in endline -- Consider them as control

	count if b_treatment == 1 & e_treatment == 0
	replace b_treatment = 0 if (b_treatment == 1 & e_treatment == 0)
	
* Generating treatment status variable
	gen treatment = 1 if b_treatment == 1
	replace treatment = 1 if e_treatment == 1 // for replacement schools
	replace treatment = 0 if b_treatment == 0
	replace treatment = 0 if e_treatment == 0 // for replacement schools
	tab treatment, m
	tab treatment matching, m

tempfile MasterDataset_SchoolLevel
save `MasterDataset_SchoolLevel', replace

	order school_name school_id treatment b_treatment e_treatment matching aser_b_english_Nothing - aser_b_urdu_Words aser_e_english_Nothing - aser_e_urdu_Words aser_b_eng_4_5_Nothing - aser_b_urdu_4_5_G5Story aser_e_eng_4_5_Nothing - aser_e_urdu_4_5_G5Story melqo_b_ev_edible_num_per - sd_melqo_e_ms_shape3_per
	
* Correcting variable labels in master dataset
*******************************************************************************
	unab varlist: b_treatment e_treatment matching aser_b_english_Nothing - aser_b_urdu_Words aser_e_english_Nothing - aser_e_urdu_Words aser_b_eng_4_5_Nothing - aser_b_urdu_4_5_G5Story aser_e_eng_4_5_Nothing - aser_e_urdu_4_5_G5Story melqo_b_ev_edible_num_per - sd_melqo_e_ms_shape3_per
	local n= wordcount("`varlist'")

	forval i = 1/`n' {
			
			local varname: word `i' of `varlist'
			local varlabel_old: var lab `varname'
			local var_l = "`varlabel_old'"
			local varlabel_new = subinstr("`var_l'", "(mean)", "", .)
			lab var `varname' "`varlabel_new'"	
	}	

	forval i = 1/`n' {
			
			local varname: word `i' of `varlist'
			local varlabel_old: var lab `varname'
			local var_l = "`varlabel_old'"
			local varlabel_new = subinstr("`var_l'", "(sd)", "", .)
			lab var `varname' "`varlabel_new'"	
	}	

	lab var matching "Matching"
export excel "$user/$drive/$folder/Output/Excel/MasterDataset_SchoolLevel.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", replace

preserve
keep school_name b_treatment e_treatment treatment matching school_id
export excel "$user/$drive/$folder/Output/Excel/MasterDataset_SchoolLevel_variables.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta", replace
restore

* Grade level
********************************************************************************
{ // ASER (1-3)
* ASER - BASELINE (1-3) Cleaned:
use "$user/$drive/$folder/Output/Stata/ASER_1_3_Baseline_Cleaned", clear
tostring grade, replace
* Generating a school-level and grade level dataset
	gen b_treatment = 1 if type == "Experimental"
	replace b_treatment = 0 if type == "Controlled"
	foreach var of varlist aser_b_e_capital_per - aser_b_gk_pic_3_per {
		gen sd_`var' = `var'
	}
	collapse (mean)  aser_b_e_capital_per - aser_b_gk_pic_3_per b_treatment (sd)  sd_aser_b_e_capital_per - sd_aser_b_gk_pic_3_per (mean) aser_b_english_Nothing - aser_b_urdu_Words, by(school_name grade)
	tempfile ASER_1_3_B_SchoolGrade_level
	save `ASER_1_3_B_SchoolGrade_level', replace
	
* ASER - ENDLINE (1-3) Cleaned:
use "$user/$drive/$folder/Output/Stata/ASER_1_3_Endline_Cleaned", clear
tostring grade, replace

* Generating a school-level dataset
	gen e_treatment = 1 if type == "Experimental"
	replace e_treatment = 0 if type == "Controlled"
	foreach var of varlist aser_e_e_capital_per - aser_e_gk_pic_3_per {
		gen sd_`var' = `var'
	}
	collapse (mean) aser_e_e_capital_per - aser_e_gk_pic_3_per e_treatment (sd)  sd_aser_e_e_capital_per - sd_aser_e_gk_pic_3_per (mean) aser_e_english_Nothing - aser_e_urdu_Words, by(school_name grade)
	tempfile ASER_1_3_E_SchoolGrade_level
	save `ASER_1_3_E_SchoolGrade_level', replace
	
* Merging ASER 1-3 
	use `ASER_1_3_B_SchoolGrade_level', clear
	merge 1:1 school_name grade using `ASER_1_3_E_SchoolGrade_level', gen(m1) 
	/*
	    Result                           # of obs.
    -----------------------------------------
    not matched                           119
        from master                        39  (m1==1) "schools in baseline that were not in endline period"
        from using                         80  (m1==2) "schools in endline that were not in baseline period"

    matched                               107  (m1==3) "schools in endline and baseline period"
    -----------------------------------------
	*/
	gen matching = 1 if m1 == 1
	replace matching = 2 if m1 == 2
	replace matching = 3 if m1 == 3
	lab def match 1 "Attrition" 2 "Replacement" 3 "Consistent"
	lab val matching match
	drop m1
	
	* converting the dummy categorical tp percentages
	foreach var of varlist aser_b_english_Nothing - aser_b_urdu_Words aser_e_english_Nothing - aser_e_urdu_Words {
		replace `var' = `var' * 100
	}

	tab matching, m
	order school_name grade b_treatment e_treatment matching
	tempfile ASER_1_3_SchoolGrade_level
	save `ASER_1_3_SchoolGrade_level', replace
	}
********************************************************************************
{ // ASER (4-5)
* ASER - BASELINE (4-5) Cleaned:
use "$user/$drive/$folder/Output/Stata/ASER_4_5_Baseline_Cleaned", clear
tostring grade, replace
* Generating a school-level dataset
	gen b_treatment = 1 if type == "Experimental"
	replace b_treatment = 0 if type == "Controlled"
	foreach var of varlist aser_b_e_sent_per - aser_b_gk_pic_3_per {
		gen sd_`var' = `var'
	}
	collapse (mean)  aser_b_e_sent_per - aser_b_gk_pic_3_per b_treatment (sd)  sd_aser_b_e_sent_per - sd_aser_b_gk_pic_3_per (mean) aser_b_eng_4_5_Nothing - aser_b_urdu_4_5_G5Story, by(school_name grade)
	tempfile ASER_4_5_B_SchoolGrade_level
	save `ASER_4_5_B_SchoolGrade_level', replace
	
* ASER - ENDLINE (4-5) Cleaned:
use "$user/$drive/$folder/Output/Stata/ASER_4_5_Endline_Cleaned", clear
tostring grade, replace
* Generating a school-level dataset
	gen e_treatment = 1 if type == "Experimental"
	replace e_treatment = 0 if type == "Controlled"
	foreach var of varlist aser_e_e_sent_per - aser_e_gk_pic_3_per {
		gen sd_`var' = `var'
	}	
	collapse (mean) aser_e_e_sent_per - aser_e_gk_pic_3_per e_treatment (sd) sd_aser_e_e_sent_per - sd_aser_e_gk_pic_3_per (mean) aser_e_eng_4_5_Nothing - aser_e_urdu_4_5_G5Story, by(school_name grade)
	tempfile ASER_4_5_E_SchoolGrade_level
	save `ASER_4_5_E_SchoolGrade_level', replace
	
* Merging ASER 4-5 
	use `ASER_4_5_B_SchoolGrade_level', clear
	merge 1:1 school_name grade using `ASER_4_5_E_SchoolGrade_level', gen(m1)
	/*
	    Result                           # of obs.
    -----------------------------------------
    not matched                            94
        from master                        20  (m1==1) "schools in baseline that were not in endline period"
        from using                         74  (m1==2) "schools in endline that were not in baseline period"

    matched                                69  (m1==3) "schools in endline and baseline period"
    -----------------------------------------
	*/
	gen matching = 1 if m1 == 1
	replace matching = 2 if m1 == 2
	replace matching = 3 if m1 == 3
	lab def match 1 "Attrition" 2 "Replacement" 3 "Consistent"
	lab val matching match
	drop m1
	
	* converting the dummy categorical tp percentages
	foreach var of varlist aser_b_eng_4_5_Nothing - aser_b_urdu_4_5_G5Story aser_e_eng_4_5_Nothing - aser_e_urdu_4_5_G5Story {
		replace `var' = `var' * 100
	}

	tab matching, m
	order school_name b_treatment e_treatment matching
	tempfile ASER_4_5_SchoolGrade_level
	save `ASER_4_5_SchoolGrade_level', replace
}
********************************************************************************
{ // MELQO

* MELQO - BASELINE Cleaned:
use "$user/$drive/$folder/Output/Stata/MELQO_Baseline_Cleaned", clear

* Generating a school-level dataset
	gen b_treatment = 1 if type == "Experimental"
	replace b_treatment = 0 if type == "Controlled"
	foreach var of varlist melqo_b_ev_edible_num_per - melqo_b_ms_shape3_per {
		gen sd_`var' = `var'
	}
	collapse (mean) melqo_b_ev_edible_num_per melqo_b_ms_shape3_per b_treatment (sd) sd_melqo_b_ev_edible_num_per - sd_melqo_b_ms_shape3_per, by(school_name grade)
	tempfile MELQO_B_SchoolGrade_level
	save `MELQO_B_SchoolGrade_level', replace
	
* MELQO - ENDLINE Cleaned:
use "$user/$drive/$folder/Output/Stata/MELQO_Endline_Cleaned", clear

* Generating a school-level dataset
	gen e_treatment = 1 if type == "Experimental"
	replace e_treatment = 0 if type == "Controlled"
	foreach var of varlist melqo_e_ev_edible_num_per - melqo_e_ms_shape3_per {
		gen sd_`var' = `var'
	}
	collapse (mean)  melqo_e_ev_edible_num_per - melqo_e_ms_shape3_per e_treatment (sd) sd_melqo_e_ev_edible_num_per - sd_melqo_e_ms_shape3_per, by(school_name grade)
	tempfile MELQO_E_SchoolGrade_level
	save `MELQO_E_SchoolGrade_level', replace
	
* Merging MELQO 
	use `MELQO_B_SchoolGrade_level', clear
	merge 1:1 school_name grade using `MELQO_E_SchoolGrade_level', gen(m1)
	/*
	
			Add here the merge results when Ahwaz shares the correct school names
		
	*/
	gen matching = 1 if m1 == 1
	replace matching = 2 if m1 == 2
	replace matching = 3 if m1 == 3
	lab def match 1 "Attrition" 2 "Replacement" 3 "Consistent"
	lab val matching match
	drop m1

	tab matching, m
	order school_name b_treatment e_treatment matching
	destring grade, replace
	tempfile MELQO_SchoolGrade_level
	save `MELQO_SchoolGrade_level', replace	
}

// Grade wise Master Datasets
use `ASER_1_3_SchoolGrade_level', clear
foreach var of varlist *per {
	rename `var' a13_`var'
}
merge 1:1 school_name grade using `ASER_4_5_SchoolGrade_level', gen(m1)
drop m1
merge 1:1 school_name grade using `MELQO_SchoolGrade_level', gen(m1)
drop m1

tempfile MasterDataset_SchoolGradeLevel
save `MasterDataset_SchoolGradeLevel', replace

* Adding school id in the grade level master dataset
use  `MasterDataset_SchoolLevel', clear
keep school_name school_id
merge 1:m school_name using `MasterDataset_SchoolGradeLevel', gen(m1)
drop m1

sort school_name grade

* Generating treatment status variable, accouting for the change in treatment status from baseline to endline for some schools

	gen treatment = 1 if b_treatment == 1 & e_treatment == 1 
	replace treatment = 2 if b_treatment == 0 & e_treatment == 0
	replace treatment = 3 if b_treatment == 1 & e_treatment == 0
	replace treatment = 4 if b_treatment == 0 & e_treatment == 1
	replace treatment = 5 if b_treatment == 1 & e_treatment == .
	replace treatment = 6 if b_treatment == 0 & e_treatment == .
	replace treatment = 7 if b_treatment == . & e_treatment == 1
	replace treatment = 8 if b_treatment == . & e_treatment == 0
	
	lab def treatment_l 1 "Treatment in both endline and baseline" 2 "Control in both endline and baseline" 3 "Treatment in baseline and control in endline" 4 "Treatment in endline and control in baseline" 5 "Attrition: Treatment in baseline" 6 "Attrition: Control in baseline" 7 "Replacement: Treatment in endline" 8 "Replacement: Control in endline"
	lab val treatment treatment_l
	
	order school_name school_id grade treatment b_treatment e_treatment matching aser_b_english_Nothing - aser_b_urdu_Words aser_e_english_Nothing - aser_e_urdu_Words aser_b_eng_4_5_Nothing - aser_b_urdu_4_5_G5Story aser_e_eng_4_5_Nothing - aser_e_urdu_4_5_G5Story melqo_b_ev_edible_num_per - sd_melqo_e_ms_shape3_per

* Correcting variable labels in master dataset
*******************************************************************************
	unab varlist: b_treatment e_treatment aser_b_english_Nothing - aser_b_urdu_Words aser_e_english_Nothing - aser_e_urdu_Words aser_b_eng_4_5_Nothing - aser_b_urdu_4_5_G5Story aser_e_eng_4_5_Nothing - aser_e_urdu_4_5_G5Story melqo_b_ev_edible_num_per - sd_melqo_e_ms_shape3_per
	local n= wordcount("`varlist'")

	forval i = 1/`n' {
			
			local varname: word `i' of `varlist'
			local varlabel_old: var lab `varname'
			local var_l = "`varlabel_old'"
			local varlabel_new = subinstr("`var_l'", "(mean)", "", .)
			lab var `varname' "`varlabel_new'"	
	}	

	forval i = 1/`n' {
			
			local varname: word `i' of `varlist'
			local varlabel_old: var lab `varname'
			local var_l = "`varlabel_old'"
			local varlabel_new = subinstr("`var_l'", "(sd)", "", .)
			lab var `varname' "`varlabel_new'"	
	}		

export excel "$user/$drive/$folder/Output/Excel/MasterDataset_SchoolGradeLevel.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolGradeLevel.dta", replace

preserve
keep if grade == "1"
export excel "$user/$drive/$folder/Output/Excel/Grade1.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/Grade1.dta", replace
restore

preserve
keep if grade ==  "2"
export excel "$user/$drive/$folder/Output/Excel/Grade2.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/Grade2.dta", replace
restore

preserve
keep if grade == "3"
export excel "$user/$drive/$folder/Output/Excel/Grade3.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/Grade3.dta", replace
restore

preserve
keep if grade == "4"
export excel "$user/$drive/$folder/Output/Excel/Grade4.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/Grade4.dta", replace
restore

preserve
keep if grade == "5"
export excel "$user/$drive/$folder/Output/Excel/Grade5.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/Grade5.dta", replace
restore

preserve
keep if grade == "6"
export excel "$user/$drive/$folder/Output/Excel/Grade6.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/Grade6.dta", replace
restore


preserve
keep if grade == "KG"
export excel "$user/$drive/$folder/Output/Excel/GradeKG.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/GradeKG.dta", replace
restore

preserve
keep if grade == "Nursery"
export excel "$user/$drive/$folder/Output/Excel/GradeNursery.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/GradeNursery.dta", replace
restore

preserve
keep if grade == "PG"
export excel "$user/$drive/$folder/Output/Excel/GradePG.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/GradePG.dta", replace
restore

exit 
