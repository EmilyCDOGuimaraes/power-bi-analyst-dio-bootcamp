# Module 7 – Project 2: Star Schema with Financial Sample

> Part of the [DIO Power BI Analyst Bootcamp](https://www.dio.me/)

---

## Overview

This project transforms the Financial Sample single flat table into a proper star schema model using Power Query and DAX in Power BI Service.

---

## Tables created

**Financials_origin** — hidden backup of the original table, kept untouched as a reference.

**D_Products** — one row per product with aggregated sales metrics: average units sold, average/median/max/min sale values. Built using Group By in Power Query.

**D_Products_Details** — product-level detail: ID, discount band, sale price, units sold, manufacturing price.

**D_Discount** — discount information per product: discount band and discount values.

**D_Details** — remaining columns not covered by other dimension tables: sales, COGS, gross sales, manufacturing price, profit, and date fields.

**D_Calendar** — date dimension created entirely in DAX using `CALENDARAUTO()`, which scans the model and auto-generates the date range. Extended with calculated columns for Month Name, Month Number, Quarter, and Year.

**F_Sales** — central fact table with surrogate key (SK_ID) created via index column. Contains: segment, country, product, discount band, units sold, sale price, gross sales, profit.

---

## DAX used

```dax
D_Calendar = CALENDARAUTO()

Year = YEAR(D_Calendar[Date])
Month Number = MONTH(D_Calendar[Date])
Month Name = FORMAT(D_Calendar[Date], "MMM")
Quarter = QUARTER(D_Calendar[Date])
```

---

## Process notes

- All dimension tables created by duplicating the original Financial Sample table in Power Query and removing irrelevant columns
- Surrogate key (SK_ID) added to F_Sales via Add Column → Index Column
- D_Products aggregations built using Transform → Group By
- D_Calendar connected to F_Sales via Date column relationship (Many to One)
- Built entirely in Power BI Service (browser) on Mac — no Power BI Desktop used

---

## Tools

- Power BI Service (browser)
- OneDrive for Business
- Dataset: Financial Sample (Microsoft)
