Use bankloan;
-- Total Loan. App, Total Funded Amount and Total Received Amt on the basis of Home Ownership
SELECT * FROM financial_loan;
SELECT 
home_ownership,
COUNT(id) AS Total_Loan_App,
SUM(loan_amount) AS Total_Funded_Amt,
SUM(total_payment) AS Total_Received_Amt
FROM financial_loan
GROUP BY
home_ownership
ORDER BY home_ownership ASC;

SELECT * FROM financial_Loan

