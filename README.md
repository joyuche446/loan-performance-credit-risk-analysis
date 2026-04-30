# Loan Performance & Credit Risk Analysis | Excel Dashboard & KPI Insights
## Project Overview:
This project analyzes loan performance and credit risk using a simulated real-world lending dataset to understand portfolio health, borrower behavior, and financial trends.
It focuses on evaluating key metrics such as loan applications, funded amount, received amount, interest rates, and debt-to-income (DTI) to assess overall portfolio performance.
The analysis was conducted using Excel, SQL, and Tableau for data exploration, cleaning, and visualization.
## Business Problem:
Banks need to balance loan growth with credit risk. While approving more loans increases revenue, it also raises the risk of defaults and financial losses.
The challenge is to understand loan performance, identify risky borrowers, and improve lending decisions to maintain a healthy and profitable loan portfolio.
## Data Overview:
**Records:** 38,600 | Fields: 20+ (loan & borrower attributes)

**Key variables:** Loan Amount, Interest Rate, Loan Status (paid/default), Issue Date, Term, Grade (risk), Annual Income
Records: 38,600
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
This project includes multiple dashboards built in Excel and Tableau to explore loan performance, risk distribution, and borrower behavior.
Full set of dashboards available in the repository [`/images` folder.](https://github.com/joyuche446/loan-performance-credit-risk-analysis/tree/main/images)
## Skills:
* Data cleaning, validation & quality assessment (handling missing values, duplicates and formatting inconsistencies)
* Data transformation using Conditional Logic and Date/Time functions.
* Pivot Tables and Charts for data summarization, analysis & visual insights
* Feature Engineering(Categorical fields & Time-based variables)
* KPI calculations and Financial metrics development
* Dashboard development & data visualization(including slicers for interactive filtering)
* SQL (JOINS, Aggregation functions, filtering, CTEs and CASE statement for complex data analysis)
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
