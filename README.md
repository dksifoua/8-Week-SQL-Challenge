# 8-Week-SQL-Challenge

This repo contains my solutions to the eight-week SQL challenge case studies from https://8weeksqlchallenge.com/.

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
