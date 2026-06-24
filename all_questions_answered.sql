/*
Question 1: What is the current achievement gap in the achlevel column across
race?

Answer 1: A full-level gap exists. Hispanic (2.71) and Black (2.80) students
trail White (3.73) and Asian (3.68) by roughly one achievement level.
*/


SELECT
    racedescription,
    ROUND(AVG(achlevel_final), 2) AS avg_achlevel_final,
    COUNT(*) AS student_count,
    DENSE_RANK() OVER (ORDER BY AVG(achlevel_final) DESC) AS rank
FROM cms_sample_9
GROUP BY racedescription
ORDER BY rank ASC;


/*
Question 2: How do LEP and Non-LEP students compare on starting achievement,
final achievement, and growth?

Answer 2: LEP students start a full level lower (2.23 vs 3.26) and stay lower
at final (2.26 vs 3.27), but they grow slightly MORE (+0.03 vs +0.01). The gap
forms at the starting line, not from falling behind, so it is a baseline gap,
not a widening one.
*/

SELECT
    LEPCategory,
    ROUND(AVG(achlevel_first), 2) AS avg_start,
    ROUND(AVG(achlevel_final), 2) AS avg_final,
    ROUND(AVG(achlevel_final - achlevel_first), 2) AS avg_growth,
    COUNT(*) AS student_count
FROM cms_sample_9
GROUP BY LEPCategory;


/*
Question 3: Within each SchoolPerformanceArea, how do schools rank on
average student achievement (AchLevel_Final)?

Answer 3:
- Area 1 lowest three: School 4503, School 4776, School 5023
- Area 2 lowest three: School 6063, School 5959, School 5894
- Area 3 lowest three: School 7727, School 7844, School 7155
*/

WITH ranked AS (
SELECT
	school,
	schoolperformancearea,
	ROUND(AVG(achlevel_final), 2) AS avg_level_final,
	COUNT(*) AS student_count,
	DENSE_RANK() OVER(PARTITION BY schoolperformancearea ORDER BY AVG(achlevel_final) ASC) AS
	ranked_lowest_score
FROM cms_sample_9
GROUP BY school, schoolperformancearea
)

SELECT *
FROM ranked
WHERE ranked_lowest_score <= 10
ORDER BY schoolperformancearea, ranked_lowest_score;


/*
Question 4A:Question 4A: Does a school's racial composition relate to its overall
achievement? (between-school view)

Answer 4A: Strong negative relationship between a school's Hispanic+Black
share and its achievement (correlation about -0.90). Schools that are
85-97% Hispanic+Black average around 2.1-2.4, while schools at 15-20%
average around 4.0+. The lowest schools here are the same ones flagged in
Q3, so the gap from Q1 shows up structurally at the school level.
*/

WITH school_stats AS (
SELECT
	school,
	ROUND(AVG(achlevel_final), 2) AS avg_final,
	COUNT(*) AS student_count,
	COUNT(*) FILTER (WHERE racedescription IN ('Hispanic', 'Black')) AS hisp_black_count
FROM cms_sample_9
GROUP BY school
)

SELECT
	school,
	avg_final,
	student_count,
	ROUND(hisp_black_count * 100.00 / student_count, 1) AS pct_hisp_black
	FROM school_stats
	ORDER BY pct_hisp_black DESC;

/*
Question 4B: Does the racial achievement gap also appear WITHIN schools,
not just between them? (within-school view)

Answer 4B: The racial gap also appears WITHIN schools, not just between them.
Even in high-achieving schools, Hispanic and Black students trail their
schoolmates (in School 4711, Hispanic students average 3.32 vs White 4.16).
So the gap is not purely a school-resource issue, it travels with the
student group across schools.
*/

SELECT
    school,
    racedescription,
    ROUND(AVG(achlevel_final), 2) AS avg_final,
    COUNT(*) AS student_count
FROM cms_sample_9
GROUP BY school, racedescription
HAVING COUNT(*) >= 10
ORDER BY school, avg_final DESC;