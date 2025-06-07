# Pratice #
# 1) 1. Top-Rated Hospitals by State
SELECT State, `Hospital overall rating`, COUNT(*) AS hospital_count
FROM hospital_general_information
WHERE `Hospital overall rating` != 'Not Available'
GROUP BY State, `Hospital overall rating`
ORDER BY State, hospital_count DESC;


#2. Hospitals Offering Emergency Services
SELECT `Facility Name`, 'City/Town', State, 'County/Parish','Hospital Type', `Emergency Services`
FROM hospital_general_information
WHERE `Emergency Services` = 'Yes';

# 3) 3. Average Count of READM Measures by Ownership Type
SELECT `Hospital Ownership`, AVG(CAST(`Count of Facility READM Measures` AS UNSIGNED)) AS avg_readm_measures
FROM hospital_general_information
GROUP BY `Hospital Ownership`;

# 4)  Hospitals with Worst MORT Measures
SELECT `Facility Name`, State, `Count of MORT Measures Worse`, `Hospital Type`, `Hospital Ownership`
FROM hospital_general_information
Limit 8;

# 5)  Patient Experience Measure Availability
SELECT `Hospital Type`, 
       AVG(CAST(`Count of Facility Pt Exp Measures` AS UNSIGNED)) AS avg_patient_experience_measures
FROM hospital_general_information
GROUP BY `Hospital Type`
ORDER BY avg_patient_experience_measures DESC;

#Top cities with the most hospitals
SELECT `City/Town`, State, COUNT(*) AS hospital_count
FROM hospital_general_information
GROUP BY `City/Town`, State
ORDER BY hospital_count DESC
LIMIT 10;

#6.Correlation between overall rating and safety performance
SELECT `Hospital overall rating`, 
       AVG(CAST(`Count of Safety Measures Better` AS UNSIGNED)) AS avg_safety_better
FROM hospital_general_information
WHERE `Hospital overall rating` != 'Not Available'
GROUP BY `Hospital overall rating`
ORDER BY `Hospital overall rating`;










