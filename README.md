# Customer Data Analysis 

## Project contents
- `01_Documentation_and_Final_Report/`: final report (editable DOCX and PDF) and project diary.
- `02_Dataset/`: source transaction CSV.
- `03_SQL_Queries/`: database setup, CSV staging/import instructions, and analysis queries.
- `04_PowerBI/`: Power BI dashboard.
- `05_Charts/`: exported chart image.
- `06_Presentation/`: project presentation.
- `07_Final_Submission/`: consolidated files intended for submission.

## Dataset facts verified from the supplied CSV
- Records: 99,457
- Columns: 10
- Earliest transaction date: 1 January 2021
- Latest transaction date: 8 March 2023
- Distinct transaction dates: 797
- The CSV date values use `DD-MM-YYYY` (for example, `10-07-2022`).
- All customer IDs in this file are unique. Accordingly, the dataset does not support repeat-customer retention or loyalty analysis.

## MySQL setup and safe date conversion
**Important:** Do not import the CSV `invoice_date` values directly into a MySQL `DATE` column. The source file uses `DD-MM-YYYY`, while MySQL date values are stored as `YYYY-MM-DD`. Importing directly can cause conversion errors or incorrect dates.

1. Open MySQL Workbench and connect to your local MySQL server.
2. Open and execute `03_SQL_Queries/00_Database_Setup.sql`. This creates the database, the final `customer` table (with a `DATE` column), and a `customer_staging` table (with a text date column).
3. In the Schemas panel, right-click `customer_staging` and choose **Table Data Import Wizard**.
4. Select `02_Dataset/Customer_Data_Analysis_Dataset.csv`.
5. Import into the existing `project_customer_segmentation.customer_staging` table. Confirm the CSV `invoice_date` field maps to `invoice_date_text` (VARCHAR), not to the final table's DATE column. Check that the other columns map in CSV header order.
6. Run the staging row-count and `invalid_date_rows` checks in `00_Database_Setup.sql`. The supplied file should produce 99,457 staging records and zero invalid dates.
7. Run the `INSERT INTO customer ... SELECT ... STR_TO_DATE(..., '%d-%m-%Y')` statement in the setup script. This explicitly converts the text dates into MySQL DATE values. The statement avoids inserting an invoice number already present in `customer`.
8. Run the final verification query. Expected results: 99,457 records, earliest date `2021-01-01`, latest date `2023-03-08`, and 797 distinct dates. If your results differ, stop and investigate before running the analysis queries.
9. Execute `Day_1_Customer_Data_Analysis.sql`, followed by `Day_2_Customer_Data_Analysis.sql`.

If you need to repeat the import from scratch, first make a backup, then clear both `customer` and `customer_staging` before importing again. Do not clear tables if you need to preserve existing data.

## Power BI
Open `04_PowerBI/Customer_Data_Analysis_Dashboard.pbix`. Configure the MySQL data source for `project_customer_segmentation.customer`, select **Refresh**, and verify that the refreshed model contains 99,457 rows and a maximum `invoice_date` of 8 March 2023. Save the refreshed PBIX only after confirming the refresh succeeds. Successful refresh depends on the local MySQL server, connector, credentials, and Power BI environment. The PBIX's runtime refresh and interactions must be checked in Power BI Desktop on the submission computer.

## Analysis definitions and limitations
- Revenue is calculated as `quantity * price`, summed across transaction records. This assumes `price` is a unit price.
- Customer IDs are unique in the supplied dataset. Do not describe the results as repeat-customer, retention, or loyalty analysis.
- The date range ends on 8 March 2023; it does not represent a complete 2023 calendar year.
- Results are descriptive and do not establish causation.
