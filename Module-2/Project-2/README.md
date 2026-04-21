# Module 2 Project 2 – Car Repair Shop Database

**DIO Power BI Bootcamp** | April 2026

---

## What this project is

This is a from-scratch relational database for a car repair shop (oficina). Unlike Project 1 which had a starter ER diagram, this one was designed independently — from entity identification through to schema implementation, test data, and analytical queries.

The workflow is simple and real: a customer brings in a vehicle, a mechanic evaluates it, a service order is created, services and parts are assigned, and the order gets paid. The schema reflects exactly that.

---

## Schema overview

10 tables:

- `Customer` — customer record with type (PF/PJ)
- `Vehicle` — vehicle linked to customer, identified by plate
- `Mechanic` — mechanics with their specialty
- `Service` — service catalog with pricing
- `Parts` — parts catalog with pricing
- `ServiceOrder` — the core entity, linking vehicle and customer, with status and dates
- `Payments` — payment record per service order
- `ServiceOrder_has_Service` — which services are on which order (with quantity)
- `ServiceOrder_has_Parts` — which parts are used on which order (with quantity)
- `ServiceOrder_has_Mechanic` — which mechanics worked on which order

---

## ER Diagram

<img width="1594" height="955" alt="er_diagram_carshop" src="https://github.com/user-attachments/assets/940b1b61-ce3e-415d-bb9a-d20b1cbbfcd6" />

---

## SQL queries — business questions answered

Eight queries covering all required SQL clauses. Full script in `oficina_queries.sql`.

**Q1 — How many service orders per customer?**
LEFT JOIN + GROUP BY — includes customers with no orders.

**Q2 — What is the calculated total per order vs what was billed?**
Derived attribute using subqueries — sums service costs and parts costs separately then combines them, compared against the billed totalValue.

**Q3 — Which customers spent more than R$500?**
HAVING to filter aggregated spending after grouping by customer.

**Q4 — Which mechanics worked on which vehicles?**
Multi-table JOIN across Mechanic, ServiceOrder, and Vehicle.

**Q5 — Completed orders, most recent first**
WHERE to filter by status + ORDER BY completion date descending.

**Q6 — Parts breakdown per service order**
Shows each part used, quantity, unit price, and line total per order.

**Q7 — Orders that required more than one mechanic**
HAVING on mechanic count — identifies complex jobs.

**Q8 — Completed orders with no payment recorded**
LEFT JOIN + WHERE IS NULL — flags revenue that hasn't been collected yet.

---

## Live fiddle

https://www.db-fiddle.com/f/39nut7VG4gqvXCY8yjZEwq/4

---

## Files in this repository

- `oficina_schema.sql` — CREATE TABLE statements + test data
- `oficina_queries.sql` — all 8 SELECT queries with comments
- `er_diagram.png` — visual ER diagram
- `README.md` — this file

---

## Repository

[github.com/EmilyCDOGuimaraes/power-bi-analyst-dio-bootcamp](https://github.com/EmilyCDOGuimaraes/power-bi-analyst-dio-bootcamp)

This project lives in `/Module-2/Project-2/`.
