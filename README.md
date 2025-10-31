# Economic Growth and Health Inequality Analysis

This Stata project analyzes the relationship between economic performance and health outcomes across countries using publicly available World Development Indicators (WDI) data from the World Bank. The workflow demonstrates a full empirical analysis pipeline — from automated data acquisition to data cleaning, merging, and regression-based exploration.

---

## 🔍 Overview

The project explores how changes in GDP per capita relate to life expectancy across income groups between 2000 and 2022. It highlights disparities and convergence patterns between developing and developed nations.

---

## ⚙️ Workflow

1. **`master.do`**  
   Runs the entire workflow automatically in sequence.

2. **`01_fetch_clean.do`**  
   - Fetches WDI data directly from the World Bank API  
   - Cleans and reshapes GDP and health data  
   - Saves clean intermediate files

3. **`02_merge_analyze.do`**  
   - Merges datasets  
   - Computes GDP growth rates  
   - Runs descriptive statistics and regression models  

---

## 📈 Outputs

- Clean datasets (`.dta` files) for GDP, life expectancy, and income groups  
- Merged dataset combining all indicators  
- Summary statistics and regression results printed in the Stata console

---

## 🧰 Requirements

- Stata 16 or newer  

---

**License:** MIT  
**Data Source:** [World Bank Open Data](https://data.worldbank.org/)
