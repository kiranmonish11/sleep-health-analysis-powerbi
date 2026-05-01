-- ============================================
-- DATA CLEANING & TRANSFORMATION
-- ============================================

-- Check for NULL values
SELECT *
FROM HEALTH
WHERE Sleep_Duration IS NULL 
   OR Quality_Of_Sleep IS NULL;

-- Create Clean View
CREATE OR REPLACE VIEW CLEAN_SLEEP AS
SELECT 
    Person_ID,
    Gender,
    Age,
    Occupation,
    
    -- Convert numeric fields
    TO_NUMBER(Sleep_Duration) AS SleepDuration,
    TO_NUMBER(Quality_Of_Sleep) AS QualityOfSleep,
    TO_NUMBER(Physical_Activity_Level) AS ActivityLevel,
    TO_NUMBER(Stress_Level) AS StressLevel,
    
    BMI_Category,
    
    -- Split Blood Pressure into Systolic / Diastolic
    TO_NUMBER(SUBSTR(Blood_Pressure, 1, INSTR(Blood_Pressure,'/')-1)) AS Systolic_BP,
    TO_NUMBER(SUBSTR(Blood_Pressure, INSTR(Blood_Pressure,'/')+1)) AS Diastolic_BP,
    
    TO_NUMBER(Heart_Rate) AS HeartRate,
    TO_NUMBER(Daily_Steps) AS DailySteps,
    
    Sleep_Disorder
FROM HEALTH
WHERE Sleep_Duration IS NOT NULL;