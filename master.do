********************************************
* Master do-file: Economic Growth & Health Inequality
* Author: Navya Srivastava
* Date: October 2025
********************************************

clear all
set more off

do "01_fetch_clean.do"
do "02_merge_analyze.do"

display "✅ All steps completed successfully!"
