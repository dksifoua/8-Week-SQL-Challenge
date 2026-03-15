# 8-Week-SQL-Challenge

This repository showcases comprehensive solutions to
the [#8WeekSQLChallenge](https://8weeksqlchallenge.com/) created
by [Danny Ma](https://www.linkedin.com/in/datawithdanny/), demonstrating proficiency in essential SQL skills required
for data analyst and analytics engineer roles. Through eight distinct case studies, I have applied advanced SQL
techniques to solve real-world business problems.

## Case Studies

Here is the link to each case study

1. [Case Study #1 - Danny's Diner](./Case%20Study%20%231%20-%20Danny's%20Diner/README.md)

## How to Run This Project Locally

This project uses Docker Compose to set up a PostgreSQL database and pgAdmin for database management.

### Prerequisites

- [Docker](https://www.docker.com/get-started) installed on your machine
- [Docker Compose](https://docs.docker.com/compose/install/) installed on your machine

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/dksifoua/8-Week-SQL-Challenge.git
   cd 8-Week-SQL-Challenge
   ```

2. **Set up environment variables**
   ```bash
   cp .env.example .env
   ```

   You can modify the `.env` file if you want to change the default credentials or ports.

3. **Start the services**
   ```bash
   docker compose up -d
   ```

   This will start:
    - PostgreSQL database on port `5432` (or your configured port)
    - pgAdmin web interface on port `8080` (or your configured port)

4. **Access pgAdmin**
    - Open your browser and navigate to `http://localhost:8080`
    - Login with the credentials from your `.env` file:
        - Email: `dimitri.sifoua@gmail.com` (default)
        - Password: `Password123!` (default)
    - The PostgreSQL server should already be configured and available. You may have to provide the PostgreSQL
      password (`secret`) to let pgAdmin connect to the database.

5. **Load the case study data**
    - Navigate to the case study folder (e.g., `Case Study 1 – Danny's Diner`)
    - Run the `schema.sql` file to create the database schema
    - Run the `solution.sql` file to execute the queries

### Stop the services

```bash
docker compose down -v
```

## SQL Skills Demonstrated

This repository serves as evidence of my expertise in the following industry-standard SQL competencies:

**Query Fundamentals & Data Retrieval**

- Complex `SELECT` statements with multiple conditions
- Advanced filtering using `WHERE`, `HAVING`, and conditional logic
- Data sorting and limiting with `ORDER BY` and `LIMIT`

**Join Operations & Table Relationships**

- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and `FULL OUTER JOIN`
- Multi-table joins across 3+ tables
- Self-joins for hierarchical data analysis

**Aggregation & Grouping**

- Aggregate functions: `SUM()`, `COUNT()`, `AVG()`, `MIN()`, `MAX()`
- `GROUP BY` with multiple dimensions
- `HAVING` clause for filtered aggregations
- `DISTINCT` for unique value analysis

**Window Functions & Analytics**

- Ranking functions: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`
- Partitioning with `PARTITION BY`
- Running totals and moving averages
- Lead and lag functions for time-series analysis

**Common Table Expressions (CTEs)**

- Recursive and non-recursive CTEs
- Multiple CTEs for complex query logic
- CTEs for improved query readability and maintenance

**Date & Time Operations**

- Date arithmetic and interval calculations
- `BETWEEN` for date range filtering
- Date formatting and extraction functions
- Time-based aggregations and trending

**Conditional Logic & Data Transformation**

- `CASE` statements for business rule implementation
- Conditional aggregations
- Data type conversions and casting
- String manipulation and pattern matching

**Subqueries & Nested Queries**

- Correlated and non-correlated subqueries
- Subqueries in `SELECT`, `FROM`, and `WHERE` clauses
- `EXISTS` and `IN` operators

**Data Definition & Manipulation**

- Table creation with appropriate data types
- `NULL` handling and coalescing
- Data integrity and constraint management

**Query Optimization & Performance**

- Writing efficient queries
- Understanding query execution order
- Index-aware query design

### Real-World Applications

Each case study in this repository mirrors actual business scenarios encountered in data analyst roles, including:

- Customer behavior analysis and segmentation
- Sales performance metrics and KPIs
- Subscription and retention analytics
- Financial reporting and calculations
- Product popularity and inventory insights
- Marketing campaign effectiveness
- Loyalty program analysis

Through these challenges, I have developed the ability to translate business questions into SQL queries, perform
exploratory data analysis, and generate actionable insights from raw data—core competencies required in modern
data-driven organizations.

# Author

- [@dksifoua](https://linkedin.com/in/dksifoua)

