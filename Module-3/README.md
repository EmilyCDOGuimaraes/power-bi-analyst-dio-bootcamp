# Module 3 – Xbox Game Pass Sales Dashboard

**DIO Power BI Analyst Bootcamp** | April 2026

---

## What this project is

Module 3 was originally taught using Excel Desktop — pivot tables, dynamic charts, the full Excel dashboard experience. Since I work entirely in Power BI Service on a Mac with no access to Excel Desktop, I rebuilt the same analytical exercise in Power BI instead.

Same data, same business questions, different tool. And honestly, a stronger output.

---

## The data

The dataset simulates Xbox Game Pass subscription records — subscriber IDs, plan tiers (Core, Standard, Ultimate), subscription types (Monthly, Quarterly, Annual), add-on purchases (EA Play and Minecraft Season Pass), coupon values, auto-renewal status, and total revenue per subscriber.

One thing worth flagging: the EA Play Season Pass Price column had mixed data types in the source file — numeric values where subscribers had the add-on, and dashes where they didn't. Power BI was reading the whole column as text. Fixed by converting the column type to decimal number in the data model before building any visuals.

---

## Business questions answered

The dashboard was designed around four questions:

- What is the total revenue across all subscriptions?
- Which plan tier (Core, Standard, Ultimate) generates the most revenue?
- How does revenue break down by subscription type, and how much of it auto-renews?
- How much revenue is coming from EA Play and Minecraft Season Pass add-ons?

---

## What's on the dashboard

**Total Sales KPI card** — top and centre, the headline number across all subscribers and plans.

**Total Value by Plan** — horizontal bar chart. Ultimate dominates, which makes sense given its price point and add-on inclusion.

**Total Value by Subscription Type + Auto Renewal** — clustered bar chart breaking down Monthly, Quarterly, and Annual revenue, split by whether the subscription auto-renews. Monthly is the largest revenue stream but has a significant non-renewal portion worth watching.

**EA Play Season Pass Revenue** — card showing total add-on revenue from EA Play subscribers.

**Minecraft Season Pass Revenue** — card showing total add-on revenue from Minecraft Season Pass subscribers.

**Plan Type slicer** — filters the entire dashboard by Core, Standard, or Ultimate so you can isolate each tier's performance.

---

## Design

Xbox brand colours throughout — no purple palette here, this dashboard has its own identity:

| Role | Hex |
|---|---|
| Canvas background | #0E0E0E |
| Primary accent | #22C55E |
| Secondary green | #9BC848 |
| Menu teal | #2AE6B1 |
| Negative / neutral | #E8E6E9 |

---

## Mac / Service constraints

Built entirely in Power BI Service on Mac. The original module used Excel Desktop features (pivot tables, dynamic named ranges, Excel-native charts) which are not available in browser Excel. Power BI Service was used as the equivalent tool — same analytical concepts, different execution environment.

---

## Repository

[github.com/EmilyCDOGuimaraes/power-bi-analyst-dio-bootcamp](https://github.com/EmilyCDOGuimaraes/power-bi-analyst-dio-bootcamp)

This project lives in `/Module-3/`.
