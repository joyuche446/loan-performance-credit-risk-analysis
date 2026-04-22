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
* Data cleaning, validation & quality assessment (handling missing values, duplicates and formatting inconsistencies)
* Data transformation using Conditional Logic and Date/Time functions.
* Pivot Tables and Charts(data summarization, analysis & visual insights)
* Feature Engineering(Categorical fields & Time-based variables)
* KPI calculations and Financial metrics development
* Dashboard development & data visualization
* Slicers for interactive dashboard filtering
## Key Insights & Recommendations:
* Analyzed 38.6K loan applications
* 86.2% good loans generated $65.3M revenue
* 13.8% bad loans led to $28.2M losses, indicating credit risk
* Portfolio remains profitable (amount received > funded amount)
* Steady monthly growth in loan applications
* Credit cards are the most common loan purpose
* Borrowers with 10+ years employment take the highest loans

To improve loan performance and mitigate risk, the following actions are recommended:
* Strengthen underwriting criteria to better screen high-risk applicants and reduce default rates
* Implement risk-based pricing strategies, adjusting interest rates according to borrower risk profiles
* Continuously monitor repayment behavior to identify early signs of potential default
* Apply tighter controls on high-risk segments contributing most to loan defaults
* Enhance collections and loan restructuring processes to improve recovery of non-performing loans
* Increase focus on low-risk borrowers to sustain and grow profitability
* Align capital allocation and operational resources with the rising demand for loans
## Next Steps:
* Integrate additional variables such as income level, credit score, and employment history for deeper risk analysis
* Apply machine learning models to improve default prediction performance
* Validate results using external or larger datasets to ensure model robustness
