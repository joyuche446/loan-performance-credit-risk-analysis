# Loan Performance & Credit Risk Analysis | Excel Dashboard & KPI Insights
## Project Overview:
This project analyzes loan performance and credit risk using a simulated real-world lending dataset. The goal is to understand portfolio health, borrower behavior, and key financial trends.
The same analysis was carried out using Excel, SQL, and Tableau to show consistency in results across different tools.
Excel was used for initial exploration and building dashboards. SQL was used to clean the data and calculate key metrics like loan performance, funding, and repayment trends. Tableau was then used to create interactive dashboards for visual analysis of risk, performance, and trends over time.
Across all tools, key metrics such as loan applications, funded amount, repayment behavior, interest rates, and debt-to-income (DTI) were analyzed to understand overall loan portfolio performance.
## Business Problem:
Banks need to balance loan growth with credit risk. While approving more loans increases revenue, it also raises the risk of defaults and financial losses.
The challenge is to understand loan performance, identify risky borrowers, and improve lending decisions to maintain a healthy and profitable loan portfolio.
## Data Overview:
Records: 38,600

Fields: 20+ columns (loan and borrower attributes)

**Key Variables:**

Loan Amount – Total amount issued to the borrower

Interest Rate – Rate applied to each loan

Loan Status – Indicates whether the loan is fully paid or defaulted

Issue Date – Date the loan was issued

Term – Duration of the loan

Grade / Risk Category – Credit risk classification

Annual Income – Borrower’s reported income
## Methodology:
* Data was cleaned and standardized using SQL and Excel, including date conversion, duplicate checks, and data validation.
* Exploratory analysis was performed using SQL queries and Excel pivot tables to identify trends and key relationships.
* Feature engineering of calculated fields was applied to create KPIs, time-based metrics (MTD, MoM), and loan risk classifications.
* Final insights were visualized through interactive dashboards in Excel and Tableau, with results validated across all tools for consistency.
## Key Calculations & Metrics:
* **Total Loan Applications:** Measures overall lending activity by counting unique loan records.
* **Total Funded Amount:** Represents total capital disbursed to borrowers across all approved loans.
* **Total Amount Received:** Captures total repayments received, reflecting cash flow performance.
* **Average Interest Rate:** Indicates the average cost of borrowing across the portfolio.
* **Average Debt-to-Income (DTI) Ratio:** Evaluates borrower financial stability and repayment capacity.
* **Month-to-Date (MTD) Metrics:** Tracks performance (applications, funding, repayments) within the selected month for real-time monitoring.
* **Month-over-Month (MoM) Growth:** Measures percentage change in key metrics compared to the previous month to assess performance trends.
## Dashboard:
The project includes Excel and Tableau dashboards built on the same dataset with identical KPIs.
Each tool contains 3 views:
Summary: Key KPIs (applications, funding, repayments, risk)
Overview: Trends and borrower segmentation
Details: Loan-level breakdown and filtering

Tableau: Interactive analysis with drill-downs
Excel: Pivot-based KPI reporting and validation

Both dashboards deliver the same insights with different levels of interactivity.
## Skills:
Data cleaning (handling missing values, duplicates and formatting inconsistencies)
Data transformation using Conditional Logic and Date/Time functions.
Pivot Tables for data summarization and analysis
Pivot charts for visual insights
Slicers for interactive dashboard filtering
KPI calculations and performance metrics development
Dashboard creation and data visualization
