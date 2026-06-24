# Charlotte Mecklenburg Schools — ELA Student Assessment Analysis
 
Data Disclaimer: This dashboard uses synthetic data generated for demonstration purposes only. It does not represent real school or licensing information.---
 
## Overview
 
This project analyzes a synthetic Charlotte Mecklenburg Schools dataset of ~39,000 ELA student assessment records across grades 3 through 8. The goal is to surface insights around student achievement levels, performance trends over time, and school-level outcomes to support data-informed decisions around student success and resource allocation.
 
---
 
## Dataset
 
| Field | Detail |
|---|---|
| Source | Charlotte Mecklenburg Schools — Sample Data #9 (synthetic) |
| Scope | ELA assessments, grades 3–8, across 149 schools |
| Format | Excel (.xlsx), exported to CSV for SQL import |
| Rows | 38,987 |
| Key Columns | School_Student_ID, AchLevel_First, AchLevel_Final, TestName, GradeLevel, LEPCategory, RaceDescription, EC, School, Teacher, Achlevel, SchoolPerformanceArea, AnnualTarget26_27, Actual23_24, Actual24_25, Actual25_26, RankingTier |
 
Raw data files are not included in this repository. The dataset is confirmed synthetic and was provided for analysis purposes only.
 
---
 
## Project Structure
 
```
├── 01_inventory.sql          # Row counts, column inventory, initial structural checks
├── 02_duplicates.sql         # Duplicate detection on School_Student_ID
├── 03_missing_values.sql     # Null counts and handling decisions per column
├── 04_formatting.sql         # Type casting, text cleanup, GradeLevel flag column
├── 05_validity_checks.sql    # Range checks, categorical validation, cross-field logic
├── 06_integrity_check.sql    # Before/after row counts and totals comparison
├── schema.md                 # Table structure documentation (no raw data)
└── README.md
```
 
---
 
## Tools
 
- **PostgreSQL** — data cleaning, transformation, and analysis (via TablePlus)
- **Excel** — initial data inspection, formatting fixes, pivot table validation
- **Tableau Public** — dashboard and visualization
- **Notion** — full project documentation and findings log
---
 
## Key Questions Explored
 
1. Which schools and grade levels are furthest from their 2026/27 performance targets?
2. Are there meaningful achievement gaps across student subgroups (race, LEP status, EC status)?
3. Which schools show the strongest and weakest growth trends from 2023/24 to 2025/26?
4. How does RankingTier correlate with actual performance outcomes across SchoolPerformanceArea?
---
 
## Approach
 
Each SQL script is commented inline to document the reasoning behind each cleaning and analysis decision, not just the syntax. The goal is a fully auditable trail:
 
- **Inventory** — understand structure and scale of the raw data
- **Clean** — identify and resolve data quality issues, validate all columns, flag anomalies for data owner review
- **Analyze** — answer the key questions using aggregations, window functions, and self joins
- **Visualize** — communicate findings through a Tableau Public dashboard
---
 
## Cleaning Highlights
 
- **School_Student_ID:** resolved a scientific-notation precision issue traced to Excel's decimal formatting (2 decimal places instead of 0), which had caused 1,001 ID collisions in the original export. Corrected in the source file, verified zero duplicates via COUNTIF, PivotTable, and SQL GROUP BY checks.
- **GradeLevel vs TestName:** flagged 3 rows where GradeLevel and TestName don't agree (pending data owner confirmation). Excluded from grade-level-specific analysis, retained in school-wide totals.
- **Achlevel/NP:** confirmed NP represents the lowest achievement tier, with 81.3% of NP rows pairing with AchLevel_Final = 2. AchLevel_Final contains no 1s anywhere in the dataset.
- **Null check:** zero nulls or blanks across all 18 columns.
---
 
## Findings
 
Full findings documented in the project Notion page:
https://app.notion.com/p/384168307e8981c4bef6c7abce8b8709
 
---
 
## Dashboard
 
Tableau Public: https://public.tableau.com/views/CharlotteMecklenburgSchoolsELAAssessmentGrades/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link
 
---
 
## Contact
 
David Quick — davvis_quick@icloud.com
