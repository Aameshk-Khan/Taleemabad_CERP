<<dd_version: 2>>
<div style="text-align:justify;">  

<div style="text-align: center;">
   <span style="color: black; font-size: 25px; font-weight: bold;">Taleemabad Evaluation by CERP Analytics</span> 
</div>  

<br>
    
<span style="color: black; font-size: 20px;">Table of contents</span>  
<div style="page-break-after: always;">

1. Introduction    
2. Taleemabad's Evaluation  
2.1. Instrument and Data Collection  
2.2. Sampling and Measurement  
2.3. Summary of Results  
	2.3.1. ASER Grades 1 - 3  
	2.3.2. ASER Grades 4 - 5  
	2.3.3. MELQO  
3. Analytics by CERP  
3.1. Data Management  
3.2. Balance Test  
3.3. Results  
	3.3.1. ASER Grades 1 - 3  
	3.3.2. ASER Grades 4 - 5  
	3.3.3. MELQO  
3.4. Results using Truncated Sample  
	3.4.1. ASER Grades 1 - 3  
	3.4.2. ASER Grades 4 - 5  
	3.4.3. MELQO 	
4. Limitations of the design
5. Conclusion  
</div>  

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
<</dd_do>>
~~~~   

**1. Introduction**  

Taleemabad, an EdTech learning platform, is dedicated to creating educational content aligned with national standards to enhance student outcomes. The platform caters to both students and teachers through a proprietary learning platform that integrates content delivery, student assessment, and engagement with parents and school administration. The Learning Management System (LMS) is offered for licensing to small-scale entrepreneurs who facilitate the enhancement of existing school operations with effective pedagogical methods and administrative tools. The platform's content is accessible through a standalone Android app and is also broadcasted on TV and radio.

Taleemabad has collaborated with CERP for an external validation of their internal assessments. For this purpose, CERP has carried out an audit using the existing data that Taleemabad has collected. The following sections delve deeper into the specifics of both evaluations, highlighting their methodologies, analyses, and key differences. This comprehensive analysis provides valuable insights into the strengths and limitations of the approaches used and ultimately contributes to a more robust assessment of Taleemabad's impact on educational outcomes.

**2. Taleemabad's Evaluation**  

The primary objective of Taleemabad evaluation was to evaluate the effectiveness of its offerings. The evaluation was conducted through third-party standardized assessments of student learning outcomes and class observations. The assessment and observation processes extended to both Taleemabad schools and comparable "control" schools. Currently encompassing 140 schools, Taleemabad employs a random sampling method to randomly select schools for these assessments and observations. In contrast, the control schools are deliberately chosen based on their close geographical proximity to the treatment schools.  

**2.1. Instrument and Data Collection**  

Taleemabad utilized established assessment instruments to evaluate learning outcomes across different grade levels. For grades 1-3 and 4-5, the ASER ("Annual Status of Education Report") instrument was employed, which rigorously tests foundational skills in English, local languages (Urdu), and Mathematics. These instruments are widely recognized and validated for their application in low and middle-income countries.  

In the pre-primary grades, Taleemabad employed MELQO, a UNESCO-led global initiative aimed at measuring pupils' development and learning at the commencement of primary school, along with assessing the quality of pre-primary learning environments. MELQO assesses pre-numeracy, pre-literacy (English), and motor skills. Pre-numeracy evaluates a child's understanding of basic mathematical concepts such as counting and number recognition. Pre-literacy (English) assesses foundational reading and writing skills, including letter recognition and sounds. Additionally, fine motor skills are observed through pupils' ability to replicate shapes presented on paper, indicating promising levels of skill development.

**2.2. Sampling and Measurement**  

The evaluation involved a comprehensive data collection process conducted at baseline during October-November 2022 and at endline during April-May 2023. This timeframe corresponds with the commencement of the fall term for baseline and the conclusion of the academic year for endline. Taleemabad employed a two-step sampling strategy, initially selecting schools randomly in the experimental group and choosing nearby non-Taleemabad subscribing schools as controls.

During baseline, approximately 30 experimental schools were randomly chosen, but not all of them participated in the endline data collection due to exits from the Taleemabad program. These schools were replaced by comparable ones for the endline assessment. Consequently, the evaluation focused on differences between the treatment and control groups at both baseline and endline, presenting these differences in terms of standard deviations of the control group, and later utilizing the metric of Learning Adjusted Years of Schooling (LAYS). The assessments, specifically ASER administered to grades 1-3 and 4-5, utilized a consistent metric across waves as detailed below:  
<figure>
   <img src="ASER_grades_and_subjects.png" alt="ASER Image" width="600"/>
  <figcaption>Table 1: Metric used for analysing ASER Grades 1 - 3 and ASER Grades 4 - 5</figcaption>
</figure>

**2.3. Summary of Results**

**2.3.1. ASER Grades 1-3:**	

Overall, 50.7% of all Taleemabad students met the criteria for all 3 subjects compared to 29.4% of control students at endline. This indicated a difference of 0.46 standard deviations compared to the control group (1.58 LAYS).  

During baseline, the difference between Taleemabad and control students is statistically insignificant from zero for English and Mathematics. For Urdu, however, the difference was -13.6% between Taleemabad and control. At the endline, the difference between Taleemabad and control schools rises to 22.9% for English and 14.6% for Urdu (both significant at 5% level). For Mathematics, however, the difference is -2.9% (i.e. in favor of control schools, significant at 5% level). Expressed in standard deviations, Taleemabad students are 0.46 of a standard deviation above control schools for English and 0.29 standard deviations for Urdu, whereas the control schools are 0.07 of a standard deviation above Taleemabad schools at the endline.    

**2.3.2. ASER Grades 4-5:**  

Overall, 7.2% of all Taleemabad students met the criteria for all 3 subjects compared to 6.2% of control students at endline. For 2 subjects, this stood at 49.3% for Taleemabad and 46.8% for control. This indicated a difference of 0.05 standard deviations compared to the control group (0.4 LAYS).  

During baseline, the difference between Taleemabad and control students is statistically insignificant from zero for English and Mathematics. For Urdu, however, the difference was -8.7% between Taleemabad and control, meaning that control schools were at a higher level than intervention schools. At the endline, the difference between Taleemabad and control schools rises to 3.6% for English, 1.5% for Mathematics and 2.2% for Urdu (all significant at 5% level). Expressed in standard deviations, Taleemabad students are 0.11 of a standard deviation above control schools for English, 0.03 for Mathematics and 0.05 standard deviations for Urdu.    

**2.3.3. MELQO:**	

For MELQO, the difference between average scores obtained by treatment and control schools for pre-numeracy, pre-literacy and motor skills is calculated. A Threshold such as one for ASER is not imposed due to a lack of available guidelines. At baseline, Taleemabad schools outperformed control schools by ~6 percent of overall score in pre-numeracy but lagged behind control schools in pre-literacy and motor skills by 0.35% and 1.58% respectively. At the endline, the difference between Taleemabad and control schools reduced to ~4% in pre-numeracy whereas Taleemabad schools performed better than control schools in pre-literacy and motor skills by 1.6% and 3.4% respectively. These results are statistically significant at the 5% level. Expressed in standard deviations, the difference between Taleemabad and control schools is 0.16, 0.11 and 0.17 for pre-numeracy, pre-literacy and motor skills respectively  

**3. Analytics by CERP:**  

**3.1. Data Management**  
 
Taleemabad provided six student-level raw datasets which included data collected at baseline and endline for ASER grades 1 - 3, ASER grades 4 - 5, and MELQO. The data cleaning process of these datasets involved a series of systematic steps to enhance data quality and analytical reliability.  
<style>
  .list-item {
    margin-bottom: 10px; /* Adjust the value as needed for the desired spacing */
  }
</style>
<ol type = "I">
<div class="list-item">
<li>The first crucial step involved a thorough revision of variable names for bringing clarity and consistency across all six datasets. This meticulous effort significantly enhanced the usability of the data for subsequent analysis.</li>  
 </div>
<div class="list-item"> 
<li>Additionally, the school names needed a rigorous cleaning to standardize them across all six datasets. The correction files provided by Taleemabad mapped various spellings and discrepancies in the school names. Once consistent correct names were created, schools were assigned a unique id which was used to create a master school-level dataset that incorporated information from all baseline and endline datasets for ASER grades 1 - 3, ASER grades 4 - 5, and MELQO.</li>   
 </div>
<div class="list-item">  
<li>Furthermore, the raw student-level datasets included student marks for each question in the ASER instrument. To facilitate analysis, categorical variables were generated using the ASER ranking methodology for the respective grade levels. These variables categorized test scores into predefined groups, representing various levels of proficiency in English, Urdu, and Maths. Subsequently, dummy variables were created for each proficiency category, indicating whether a student belonged to a specific proficiency level. Due to the lack of guidelines regarding thresholds for MELQO, the percentage scores obtained by students for pre-numeracy, pre-literacy and motor skills are calculated.</li>   
 </div>
</ol>
Following the cleaning of endline and baseline data for ASER grades 1 - 3, ASER grades 4 - 5 and MELQO, the individual datasets were collapsed on school to create school level datasets. Consequently, dummy variables that were previously created for each proficiency category now indicate the proportion of students in each school belonging to specific proficiency levels. Similarly, pre-numeracy, pre-literacy and motor skills indicators now represented average percentage scores at school level. The baseline and endline school level datasets for ASER grades 1 - 3, ASER grades 4 - 5 and MELQO were merged on the basis of schools to create a school level master dataset.  

Sine not all schools during the baseline assessment were included in the endline, and new schools were introduced as replacements, a matching variable was created to categorize whether a school was present in the baseline, the endline, or both. Schools present in both baseline and endline assessments were labelled as "Consistent". Those exclusively present in the baseline were labeled as "Attrition," signifying their absence in the endline. Conversely, schools introduced in the endline were categorized as "Replacement."  
  
~~~~
<<dd_do: quietly>>
	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel_variables.dta", clear
	lab var treatment "Treatment Status"
	lab def treatment_ 0 "Control" 1 "Treatment"
	lab val treatment treatment_
	asdoc tab2 matching treatment, col save(tables_for_report.doc) replace
<</dd_do>>
~~~~
<figure>
    <img src="tab matching treatment.png" alt="tab1" width="320"/>
  <figcaption>Table 2: Categories of schools by Treatment status</figcaption>
</figure> 

Table 2 provided above demonstrates the distribution of schools categorized as Consistent, Attrition, and Replacement within both the treatment and control groups. The first row has frequencies; second row has column percentages. There are 97 unique schools in the master dataset, out of which 11 schools dropped after baseline and 44 schools were added as replacements at the endline stage. Out of 44 replacement schools, six schools were added to replace that the schools that were dropped after baseline. However, the number of replacement control schools is much higher due to two reasons. Firstly, when a treatment school dropped after baseline then nearby control school(s) were also introduced as replacements in addition to a treatment school. Secondly, ambiguous school names in the endline datasets which could not be corrected were consequently renamed as unknown and added to the control group. Both of these decisions were taken by Taleemabad.  

Furthermore, three schools were initially enrolled in the Taleemabad program at baseline but withdrew from the program but agreed to undergo the endline assessment. Hence, their treatment status changed from treatment in baseline to control in endline. Specifically, these schools have been regarded as control schools in both baseline and endline.  

In the full sample, there are 97 unique school out of which 33 are treatment schools and 64 are control schools. The truncated sample, which consists of Consistent schools only, contains 21 treatment schools and 21 control schools.  
 
**3.2. Balance Test**  

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	orth_out aser_b_english_Sentence aser_e_english_Sentence aser_b_math_Subtract aser_e_math_Subtract aser_b_urdu_Story aser_e_urdu_Story, by(treatment)
	
	orth_out aser_b_eng_4_5_G5Sentence aser_e_eng_4_5_G5Sentence aser_b_maths_4_5_Division aser_e_maths_4_5_Division aser_b_urdu_4_5_G5Story aser_e_urdu_4_5_G5Story, by(treatment)
	
	orth_out melqo_b_motor_skills melqo_b_pre_numeracy melqo_b_pre_literacy melqo_e_motor_skills melqo_e_pre_numeracy melqo_e_pre_literacy, by(treatment)
<</dd_do>>
~~~~
<figure>
    <img src="Balance Test.png" alt="tab1" width="620"/>
  <figcaption>Table 3: Balance Test</figcaption>
</figure> 

Table 3 indicates a lack of balance between treatment and control groups at baseline. Notably, differences in the number of students, proportion of male students, and outcome variables are evident. This imbalance is attributed to the non-random selection of control schools, based on proximity to treatment schools.  

**3.3. Results**  

This study evaluates the impact of the Taleemabad program on the student learning outcomes by comparing the mean differences in scores, in percentages, between the treatment and control groups at baseline and endline, and testing whether these differences are statistically significant. The following results pertain to the full sample of 97 schools.  

**3.3.1. ASER Grades 1 - 3**  
<figure>
    <img src="ASER Result_1_3.png" alt="tab1" width="600"/>
  <figcaption>Figure 1: Percentage Difference in Grade Threshold Clearing Between Treatment and Control Schools at Baseline and Endline using ASER Grades 1 - 3 instrument, comparing results by Taleemabad and CERP Analytics</figcaption>
</figure>

~~~~
<<dd_do: quietly>>
	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "aser_e_1_3_overall"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	
	qui summarize `a' if treatment == 0, detail
	local mean_control = round(r(mean),0.01)
	local sd_control = r(sd)

	qui summarize `a' if treatment == 1, detail
	local mean_treat = round(r(mean),0.01)

	* Calculate the difference at baseline
	local diff_std = round((( `mean_treat' - `mean_control' ) / `sd_control'), 0.001)
	local diff = round(( `mean_treat' - `mean_control' ),0.01)

	orth_out `a', by(treatment) compare test count
	
	* LAYS
	local LAYS = round((`diff_std' / 0.13),0.01)
	}
<</dd_do>>
~~~~
At endline, <<dd_display: "`mean_treat'">>% of treatment schools met the criteria for all 3 subjects compared to <<dd_display: "`mean_control'">>% of control schools. This represents a difference of <<dd_display: "`diff_std'">> standard deviations compared to the control group, which is equivalent to <<dd_display: "`LAYS'">> LAYS.   
~~~~
<<dd_do: quietly>>
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'),0.001)
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	orth_out `a' `b', by(treatment) compare test count
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	local diff_endline_std = -1 * `diff_endline_std'
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	orth_out `a' `b', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for Maths is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control schools for Maths is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations below control schools for Maths at endline. 
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "aser_b_urdu_Story"
	local var_e "aser_e_urdu_Story"
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.001)
	orth_out `a' `b', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for Urdu is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control schools for Urdu is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for Urdu at endline. 


**3.3.2. ASER Grades 4 - 5**   
<figure>
    <img src="ASER Result_4_5.png" alt="tab1" width="600"/>
  <figcaption>Figure 2: Percentage Difference in Grade Threshold Clearing Between Treatment and Control Schools at Baseline and Endline using ASER Grades 4 - 5 instrument, comparing results by Taleemabad and CERP Analytics</figcaption>
</figure>


~~~~
<<dd_do: quietly>>
	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "aser_e_4_5_overall"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	
	qui summarize `a' if treatment == 0, detail
	local mean_control = round(r(mean),0.01)
	local sd_control = r(sd)

	qui summarize `a' if treatment == 1, detail
	local mean_treat = round(r(mean), 0.01)

	* Calculate the difference at baseline
	local diff_std = round((( `mean_treat' - `mean_control' ) / `sd_control'),0.001)
	local diff = round(( `mean_treat' - `mean_control' ),0.01)

	orth_out `a', by(treatment) compare test count
	
	* LAYS
	local LAYS = round((`diff_std' / 0.130),0.01)
	}
<</dd_do>>
~~~~
At endline, <<dd_display: "`mean_treat'">>% of treatment schools met the criteria for all 3 subjects compared to <<dd_display: "`mean_control'">>% of control schools. This represents a difference of <<dd_display: "`diff_std'">> standard deviations compared to the control group, which is equivalent to <<dd_display: "`LAYS'">> LAYS.  
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "aser_b_eng_4_5_G5Sentence"
	local var_e "aser_e_eng_4_5_G5Sentence"
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	orth_out `a' `b', by(treatment) compare test count
	}
	
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for English is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control schools for English is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for English at endline. 
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "aser_b_maths_4_5_Division"
	local var_e "aser_e_maths_4_5_Division"
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	orth_out `a' `b', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for Maths is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control schools for Maths is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for Maths at endline. 

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "aser_b_urdu_4_5_G5Story"
	local var_e "aser_e_urdu_4_5_G5Story"
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	orth_out `a' `b', by(treatment) compare test count
	}
	
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for Urdu is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control schools for Urdu is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for Urdu at endline.  

**3.3.3. MELQO**  

<figure>
    <img src="MELQO Result.png" alt="tab1" width="600"/>
  <figcaption>Figure 3: Percentage Difference in Scores between Treatment and Control Schools at Baseline and Endline using MELQO, comparing results by Taleemabad and CERP Analytics</figcaption>
</figure>  
 
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "melqo_b_pre_literacy"
	local var_e "melqo_e_pre_literacy"
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	di "`diff_endline_std'"
	local diff_endline_std = -1 * `diff_endline_std'
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.05)
	di "`diff_endline'"
	orth_out `a' `b', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for pre-literacy is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control schools for pre-literacy is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations below control schools for pre-literacy at endline.  

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "melqo_b_pre_numeracy"
	local var_e "melqo_e_pre_numeracy"
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	orth_out `a' `b', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for pre-numeracy is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control schools for pre-numeracy is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for pre-numeracy at endline.  

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	
	local var_b "melqo_b_motor_skills"
	local var_e "melqo_e_motor_skills"
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	orth_out `a' `b', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for motor skills is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control schools for motor skills is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for pre-numeracy at endline.  


**3.4. Results using Truncated Sample**  

The following results pertain to the truncated sample of 42 consistent schools, with 21 schools part of the treatment group and an equivalent number part of the control group. 

**3.4.1. ASER Grades 1 - 3**  
<figure>
    <img src="ASER Result_1_3_truncated.png" alt="tab1" width="600"/>
  <figcaption>Figure 1: Percentage Difference in Grade Threshold Clearing Between Treatment and Control Schools at Baseline and Endline using ASER Grades 1 - 3 instrument</figcaption>
</figure> 

~~~~
<<dd_do: quietly>>
	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	keep if matching == 3
	local var_b "aser_e_1_3_overall"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	
	qui summarize `a' if treatment == 0, detail
	local mean_control = round(r(mean),0.01)
	local sd_control = r(sd)

	qui summarize `a' if treatment == 1, detail
	local mean_treat = round(r(mean),0.01)

	* Calculate the difference at baseline
	local diff_std = round((( `mean_treat' - `mean_control' ) / `sd_control'), 0.001)
	local diff = round(( `mean_treat' - `mean_control' ),0.01)

	orth_out `a', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At endline, <<dd_display: "`mean_treat'">>% of treatment schools met the criteria for all 3 subjects compared to <<dd_display: "`mean_control'">>% of control schools. This represents a difference of <<dd_display: "`diff_std'">> standard deviations compared to the control group. 

~~~~
<<dd_do: quietly>>
	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	keep if matching == 3
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	di "`diff_baseline'"
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'),0.001)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	di "`diff_endline'"
	orth_out `a' `b', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for English is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control schools for English is <<dd_display: "`diff_endline'">>% which is statistically significant at 5%. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for English at endline. 
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	keep if matching == 3
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	di "`diff_baseline'"
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	di "`diff_endline'"
	orth_out `a' `b', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for Maths is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control schools for Maths is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for Maths at endline. 
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	keep if matching == 3
	local var_b "aser_b_urdu_Story"
	local var_e "aser_e_urdu_Story"
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	di "`diff_baseline'"
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline') * 1000)/1000
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	di "`diff_endline'"
	orth_out `a' `b', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for Urdu is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control schools for Urdu is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for Urdu at endline. 


**3.4.2. ASER Grades 4 - 5**   
<figure>
    <img src="ASER Result_4_5_truncated.png" alt="tab1" width="600"/>
  <figcaption>Figure 2: Percentage Difference in Grade Threshold Clearing Between Treatment and Control Schools at Baseline and Endline using ASER Grades 4 - 5 instrument</figcaption>
</figure>

~~~~
<<dd_do: quietly>>
	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	keep if matching == 3
	local var_b "aser_e_4_5_overall"
	local n : word count `var_b'

	forvalues i = 1/`n' {
		
	local a : word `i' of `var_b'
	
	qui summarize `a' if treatment == 0, detail
	local mean_control = round(r(mean),0.01)
	local sd_control = r(sd)

	qui summarize `a' if treatment == 1, detail
	local mean_treat = round(r(mean), 0.01)

	* Calculate the difference at baseline
	local diff_std = round((( `mean_treat' - `mean_control' ) / `sd_control'),0.001)
	local diff = round(( `mean_treat' - `mean_control' ),0.01)

	orth_out `a', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At endline, <<dd_display: "`mean_treat'">>% of treatment schools met the criteria for all 3 subjects compared to <<dd_display: "`mean_control'">>% of control schools. This represents a difference of <<dd_display: "`diff_std'">> standard deviations compared to the control group. 

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	keep if matching == 3
	local var_b "aser_b_eng_4_5_G5Sentence"
	local var_e "aser_e_eng_4_5_G5Sentence"
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	di "`diff_baseline'"
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	di "`diff_endline'"
	orth_out `a' `b', by(treatment) compare test count
	}
	
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for English is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control schools for English is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for English at endline. 
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	keep if matching == 3
	local var_b "aser_b_maths_4_5_Division"
	local var_e "aser_e_maths_4_5_Division"
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	di "`diff_baseline'"
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	di "`diff_endline'"
	orth_out `a' `b', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for Maths is <<dd_display: "`diff_baseline'">>% which is statistically significant at the 5% level. At endline, the percentage difference between treatment and control schools for Maths is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for Maths at endline. 

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	keep if matching == 3
	local var_b "aser_b_urdu_4_5_G5Story"
	local var_e "aser_e_urdu_4_5_G5Story"
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	di "`diff_baseline'"
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	di "`diff_endline'"
	orth_out `a' `b', by(treatment) compare test count
	}
	
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for Urdu is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control schools for Urdu is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for Urdu at endline.  

**3.4.3. MELQO**   

<figure>
    <img src="MELQO Result_truncated.png" alt="tab1" width="600"/>
  <figcaption>Figure 6: Percentage Difference in Scores between Treatment and Control Schools at Baseline and Endline using MELQO</figcaption>
</figure>  
~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	keep if matching == 3
	local var_b "melqo_b_pre_literacy"
	local var_e "melqo_e_pre_literacy"
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	di "`diff_baseline'"
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	di "`diff_endline'"
	orth_out `a' `b', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for pre-literacy is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control schools for pre-literacy is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for pre-literacy at endline.  

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	keep if matching == 3
	local var_b "melqo_b_pre_numeracy"
	local var_e "melqo_e_pre_numeracy"
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	di "`diff_baseline'"
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	di "`diff_endline'"
	orth_out `a' `b', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for pre-numeracy is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control schools for pre-numeracy is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for pre-numeracy at endline.  

~~~~
<<dd_do: quietly>>

	use "$user/$drive/$folder/Output/Stata/MasterDataset_SchoolLevel.dta", clear
	keep if matching == 3
	local var_b "melqo_b_motor_skills"
	local var_e "melqo_e_motor_skills"
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
	local diff_baseline = round(( `mean_treat_baseline' - `mean_control_baseline' ),0.01)
	di "`diff_baseline'"
	
	* Endline calculations
	qui summarize `b' if treatment == 0, detail
	local mean_control_endline = r(mean)
	local sd_control_endline = r(sd)
	
	qui summarize `b' if treatment == 1, detail
	local mean_treat_endline = r(mean)

	* Calculate the difference at endline 
	local diff_endline_std = round((( `mean_treat_endline' - `mean_control_endline' ) / `sd_control_endline'), 0.001)
	di "`diff_endline_std'"
	local diff_endline = round(( `mean_treat_endline' - `mean_control_endline' ),0.01)
	di "`diff_endline'"
	orth_out `a' `b', by(treatment) compare test count
	}
<</dd_do>>
~~~~
At baseline, the percentage difference between treatment and control schools for motor skills is <<dd_display: "`diff_baseline'">>% which is statistically insignificant from zero. At endline, the percentage difference between treatment and control schools for motor skills is <<dd_display: "`diff_endline'">>% which is statistically insignificant from zero. Expressed in standard deviations, treatment schools are <<dd_display: "`diff_endline_std'">> standard deviations above control schools for pre-numeracy at endline.  

**4. Limitations of the design**    

<ol style="list-style-position: inside; padding-left: 0;" type = "I" >
  <li>
    Inability to Track Test Scores for the Same Student at Baseline and Endline:
    <p>One of the significant limitations of the evaluation design is the inability to consistently track test scores for the same student at both baseline and endline assessments. This constraint hinders our capacity to conduct comprehensive child-level analyses, which could provide valuable insights into individual progress over the course of the intervention. </p>
    <p>Additionally, due to the unavailability of test scores for the same student at baseline and endline, we are compelled to aggregate test scores at the school level for analysis. However, collapsing on the school level introduces a potential distortion in our findings as the average test scores at the school level may not accurately represent how individual children within the same school are actually performing. Variability in student performance is obscured, and the aggregated school-level analysis may provide a skewed representation of Taleemabad program's impact on educational outcomes.</p>
  </li>

  <li>
    Lack of Sufficient Data on External Factors:
    <p>Our evaluation design faces a challenge due to the insufficient availability of data on external factors. The absence of comprehensive information on variables, such as socio-economic status, family support, or prior educational experiences, poses a substantial obstacle to effectively isolating the treatment effect from other potential influences.</p>
    <p>For instance, without detailed data on socio-economic status, we may overlook how financial resources within households could independently impact a student's academic performance. If a student's improved outcomes align with an increase in parental involvement, discerning the isolated impact of the program becomes intricate. Household characteristics, including parental education levels or the availability of educational resources at home, could significantly influence a student's performance, but our current design lacks the granularity to account for these nuances.</p>
    <p>Consequently, the observed differences in means cannot be conclusively attributed to the treatment alone. This limitation not only undermines the internal validity of our study but also restricts the extent to which causal inferences can be drawn. The complexity introduced by unaccounted household characteristics highlights the need for more comprehensive data collection strategies to strengthen the robustness of our analysis and enhance the validity of our conclusions.</p>
  </li>

  <li>
    Inherent Difficulty in Establishing Causation:
    <p>The design's limitations extend to the broader issue of establishing causation. The lack of a controlled environment and comprehensive data on confounding variables, such as teacher quality or school resources, introduces complexities in confidently attributing changes in outcomes solely to the implemented treatment. For instance, improved educational outcomes may be linked not only to the Taleemabad program but also to unaccounted variations in teaching methods or additional resources allocated to specific schools.</p>
  </li>

  <li>
    Potential for Selection Bias in Selection of Control Schools:
    <p>A notable limitation in our study arises from the process of selecting control schools based on proximity to treatment schools. This method, though practical, introduces the potential for selection bias. The proximity-based selection of control schools may inadvertently lead to differences in contextual factors between treatment and control groups. Local variations in community characteristics and educational resources may exist impacting the baseline comparability of the two groups. Variations in characteristics between treatment and control groups may confound our ability to attribute observed changes solely to the Taleemabad program. </p>
  </li>
</ol>  

**5. Conclusion**

</div>


