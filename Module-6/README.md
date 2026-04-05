# Module 6 – Data Transformation with Power BI

> Part of the [DIO Power BI Analyst Bootcamp](https://www.dio.me/)

---

## Overview

The challenge was to take a relational company database, clean and transform it in Power Query, and set up relationships between tables in preparation for star schema modeling (Module 7).

The original instructions assumed an Azure MySQL instance — bypassed here due to Mac limitations. The Company database was loaded as CSVs via OneDrive directly into Power BI Service.

---

## Transformations in Power Query

| Step | What was done |
|------|--------------|
| Headers & data types | Verified and corrected across all tables |
| Salary column | Converted to decimal (double precision) |
| Null values | Employees with no Super_ssn identified as top-level managers, not data errors |
| Department managers | Confirmed all departments have an assigned manager |
| Project hours | Verified in the works_on table |
| Address column | Split into fragments, unnecessary columns removed |
| Employee + Department | Merged using employee as base table (Left Outer Join: Dno → Dnumber) |
| Manager names | Self-referencing merge (Super_ssn → Ssn) to bring manager names into employee table |
| Employee Name | First Name and Last Name combined into one column |
| Dept_Location | Department Name and Location combined to ensure unique department-location pairs |
| Group By | Data grouped to count employees per manager |
| Cleanup | Unnecessary columns removed across all tables |

---

## Relationships (Model View)
