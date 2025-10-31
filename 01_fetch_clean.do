********************************************
* 01_fetch_clean.do
* Purpose: Download WDI data directly from World Bank API
********************************************

clear all
set more off

* ---- Download GDP per capita (constant 2015 US$) ----
import delimited using "https://api.worldbank.org/v2/en/indicator/NY.GDP.PCAP.KD?downloadformat=csv", clear
keep if strpos(countrycode, "WLD")==0  // remove world aggregate
rename (Country.Name Country.Code) (countryname countrycode)
rename Value gdp_pc
keep countrycode countryname year gdp_pc
destring gdp_pc, replace force
save "gdp_clean.dta", replace

* ---- Download Life Expectancy at birth ----
import delimited using "https://api.worldbank.org/v2/en/indicator/SP.DYN.LE00.IN?downloadformat=csv", clear
keep if strpos(countrycode, "WLD")==0
rename (Country.Name Country.Code) (countryname countrycode)
rename Value lifeexp
keep countrycode countryname year lifeexp
destring lifeexp, replace force
save "lifeexp_clean.dta", replace

* ---- Download Income Group metadata ----
import delimited using "https://databankfiles.worldbank.org/public/ddpext_download/CLASS.xls", clear
rename (CountryCode IncomeGroup) (countrycode income_group)
keep countrycode income_group
duplicates drop
save "income_clean.dta", replace
