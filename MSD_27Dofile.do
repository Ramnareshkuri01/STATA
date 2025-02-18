use "C:\Users\nares\OneDrive\Desktop\IIPS Coach\Study MSD\MSD_Semester-2\Extra\Nandita_mam\MSD_27\3_LASI_W1_Individual.dta"


*independent variables for socio-economic and demographic factors include:

*10. What are the socio-economic and demographic determinants of self-rated health among older adults?

//self-rated -ht001_a

//Socio-Economic Factors can be 

*Education level -dm008 ,Income - we020 ,Employment status- es008_1 ,Health insurance coverage paid by self -we318cs1

// Demographic Factors cqn be 

*Age -dm005  ,caste category -dm013 ,place of residence - residence  , covered with pension -we412, religion-dm010

ta we020
summarize we020
tab es008_1
ta we318c
ta we318cs1
ta dm005
ta dm007
ta dm013
ta residence
ta dm021
ta we412
tab ht001_a


*first we need to convert ht001_a into binary value 1.good or 2. bad by recide to run the logit

summarize ht001_a

tabulate ht001_a, missing
drop if ht001_a == .

ta ht001_a, nol

recode ht001_a (4/5=0 "Good") (1 2 3=1 "Bad"), gen(selfrated_health12)
ta selfrated_health12

recode dm005 (18/45=1 "Young") (46/116=2 "Old"), gen(age12)

recode dm008 (1/2=0 "Primary") (3/5=1 "Secondary") (6/9=2 "Higher"), gen(education12)

recode dm010 (2=2 "Hindu") (3=3 "Muslim") (4=4 "Christian") (1 5 6 7 8 9 10=1 "Others"), gen(religion12)

* recoding wealth quintile
recode mpce_quintile (1/2=1 "Poor") (3=2 "Middle") (4/5=3 "Rich"), gen(wealth)

logit selfrated_health12 i.age12 i.education12 i.dm013 i.residence i.religion12 i.wealth, or
	
// Interpretation 

/*
. logit selfrated_health12 i.age12 i.education12 i.dm013 i.residence i.religion12 i.wealth, or

Iteration 0:   log likelihood = -24052.708  
Iteration 1:   log likelihood =  -23398.44  
Iteration 2:   log likelihood = -23392.171  
Iteration 3:   log likelihood = -23392.171  

Logistic regression                                    Number of obs =  37,739
                                                       LR chi2(12)   = 1321.07
                                                       Prob > chi2   =  0.0000
Log likelihood = -23392.171                            Pseudo R2     =  0.0275

-----------------------------------------------------------------------------------------------
           selfrated_health12 | Odds ratio   Std. err.      z    P>|z|     [95% conf. interval]
------------------------------+----------------------------------------------------------------
                        age12 |
                         Old  |   .5295522   .0176612   -19.06   0.000     .4960439    .5653239
                              |
                  education12 |
                   Secondary  |   1.329555   .0318951    11.87   0.000     1.268489    1.393562
                      Higher  |   2.003876   .0860847    16.18   0.000     1.842061    2.179906
                              |
                        dm013 |
           2 Scheduled tribe  |   2.106092   .1025943    15.29   0.000     1.914312    2.317085
3 Other backward class (OBC)  |   1.109368   .0395106     2.91   0.004      1.03457    1.189574
              4 None of them  |   .9230707   .0339326    -2.18   0.029     .8589033     .992032
                              |
                    residence |
                     2 Urban  |   1.238556   .0288358     9.19   0.000     1.183308    1.296382
                              |
                   religion12 |
                       Hindu  |   .8526438   .0444398    -3.06   0.002     .7698446    .9443484
                      Muslim  |   .7465137   .0469261    -4.65   0.000     .6599803    .8443929
                   Christian  |   .7580737   .0493558    -4.25   0.000     .6672559    .8612525
                              |
                       wealth |
                      Middle  |   .9894737   .0313611    -0.33   0.738     .9298774     1.05289
                        Rich  |   .9171784   .0239337    -3.31   0.001     .8714486    .9653079
                              |
                        _cons |   2.831248   .1877696    15.69   0.000     2.486141    3.224259
-----------------------------------------------------------------------------------------------
Note: _cons estimates baseline odds.


Older people are less likely to rate their health as good (OR = 0.53).

As Higher education increases the odds of good health (OR = 1.33 for secondary, OR = 2.00 for higher).

For urban residents health is more likely 25% more better than rural

Scheduled Tribes have twice the odds (OR = 2.1) of good health compared to Scheduled Castes.

Hindus are having more good health (OR =0.86)then Christians(OR=0.75) and  Muslims(OR=0.76)


Wealth tells Rich people are  less likely (OR = 0.92) to rate their health as good.

Pseudo R² = 2.75%  which is a significant predictors.





*/


	
