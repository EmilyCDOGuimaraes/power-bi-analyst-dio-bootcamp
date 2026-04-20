# Module 2 Project 1 – E-commerce Logical Database Schema

**DIO Power BI Bootcamp** | April 2026

---

## What this project is

This project takes an E-commerce conceptual ER model and turns it into a working relational database — schema design, data insertion, and analytical queries included.

The starting point was a conceptual diagram showing entities like Customer, Product, Order, Supplier, Seller, Stock, and their relationships. The task was to map that into a proper relational schema, refine it with three specific business rules, populate it with test data, and then write meaningful SQL queries to answer real business questions.

---

## Business rules applied

Three refinements were required beyond the base model:

**1. Customer PF vs PJ** — A customer account can be either an individual (Pessoa Física) or a company (Pessoa Jurídica), but never both. Implemented using a base `Customer` table with a `type` ENUM field, and two separate tables `CustomerPF` (with CPF, name, date of birth) and `CustomerPJ` (with CNPJ and company name), each linked back to Customer via foreign key.

**2. Multiple payment methods** — A single order can have more than one payment method registered. Implemented by making `Payment` a separate table with a foreign key to `Orders`, allowing multiple rows per order.

**3. Delivery tracking** — Each order has a delivery record with a status field and a tracking code. Implemented as a dedicated `Delivery` table linked to `Orders`.

---

## Schema overview

13 tables total:

- `Customer` — base customer record with type (PF/PJ)
- `CustomerPF` — individual customer details (CPF, name, date of birth)
- `CustomerPJ` — company customer details (CNPJ, company name)
- `Orders` — order records linked to customers
- `Payment` — one or more payment methods per order
- `Delivery` — delivery status and tracking code per order
- `Product` — product catalog
- `Supplier` — suppliers with CNPJ
- `Seller` — third-party sellers
- `Stock` — stock locations
- `ProductHasSupplier` — which products come from which suppliers
- `ProductHasStock` — which products are in which stock locations
- `ProductHasOrders` — which products are in which orders (with quantity and unit price)
- `SellerHasProduct` — which sellers carry which products

See the ER diagram below for the full relationship map.

---

## ER Diagram

<img width="1374" height="1247" alt="er_diagram" src="https://github.com/user-attachments/assets/689f5bf1-9cd8-4cb9-82ce-77e4604ab81c" />


---

## SQL queries — business questions answered

Eight queries were written covering all required SQL clauses. The full script is in `ecommerce_queries.sql`.

**Q1 — How many orders did each customer make?**
Uses `LEFT JOIN` and `GROUP BY` to count orders per customer, including customers with zero orders.

**Q2 — What is the total value of each order?**
Calculates a derived attribute: `SUM(quantity × unitPrice) + shippingCost` per order.

**Q3 — Which customers spent more than R$1,000?**
Uses `HAVING` to filter aggregated totals after grouping by customer.

**Q4 — Products, their suppliers, and stock locations**
Multi-table `JOIN` across Product, Supplier, and Stock through junction tables.

**Q5 — Delivered orders, most recent first**
Uses `WHERE` to filter by status and `ORDER BY` to sort by date descending.

**Q6 — Any seller that is also a supplier?**
Joins Seller and Supplier on company name to check for overlap.

**Q7 — Delivery status and tracking per order**
Joins Orders, Customer, and Delivery to show full delivery picture per order.

**Q8 — Payment methods per order**
Uses `GROUP_CONCAT` to list all payment methods used in each order.

---

## Live fiddle

Schema and queries are available to run interactively here:
[db-fiddle.com/f/39nut7VG4gqvXCY8yjZEwq/2](https://www.db-fiddle.com/f/39nut7VG4gqvXCY8yjZEwq/2)

---

## Files in this repository

- `ecommerce_schema.sql` — CREATE TABLE statements + test data INSERT statements
- `ecommerce_queries.sql` — all 8 SELECT queries with comments
- `er_diagram.png` — visual ER diagram of the schema
- `README.md` — this file

---

## Repository

[github.com/EmilyCDOGuimaraes/power-bi-analyst-dio-bootcamp](https://github.com/EmilyCDOGuimaraes/power-bi-analyst-dio-bootcamp)

This project lives in `/Module-2/Project-1/`.
