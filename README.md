# starwars_dataset

## Importing CSV Data into a PostgreSQL Database

We have been using [neon.tech](https://neon.tech) for our databases. You can find their instructions on how to import data into a Neon database table from a CSV file [here](https://neon.tech/docs/import/import-from-csv).


### Prerequisites

1. **Install `psql`:**
   The `psql` client is the native command-line client for PostgreSQL. It provides an interactive session for sending commands to PostgreSQL. You can download and install `psql` from the [official PostgreSQL website](https://www.postgresql.org/download/).

2. **Open `psql`:**
   Open your terminal or command prompt and start the `psql` command-line tool by running the following command:

   ```sh
   psql postgresql://[user]:[password]@[neon_hostname]/[dbname]
   ```
## Steps to Import CSV Data
1. Prepare the Database and Table: Ensure that the database and table where you want to import the CSV data exist. For example, you should have a table named char_starships with the appropriate schema:

```sql
CREATE TABLE char_starships (
    char_ship_id SERIAL PRIMARY KEY,
    starship_id INT,
    char_id INT,
    starships VARCHAR(255)
);
```
2. Place the CSV File: Place the CSV file (`char_starships.csv`) in a directory accessible by the PostgreSQL server.

3.Use the `COPY` Command: You can use the `COPY` command to import the CSV file into the PostgreSQL table. This command needs to be run from the PostgreSQL command-line interface (`psql`) or within a SQL script. Replace `/path/to/char_starships.csv` with the actual path to your CSV file.

```sql
COPY char_starships(char_ship_id, starship_id, char_id, starships)
FROM '/path/to/char_starships.csv'
DELIMITER ','
CSV HEADER;
```

Replace char_starships.csv with the actual path to your CSV file.

Alternative: Use the `\copy` Command: If you are using the psql command-line tool, you can use the `\copy` command, which is a client-side command and can be more convenient if the CSV file is on your local machine.

```sql
\copy char_starships(char_ship_id, starship_id, char_id, starships)
FROM 'C:/path/to/char_starships.csv'
DELIMITER ','
CSV HEADER;
```