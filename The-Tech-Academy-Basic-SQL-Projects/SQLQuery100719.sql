/*DATABASE AND SQL COURSE
STEP 65 DRILL 1*/

USE db_zoo;
GO

SELECT habitat_id, habitat_type, habitat_cost

FROM tbl_habitat;


/*STEP 66 DRILL 2*/

SELECT species_name
FROM tbl_species
WHERE species_order = 3;


/*STEP 67 DRILL 3*/
SELECT nutrition_type
FROM tbl_nutrition
WHERE nutrition_cost <= 600;


/*STEP 68 DRILL 4*/
SELECT species_name
FROM tbl_species
WHERE species_nutrition >= 2202 AND species_nutrition <= 2206;


/*STEP 69 DRILL 5*/
SELECT species_name AS "SPECIES NAME:", nutrition_type AS "Nutrition Type:"
FROM tbl_species, tbl_nutrition;


/*STEP 70 DRILL 6*/
SELECT specialist_fname, 
	specialist_lname, 
	specialist_contact
FROM 
	tbl_specialist SP
JOIN tbl_species TS
JOIN tbl_care TC
	ON TS.species_care = TC.care_id 
	ON TC.care_specialist = SP.specialist_id
WHERE TS.species_name = 'penguin'

