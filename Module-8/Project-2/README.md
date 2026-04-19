# Module 8 Project 2 – Sales & Profit Report with Data Analytics

**DIO Power BI Analyst Bootcamp** | April 2026

---

## What this project is

This report is a continuation of Module 8 Project 1 — rather than starting fresh, I extended the existing purple/fuchsia report into a full 6-page analytical experience. Pages 1 and 2 carry over from the previous project. Page 3 is an original page I created independently (not instructor-requested). Pages 4 through 6 were built for this challenge.

The brief asked for a report focused on data analytics, user experience, and visual cohesion. Every design decision — layout, colour, hierarchy, proportion — was made with that in mind.

---

## Report structure

**Page 1 — Sales Report**
Overview dashboard with KPI cards, sales by month, segment, product, and country. Includes bookmarks and a date slicer.

**Page 2 — Detailed Profit Report**
Profit breakdown by product, quarter, country, and year. Features a decomposition tree visual for hierarchical profit analysis.

**Page 3 — Not All Sales Are Equal** *(original page)*
A clustered bar comparing Gross Sales vs Profit by product. Built to challenge the assumption that top-selling products are also the most profitable. Paseo tells an interesting story here.

**Page 4 — Details**
Sales over time, quarterly matrix (2013/2014/Total), units sold and profit by product, and sales by discount band.

**Page 5 — TOPN & Outliers**
Scatter plot showing Sales, Units Sold, and Profit by product with a play axis by month. Stacked column showing Sales vs TOP3 Product contribution by country (using a custom DAX TOPN measure). Top 3 products by sales.

**Page 6 — Data Analytics**
Sales by semester, sales by month and year side-by-side, a Year-over-Year Growth KPI card (249%), and sales by segment broken down by year.

---

## DAX measures created

- **TOP3 PRODUCT** — calculates sales for the top 3 products using `TOPN` with `VALUES()` for filter context
- **YoY Growth %** — year-over-year sales growth using `CALCULATE` and `DIVIDE`
- **Semester** — calculated column classifying months 1–6 as Semester 1, 7–12 as Semester 2

---

## Design system

All pages use a consistent dark palette:

| Role | Hex |
|---|---|
| Page background | #1B0B2E |
| Card/canvas background | #3D1A6E |
| Primary accent | #7B2D8B |
| Secondary accent | #C2185B |
| Fuchsia highlight (Paseo) | #E91E8C |
| Light pink text | #F8BBD9 |
| Labels/titles | #FFFFFF |

Paseo is always highlighted in fuchsia across all product visuals — it's the dominant product by both volume and profit, and the design reinforces that consistently.

---

## Power BI Service limitations (Mac)

This entire report was built in **Power BI Service on a Mac browser** — no Power BI Desktop was used at any point. Some features are Desktop-only and were either substituted or documented:

| Feature | Status |
|---|---|
| Performance Analyzer | Desktop only — not available in Service |
| DAX Studio | Desktop only — standalone Windows app |
| AI clustering visuals | Desktop only — skipped |
| Sankey/flow chart | Desktop only — skipped |
| Smart narrative visual | Desktop only — skipped |
| Play axis (scatter animation) | Available in Service ✓ |

**Known limitation — TOPN filter context in PBIR format:**
The `TOP3 PRODUCT` measure was written using `VALUES(financials[Product])` to respect row context per country. In Power BI Service with the enhanced PBIR report format, `VALUES()` does not resolve per-category context the same way Desktop does — the measure returns the correct total sales figure but cannot isolate the top 3 products per country segment within the stacked column visual. This is a documented Service/PBIR limitation, not a DAX logic error. The measure works correctly at report level.

Working in Service-only is a deliberate constraint of this bootcamp environment. Where Desktop features were unavailable, the closest equivalent was used and noted. This is framed as a portfolio strength — adaptability under real-world constraints.

---

## Repository

[github.com/EmilyCDOGuimaraes/power-bi-analyst-dio-bootcamp](https://github.com/EmilyCDOGuimaraes/power-bi-analyst-dio-bootcamp)

Each module has its own folder. This project lives in `/Module-8/Project-2/`.
