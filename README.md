# Charlotte Mecklenburg Schools — [Project Title]

> Data analysis project completed as part of the Charlotte Mecklenburg Schools interview process.

---

## Overview

[Brief 2–3 sentence description of what this project analyzes and why it matters. Example: This project examines [dataset topic] to surface insights around [key theme]. The goal is to support data-informed decisions around [area of impact, e.g., student outcomes, attendance, resource allocation].]

---

## Dataset

| Field | Detail |
|---|---|
| **Source** | Charlotte Mecklenburg Schools — Sample Data |
| **Scope** | [Describe what the data covers, e.g., school year, grade levels, departments] |
| **Format** | [CSV / SQL dump / Excel] |
| **Rows** | [TBD after data review] |
| **Key Columns** | [TBD after data review] |

> Raw data files are not included in this repository due to confidentiality requirements.

---

## Project Structure

```
├── 01_inventory.sql          # Row counts, column inventory, initial structural checks
├── 02_duplicates.sql         # Duplicate detection and removal
├── 03_missing_values.sql     # Null counts and handling decisions
├── 04_formatting.sql         # Type casting, date standardization, text cleanup
├── 05_validity_checks.sql    # Range and categorical value checks
├── 06_integrity_check.sql    # Before/after row counts and totals comparison
├── schema.md                 # Table structure documentation (no raw data)
└── README.md
```

---

## Tools

- **PostgreSQL** — data cleaning, transformation, and analysis
- **Tableau** — data visualization and dashboard (link below)

---

## Key Questions Explored

1. [Question 1 — e.g., Which schools have the highest chronic absenteeism rates?]
2. [Question 2]
3. [Question 3]

---

## Approach

Each SQL script is commented inline to document the reasoning behind each cleaning and analysis decision — not just the syntax. The goal is a fully auditable trail:

1. **Inventory** — understand structure and scale of the raw data
2. **Clean** — remove duplicates, handle nulls, standardize formats, validate values
3. **Analyze** — answer the key questions using aggregations and joins
4. **Visualize** — build a Tableau dashboard to communicate findings

---

## Findings

[Brief summary of findings — fill in after analysis is complete.]

---

## Dashboard

Tableau Public link: [link here]

---

## Contact

**David Quick**
davvis_quick@icloud.com
