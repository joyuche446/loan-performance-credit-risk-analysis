Use `bankloan`;
SELECT * FROM financial_loan;
-- Turning off SQL-safe_updates
SET SQL_SAFE_UPDATES = 0;
--  Cleaning up dirty issue date column by creating new clean column
/* UPDATE financial_loan
SET clean_issue_date = CASE
    WHEN issue_date LIKE '%/%/%' THEN STR_TO_DATE(issue_date, '%m/%d/%Y')
    WHEN issue_date LIKE '%-%-%' THEN STR_TO_DATE(issue_date, '%d-%m-%Y')
    ELSE NULL
END;
ALTER TABLE financial_loan
DROP issue_date;
ALTER TABLE financial_loan
CHANGE COLUMN clean_issue_date issue_date DATE;
*/
--  Cleaning up dirty last_credit_pull_date column by creating new clean column
/* UPDATE financial_loan
SET clean_last_credit_pull_date = CASE
    WHEN last_credit_pull_date LIKE '%/%/%' THEN STR_TO_DATE(last_credit_pull_date, '%m/%d/%Y')
    WHEN last_credit_pull_date LIKE '%-%-%' THEN STR_TO_DATE(last_credit_pull_date, '%d-%m-%Y')
    ELSE NULL
END;
*/
SELECT * FROM financial_loan;
/*ALTER TABLE financial_loan
CHANGE COLUMN clean_last_credit_pull_date last_credit_pull_date DATE; */

--  Cleaning up dirty last_payment_date column by creating new clean column
/*ALTER TABLE financial_loan
ADD COLUMN clean_payment_date DATE ;
*/
/*
UPDATE financial_loan
SET clean_payment_date = CASE
    WHEN last_payment_date LIKE '%/%/%' THEN STR_TO_DATE(last_payment_date, '%m/%d/%Y')
    WHEN last_payment_date LIKE '%-%-%' THEN STR_TO_DATE(last_payment_date, '%d-%m-%Y')
    ELSE NULL
END;
ALTER TABLE financial_loan
DROP last_payment_date;
*/
/* ALTER TABLE financial_loan
CHANGE COLUMN clean_payment_date last_payment_date DATE */

/* ALTER TABLE financial_loan
ADD COLUMN clean_next_payment DATE */
/* UPDATE financial_loan
SET clean_next_payment = CASE
    WHEN next_payment_date LIKE '%/%/%' THEN STR_TO_DATE(next_payment_date, '%m/%d/%Y')
    WHEN next_payment_date LIKE '%-%-%' THEN STR_TO_DATE(next_payment_date, '%d-%m-%Y')
    ELSE NULL
    END; */
    
/* ALTER TABLE financial_loan
DROP next_payment_date; */

/* ALTER TABLE financial_loan
CHANGE COLUMN clean_next_payment next_payment_date DATE */

-- Calculating KPIs/ Analysis

-- 1. KPI 1: Total Loan Application, MTD Loan.App and MoM Loan app. changes
-- Total Loan Applications
SELECT COUNT(*) AS Total_Loan_Application 
FROM financial_loan;

-- Total MTD Loan Applications
SELECT * FROM financial_loan;
SELECT COUNT(id) AS MTD_loans
FROM financial_loan
WHERE MONTH(issue_date)=12 AND YEAR(issue_date) =2021; -- Ans: 4314

-- Total PMTD Loan Applications
SELECT COUNT(id) AS PMTD_loans
FROM financial_loan
WHERE MONTH(issue_date)=11 AND YEAR(issue_date) =2021; -- Ans: 4035

-- MoM Loan Application
-- Formula for MoM = Month to Date-Previous Month To Date/Previous Month To Date
-- ((MTD-PMTD)/PMTD)*100
-- MTD  and PMTD were calculated above
WITH MTD_app AS(
SELECT COUNT(id) AS MTD_loans
FROM financial_loan
WHERE MONTH(issue_date)=12 AND YEAR(issue_date) =2021),
PMTD_app AS (SELECT COUNT(id) AS PMTD_loans
FROM financial_loan
WHERE MONTH(issue_date)=11 AND YEAR(issue_date) =2021)
SELECT 
((MTD_loans-PMTD_loans)/PMTD_loans)* 100 AS "%MoM Total Amt"
FROM MTD_app, PMTD_APP; -- ANS: 6.9145

-- KPI 2: Total Funded Amount, MTD Funded Amount and MoM Funded Amount changes
SELECT * FROM financial_loan;
-- Total Funded Amount
SELECT 
SUM(loan_amount) AS Total_Funded_Amt
FROM financial_loan; -- Ans: 435757075

-- MTD Funded Amount
SELECT * FROM financial_loan;
SELECT
SUM(loan_amount) AS Total_MTD_Funded_Amt
FROM financial_loan
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)= 2021; -- ANS: 53981425
-- PMTD Funded Amount
SELECT
SUM(loan_amount) AS Total_PMTD_Funded_Amt
FROM financial_loan
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)= 2021; -- ANS: 47754825

-- MoM Total Funded Amount
-- Formula: ((MTD-PMTD)/PMTD)*100
WITH MTD_FA AS(
SELECT SUM(loan_amount) AS Total_MTD_Funded_Amt
FROM financial_loan
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)= 2021),
PMTD_FA AS (
SELECT SUM(loan_amount) AS Total_PMTD_Funded_Amt
FROM financial_loan
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)= 2021) 

SELECT 
((Total_MTD_Funded_Amt-Total_PMTD_Funded_Amt)/Total_PMTD_Funded_Amt)*100 AS "%MoM Funded Amt"
FROM MTD_FA, PMTD_FA;
-- ANS: 13.0387

-- KPI 3: Total Amount Received, MTD Amount Received and MoM Loan Amount Received
-- Total Amount Received
SELECT * FROM financial_loan;
SELECT 
SUM(total_payment) AS Total_Amt_Received
FROM financial_loan; -- ANS: 473070933

-- MTD Total Amt Received
SELECT SUM(total_payment) AS Total_Amt_Received
FROM financial_loan
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)= 2021; -- ANS: 58074380

-- PMTD Total Amt Received
SELECT SUM(total_payment) AS Total_Amt_Received
FROM financial_loan
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)= 2021;

 WITH MTD_TAR AS(
SELECT SUM(total_payment) AS MTD_Total_Amt_Received
FROM financial_loan
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)= 2021),
PMTD_TAR AS (
SELECT SUM(total_payment) AS PMTD_Total_Amt_Received
FROM financial_loan
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)= 2021)

SELECT
 ((MTD_Total_Amt_Received-PMTD_Total_Amt_Received)/PMTD_Total_Amt_Received)*100 AS "%MoM%"
 FROM MTD_TAR,PMTD_TAR; -- ANS: 15.8429
 
 -- KPI 4: Average_Interest_Rate
 SELECT * FROM financial_loan;
 SELECT
 AVG(int_rate)*100 AS Avg_Interest_Rate
 FROM financial_loan; -- ANS: 12.048831397760178
 
 -- MTD Average_Interest_Rate
 SELECT
 AVG(int_rate)*100 AS MTD_Avg_Interest_Rate
 FROM financial_loan
 WHERE MONTH(issue_date)=12 AND YEAR(issue_date)= 2021;-- ANS: 12.356040797403738
 
 -- PMTD Average_Interest_Rate
 SELECT
 AVG(int_rate)*100 AS PMTD_Avg_Interest_Rate
 FROM financial_loan
 WHERE MONTH(issue_date)=11 AND YEAR(issue_date)= 2021; -- ANS: 11.941717472118796
 
 WITH MTD_AIR AS(
SELECT
 AVG(int_rate)*100 AS MTD_Avg_Interest_Rate
 FROM financial_loan
 WHERE MONTH(issue_date)=12 AND YEAR(issue_date)= 2021),
PMTD_AIR AS (
SELECT
 AVG(int_rate)*100 AS PMTD_Avg_Interest_Rate
 FROM financial_loan
 WHERE MONTH(issue_date)=11 AND YEAR(issue_date)= 2021)

SELECT
((MTD_Avg_Interest_Rate-PMTD_Avg_Interest_Rate)/PMTD_Avg_Interest_Rate)*100 AS "%MoM Avg_Int_Rate"
FROM MTD_AIR,PMTD_AIR; -- ANS: 3.469545534403177

 -- KPI 5: Average_DTI
 -- Avg_DTI
 SELECT* FROM financial_loan; -- ANS:
 SELECT
 AVG(dti)*100
 FROM financial_loan; -- ANS: 13.32743311903776
 
 -- MTD Avg_DTI
 SELECT
 AVG(dti)*100 AS MTD_Avg_Dti
 FROM financial_loan
 WHERE MONTH(issue_date)=12 AND YEAR(issue_date)= 2021;-- ANS: 13.66553778395922
 
 -- PMTD Average_Interest_Rate
 SELECT
 AVG(dti)*100 AS PMTD_Avg_Dti
 FROM financial_loan
 WHERE MONTH(issue_date)=11 AND YEAR(issue_date)= 2021; -- ANS: 13.302733581164853
 
 WITH MTD_ADTI AS(
SELECT
 AVG(dti)*100 AS MTD_DTI
 FROM financial_loan
 WHERE MONTH(issue_date)=12 AND YEAR(issue_date)= 2021),
PMTD_ADTI AS (
SELECT
 AVG(dti)*100 AS PMTD_DTI
 FROM financial_loan
 WHERE MONTH(issue_date)=11 AND YEAR(issue_date)= 2021)

SELECT
((MTD_DTI-PMTD_DTI)/PMTD_DTI)*100 AS "%MoM Avg_DTI"
FROM MTD_ADTI,PMTD_ADTI;-- ANS: 2.727290602196649

-- KPI: Good Loan Vs Bad Loan

SELECT DISTINCT loan_status
FROM financial_loan;
ALTER TABLE financial_loan
ADD COLUMN Loan_Quality TEXT;
ALTER TABLE financial_loan
DROP COLUMN Loan_Quality;
-- STEP 1: Creating Good and Bad Buckets
SELECT *,
    CASE 
        WHEN loan_status IN ('Fully Paid', 'Current') THEN 'Good'
        WHEN loan_status = 'Charged Off' THEN 'Bad'
        ELSE 'Unknown'
    END AS loan_quality
FROM financial_loan;
-- STEP 2: Calculting Good Loan Applications
-- Good Loan Applications
SELECT COUNT(*) AS Good_Loan_App
FROM (
    SELECT 
        CASE 
            WHEN loan_status IN ('Fully Paid', 'Current') THEN 'Good'
            WHEN loan_status = 'Charged Off' THEN 'Bad'
        END AS loan_quality
    FROM financial_loan
) t
WHERE loan_quality = 'Good';-- ANS: 33243

-- Good Loan Percentage
WITH Good_LAPP AS(SELECT COUNT(*) AS Good_Loan_App
FROM (
    SELECT 
        CASE 
            WHEN loan_status IN ('Fully Paid', 'Current') THEN 'Good'
            WHEN loan_status = 'Charged Off' THEN 'Bad'
        END AS loan_quality
    FROM financial_loan
) t
WHERE loan_quality = 'Good'),
Total_LAPP AS (SELECT COUNT(*) AS Total_Loan_Application 
FROM financial_loan)
SELECT 
(Good_Loan_App/Total_Loan_Application )*100 AS "%Good_Loan_App"
FROM GOOD_LAPP, Total_LAPP; -- 86.1753

-- Good_Loan_Funded_Amount
SELECT 
    SUM(loan_amount) AS_Good_Loan_Funded_Amt
FROM (
    SELECT 
        loan_amount,
        CASE 
            WHEN loan_status IN ('Fully Paid', 'Current') THEN 'Good'
            WHEN loan_status = 'Charged Off' THEN 'Bad'
        END AS loan_quality
    FROM financial_loan
) t
WHERE loan_quality = 'Good'; -- ANS: 370224850

-- Good_Loan_Total_Received_Amount
SELECT 
    SUM(total_payment) AS_Good_Loan_Total_Payment
FROM (
    SELECT 
        total_payment,
        CASE 
            WHEN loan_status IN ('Fully Paid', 'Current') THEN 'Good'
            WHEN loan_status = 'Charged Off' THEN 'Bad'
        END AS loan_quality
    FROM financial_loan
) t
WHERE loan_quality = 'Good'; -- ANS: 435786170
-- Calculating Bad Loan
SELECT COUNT(*) AS Bad_Loan_App
FROM (
    SELECT 
        CASE 
            WHEN loan_status IN ('Fully Paid', 'Current') THEN 'Good'
            WHEN loan_status = 'Charged Off' THEN 'Bad'
        END AS loan_quality
    FROM financial_loan
) t
WHERE loan_quality = 'Bad';-- ANS: 5333

-- Bad Loan_Percentage
WITH BAD_LAPP AS(SELECT COUNT(*) AS Bad_Loan_App
FROM (
    SELECT 
        CASE 
            WHEN loan_status IN ('Fully Paid', 'Current') THEN 'Good'
            WHEN loan_status = 'Charged Off' THEN 'Bad'
        END AS loan_quality
    FROM financial_loan
) t
WHERE loan_quality = 'Bad'),
Total_LAPP AS (SELECT COUNT(*) AS Total_Loan_Application 
FROM financial_loan)
SELECT 
(Bad_Loan_App/Total_Loan_Application )*100 AS "%Bad_Loan_App"
FROM Bad_LAPP, Total_LAPP;-- ANS:13.8247

-- Bad Loan Funded Amt
SELECT 
    SUM(loan_amount) AS_Bad_Loan_Funded_Amt
FROM (
    SELECT 
        loan_amount,
        CASE 
            WHEN loan_status IN ('Fully Paid', 'Current') THEN 'Good'
            WHEN loan_status = 'Charged Off' THEN 'Bad'
        END AS loan_quality
    FROM financial_loan
) t
WHERE loan_quality = 'Bad'; -- ANS: 65532225

-- Good_Loan_Total_Received_Amount
SELECT 
    SUM(total_payment) AS_Bad_Loan_Total_Payment
FROM (
    SELECT 
        total_payment,
        CASE 
            WHEN loan_status IN ('Fully Paid', 'Current') THEN 'Good'
            WHEN loan_status = 'Charged Off' THEN 'Bad'
        END AS loan_quality
    FROM financial_loan
) t
WHERE loan_quality = 'Bad';-- ANS:37284763
-- Loan Status Grid View
SELECT * FROM financial_loan;
SELECT 
    Loan_Status,
    COUNT(id) AS Total_Loan_App,
    SUM(loan_amount) AS Total_Funded_Amt,
    SUM(total_payment) AS Total_Amt_Received,
    AVG(int_rate)*100 AS AVG_Int_Rate,
    AVG(dti) *100 AS AVG_DTI,
    SUM(CASE 
        WHEN MONTH(issue_date)=12 AND YEAR(issue_date)=2021 
        THEN loan_amount 
        ELSE 0 
    END) AS MTD_Total_Funded_Amt,
    SUM(CASE 
        WHEN MONTH(issue_date)=12 AND YEAR(issue_date)=2021 
        THEN total_payment
        ELSE 0 
    END) AS MTD_Total_Received_Amt
FROM financial_loan
GROUP BY Loan_Status;

-- Total Loan. App, Total Funded Amot and Total Received Amt on the basis of Month
SELECT 
MONTH(issue_date),
MONTHNAME(issue_date),
COUNT(id) AS Total_Loan_App,
SUM(loan_amount) AS Total_Funded_Amt,
SUM(total_payment) AS Total_Received_Amt
FROM financial_loan
GROUP BY
MONTH(issue_date),
MONTHNAME(issue_date)
ORDER BY MONTH(issue_date) ASC;

-- Total Loan. App, Total Funded Amount and Total Received Amt on the basis of State
SELECT * FROM financial_loan;
SELECT 
address_state,
COUNT(id) AS Total_Loan_App,
SUM(loan_amount) AS Total_Funded_Amt,
SUM(total_payment) AS Total_Received_Amt
FROM financial_loan
GROUP BY
address_state
ORDER BY address_state ASC;

-- Total Loan. App, Total Funded Amount and Total Received Amt on the basis of State
SELECT * FROM financial_loan;
SELECT 
term,
COUNT(id) AS Total_Loan_App,
SUM(loan_amount) AS Total_Funded_Amt,
SUM(total_payment) AS Total_Received_Amt
FROM financial_loan
GROUP BY
term
ORDER BY term ASC;

-- Total Loan. App, Total Funded Amount and Total Received Amt on the basis of Employee Length
SELECT * FROM financial_loan;
SELECT 
emp_length,
COUNT(id) AS Total_Loan_App,
SUM(loan_amount) AS Total_Funded_Amt,
SUM(total_payment) AS Total_Received_Amt
FROM financial_loan
GROUP BY
emp_length
ORDER BY emp_length ASC;

-- Total Loan. App, Total Funded Amount and Total Received Amt on the basis of Purpose of Loan
SELECT * FROM financial_loan;
SELECT 
purpose,
COUNT(id) AS Total_Loan_App,
SUM(loan_amount) AS Total_Funded_Amt,
SUM(total_payment) AS Total_Received_Amt
FROM financial_loan
GROUP BY
purpose
ORDER BY purpose ASC;

