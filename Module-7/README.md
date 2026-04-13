# Module 7 – Project 1: Dimensional Modeling (Star Schema)

> Part of the [DIO Power BI Analyst Bootcamp](https://www.dio.me/)

---

## Overview

This project transforms a relational university database into a dimensional star schema model, with **Professor** as the analytical focus.

The original relational model contains entities for professors, departments, subjects, courses, and students. This star schema excludes student data as per project requirements and introduces an invented date dimension to enable time-based analysis.

---

## Schema

**Fact table — Fact_Professor**
Records measurable events around professors: subjects taught, courses offered, hours and classes delivered per period.

**Dimension tables:**
- Dim_Professor — professor attributes (name, department, hire date)
- Dim_Department — department details (name, campus, coordinator, hours, enrollments)
- Dim_Subject — subject details (name, prerequisites, total credits)
- Dim_Course — course details (name, number of students, credits)
- Dim_Data — invented date dimension (date, year, semester, month) to enable time intelligence

---

## Design decisions

- Student data explicitly excluded per project brief
- Date dimension invented and added since the original relational model contains no date fields — granularity set at month/semester level
- Fact table contains foreign keys to all five dimensions plus two measures: hours_taught (DECIMAL) and num_classes (INT)

---

## Tools

- Miro (schema design)
- Dataset: University relational model (DIO)
