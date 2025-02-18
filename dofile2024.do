use "C:\Users\nares\Dropbox\PC\Downloads\Hh data.dta"
tab Rel,nofreq
tab Rel
tab Rel,freq
sort Rel
list Rel, nolabel
 tab rel, nolabel
tab Rel, nolabel
recode Rel (1/2 =1 "a") ( 3/4 =2 "b"), gen(aa)
tab aa
droap aa ==a
droap if aa==a
droap if aa="a"
drop if aa == "a"
drop if aa == "a"
droap aa
tab aa
drop aa
tab aa
tab Age if Age <= 20
tab PoR
tab PoR ==2
tab PoR if PoR == 2
tab Age PSL
tab Age PSL ,label
tab Age
tab Age, label
tab Age  PSL if PSL == 1
replace Age = 10 if missing(Age)
tab Age
set obs `=_N + 1'
replace Age = 10 if _n == _N
tab Age