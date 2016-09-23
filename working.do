

cd C:\Users\JoeS\Desktop
import delimited "Test.txt", clear delimiter(tab) varnames(1)
compress
save test, replace

keep if name!=""
gen count=1
collapse (sum) count, by(name)

gen keep=0
replace keep=1 if name=="Starbucks" | name=="Starbucks Coffee"
replace keep=1 if name=="McDonald's"
replace keep=1 if name=="CVS" | name=="CVS Pharmacy"
replace keep=1 if name=="Subway"
replace keep=1 if name=="Exxon"
replace keep=1 if name=="Shell"
replace keep=1 if name=="Giant"
replace keep=1 if name=="Safeway"
replace keep=1 if name=="Sunoco"
replace keep=1 if name=="BP"
replace keep=1 if name=="Wendy's"
replace keep=1 if name=="Chipoltle"
replace keep=1 if name=="Burger King"
replace keep=1 if name=="Dunkin' Donuts"
replace keep=1 if name=="Pizza Hut"
replace keep=1 if name=="Target"
replace keep=1 if name=="Best Buy"
replace keep=1 if name=="Five Guys"
replace keep=1 if name=="IHOP"
replace keep=1 if name=="Cosi"
replace keep=1 if name=="Staples"
replace keep=1 if name=="Taco Bell"
replace keep=1 if name=="Panera Bread"
replace keep=1 if name=="Rite Aid" | name=="Rite-Aid"
replace keep=1 if name=="Walgreens"
replace keep=1 if name=="Au Bon Pain"
replace keep=1 if name=="Citgo"
replace keep=1 if name=="Chick-fil-A"
keep if keep==1

keep name count
merge 1:m name using test
drop if _merge==2
drop _merge

sort name
keep name count type id timestamp lon lat amenity addr*



