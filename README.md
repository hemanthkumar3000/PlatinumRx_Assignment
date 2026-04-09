# PlatinumRx Assignment

## Overview

This assignment was completed to demonstrate practical skills in three main areas:

1) **SQL**
2) **Spreadsheet / Excel**
3) **Python**

The overall goal was to solve real-world style data problems in a simple, clean, and structured way.



## Approach Followed

I approached the assignment section by section so that each part could be completed clearly and independently.

### 1. SQL Section
For the SQL part, I first created the required database structure based on the given tables and relationships.

I focused on:
1) creating the tables with proper columns
2) inserting the sample data
3) writing queries using joins, grouping, filtering, and aggregation where required

While solving the SQL questions, I tried to keep the queries readable and beginner-friendly instead of making them unnecessarily complex.



### 2. Spreadsheet / Excel Section
For the spreadsheet tasks, I used formulas and helper columns to complete the required analysis.

#### Question 1 – Data Population
To bring the `created_at` field from the `ticket` sheet into the `feedbacks` sheet, I used:

- **VLOOKUP**

The common key used between both sheets was:
- `cms_id`

This helped connect the two datasets and populate the required values correctly.

#### Question 2 – Time Analysis
To check whether records matched on both:
- **same day**
- **same hour**

I created helper columns such as:
- "Same Day"
- "Same Hour"

Then I used logical comparison formulas and counting functions to identify the final result.

This approach made the spreadsheet easier to understand and verify.



### 3. Python Section
For the Python part, I solved the given problems using basic Python concepts such as:

- loops
- conditionals
- string handling
- arithmetic operations

I intentionally kept the code simple and beginner-friendly so that it is easy to read, test, and explain.

Examples of the type of logic used include:
- converting minutes into human-readable time format
- removing duplicate characters from a string
- solving problems using direct loop-based approaches instead of overly advanced shortcuts



## Assumptions Made

While completing the assignment, I made the following assumptions:

- The sample data provided in the assignment is valid and consistent.
- `cms_id` is the common key used to map records between sheets/tables where required.
- Date and time values are already in a valid format for comparison in Excel.
- Python solutions are expected to be simple, readable, and suitable for beginner-level understanding unless otherwise specified.
- Wherever multiple methods were possible, I preferred the one that is easier to understand and explain.



## Tools Used

The following tools were used to complete the assignment:

- **MySQL**
- **Google Sheets**
- **Python**
- **VS Code**



## Final Note

I tried to complete this assignment in a practical and structured way while keeping the solutions clear, readable, and easy to verify.

The main focus was not just to get the correct answer, but also to use an approach that reflects problem-solving, clarity, and maintainability.