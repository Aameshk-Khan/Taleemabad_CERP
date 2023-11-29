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
		  
		  // Note: There are schools which were not part of Taleemabad at endline but still did the endline instruments i.e. treatment status changed from treatment to control from baseline to endline. 
		  // Hence, I have created 2 variables for treatment.
		  // b_treatment - status at baseline
		  // e_treatment - status at endline	
		  
********************************************************************************
{ // ASER (1-3)
* ASER - BASELINE (1-3) Cleaned:
use "$user/$drive/$folder/Output/Stata/ASER_1_3_Baseline_Cleaned", clear

* Generating a school-level dataset
	gen b_treatment = 1 if type == "Experimental"
	replace b_treatment = 0 if type == "Controlled"
	foreach var of varlist age_b aser_b_e_capital_per - aser_b_gk_pic_3_per {
		gen sd_`var' = `var'
	}
	collapse (mean) age_b aser_b_e_capital_per - aser_b_gk_pic_3_per b_treatment (sd) sd_age_b sd_aser_b_e_capital_per - sd_aser_b_gk_pic_3_per (sum) aser_b_english_Nothing - aser_b_urdu_Words, by(school_name)
	tempfile ASER_1_3_Baseline_School_level
	save `ASER_1_3_Baseline_School_level', replace
	
* ASER - ENDLINE (1-3) Cleaned:
use "$user/$drive/$folder/Output/Stata/ASER_1_3_Endline_Cleaned", clear

* Generating a school-level dataset
	gen e_treatment = 1 if type == "Experimental"
	replace e_treatment = 0 if type == "Controlled"
	foreach var of varlist age_e aser_e_e_capital_per - aser_e_gk_pic_3_per {
		gen sd_`var' = `var'
	}
	collapse (mean) age_e aser_e_e_capital_per - aser_e_gk_pic_3_per e_treatment (sd) sd_age_e sd_aser_e_e_capital_per - sd_aser_e_gk_pic_3_per (sum) aser_e_english_Nothing - aser_e_urdu_Words, by(school_name)
	tempfile ASER_1_3_Endline_School_level
	save `ASER_1_3_Endline_School_level', replace
	
* Merging ASER 1-3 
	use `ASER_1_3_Baseline_School_level', clear
	merge 1:1 school_name using `ASER_1_3_Endline_School_level', gen(m1) 
	/*
	    Result                           # of obs.
    -----------------------------------------
    not matched                            84
        from master                        32  (m1==1) "schools in baseline that were not in endline period"
        from using                         52  (m1==2) "schools in endline that were not in baseline period"

    matched                                19  (m1==3) "schools in endline and baseline period"
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
	foreach var of varlist age_b aser_b_e_sent_per - aser_b_gk_pic_3_per {
		gen sd_`var' = `var'
	}
	collapse (mean) age_b aser_b_e_sent_per - aser_b_gk_pic_3_per b_treatment (sd) sd_age_b sd_aser_b_e_sent_per - sd_aser_b_gk_pic_3_per (sum) aser_b_eng_Nothing - aser_b_urdu_4_5_G5Story, by(school_name)
	tempfile ASER_4_5_Baseline_School_level
	save `ASER_4_5_Baseline_School_level', replace
	
* ASER - ENDLINE (4-5) Cleaned:
use "$user/$drive/$folder/Output/Stata/ASER_4_5_Endline_Cleaned", clear

* Generating a school-level dataset
	gen e_treatment = 1 if type == "Experimental"
	replace e_treatment = 0 if type == "Controlled"
	foreach var of varlist age_e aser_e_e_sent_per - aser_e_gk_pic_3_per {
		gen sd_`var' = `var'
	}	
	collapse (mean) age_e aser_e_e_sent_per - aser_e_gk_pic_3_per e_treatment (sd) sd_age_e sd_aser_e_e_sent_per - sd_aser_e_gk_pic_3_per (sum) aser_e_eng_Nothing - aser_e_urdu_4_5_G5Story, by(school_name)
	tempfile ASER_4_5_Endline_School_level
	save `ASER_4_5_Endline_School_level', replace
	
* Merging ASER 4-5 
	use `ASER_4_5_Baseline_School_level', clear
	merge 1:1 school_name using `ASER_4_5_Endline_School_level', gen(m1)
	/*
	    Result                           # of obs.
    -----------------------------------------
    not matched                            79
        from master                        28  (m1==1) "schools in baseline that were not in endline period"
        from using                         51  (m1==2) "schools in endline that were not in baseline period"

    matched                                19  (m1==3) "schools in endline and baseline period"
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
	tempfile ASER_4_5_School_level
	save `ASER_4_5_School_level', replace
}
********************************************************************************
{ // MELQO
/*
* MELQO - BASELINE Cleaned:
use "$user/$drive/$folder/Output/Stata/MELQO_Baseline_Cleaned", clear

* Generating a school-level dataset
	gen treatment = 1 if type == "Taleemabad school"
	replace treatment = 0 if type == "Non Taleemabad School"
	foreach var of varlist age_b melqo_b_ev_edible_num_per - melqo_b_ms_shape3_per {
		gen sd_`var' = `var'
	}
	collapse (mean) age_b melqo_b_ev_edible_num_per - melqo_b_ms_shape3_per treatment (sd) sd_age_b sd_melqo_b_ev_edible_num_per - sd_melqo_b_ms_shape3_per, by(school_name_trim)
	tempfile MELQO_Baseline_School_level
	save `MELQO_Baseline_School_level', replace
	
* MELQO - ENDLINE Cleaned:
use "$user/$drive/$folder/Output/Stata/MELQO_Endline_Cleaned", clear

* Generating a school-level dataset
	gen treatment = 1 if type == "Taleemabad school"
	replace treatment = 0 if type == "Non Taleemabad School"
	foreach var of varlist age_e melqo_e_ev_edible_num_per - melqo_e_ms_shape3_per {
		gen sd_`var' = `var'
	}
	collapse (mean) age_e melqo_e_ev_edible_num_per - melqo_e_ms_shape3_per treatment (sd) sd_age_e sd_melqo_e_ev_edible_num_per - sd_melqo_e_ms_shape3_per, by(school_name_trim)
	tempfile MELQO_Endline_School_level
	save `MELQO_Endline_School_level', replace
	
* Merging MELQO 
	use `MELQO_Baseline_School_level', clear
	merge 1:1 school_name_trim using `MELQO_Endline_School_level', gen(m1)
	/*
	    Result                           # of obs.
    -----------------------------------------
    not matched                           214
        from master                         7  (m1==1) "schools in baseline that were not in endline period"
        from using                        207  (m1==2) "schools in endline that were not in baseline period"

    matched                                46  (m1==3) "schools in endline and baseline period"
    -----------------------------------------
	*/
	gen matching = 1 if m1 == 1
	replace matching = 2 if m1 == 2
	replace matching = 3 if m1 == 3
	lab def match 1 "Attrition" 2 "Replacement" 3 "Consistent"
	lab val matching match
	drop m1

	tab matching, m
	order school_name_trim treatment matching
	tempfile MELQO_School_level
	save `MELQO_School_level', replace*/
}
********************************************************************************
// School Level Master Dataset
use `ASER_1_3_School_level', clear
foreach var of varlist age_b - sd_aser_e_gk_pic_3_per {
	rename `var' a13_`var'
}
merge 1:1 school_name using `ASER_4_5_School_level', gen(m1)
drop m1
//merge 1:1 school_name_trim using `MELQO_School_level', gen(m1)

sort school_name
encode school_name, gen(school_id)
tempfile MasterDataset_SchoolLevel
save `MasterDataset_SchoolLevel', replace

export excel "$user/$drive/$folder/Output/Excel/MasterDataset_SchoolLevel.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", replace

preserve
keep school_name b_treatment e_treatment matching school_id
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
	foreach var of varlist age_b aser_b_e_capital_per - aser_b_gk_pic_3_per {
		gen sd_`var' = `var'
	}
	collapse (mean) age_b aser_b_e_capital_per - aser_b_gk_pic_3_per b_treatment (sd) sd_age_b sd_aser_b_e_capital_per - sd_aser_b_gk_pic_3_per, by(school_name grade)
	tempfile ASER_1_3_B_SchoolGrade_level
	save `ASER_1_3_B_SchoolGrade_level', replace
	
* ASER - ENDLINE (1-3) Cleaned:
use "$user/$drive/$folder/Output/Stata/ASER_1_3_Endline_Cleaned", clear
tostring grade, replace

* Generating a school-level dataset
	gen e_treatment = 1 if type == "Experimental"
	replace e_treatment = 0 if type == "Controlled"
	foreach var of varlist age_e aser_e_e_capital_per - aser_e_gk_pic_3_per {
		gen sd_`var' = `var'
	}
	collapse (mean) age_e aser_e_e_capital_per - aser_e_gk_pic_3_per e_treatment (sd) sd_age_e sd_aser_e_e_capital_per - sd_aser_e_gk_pic_3_per, by(school_name grade)
	tempfile ASER_1_3_E_SchoolGrade_level
	save `ASER_1_3_E_SchoolGrade_level', replace
	
* Merging ASER 1-3 
	use `ASER_1_3_B_SchoolGrade_level', clear
	merge 1:1 school_name grade using `ASER_1_3_E_SchoolGrade_level', gen(m1) 
	/*
	    Result                           # of obs.
    -----------------------------------------
    not matched                           234
        from master                        98  (m1==1) "schools in baseline that were not in endline period"
        from using                        136  (m1==2) "schools in endline that were not in baseline period"

    matched                                51  (m1==3) "schools in endline and baseline period"
    -----------------------------------------
	*/
	gen matching = 1 if m1 == 1
	replace matching = 2 if m1 == 2
	replace matching = 3 if m1 == 3
	lab def match 1 "Attrition" 2 "Replacement" 3 "Consistent"
	lab val matching match
	drop m1

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
	foreach var of varlist age_b aser_b_e_sent_per - aser_b_gk_pic_3_per {
		gen sd_`var' = `var'
	}
	collapse (mean) age_b aser_b_e_sent_per - aser_b_gk_pic_3_per b_treatment (sd) sd_age_b sd_aser_b_e_sent_per - sd_aser_b_gk_pic_3_per, by(school_name grade)
	tempfile ASER_4_5_B_SchoolGrade_level
	save `ASER_4_5_B_SchoolGrade_level', replace
	
* ASER - ENDLINE (4-5) Cleaned:
use "$user/$drive/$folder/Output/Stata/ASER_4_5_Endline_Cleaned", clear
tostring grade, replace
* Generating a school-level dataset
	gen e_treatment = 1 if type == "Experimental"
	replace e_treatment = 0 if type == "Controlled"
	foreach var of varlist age_e aser_e_e_sent_per - aser_e_gk_pic_3_per {
		gen sd_`var' = `var'
	}	
	collapse (mean) age_e aser_e_e_sent_per - aser_e_gk_pic_3_per e_treatment (sd) sd_age_e sd_aser_e_e_sent_per - sd_aser_e_gk_pic_3_per, by(school_name grade)
	tempfile ASER_4_5_E_SchoolGrade_level
	save `ASER_4_5_E_SchoolGrade_level', replace
	
* Merging ASER 4-5 
	use `ASER_4_5_B_SchoolGrade_level', clear
	merge 1:1 school_name grade using `ASER_4_5_E_SchoolGrade_level', gen(m1)
	/*
	    Result                           # of obs.
    -----------------------------------------
    not matched                           165
        from master                        55  (m1==1) "schools in baseline that were not in endline period"
        from using                        110  (m1==2) "schools in endline that were not in baseline period"

    matched                                36  (m1==3) "schools in endline and baseline period"
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
	tempfile ASER_4_5_SchoolGrade_level
	save `ASER_4_5_SchoolGrade_level', replace
}
********************************************************************************
{ // MELQO
/*
* MELQO - BASELINE Cleaned:
use "$user/$drive/$folder/Output/Stata/MELQO_Baseline_Cleaned", clear

* Generating a school-level dataset
	gen treatment = 1 if type == "Taleemabad school"
	replace treatment = 0 if type == "Non Taleemabad School"
	foreach var of varlist age melqo_b_ev_edible_num_per - melqo_b_ms_shape3_per {
		gen sd_`var' = `var'
	}
	collapse (mean) age melqo_b_ev_edible_num_per melqo_b_ms_shape3_per treatment (sd) sd_age sd_melqo_b_ev_edible_num_per - sd_melqo_b_ms_shape3_per, by(school_name_trim grade)
	tempfile MELQO_B_SchoolGrade_level
	save `MELQO_B_SchoolGrade_level', replace
	
* MELQO - ENDLINE Cleaned:
use "$user/$drive/$folder/Output/Stata/MELQO_Endline_Cleaned", clear

* Generating a school-level dataset
	gen treatment = 1 if type == "Taleemabad school"
	replace treatment = 0 if type == "Non Taleemabad School"
	foreach var of varlist age melqo_e_ev_edible_num_per - melqo_e_ms_shape3_per {
		gen sd_`var' = `var'
	}
	collapse (mean) age melqo_e_ev_edible_num_per - melqo_e_ms_shape3_per treatment (sd) sd_age sd_melqo_e_ev_edible_num_per - sd_melqo_e_ms_shape3_per, by(school_name_trim grade)
	tempfile MELQO_E_SchoolGrade_level
	save `MELQO_E_SchoolGrade_level', replace
	
* Merging MELQO 
	use `MELQO_B_SchoolGrade_level', clear
	merge 1:1 school_name_trim grade using `MELQO_E_SchoolGrade_level', gen(m1)
	/*
	    Result                           # of obs.
    -----------------------------------------
    not matched                           131
        from master                        24  (m1==1) "schools in baseline that were not in endline period"
        from using                        107  (m1==2) "schools in endline that were not in baseline period"

    matched                                90  (m1==3) "schools in endline and baseline period"
    -----------------------------------------
	*/
	gen matching = 1 if m1 == 1
	replace matching = 2 if m1 == 2
	replace matching = 3 if m1 == 3
	lab def match 1 "Attrition" 2 "Replacement" 3 "Consistent"
	lab val matching match
	drop m1

	tab matching, m
	order school_name_trim treatment matching
	destring grade, replace
	tempfile MELQO_SchoolGrade_level
	save `MELQO_SchoolGrade_level', replace
	*/
}
// Grade wise Master Datasets
use `ASER_1_3_SchoolGrade_level', clear
foreach var of varlist age_b - sd_aser_e_gk_pic_3_per {
	rename `var' a13_`var'
}
merge 1:1 school_name grade using `ASER_4_5_SchoolGrade_level', gen(m1)
drop m1
//merge 1:1 school_name grade using `MELQO_SchoolGrade_level', gen(m1)

tempfile MasterDataset_SchoolGradeLevel
save `MasterDataset_SchoolGradeLevel', replace

use  `MasterDataset_SchoolLevel', clear
keep school_name school_id
merge 1:m school_name using `MasterDataset_SchoolGradeLevel'

sort school_name grade

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

/*
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
*/ 

exit 
