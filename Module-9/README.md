# Module 9 – Data Analytics with Field Parameters

**DIO Power BI Analyst Bootcamp** | April 2026

---

## ⚠️ Important note on Power BI Service limitations

This project was built entirely in **Power BI Service on a Mac browser** — no Power BI Desktop was used. Field parameters are a feature that Power BI supports, but their interactive axis-binding behaviour does not function in the enhanced PBIR report format used by Service. This affected the core mechanic of this challenge.

Everything documented below reflects what was built, what worked, what didn't, and why. This is not a gap in understanding — it's an honest account of working within real constraints.

---

## What this project is

Module 9 builds on the report from Module 8. The brief: create at least two visuals using field parameters — one based on categories, one based on values — and present them as a client-facing page with a clear narrative.

The page is called **"Where Should We Grow?"** and was designed as a standalone presentation slide: interactive, analytical, and directed at a business decision-maker rather than a technical audience.

---

## Field parameters — what was built and what broke

### Category Parameter
A field parameter was created containing three dimensions: **Country**, **Product**, and **Segment**. The intent was for a slicer to dynamically switch the X axis of a bar chart between these three fields.

**What happened:** The parameter table and slicer were created successfully and appear correctly in the data model. However, in Power BI Service's PBIR format, the slicer does not drive the visual axis interactively. This is a confirmed Service/PBIR limitation — field parameter axis binding requires Power BI Desktop.

**Workaround:** The Category Parameter slicer was replaced with a standard **Country slicer** that filters two bar charts simultaneously. This achieves the same analytical intent — letting the viewer slice the data by a category — using a mechanism that actually works in Service.

### Value Parameter
A field parameter was created containing three measures: **Sales**, **Profit**, and **Units Sold**. The intent was for a slicer to dynamically switch the Y axis measure of a bar chart.

**What happened:** Same limitation as above — the value parameter slicer does not drive visual measures interactively in PBIR format. Additionally, dragging the parameter field into the Y axis caused Power BI to default to Count aggregation rather than Sum, producing incorrect results.

**Workaround:** The Value Parameter slicer was replaced with a **Year slicer** (2013/2014) that filters the Performance by Product chart. This gives the viewer a meaningful toggle — comparing product performance across years — without pretending a broken feature works.

---

## Conditional formatting — attempted and noted

The instructor demonstrated conditional formatting on bar colours to highlight negative profit values in red. This was attempted using the Rules-based format style in Service.

**What happened:** The rule was applied but affected axis labels rather than bar colours. The Gradient option worked but does not cleanly isolate negative values from positive ones.

**Decision:** Conditional formatting was dropped from the final page and noted here. The visual story is clear from bar length alone.

---

## What the page actually contains

**Page: Growth Opportunities (Page 7)**

Four visuals, two slicers, one narrative text box:

- **Sales by Segment** — horizontal bar chart showing which customer segments generate the most revenue. Government dominates across all markets.
- **Profit by Product** — horizontal bar chart showing profit margin by product. Paseo leads significantly; Carretera and Montana show thinner margins.
- **Performance by Product** — horizontal bar chart showing sales by product, filterable by year. Reveals how product rankings shifted between 2013 and 2014.
- **Country slicer** — filters Sales by Segment and Profit by Product simultaneously.
- **Year slicer** — filters Performance by Product.
- **"So what?" text box** — narrative context for the client before they interact with the visuals.

---

## Design

Consistent with the rest of the report — #1B0B2E background, #E91E8C for dominant values, #7B2D8B and #C2185B for supporting series, white titles.

---

## Repository

[github.com/EmilyCDOGuimaraes/power-bi-analyst-dio-bootcamp](https://github.com/EmilyCDOGuimaraes/power-bi-analyst-dio-bootcamp)

This project lives in `/Module-9/`.
