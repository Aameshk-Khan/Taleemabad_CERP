* Purpose: Clean and organize Taleemabad's data.
* Author(s): Ahmed 
* Date: 12th Oct 2023

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
{ //* ASER - BASELINE (1-3):

import delimited "$user/$drive/$folder//Shared by Taleemabad/Data/Baseline/Copy of ASER_Test_1_3_19dec - data (1).csv", encoding(ISO-8859-1) clear


* Cleaning operations:
	duplicates report _id
	duplicates tag _id, gen(dup)
	// br if dup == 2 // empty rows
	drop if _id == .
	drop dup
	
	count // 1898 Observations
	d
	
	rename general_details_sectionschool_na school_name
	rename general_details_sectiongender gender
	rename general_details_sectionstudent_a age_b
	rename general_details_sectiongrade grade
	
	rename (englisheng_5_capital_letters - englisheng_sentence_meaning) (aser_b_eng_capital aser_b_eng_small aser_b_eng_words aser_b_eng_word_meaning aser_b_eng_read_sentences aser_b_eng_sentence_fluency aser_b_eng_sentence_meaning)
	
	rename (urduud_read_4_sentences - urduud_comprehension) (aser_b_urdu_read_sentences aser_b_urdu_sentence_fluency aser_b_urdu_words aser_b_urdu_letters aser_b_urdu_story_fluency aser_b_urdu_comprehension)
	
	rename (mathsmaths_minus_2digit - mathsmaths_shape_name) (aser_b_maths_minus_2digit aser_b_maths_minus_3digit aser_b_maths_100_200 aser_b_maths_10_99 aser_b_maths_1_9 aser_b_maths_division aser_b_maths_time aser_b_maths_word_problem aser_b_maths_shape_name)
	
	rename (general_knowledgegk_picture_acti - v23) (aser_b_gk_action_1 aser_b_gk_action_2 aser_b_gk_picture_1 aser_b_gk_picture_2 aser_b_gk_picture_3)
	
	lab var type "Treatment status"

	unab varlist: aser_b*
	local n= wordcount("`varlist'")
	
* Creating test score variables (percentages)
 {
	gen aser_b_e_capital_per = aser_b_eng_capital / 5 * 100
	gen aser_b_e_small_per = aser_b_eng_small / 5 * 100
	gen aser_b_e_words_per = aser_b_eng_words / 5 * 100
	gen aser_b_e_word_meaning_per = aser_b_eng_word_meaning / 5 * 100
	gen aser_b_e_read_sent_per = aser_b_eng_read_sentences / 4 * 100
	gen aser_b_e_sent_flue_per = aser_b_eng_sentence_fluency / 5 * 100
	gen aser_b_e_sent_meaning_per = aser_b_eng_sentence_meaning / 4 * 100
	
	gen aser_b_u_read_sent_per = aser_b_urdu_read_sentences / 4 * 100
	gen aser_b_u_sent_flue_per = aser_b_urdu_sentence_fluency / 5 * 100
	gen aser_b_u_words_per = aser_b_urdu_words / 5 * 100
	gen aser_b_u_letters_per = aser_b_urdu_letters / 5 * 100
	gen aser_b_u_story_flue_per = aser_b_urdu_story_fluency / 5 *100
	gen aser_b_u_comp_per = aser_b_urdu_comprehension / 2 * 100
	
	gen aser_b_m_minus_2digit_per = 100 if aser_b_maths_minus_2digit == "correct"
	replace aser_b_m_minus_2digit_per = 0 if aser_b_maths_minus_2digit == "incorrect"
	
	gen aser_b_m_minus_3digit_per = 100 if aser_b_maths_minus_3digit == "correct"
	replace aser_b_m_minus_3digit_per = 0 if aser_b_maths_minus_3digit == "incorrect"
	
	gen aser_b_m_100_200_per = aser_b_maths_100_200 / 5 * 100
	gen aser_b_m_10_99_per = aser_b_maths_10_99 / 5 * 100
	gen aser_b_m_1_9_per = aser_b_maths_1_9 /5 * 100
	
	gen aser_b_m_division_per = 100 if aser_b_maths_division == "correct"
	replace aser_b_m_division_per = 0 if aser_b_maths_division == "incorrect"
	
	gen aser_b_m_time_per = 100 if aser_b_maths_time == "correct"
	replace aser_b_m_time_per = 0 if aser_b_maths_time == "incorrect"
	
	gen aser_b_m_word_problem_per = 100 if aser_b_maths_word_problem == "correct"
	replace aser_b_m_word_problem_per = 0 if aser_b_maths_word_problem == "incorrect"
	
	gen aser_b_m_shape_name_per = 100 if aser_b_maths_shape_name == "correct"
	replace aser_b_m_shape_name_per = 0 if aser_b_maths_shape_name == "incorrect"
	
	gen aser_b_gk_act_1_per = 100 if aser_b_gk_action_1 == "correct"
	replace aser_b_gk_act_1_per = 0 if aser_b_gk_action_1 == "incorrect"
	
	gen aser_b_gk_act_2_per = 100 if aser_b_gk_action_2 == "correct"
	replace aser_b_gk_act_2_per = 0 if aser_b_gk_action_2 == "incorrect"
	
	gen aser_b_gk_pic_1_per = 100 if aser_b_gk_picture_1 == "correct" 
	replace aser_b_gk_pic_1_per = 100 if aser_b_gk_picture_1 == "incorrect" 
	
	gen aser_b_gk_pic_2_per = 100 if aser_b_gk_picture_2 == "correct" 
	replace aser_b_gk_pic_2_per = 100 if aser_b_gk_picture_2 == "incorrect" 
	
	gen aser_b_gk_pic_3_per = 100 if aser_b_gk_picture_3 == "correct" 
	replace aser_b_gk_pic_3_per = 100 if aser_b_gk_picture_3 == "incorrect" 
	
	
	unab varlist2: *per
	forval i = 1/`n' {
			
			local varname: word `i' of `varlist'
			local varlabel_old: var lab `varname'
			local varlabel_new = "`varlabel_old'_percentage_score"

			local varname: word `i' of `varlist2'
			lab var `varname' "`varlabel_new'"		
	}	
	}

* Creating categorical variables , based on ASER’s ranking methodology 	

	gen aser_b_english = 0 if inrange(aser_b_eng_capital,0,3)
	replace aser_b_english = 1 if inrange(aser_b_eng_capital,4,5) & inrange(aser_b_eng_small,0,3)
	replace aser_b_english = 2 if inrange(aser_b_eng_capital,4,5) & inrange(aser_b_eng_small,4,5) & inrange(aser_b_eng_words,0,3)
	replace aser_b_english = 3 if inrange(aser_b_eng_capital,4,5) & inrange(aser_b_eng_small,4,5) & inrange(aser_b_eng_words,4,5) & inrange(aser_b_eng_read_sentences,0,3)
	replace aser_b_english = 4 if inrange(aser_b_eng_capital,4,5) & inrange(aser_b_eng_small,4,5) & inrange(aser_b_eng_words,4,5) & aser_b_eng_read_sentence == 4
	
	lab def eng_cat 0 "Nothing" 1 "Capital letters" 2 "Small letters" 3 "Word" 4 "Sentence"
	lab val aser_b_english eng_cat
	lab var aser_b_english "english score - categorical"
	
	gen aser_b_maths = 5 if aser_b_maths_minus_2digit == "incorect" & aser_b_maths_minus_3digit == "incorrect" & inrange(aser_b_maths_10_99,4,5) & inrange(aser_b_maths_100_200,0,3)
	replace aser_b_maths = 4 if aser_b_maths_minus_2digit == "corect" & aser_b_maths_minus_3digit == "correct" & aser_b_maths_division == "correct"
	replace aser_b_maths = 3 if aser_b_maths_minus_2digit == "corect" & aser_b_maths_minus_3digit == "correct" & aser_b_maths_division == "incorrect"
	replace aser_b_maths = 2 if aser_b_maths_minus_2digit == "incorect" & aser_b_maths_minus_3digit == "incorrect" & inrange(aser_b_maths_100_200,4,5) 
	replace aser_b_maths = 1 if aser_b_maths_minus_2digit == "incorect" & aser_b_maths_minus_3digit == "incorrect" & inrange(aser_b_maths_10_99,0,3) & inrange(aser_b_maths_1_9,4,5) & inrange(aser_b_maths_100_200,0,3) 
	replace aser_b_maths = 0 if aser_b_maths_minus_2digit == "incorect" & aser_b_maths_minus_3digit == "incorrect" & inrange(aser_b_maths_10_99,0,3) & inrange(aser_b_maths_1_9,0,3) & inrange(aser_b_maths_100_200,0,3)
	
	
	lab def math_cat 0 "Nothing" 1 "Recognise numbers 1 - 9" 2 "Recognise 100 - 200" 3 "subtraction" 4 "division" 5 "recognise numbers 11 - 99" 
	lab val aser_b_maths maths_cat
	lab var aser_b_maths "maths score - categorical"
	
	gen aser_b_urdu = 6 if aser_b_urdu_read_sentences == 4
	replace aser_b_urdu = 5 if aser_b_urdu_read_sentences != 4 & inrange(aser_b_urdu_words,4,5)
	replace aser_b_urdu = 4 if aser_b_urdu_read_sentences == 4 & aser_b_urdu_story_fluency == 5
	replace aser_b_urdu = 3 if aser_b_urdu_read_sentences == 4 & aser_b_urdu_story_fluency != 5
	replace aser_b_urdu = 2 if aser_b_urdu_read_sentences != 4 & inrange(aser_b_urdu_letters,4,5)
	replace aser_b_urdu = 1 if aser_b_urdu_read_sentences != 4 & inrange(aser_b_urdu_letters,1,3)
	
	lab def urdu_cat 1 "beginner" 2 "can read letters" 3 "paragraph" 4 "story" 5 "words" 6 "sentence"
	lab val aser_b_urdu urdu_cat
	lab var aser_b_urdu "urdu score - categorical"
		
tempfile ASER_1_3_baseline
save `ASER_1_3_baseline', replace

* Adjusting school names using the corrected school names provided by taleemabad. 
			/////////////////// 
		import excel "$user/$drive/$folder/Shared by Taleemabad/Schools/ASER_Churn_Baseline.xlsx", firstrow clear	
		rename general_details_sectionschool_n school_name
		duplicates drop
		tempfile ASER_Churn_Baseline
		save `ASER_Churn_Baseline', replace
			///////////////////
			
use `ASER_1_3_baseline', clear
	merge m:1 school_name using `ASER_Churn_Baseline', gen(m1)
		/*
    Result                           # of obs.
    -----------------------------------------
    not matched                            53
        from master                         0  (m1==1)
        from using                         53  (m1==2) 

    matched                             1,898  (m1==3)
    -----------------------------------------
	*/
	drop if m1 == 2 
	drop school_name
	rename corrected_school school_name
	drop m1 		

/* This chunk checks whether the data is unqiue on school id and child id. 
* Generating School_id 
	sort school_name_trim
	encode school_name_trim, gen(school_id)
	lab var school_id "School ID"
	bysort school_name_trim: gen child_id = _n
	lab var child_id "Child ID"
	isid school_id child_id
*/ 
tempfile ASER_1_3_baseline
save `ASER_1_3_baseline', replace

export excel "$user/$drive/$folder/Output/Excel/ASER_1_3_Baseline_Cleaned.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/ASER_1_3_Baseline_Cleaned.dta",replace
	sort school_name
	egen tag = tag(school_name)
	keep if tag
	keep school_name type 
* School level dataset with (type (treatment status) and school_name 
tempfile ASER_1_3_baseline_school_var
save `ASER_1_3_baseline_school_var', replace
}
********************************************************************************
{ //* ASER - BASELINE (4-5):

import delimited "$user/$drive/$folder/Shared by Taleemabad/Data/Baseline/Copy of ASER_Test_4_5_19dec.xlsx - data.csv", encoding(ISO-8859-1) clear

* Cleaning operations:
	duplicates report _id // No duplicates
	count // 993 Observations
	d

	rename general_details_sectionschool_na school_name
	rename general_details_sectiongender gender
	rename general_details_sectionstudent_a age_b
	rename general_details_sectiongrade grade
	
	rename (english_g4_5eng_read_sentences_g - english_g4_5eng_g2_5_capital_let) (aser_b_eng_sentences aser_b_eng_sentence_meaning aser_b_eng_story_fluency aser_b_eng_comprehension aser_b_eng_g1_3_sentence aser_b_eng_g1_3_sentence_meaning aser_b_eng_g1_3_words aser_b_eng_g1_3_meaning aser_b_eng_g1_3_small aser_b_eng_g1_3_capital) 
	
	rename (urdu_g4_5ud_story_fluency_g4_5 - urdu_g4_5masculine_feminine_g4_5) (aser_b_urdu_story_fluency aser_b_urdu_comprehension aser_b_urdu_g1_3_story_fluency aser_b_urdu_g1_3_comprehension aser_b_urdu_grammar aser_b_urdu_word_sentences aser_b_urdu_read_sentences aser_b_urdu_g1_3_sen_fluency aser_b_urdu_g1_3_read_words aser_b_urdu_g1_3_read_letters aser_b_urdu_masculine_feminine)
	
	rename (maths_g4_5maths_minus_4digit - maths_g4_5maths_complete_pattern) (aser_b_maths_minus_4digit aser_b_maths_minus_5digit aser_b_maths_division aser_b_maths_g1_3_minus_3dig aser_b_maths_g1_3_minus_2dig aser_b_maths_g1_3_division aser_b_maths_5digit_nums aser_b_maths_3digit_nums aser_b_maths_2digit_nums aser_b_maths_1digit_nums aser_b_maths_decimals aser_b_maths_time aser_b_maths_word_problem aser_b_maths_g1_3_wordprob aser_b_maths_complete_pattern)
	
	rename (general_knowledge_g4_5gk_picture - v26) (aser_b_gk_action_1 aser_b_gk_action_2 aser_b_gk_picture_1 aser_b_gk_picture_2 aser_b_gk_picture_3) 

	lab var type "Treatment status"

	unab varlist: aser_b*
	local n= wordcount("`varlist'")
	
* Creating test score variables
{
	gen aser_b_e_sent_per = aser_b_eng_sentences / 8 * 100 
	gen aser_b_e_sent_meaning_per = aser_b_eng_sentence_meaning / 8 * 100
	gen aser_b_e_story_flue_per = aser_b_eng_story_fluency / 5 * 100 
	gen aser_b_e_comp_per = aser_b_eng_comprehension / 2 * 100 
	gen aser_b_e_g1_3_sent_per = aser_b_eng_g1_3_sentence / 4 * 100 
	gen aser_b_e_g1_3_sen_mean_per = aser_b_eng_g1_3_sentence_meaning / 4 * 100 
	gen aser_b_e_g1_3_words_per = aser_b_eng_g1_3_words / 5 * 100  
	gen aser_b_e_g1_3_meaning_per = aser_b_eng_g1_3_meaning / 5 * 100 
	gen aser_b_e_g1_3_small_per = aser_b_eng_g1_3_small / 5 * 100 
	gen aser_b_e_g1_3_capital_per  = aser_b_eng_g1_3_capital / 5 * 100
	
	gen aser_b_u_story_flue_per = aser_b_urdu_story_fluency / 5 * 100  
	gen aser_b_u_comp_per = aser_b_urdu_comprehension / 2 * 100 
	gen aser_b_u_g1_3_storyflue_per = aser_b_urdu_g1_3_story_fluency / 5 * 100 
	gen aser_b_u_g1_3_compre_per = aser_b_urdu_g1_3_comprehension / 2 * 100 
	gen aser_b_u_grammar_per = 100 if aser_b_urdu_grammar == "correct"
	replace aser_b_u_grammar_per = 0 if aser_b_urdu_grammar == "incorrect"
	gen aser_b_u_word_sent_per = aser_b_urdu_word_sentences / 5 * 100
	gen aser_b_u_read_sent_per =  aser_b_urdu_read_sentences / 4 * 100
	gen aser_b_u_g1_3_sen_flue_per = aser_b_urdu_g1_3_sen_fluency / 5 * 100 
	gen aser_b_u_g1_3_read_words_per = aser_b_urdu_g1_3_read_words / 5 * 100 
	gen aser_b_u_g1_3_read_let_per = aser_b_urdu_g1_3_read_letters / 5 * 100 
	gen aser_b_u_mas_fem_per =aser_b_urdu_masculine_feminine / 2 * 100
	
	gen aser_b_m_minus_4digit_per = 100 if aser_b_maths_minus_4digit == "correct"
	replace aser_b_m_minus_4digit_per = 0 if aser_b_maths_minus_4digit == "incorrect"
	
	gen aser_b_m_minus_5digit_per = 100 if aser_b_maths_minus_5digit == "correct"
	replace aser_b_m_minus_5digit_per = 0 if aser_b_maths_minus_5digit == "incorrect"
	
	gen aser_b_m_division_per = 100 if aser_b_maths_division == "correct"
	replace aser_b_m_division_per = 0 if aser_b_maths_division == "incorrect"
	
	gen aser_b_m_g1_3_minus_3dig_per = 100 if aser_b_maths_g1_3_minus_3dig == "correct"
	replace aser_b_m_g1_3_minus_3dig_per = 0 if aser_b_maths_g1_3_minus_3dig == "incorrect"
	
	gen aser_b_m_g1_3_minus_2dig_per = 100 if aser_b_maths_g1_3_minus_2dig == "correct"
	replace aser_b_m_g1_3_minus_2dig_per = 0 if aser_b_maths_g1_3_minus_2dig == "incorrect"
	
	gen aser_b_m_g1_3_division_per = aser_b_maths_g1_3_division / 2 * 100
	
	gen aser_b_m_5digit_nums_per = aser_b_maths_5digit_nums / 5 * 100 
	
	gen aser_b_m_3digit_nums_per =  aser_b_maths_3digit_nums / 5 * 100
	
	gen aser_b_m_2digit_nums_per =  aser_b_maths_2digit_nums / 5 * 100
	
	gen aser_b_m_1digit_nums_per = aser_b_maths_1digit_nums / 5 * 100
	
	gen aser_b_m_decimals_per =  aser_b_maths_decimals / 5 * 100
	
	gen  aser_b_m_time_per = 100 if  aser_b_maths_time  == "correct"
	replace  aser_b_m_time_per = 0 if  aser_b_maths_time  == "incorrect"
	
	gen aser_b_m_word_problem_per = 100 if  aser_b_maths_word_problem  == "correct"
	replace  aser_b_m_word_problem_per = 0 if  aser_b_maths_word_problem  == "incorrect"
	
	gen aser_b_m_g1_3_wordprob_per = 100 if  aser_b_maths_g1_3_wordprob  == "correct"
	replace  aser_b_m_g1_3_wordprob_per = 0 if  aser_b_maths_g1_3_wordprob  == "incorrect"
	
	gen aser_b_m_complete_pat_per = 100 if  aser_b_maths_complete_pattern  == "correct"
	replace  aser_b_m_complete_pat_per = 0 if  aser_b_maths_complete_pattern  == "incorrect"
	
	gen aser_b_gk_act_1_per = 100 if aser_b_gk_action_1 == "correct"
	replace aser_b_gk_act_1_per = 0 if aser_b_gk_action_1 == "incorrect"
	
	gen aser_b_gk_act_2_per = 100 if aser_b_gk_action_2 == "correct"
	replace aser_b_gk_act_2_per = 0 if aser_b_gk_action_2 == "incorrect"
	
	gen aser_b_gk_pic_1_per = 100 if aser_b_gk_picture_1 == "correct" 
	replace aser_b_gk_pic_1_per = 100 if aser_b_gk_picture_1 == "incorrect" 
	
	gen aser_b_gk_pic_2_per = 100 if aser_b_gk_picture_2 == "correct" 
	replace aser_b_gk_pic_2_per = 100 if aser_b_gk_picture_2 == "incorrect" 
	
	gen aser_b_gk_pic_3_per = 100 if aser_b_gk_picture_3 == "correct" 
	replace aser_b_gk_pic_3_per = 100 if aser_b_gk_picture_3 == "incorrect" 
	
	unab varlist2: *per
	forval i = 1/`n' {
			
			local varname: word `i' of `varlist'
			local varlabel_old: var lab `varname'
			local varlabel_new = "`varlabel_old'_percentage_score"

			local varname: word `i' of `varlist2'
			lab var `varname' "`varlabel_new'"		
	}	
}	

* Creating categorical variables , based on ASER’s ranking methodology 	

		gen aser_b_english_4_5 = 0 if inrange(aser_b_eng_g1_3_capital,0,3)
		replace aser_b_english_4_5 = 1 if inrange(aser_b_eng_g1_3_capital,4,5) & inrange(aser_b_eng_g1_3_small,0,3)
		replace aser_b_english_4_5 = 2 if inrange(aser_b_eng_g1_3_small,4,5) & inrange(aser_b_eng_g1_3_words,0,3)
		replace aser_b_english_4_5 = 3 if inrange(aser_b_eng_g1_3_words,4,5) & inrange(aser_b_eng_g1_3_sentence,0,2)
		replace aser_b_english_4_5 = 4 if inrange(aser_b_eng_sentences,6,8) & inrange(aser_b_eng_sentence_meaning,0,5)
		replace aser_b_english_4_5 = 4 if inrange(aser_b_eng_sentences,0,3) & inrange(aser_b_eng_g1_3_sentence,2,4)
		replace aser_b_english_4_5 = 4 if inrange(aser_b_eng_sentences,4,6)
		replace aser_b_english_4_5 = 5 if inrange(aser_b_eng_sentences,6,8) & inrange(aser_b_eng_sentence_meaning,6,8) & inrange(aser_b_eng_comprehension,0,1)
		replace aser_b_english_4_5 = 6 if inrange(aser_b_eng_sentences,6,8) & inrange(aser_b_eng_sentence_meaning,6,8) & aser_b_eng_comprehension == 2	
		
	lab def eng_cat_45 0 "Nothing" 1 "Capital letters" 2 "Small letters" 3 "Word" 4 "G2 Sentence" 5 "G5 Sentence" 6 "G5 Story"
	lab val aser_b_english_4_5 eng_cat_45
	lab var aser_b_english_4_5 "english score grades 4-5 - categorical"
	
	gen aser_b_urdu_4_5 = 0 if inrange(aser_b_urdu_g1_3_read_letters,0,3) 
	replace aser_b_urdu_4_5 = 1 if inrange(aser_b_urdu_g1_3_read_letters,4,5) & inrange(aser_b_urdu_g1_3_read_words,0,3)
	replace aser_b_urdu_4_5 = 2 if inrange(aser_b_urdu_g1_3_read_words,4,5) & inrange(aser_b_urdu_g1_3_sen_fluency,0,3)
	replace aser_b_urdu_4_5 = 3 if inrange(aser_b_urdu_g1_3_sen_fluency,4,5) & inrange(aser_b_urdu_read_sentences,2,4) & inrange(aser_b_urdu_story_fluency,0,3)
	replace aser_b_urdu_4_5 = 4 if inrange(aser_b_urdu_g1_3_story_fluency,4,5) & inrange(aser_b_urdu_story_fluency,0,3)
	replace aser_b_urdu_4_5 = 5 if inrange(aser_b_urdu_story_fluency,4,5)
	
	lab def urdu_cat_45 0 "Nothing" 1 "Letters" 2 "Words" 3 "G2 Sentence" 4 "G2 Story" 5 "G5 Story"
	lab val aser_b_urdu_4_5 urdu_cat_45
	lab var aser_b_urdu_4_5 "urdu score grades 4-5 - categorical"
	
	gen aser_b_maths_4_5 = 0 if aser_b_maths_5digit_nums < 4 & aser_b_maths_3digit_nums < 4 & aser_b_maths_2digit_nums < 4 & aser_b_maths_1digit_nums < 4
	replace aser_b_maths_4_5 = 1 if aser_b_maths_5digit_nums >= 4 & aser_b_maths_3digit_nums >= 4 & aser_b_maths_2digit_nums >= 4 & aser_b_maths_1digit_nums >= 4
	replace aser_b_maths_4_5 = 2 if aser_b_maths_g1_3_minus_3dig == "correct" & aser_b_maths_g1_3_minus_2dig == "correct"
	replace aser_b_maths_4_5 = 3 if aser_b_maths_minus_4digit == "correct" & aser_b_maths_minus_5digit == "correct"
	replace aser_b_maths_4_5 = 4 if aser_b_maths_minus_4digit == "correct" & aser_b_maths_minus_5digit == "correct" & aser_b_maths_division == "correct"
	
	lab def math_cat_45 0 "Nothing" 1 "Number Recognition" 2 "Subtraction-2/3" 3 "Subtraction-4/5" 4 "Division" 
	lab val aser_b_maths_4_5 maths_cat_45
	lab var aser_b_maths_4_5 "maths score grades 4-5 - categorical"
	
	
tempfile ASER_4_5_baseline
save `ASER_4_5_baseline', replace

* Adjusting school names using the corrected school names provided by taleemabad. 
			
use `ASER_4_5_baseline', clear
	merge m:1 school_name using `ASER_Churn_Baseline', gen(m1)
		/*
    Result                           # of obs.
    -----------------------------------------
    not matched                            58
        from master                         0  (m1==1)
        from using                         58  (m1==2)

    matched                               993  (m1==3)
    -----------------------------------------
	*/
	drop if m1 == 2 
	drop school_name
	rename corrected_school school_name
	drop m1 		

/*	
* Generating School_id 
	sort school_name_trim
	encode school_name_trim, gen(school_id)
	lab var school_id "School ID"
	bysort school_name_trim: gen child_id = _n
	lab var child_id "Child ID"
	isid school_id child_id
*/
tempfile ASER_4_5_baseline
save `ASER_4_5_baseline', replace
	
export excel "$user/$drive/$folder/Output/Excel/ASER_4_5_Baseline_Cleaned.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/ASER_4_5_Baseline_Cleaned.dta", replace


	egen tag = tag(school_name)
	keep if tag
	keep school_name type
* School level dataset with (type (treatment status),  and school_name 
tempfile ASER_4_5_baseline_school_var
save `ASER_4_5_baseline_school_var', replace
}
********************************************************************************
{ //* MELQO - BASELINE:
/*
import delimited "$user/$drive/$folder/Shared by Taleemabad/Data/Baseline/Copy of MELQO_19dec_raw.xlsx - data.csv", encoding(ISO-8859-1) clear

* Cleaning operations:
	duplicates report _id
	duplicates tag _id, gen(dup)
	// br if dup == 2 // empty rows
	drop if _id == .
	drop dup
	
	count // 1833 Observations
	d
	
	rename general_details_sectionschool_na school_name
	rename general_details_sectiongender gender
	rename general_details_sectionstudent_a age_b
	rename general_details_sectiongrade grade 

	rename (expressive_vocabularyedibles_num - expressive_vocabularyanimals_sta) (melqo_b_expvocab_edibles_number melqo_b_expvocab_edibles_stated melqo_b_expvocab_animals_number melqo_b_expvocab_animals_stated)
	
	rename (pre_literacy_sectionletter_ident pre_literacy_sectionletter_sound) (melqo_b_prelit_letter_identify melqo_b_prelit_letter_sound)
	
	rename (listening_comprehension_story_se) (melqo_b_listening_comp_story)
	
	rename (name_writing_sectionname_writing name_writing_sectionincorrect_na) (melqo_b_name_writing melqo_b_incorrect_name)
	
	rename (motor_skills_sectionshape_1 motor_skills_sectionshape_2 motor_skills_sectionshape_3) (melqo_b_motorskills_shape1 melqo_b_motorskills_shape2 melqo_b_motorskills_shape3)
	
	rename (pre_numeracy_sectionverbal_count pre_numeracy_sectionnumber_ident) (melqo_b_prenum_verbal_count melqo_b_prenum_number_identify)
 		
	lab var type "Treatment status"
	/*
	unab varlist: melqo_b*
	local n= wordcount("`varlist'")
	*/
* Creating test score variables	
	gen melqo_b_ev_edible_num_per = melqo_b_expvocab_edibles_number / 10 * 100
	gen melqo_b_ev_animal_num_per = melqo_b_expvocab_animals_numbe / 10 * 100
	
	gen melqo_b_pl_let_identify_per = melqo_b_prelit_letter_identify / 8 * 100
	gen melqo_b_pl_let_sound_per = melqo_b_prelit_letter_sound / 8 * 100
	gen melqo_b_listcomp_story_per = melqo_b_listening_comp_story / 5 * 100
	
	gen melqo_b_name_writing_per = 100 if melqo_b_name_writing == "correct"
	replace melqo_b_name_writing_per = 0 if melqo_b_name_writing == "incorrect"
	
	gen melqo_b_pn_verbal_count_per = melqo_b_prenum_verbal_count / 30 * 100
	gen melqo_b_pn_num_identify_per = melqo_b_prenum_number_identify/ 10 * 100
	
	gen melqo_b_ms_shape1_per = 100 if melqo_b_motorskills_shape1 == "all_criteria_met"
	replace melqo_b_ms_shape1_per = 50 if melqo_b_motorskills_shape1 == "missing_one_criteria"
	replace melqo_b_ms_shape1_per = 0 if melqo_b_motorskills_shape1 == "missing_more_than_one_criteria"

	gen melqo_b_ms_shape2_per = 100 if melqo_b_motorskills_shape2 == "all_criteria_met"
	replace melqo_b_ms_shape2_per = 50 if melqo_b_motorskills_shape2 == "missing_one_criteria"
	replace melqo_b_ms_shape2_per = 0 if melqo_b_motorskills_shape2 == "missing_more_than_one_criteria"

	gen melqo_b_ms_shape3_per = 100 if melqo_b_motorskills_shape3 == "all_criteria_met"
	replace melqo_b_ms_shape3_per = 50 if melqo_b_motorskills_shape3 == "missing_one_criteria"
	replace melqo_b_ms_shape3_per = 0 if melqo_b_motorskills_shape3 == "missing_more_than_one_criteria"
	
	/*
	unab varlist2: *per
	forval i = 1/`n' {
			
			local varname: word `i' of `varlist'
			local varlabel_old: var lab `varname'
			local varlabel_new = "`varlabel_old'per"

			local varname: word `i' of `varlist2'
			lab var `varname' "`varlabel_new'"		
	}
	*/
	gen school_name_trim = school_name
	lab var school_name_trim "school name in lower case wihtout spaces"
	replace school_name_trim = ustrtrim(school_name_trim)
	replace school_name_trim = lower(school_name_trim)
	replace school_name_trim = subinstr(school_name_trim, " ", "",.)
	replace school_name_trim = subinstr(school_name_trim, ".", "",.)
	
tempfile MELQO_baseline
save `MELQO_baseline', replace

	use `MELQO_baseline', clear
	merge m:1 school_name_trim using `schoolcorrection_ASER', gen(m1)
		/*

    Result                           # of obs.
    -----------------------------------------
    not matched                         1,110
        from master                       884  (m1==1) // already correct
        from using                        226  (m1==2) // these schools are not present

    matched                               949  (m1==3)
    -----------------------------------------
		*/

	drop if m1 == 2 
	tab school_name_trim if corrected_school == "" 
	replace corrected_school = school_name_trim if corrected_school == "" // school names which are already correct
	drop school_name_trim
	rename corrected_school school_name_trim
	drop m1

	merge m:1 school_name_trim using `schoolcorrection_2', gen(m1)
	drop if m1 == 2 // these schools are not present
	replace corrected_school = school_name_trim if corrected_school == "" // school names which are already correct
	drop school_name_trim
	rename corrected_school school_name_trim
	drop m1
/*
* Generating School_id 
	sort school_name_trim
	encode school_name_trim, gen(school_id)
	lab var school_id "School ID"
	bysort school_name_trim: gen child_id = _n
	lab var child_id "Child ID"
	isid school_id child_id
*/
tempfile MELQO_baseline
save `MELQO_baseline', replace	
export excel "$user/$drive/$folder/Output/Excel/MELQO_Baseline_Cleaned.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/MELQO_Baseline_Cleaned.dta", replace

	egen tag = tag(school_name_trim)
	keep if tag
	keep school_name_trim type
* School level dataset with (type (treatment status), school_id (numeric), and school_name variables	
tempfile MELQO_baseline_school_var
save `MELQO_baseline_school_var', replace	
*/
}
********************************************************************************
{ //* ASER - ENDLINE (1-3):

import excel "$user/$drive/$folder/Shared by Taleemabad/Data/Endline/ASER_Test_1_3_CERP.xls", firstrow clear


* Cleaning operations:
	duplicates report _id // No duplicates
	count // 2436 Observations
	
	d
	
	rename general_details_sectionschool_n school_name
	rename general_details_sectiongender gender
	rename general_details_sectionStudent_ age_e
	rename general_details_sectiongrade grade

	rename (englisheng_5_capital_letters - englisheng_sentence_meaning) (aser_e_eng_capital aser_e_eng_small aser_e_eng_words aser_e_eng_word_meaning aser_e_eng_read_sentences aser_e_eng_sentence_fluency aser_e_eng_sentence_meaning)
	
	rename (urduud_read_4_sentences - urduud_comprehension) (aser_e_urdu_read_sentences aser_e_urdu_sentence_fluency aser_e_urdu_words aser_e_urdu_letters aser_e_urdu_story_fluency aser_e_urdu_comprehension)
	
	rename (mathsmaths_minus_2digit - mathsmaths_shape_name) (aser_e_maths_minus_2digit aser_e_maths_minus_3digit aser_e_maths_100_200 aser_e_maths_10_99 aser_e_maths_1_9 aser_e_maths_division aser_e_maths_time aser_e_maths_word_problem aser_e_maths_shape_name)
	
	rename (general_knowledgegk_picture_act - W) (aser_e_gk_action_1 aser_e_gk_action_2 aser_e_gk_picture_1 aser_e_gk_picture_2 aser_e_gk_picture_3)
	
	unab varlist: aser_e*
	local n= wordcount("`varlist'")
	
* Creating test score variables
{
	gen aser_e_e_capital_per = aser_e_eng_capital / 5 * 100
	gen aser_e_e_small_per = aser_e_eng_small / 5 * 100
	gen aser_e_e_words_per = aser_e_eng_words / 5 * 100
	gen aser_e_e_word_meaning_per = aser_e_eng_word_meaning / 5 * 100
	gen aser_e_e_read_sent_per = aser_e_eng_read_sentences / 4 * 100
	gen aser_e_e_sent_flue_per = aser_e_eng_sentence_fluency / 5 * 100
	gen aser_e_e_sent_meaning_per = aser_e_eng_sentence_meaning / 4 * 100
	
	gen aser_e_u_read_sent_per = aser_e_urdu_read_sentences / 4 * 100
	gen aser_e_u_sent_flue_per = aser_e_urdu_sentence_fluency / 5 * 100
	gen aser_e_u_words_per = aser_e_urdu_words / 5 * 100
	gen aser_e_u_letters_per = aser_e_urdu_letters / 5 * 100
	gen aser_e_u_story_flue_per = aser_e_urdu_story_fluency / 5 *100
	gen aser_e_u_comp_per = aser_e_urdu_comprehension / 2 * 100
	
	gen aser_e_m_minus_2digit_per = 100 if aser_e_maths_minus_2digit == "correct"
	replace aser_e_m_minus_2digit_per = 0 if aser_e_maths_minus_2digit == "incorrect"
	
	gen aser_e_m_minus_3digit_per = 100 if aser_e_maths_minus_3digit == "correct"
	replace aser_e_m_minus_3digit_per = 0 if aser_e_maths_minus_3digit == "incorrect"
	
	gen aser_e_m_100_200_per = aser_e_maths_100_200 / 5 * 100
	gen aser_e_m_10_99_per = aser_e_maths_10_99 / 5 * 100
	gen aser_e_m_1_9_per = aser_e_maths_1_9 /5 * 100
	
	gen aser_e_m_division_per = 100 if aser_e_maths_division == "correct"
	replace aser_e_m_division_per = 0 if aser_e_maths_division == "incorrect"
	
	gen aser_e_m_time_per = 100 if aser_e_maths_time == "correct"
	replace aser_e_m_time_per = 0 if aser_e_maths_time == "incorrect"
	
	gen aser_e_m_word_problem_per = 100 if aser_e_maths_word_problem == "correct"
	replace aser_e_m_word_problem_per = 0 if aser_e_maths_word_problem == "incorrect"
	
	gen aser_e_m_shape_name_per = 100 if aser_e_maths_shape_name == "correct"
	replace aser_e_m_shape_name_per = 0 if aser_e_maths_shape_name == "incorrect"
	
	gen aser_e_gk_act_1_per = 100 if aser_e_gk_action_1 == "correct"
	replace aser_e_gk_act_1_per = 0 if aser_e_gk_action_1 == "incorrect"
	
	gen aser_e_gk_act_2_per = 100 if aser_e_gk_action_2 == "correct"
	replace aser_e_gk_act_2_per = 0 if aser_e_gk_action_2 == "incorrect"
	
	gen aser_e_gk_pic_1_per = 100 if aser_e_gk_picture_1 == "correct" 
	replace aser_e_gk_pic_1_per = 100 if aser_e_gk_picture_1 == "incorrect" 
	
	gen aser_e_gk_pic_2_per = 100 if aser_e_gk_picture_2 == "correct" 
	replace aser_e_gk_pic_2_per = 100 if aser_e_gk_picture_2 == "incorrect" 
	
	gen aser_e_gk_pic_3_per = 100 if aser_e_gk_picture_3 == "correct" 
	replace aser_e_gk_pic_3_per = 100 if aser_e_gk_picture_3 == "incorrect" 

	
	unab varlist2: *per
	forval i = 1/`n' {
			
			local varname: word `i' of `varlist'
			local varlabel_old: var lab `varname'
			local varlabel_new = "`varlabel_old'_percentage_score"

			local varname: word `i' of `varlist2'
			lab var `varname' "`varlabel_new'"		
	}	
}
	
* Creating categorical variables , based on ASER’s ranking methodology 	

	gen aser_e_english = 0 if inrange(aser_e_eng_capital,0,3)
	replace aser_e_english = 1 if inrange(aser_e_eng_capital,4,5) & inrange(aser_e_eng_small,0,3)
	replace aser_e_english = 2 if inrange(aser_e_eng_capital,4,5) & inrange(aser_e_eng_small,4,5) & inrange(aser_e_eng_words,0,3)
	replace aser_e_english = 3 if inrange(aser_e_eng_capital,4,5) & inrange(aser_e_eng_small,4,5) & inrange(aser_e_eng_words,4,5) & inrange(aser_e_eng_read_sentences,0,3)
	replace aser_e_english = 4 if inrange(aser_e_eng_capital,4,5) & inrange(aser_e_eng_small,4,5) & inrange(aser_e_eng_words,4,5) & aser_e_eng_read_sentence == 4
	
	lab def eng_cat 0 "Nothing" 1 "Capital letters" 2 "Small letters" 3 "Word" 4 "Sentence"
	lab val aser_e_english eng_cat
	lab var aser_e_english "english score - categorical"
	
	gen aser_e_maths = 5 if aser_e_maths_minus_2digit == "incorect" & aser_e_maths_minus_3digit == "incorrect" & inrange(aser_e_maths_10_99,4,5) & inrange(aser_e_maths_100_200,0,3)
	replace aser_e_maths = 4 if aser_e_maths_minus_2digit == "corect" & aser_e_maths_minus_3digit == "correct" & aser_e_maths_division == "correct"
	replace aser_e_maths = 3 if aser_e_maths_minus_2digit == "corect" & aser_e_maths_minus_3digit == "correct" & aser_e_maths_division == "incorrect"
	replace aser_e_maths = 2 if aser_e_maths_minus_2digit == "incorect" & aser_e_maths_minus_3digit == "incorrect" & inrange(aser_e_maths_100_200,4,5) 
	replace aser_e_maths = 1 if aser_e_maths_minus_2digit == "incorect" & aser_e_maths_minus_3digit == "incorrect" & inrange(aser_e_maths_10_99,0,3) & inrange(aser_e_maths_1_9,4,5) & inrange(aser_e_maths_100_200,0,3) 
	replace aser_e_maths = 0 if aser_e_maths_minus_2digit == "incorect" & aser_e_maths_minus_3digit == "incorrect" & inrange(aser_e_maths_10_99,0,3) & inrange(aser_e_maths_1_9,0,3) & inrange(aser_e_maths_100_200,0,3)
	
	lab def math_cat 0 "Nothing" 1 "Recognise numbers 1 - 9" 2 "Recognise 100 - 200" 3 "subtraction" 4 "division" 5 "recognise numbers 11 - 99" 
	lab val aser_e_maths maths_cat
	lab var aser_e_maths "maths score - categorical"

	gen aser_e_urdu = 6 if aser_e_urdu_read_sentences == 4
	replace aser_e_urdu = 5 if aser_e_urdu_read_sentences != 4 & inrange(aser_e_urdu_words,4,5)
	replace aser_e_urdu = 4 if aser_e_urdu_read_sentences == 4 & aser_e_urdu_story_fluency == 5
	replace aser_e_urdu = 3 if aser_e_urdu_read_sentences == 4 & aser_e_urdu_story_fluency != 5
	replace aser_e_urdu = 2 if aser_e_urdu_read_sentences != 4 & inrange(aser_e_urdu_letters,4,5)
	replace aser_e_urdu = 1 if aser_e_urdu_read_sentences != 4 & inrange(aser_e_urdu_letters,1,3)
	
	lab def urdu_cat 1 "beginner" 2 "can read letters" 3 "paragraph" 4 "story" 5 "words" 6 "sentence"
	lab val aser_e_urdu urdu_cat
	lab var aser_e_urdu "urdu score - categorical"	
	
	replace school_name = ustrltrim(school_name)
	replace school_name = lower(school_name)
	replace school_name = subinstr(school_name, " ", "",.)
	replace school_name = subinstr(school_name, ".", "",.)
	
tempfile ASER_1_3_endline
save `ASER_1_3_endline', replace	

* Adjusting school names using the corrected school names provided by taleemabad. 
			/////////////////// 
		import excel "$user/$drive/$folder/Shared by Taleemabad/Schools/schoolcorrection_ASER_Endline.xlsx", firstrow clear	
		rename general_details_sectionschool_n school_name
		gen type = "Experimental" if treatment == 1
		replace type = "Controlled" if treatment == 2
		replace type = "Controlled" if treatment == .
		duplicates drop
		drop treatment
		rename ttype treatment_type
		tempfile schoolcorrection_ASER_Endline
		save `schoolcorrection_ASER_Endline', replace
			///////////////////	
	use `ASER_1_3_endline', clear
	merge m:1 school_name using `schoolcorrection_ASER_Endline', gen(m1)
		/*

    Result                           # of obs.
    -----------------------------------------
    not matched                            95
        from master                         0  (m1==1)
        from using                         95  (m1==2)

    matched                             2,436  (m1==3)
    -----------------------------------------

	*/
	drop if m1 == 2
	drop school_name
	rename corrected_school school_name
	drop m1
	
tempfile ASER_1_3_endline
save `ASER_1_3_endline', replace
export excel "$user/$drive/$folder/Output/Excel/ASER_1_3_Endline_Cleaned.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/ASER_1_3_Endline_Cleaned.dta", replace
}
********************************************************************************
{ //* ASER - ENDLINE (4-5):

import excel "$user/$drive/$folder/Shared by Taleemabad/Data/Endline/ASER_Test_4_5_CERP.xls", firstrow clear

* Cleaning operations:
	duplicates report _id // No duplicates
	count // 1864 Observations
	d
	
	rename general_details_sectionschool_n school_name
	rename general_details_sectiongender gender
	rename general_details_sectionStudent_ age_e
	rename general_details_sectiongrade grade
	
	rename (english_G4_5eng_read_sentences_ - english_G4_5eng_G2_5_capital_le) (aser_e_eng_sentences aser_e_eng_sentence_meaning aser_e_eng_story_fluency aser_e_eng_comprehension aser_e_eng_g1_3_sentence aser_e_eng_g1_3_sentence_meaning aser_e_eng_g1_3_words aser_e_eng_g1_3_meaning aser_e_eng_g1_3_small aser_e_eng_g1_3_capital) 
	
	rename (urdu_G4_5ud_story_fluency_G4_5 - urdu_G4_5masculine_feminine_G4_) (aser_e_urdu_story_fluency aser_e_urdu_comprehension aser_e_urdu_g1_3_story_fluency aser_e_urdu_g1_3_comprehension aser_e_urdu_grammar aser_e_urdu_word_sentences aser_e_urdu_read_sentences aser_e_urdu_g1_3_sen_fluency aser_e_urdu_g1_3_read_words aser_e_urdu_g1_3_read_letters aser_e_urdu_masculine_feminine)
	
	rename (maths_G4_5maths_minus_4digit - maths_G4_5maths_complete_patter) (aser_e_maths_minus_4digit aser_e_maths_minus_5digit aser_e_maths_division aser_e_maths_g1_3_minus_3dig aser_e_maths_g1_3_minus_2dig aser_e_maths_g1_3_division aser_e_maths_5digit_nums aser_e_maths_3digit_nums aser_e_maths_2digit_nums aser_e_maths_1digit_nums aser_e_maths_decimals aser_e_maths_time aser_e_maths_word_problem aser_e_maths_g1_3_wordprob aser_e_maths_complete_pattern)
	
	rename (general_knowledge_G4_5gk_pictur - Z) (aser_e_gk_action_1 aser_e_gk_action_2 aser_e_gk_picture_1 aser_e_gk_picture_2 aser_e_gk_picture_3) 
	
	unab varlist: aser_e*
	local n= wordcount("`varlist'")
	
* Creating test score variables

	gen aser_e_e_sent_per = aser_e_eng_sentences / 8 * 100 
	gen aser_e_e_sent_meaning_per = aser_e_eng_sentence_meaning / 8 * 100
	gen aser_e_e_story_flue_per = aser_e_eng_story_fluency / 5 * 100 
	gen aser_e_e_comp_per = aser_e_eng_comprehension / 2 * 100 
	gen aser_e_e_g1_3_sent_per = aser_e_eng_g1_3_sentence / 4 * 100 
	gen aser_e_e_g1_3_sen_mean_per = aser_e_eng_g1_3_sentence_meaning / 4 * 100 
	gen aser_e_e_g1_3_words_per = aser_e_eng_g1_3_words / 5 * 100  
	gen aser_e_e_g1_3_meaning_per = aser_e_eng_g1_3_meaning / 5 * 100 
	gen aser_e_e_g1_3_small_per = aser_e_eng_g1_3_small / 5 * 100 
	gen aser_e_e_g1_3_capital_per  = aser_e_eng_g1_3_capital / 5 * 100
	
	gen aser_e_u_story_flue_per = aser_e_urdu_story_fluency / 5 * 100  
	gen aser_e_u_comp_per = aser_e_urdu_comprehension / 2 * 100 
	gen aser_e_u_g1_3_storyflue_per = aser_e_urdu_g1_3_story_fluency / 5 * 100 
	gen aser_e_u_g1_3_compre_per = aser_e_urdu_g1_3_comprehension / 2 * 100 
	gen aser_e_u_grammar_per = 100 if aser_e_urdu_grammar == "correct"
	replace aser_e_u_grammar_per = 0 if aser_e_urdu_grammar == "incorrect"
	gen aser_e_u_word_sent_per = aser_e_urdu_word_sentences / 5 * 100
	gen aser_e_u_read_sent_per =  aser_e_urdu_read_sentences / 4 * 100
	gen aser_e_u_g1_3_sen_flue_per = aser_e_urdu_g1_3_sen_fluency / 5 * 100 
	gen aser_e_u_g1_3_read_words_per = aser_e_urdu_g1_3_read_words / 5 * 100 
	gen aser_e_u_g1_3_read_let_per = aser_e_urdu_g1_3_read_letters / 5 * 100 
	gen aser_e_u_mas_fem_per =aser_e_urdu_masculine_feminine / 2 * 100
	
	gen aser_e_m_minus_4digit_per = 100 if aser_e_maths_minus_4digit == "correct"
	replace aser_e_m_minus_4digit_per = 0 if aser_e_maths_minus_4digit == "incorrect"
	
	gen aser_e_m_minus_5digit_per = 100 if aser_e_maths_minus_5digit == "correct"
	replace aser_e_m_minus_5digit_per = 0 if aser_e_maths_minus_5digit == "incorrect"
	
	gen aser_e_m_division_per = 100 if aser_e_maths_division == "correct"
	replace aser_e_m_division_per = 0 if aser_e_maths_division == "incorrect"
	
	gen aser_e_m_g1_3_minus_3dig_per = 100 if aser_e_maths_g1_3_minus_3dig == "correct"
	replace aser_e_m_g1_3_minus_3dig_per = 0 if aser_e_maths_g1_3_minus_3dig == "incorrect"
	
	gen aser_e_m_g1_3_minus_2dig_per = 100 if aser_e_maths_g1_3_minus_2dig == "correct"
	replace aser_e_m_g1_3_minus_2dig_per = 0 if aser_e_maths_g1_3_minus_2dig == "incorrect"
	
	gen aser_e_m_g1_3_division_per = aser_e_maths_g1_3_division / 2 * 100
	
	gen aser_e_m_5digit_nums_per = aser_e_maths_5digit_nums / 5 * 100 
	
	gen aser_e_m_3digit_nums_per =  aser_e_maths_3digit_nums / 5 * 100
	
	gen aser_e_m_2digit_nums_per =  aser_e_maths_2digit_nums / 5 * 100
	
	gen aser_e_m_1digit_nums_per = aser_e_maths_1digit_nums / 5 * 100
	
	gen aser_e_m_decimals_per =  aser_e_maths_decimals / 5 * 100
	
	gen  aser_e_m_time_per = 100 if  aser_e_maths_time  == "correct"
	replace  aser_e_m_time_per = 0 if  aser_e_maths_time  == "incorrect"
	
	gen aser_e_m_word_problem_per = 100 if  aser_e_maths_word_problem  == "correct"
	replace  aser_e_m_word_problem_per = 0 if  aser_e_maths_word_problem  == "incorrect"
	
	gen aser_e_m_g1_3_wordprob_per = 100 if  aser_e_maths_g1_3_wordprob  == "correct"
	replace  aser_e_m_g1_3_wordprob_per = 0 if  aser_e_maths_g1_3_wordprob  == "incorrect"
	
	gen aser_e_m_complete_pat_per = 100 if  aser_e_maths_complete_pattern  == "correct"
	replace  aser_e_m_complete_pat_per = 0 if  aser_e_maths_complete_pattern  == "incorrect"
	
	gen aser_e_gk_act_1_per = 100 if aser_e_gk_action_1 == "correct"
	replace aser_e_gk_act_1_per = 0 if aser_e_gk_action_1 == "incorrect"
	
	gen aser_e_gk_act_2_per = 100 if aser_e_gk_action_2 == "correct"
	replace aser_e_gk_act_2_per = 0 if aser_e_gk_action_2 == "incorrect"
	
	gen aser_e_gk_pic_1_per = 100 if aser_e_gk_picture_1 == "correct" 
	replace aser_e_gk_pic_1_per = 100 if aser_e_gk_picture_1 == "incorrect" 
	
	gen aser_e_gk_pic_2_per = 100 if aser_e_gk_picture_2 == "correct" 
	replace aser_e_gk_pic_2_per = 100 if aser_e_gk_picture_2 == "incorrect" 
	
	gen aser_e_gk_pic_3_per = 100 if aser_e_gk_picture_3 == "correct" 
	replace aser_e_gk_pic_3_per = 100 if aser_e_gk_picture_3 == "incorrect" 

* Creating categorical variables , based on ASER’s ranking methodology 	

		gen aser_e_english_4_5 = 0 if inrange(aser_e_eng_g1_3_capital,0,3)
		replace aser_e_english_4_5 = 1 if inrange(aser_e_eng_g1_3_capital,4,5) & inrange(aser_e_eng_g1_3_small,0,3)
		replace aser_e_english_4_5 = 2 if inrange(aser_e_eng_g1_3_small,4,5) & inrange(aser_e_eng_g1_3_words,0,3)
		replace aser_e_english_4_5 = 3 if inrange(aser_e_eng_g1_3_words,4,5) & inrange(aser_e_eng_g1_3_sentence,0,2)
		replace aser_e_english_4_5 = 4 if inrange(aser_e_eng_sentences,6,8) & inrange(aser_e_eng_sentence_meaning,0,5)
		replace aser_e_english_4_5 = 4 if inrange(aser_e_eng_sentences,0,3) & inrange(aser_e_eng_g1_3_sentence,2,4)
		replace aser_e_english_4_5 = 4 if inrange(aser_e_eng_sentences,4,6)
		replace aser_e_english_4_5 = 5 if inrange(aser_e_eng_sentences,6,8) & inrange(aser_e_eng_sentence_meaning,6,8) & inrange(aser_e_eng_comprehension,0,1)
		replace aser_e_english_4_5 = 6 if inrange(aser_e_eng_sentences,6,8) & inrange(aser_e_eng_sentence_meaning,6,8) & aser_e_eng_comprehension == 2	
		
	lab def eng_cat_45 0 "Nothing" 1 "Capital letters" 2 "Small letters" 3 "Word" 4 "G2 Sentence" 5 "G5 Sentence" 6 "G5 Story"
	lab val aser_e_english_4_5 eng_cat_45
	lab var aser_e_english_4_5 "english score grades 4-5 - categorical"
	
	gen aser_e_urdu_4_5 = 0 if inrange(aser_e_urdu_g1_3_read_letters,0,3) 
	replace aser_e_urdu_4_5 = 1 if inrange(aser_e_urdu_g1_3_read_letters,4,5) & inrange(aser_e_urdu_g1_3_read_words,0,3)
	replace aser_e_urdu_4_5 = 2 if inrange(aser_e_urdu_g1_3_read_words,4,5) & inrange(aser_e_urdu_g1_3_sen_fluency,0,3)
	replace aser_e_urdu_4_5 = 3 if inrange(aser_e_urdu_g1_3_sen_fluency,4,5) & inrange(aser_e_urdu_read_sentences,2,4) & inrange(aser_e_urdu_story_fluency,0,3)
	replace aser_e_urdu_4_5 = 4 if inrange(aser_e_urdu_g1_3_story_fluency,4,5) & inrange(aser_e_urdu_story_fluency,0,3)
	replace aser_e_urdu_4_5 = 5 if inrange(aser_e_urdu_story_fluency,4,5)
	
	lab def urdu_cat_45 0 "Nothing" 1 "Letters" 2 "Words" 3 "G2 Sentence" 4 "G2 Story" 5 "G5 Story"
	lab val aser_e_urdu_4_5 urdu_cat_45
	lab var aser_e_urdu_4_5 "urdu score grades 4-5 - categorical"
	
	gen aser_e_maths_4_5 = 0 if aser_e_maths_5digit_nums < 4 & aser_e_maths_3digit_nums < 4 & aser_e_maths_2digit_nums < 4 & aser_e_maths_1digit_nums < 4
	replace aser_e_maths_4_5 = 1 if aser_e_maths_5digit_nums >= 4 & aser_e_maths_3digit_nums >= 4 & aser_e_maths_2digit_nums >= 4 & aser_e_maths_1digit_nums >= 4
	replace aser_e_maths_4_5 = 2 if aser_e_maths_g1_3_minus_3dig == "correct" & aser_e_maths_g1_3_minus_2dig == "correct"
	replace aser_e_maths_4_5 = 3 if aser_e_maths_minus_4digit == "correct" & aser_e_maths_minus_5digit == "correct"
	replace aser_e_maths_4_5 = 4 if aser_e_maths_minus_4digit == "correct" & aser_e_maths_minus_5digit == "correct" & aser_e_maths_division == "correct"
	
	lab def math_cat_45 0 "Nothing" 1 "Number Recognition" 2 "Subtraction-2/3" 3 "Subtraction-4/5" 4 "Division" 
	lab val aser_e_maths_4_5 maths_cat_45
	lab var aser_e_maths_4_5 "maths score grades 4-5 - categorical"
	
	
	unab varlist2: *per
	forval i = 1/`n' {
			
			local varname: word `i' of `varlist'
			local varlabel_old: var lab `varname'
			local varlabel_new = "`varlabel_old'_percentage_score"

			local varname: word `i' of `varlist2'
			lab var `varname' "`varlabel_new'"		
	}	
	
	replace school_name = ustrltrim(school_name)
	replace school_name = lower(school_name)
	replace school_name = subinstr(school_name, " ", "",.)
	replace school_name = subinstr(school_name, ".", "",.)
	
tempfile ASER_4_5_endline
save `ASER_4_5_endline', replace	
	
	merge m:1 school_name using `schoolcorrection_ASER_Endline', gen(m1)
		/*
    Result                           # of obs.
    -----------------------------------------
    not matched                           124
        from master                         0  (m1==1)
        from using                        124  (m1==2)

    matched                             1,864  (m1==3)
    -----------------------------------------
	*/
	
	drop if m1 == 2
	drop school_name
	rename corrected_school school_name
	drop m1
	
tempfile ASER_4_5_endline
save `ASER_4_5_endline', replace

export excel "$user/$drive/$folder/Output/Excel/ASER_4_5_Endline_Cleaned.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/ASER_4_5_Endline_Cleaned.dta", replace

}
********************************************************************************
{ //* MELQO - ENDLINE:
/*
import excel "$user/$drive/$folder/Shared by Taleemabad/Data/Endline/MELQO_V1_2023_08_08_04_24_27_693377.xlsx", firstrow clear


* Cleaning operations:
	duplicates report _id // No duplicates
	count // 4228 Observations
	d
	
	rename general_details_sectionschool_n school_name
	rename general_details_sectiongender gender
	rename general_details_sectionStudent_ age_e
	rename general_details_sectiongrade grade  
	rename general_details_sectionstudent_ name

	rename (expressive_vocabularyedibles_nu - expressive_vocabularyanimals_st) (melqo_e_expvocab_edibles_number melqo_e_expvocab_edibles_stated melqo_e_expvocab_animals_number melqo_e_expvocab_animals_stated)
	
	rename (pre_literacy_sectionletter_iden pre_literacy_sectionletter_soun) (melqo_e_prelit_letter_identify melqo_e_prelit_letter_sound)
	
	rename (listening_comprehension_story_se) (melqo_e_listening_comp_story)
	
	rename (name_writing_sectionname_writin name_writing_sectionincorrect_n) (melqo_e_name_writing melqo_e_incorrect_name)
	
	rename (motor_skills_sectionshape_1 motor_skills_sectionshape_2 motor_skills_sectionshape_3) (melqo_e_motorskills_shape1 melqo_e_motorskills_shape2 melqo_e_motorskills_shape3)
	
	rename (pre_numeracy_sectionverbal_coun pre_numeracy_sectionnumber_iden) (melqo_e_prenum_verbal_count melqo_e_prenum_number_identify)
	
	/*
	unab varlist: melqo_b*
	local n= wordcount("`varlist'")
	*/
	
* Creating test score variables	
	gen melqo_e_ev_edible_num_per = melqo_e_expvocab_edibles_number / 10 * 100
	gen melqo_e_ev_animal_num_per = melqo_e_expvocab_animals_numbe / 10 * 100

	gen melqo_e_pl_let_identify_per = melqo_e_prelit_letter_identify / 8 * 100
	gen melqo_e_pl_let_sound_per = melqo_e_prelit_letter_sound / 8 * 100
	gen melqo_e_listcomp_story_per = melqo_e_listening_comp_story / 5 * 100
	
	gen melqo_e_name_writing_per = 100 if melqo_e_name_writing == "correct"
	replace melqo_e_name_writing_per = 0 if melqo_e_name_writing == "incorrect"
	
	gen melqo_e_pn_verbal_count_per = melqo_e_prenum_verbal_count / 30 * 100
	gen melqo_e_pn_num_identify_per = melqo_e_prenum_number_identify/ 10 * 100
	
	gen melqo_e_ms_shape1_per = 100 if melqo_e_motorskills_shape1 == "all_criteria_met"
	replace melqo_e_ms_shape1_per = 50 if melqo_e_motorskills_shape1 == "missing_one_criteria"
	replace melqo_e_ms_shape1_per = 0 if melqo_e_motorskills_shape1 == "missing_more_than_one_criteria"

	gen melqo_e_ms_shape2_per = 100 if melqo_e_motorskills_shape2 == "all_criteria_met"
	replace melqo_e_ms_shape2_per = 50 if melqo_e_motorskills_shape2 == "missing_one_criteria"
	replace melqo_e_ms_shape2_per = 0 if melqo_e_motorskills_shape2 == "missing_more_than_one_criteria"

	gen melqo_e_ms_shape3_per = 100 if melqo_e_motorskills_shape3 == "all_criteria_met"
	replace melqo_e_ms_shape3_per = 50 if melqo_e_motorskills_shape3 == "missing_one_criteria"
	replace melqo_e_ms_shape3_per = 0 if melqo_e_motorskills_shape3 == "missing_more_than_one_criteria"
	
	
	/*
	unab varlist2: *per
	forval i = 1/`n' {
			
			local varname: word `i' of `varlist'
			local varlabel_old: var lab `varname'
			local varlabel_new = "`varlabel_old'per"

			local varname: word `i' of `varlist2'
			lab var `varname' "`varlabel_new'"		
	}
	*/
	gen school_name_trim = school_name
	lab var school_name_trim "school name in lower case wihtout spaces"
	replace school_name_trim = ustrtrim(school_name_trim)
	replace school_name_trim = lower(school_name_trim)
	replace school_name_trim = subinstr(school_name_trim, " ", "",.)
	replace school_name_trim = subinstr(school_name_trim, ".", "",.)


tempfile MELQO_endline
save `MELQO_endline', replace

	merge m:1 school_name_trim using `schoolcorrection_ASER', gen(m1)
		/*

    Result                           # of obs.
    -----------------------------------------
    not matched                         1,523
        from master                     1,406  (m1==1)
        from using                        117  (m1==2)

    matched                             2,822  (m1==3)
    -----------------------------------------

	*/
	drop if m1 == 2
	tab school_name_trim if corrected_school == "" // no observations
	replace corrected_school = school_name_trim if corrected_school == ""
	drop school_name_trim
	rename corrected_school school_name_trim
	drop m1
	
	merge m:1 school_name_trim using `schoolcorrection_2', gen(m1)
	drop if m1 == 2 // these schools are not present
	replace corrected_school = school_name_trim if corrected_school == "" // school names which are already correct
	drop school_name_trim
	rename corrected_school school_name_trim
	drop m1
	
	merge m:1 school_name_trim using `MELQO_baseline_school_var', gen(m1)
	/*

    Result                           # of obs.
    -----------------------------------------
    not matched                         2,263
        from master                     2,258  (m1==1)
        from using                          5  (m1==2)

    matched                             1,970  (m1==3)
    -----------------------------------------

	*/
	drop if m1 == 2
	drop m1
	
tempfile MELQO_endline
save `MELQO_endline', replace

export excel "$user/$drive/$folder/Output/Excel/MELQO_Endline_Cleaned.xlsx", firstrow(variable) replace
save "$user/$drive/$folder/Output/Stata/MELQO_Endline_Cleaned.dta", replace
*/
}
********************************************************************************

exit
