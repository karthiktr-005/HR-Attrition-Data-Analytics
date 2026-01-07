-- create database hr_analytics
CREATE SCHEMA hr_analytics;
USE hr_analytics;

-- create table hr_data
CREATE TABLE hr_data (
    Emp_id VARCHAR(10),
    Age INT,
    Gender VARCHAR(10),
    Department VARCHAR(50),
    JobRole VARCHAR(50),
    MonthlyIncome INT,
    OverTime VARCHAR(5),
    JobSatisfaction INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    Attrition VARCHAR(5)
);

-- import data from Excel (Cleaned_HR_Data) 

-- data exploration
SELECT 
    COUNT(*)
FROM
    hr_data;
    
SELECT 
    *
FROM
    hr_data
LIMIT 10;

-- Analyzing
-- Count the total employee
SELECT 
    COUNT(*) AS Total_Employee
FROM
    hr_data;

-- Count the total Attrition
SELECT 
    COUNT(*) AS Total_Attrition
FROM
    hr_data
WHERE
    attrition = 'Yes'; 

-- Calculate the Attrition Rate
SELECT 
    (COUNT(CASE
        WHEN Attrition = 'Yes' THEN 1
    END) * 100.0) / COUNT(*) AS attrition_Rate
FROM
    hr_data;

-- Attrition by department
SELECT 
    department, COUNT(*) AS Attrition_Count
FROM
    hr_data
WHERE
    attrition = 'Yes'
GROUP BY department;  

-- Overtime VS Attrition
SELECT 
    overtime, COUNT(*) AS Attrition_Count
FROM
    hr_data
WHERE
    Attrition = 'yes'
GROUP BY overtime; 
-- Employees doing overtime are leaving more -- ***



-- Salary VS Attrition
SELECT 
    CASE
        WHEN monthlyincome < 3000 THEN 'Low'
        WHEN monthlyincome BETWEEN 3000 AND 7000 THEN 'Medium'
        ELSE 'High'
    END AS Salary_Group,
    COUNT(*) AS Attrition_Count
FROM
    hr_data
WHERE
    attrition = 'yes'
GROUP BY salary_Group;

-- Experience VS Attrition 
SELECT 
    CASE
        WHEN yearsatcompany <= 3 THEN '0-3 Years'
        WHEN yearsatcompany <= 7 THEN '4-7 Years'
        ELSE '8+ Years'
    END AS Experience_Group,
    COUNT(*) AS Attrition_Count
FROM
    hr_data
WHERE
    Attrition = 'yes'
GROUP BY Experience_Group
