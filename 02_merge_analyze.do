********************************************
* 02_merge_analyze.do
* Purpose: Merge datasets and perform analysis
********************************************

clear all
set more off

use "gdp_clean.dta", clear
merge 1:1 countrycode year using "lifeexp_clean.dta", nogen
merge m:1 countrycode using "income_clean.dta", nogen

keep if year >= 2000 & year <= 2022

* GDP growth rate
bysort countrycode (year): gen gdp_growth = (gdp_pc - gdp_pc[_n-1]) / gdp_pc[_n-1] * 100

label var gdp_pc "GDP per capita (constant 2015 USD)"
label var lifeexp "Life Expectancy at Birth (years)"
label var gdp_growth "GDP per capita growth (%)"

save "merged_panel.dta", replace

* ---- Summary stats ----
summarize gdp_pc lifeexp gdp_growth
table income_group, c(mean gdp_pc mean lifeexp mean gdp_growth)

* ---- Regression ----
regress lifeexp gdp_pc gdp_growth i.income_group##c.year
