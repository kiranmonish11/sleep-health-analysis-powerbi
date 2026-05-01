-- ============================================
-- ANALYTICAL VIEWS
-- ============================================

-- 1. Sleep vs Stress Analysis
CREATE OR REPLACE VIEW SLEEP_STRESS AS
SELECT 
    StressLevel,
    AVG(SleepDuration) AS AvgSleep,
    AVG(QualityOfSleep) AS AvgQuality
FROM CLEAN_SLEEP
GROUP BY StressLevel;

-- 2. Activity vs Health
CREATE OR REPLACE VIEW ACTIVITY_HEALTH AS
SELECT 
    ActivityLevel,
    AVG(HeartRate) AS AvgHeartRate,
    AVG(DailySteps) AS AvgSteps
FROM CLEAN_SLEEP
GROUP BY ActivityLevel;

-- 3. BMI Impact
CREATE OR REPLACE VIEW BMI_ANALYSIS AS
SELECT 
    BMI_Category,
    AVG(SleepDuration) AS AvgSleep,
    AVG(StressLevel) AS AvgStress
FROM CLEAN_SLEEP
GROUP BY BMI_Category;

-- 4. Sleep Disorder Analysis
CREATE OR REPLACE VIEW DISORDER_ANALYSIS AS
SELECT 
    Sleep_Disorder,
    AVG(SleepDuration) AS AvgSleep,
    AVG(StressLevel) AS AvgStress,
    AVG(HeartRate) AS AvgHeartRate
FROM CLEAN_SLEEP
GROUP BY Sleep_Disorder;

-- 5. High-Risk Individuals
CREATE OR REPLACE VIEW RISK_GROUP AS
SELECT *
FROM CLEAN_SLEEP
WHERE StressLevel >= 7
  AND SleepDuration < 6;